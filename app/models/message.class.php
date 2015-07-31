<?php

/**
 * Classe para gerenciamento de mensagens e e-mails
 * @author Gustavo Pchek
 */

	class Message extends BaseModel{
		private $idMessage;
		private $recipient;
		private $subject;
		private $title;
		private $content;
		private $status;

		public function confirmedEnrollment(){
			$mail = file_get_contents("app/views/default/message/_message_email.html");
			$mail = str_replace('{{LOGO}}', "<a href='". $this->getUri() . "''><img id='title-banner-img' src='" . $this->getResource('img/utfpr/title-header.png'). "' alt='UTFPR Eventos' style='max-width: 200px'/></a>", $mail);
			$title = "Inscrição Confirmada";
			$text = 'Sua inscrição <b>#174</b> no evento "<b>Semana Acadêmica TSI 2014</b>" foi confirmada.';
			$additional = '<button>Veja os detalhes da sua inscrição</button><br><br><button>Acesse a página do evento</button>';
			$username = "Gustavo Pchek";
			$event = "Semana Acadêmica TSI 2014";
			$start = "21/09/2015 - 19:00";
			$end = "25/09/2015 - 22:00";

			$price = "R$ 30,00";
			$date = "15/09/2015 - 17:44";
			$confirmDate = "18/09/2015 - 09:05";

			$mail = str_replace('{{TEXT}}', $text, $mail);
			$mail = str_replace('{{TITLE}}', $title, $mail);
			$mail = str_replace('{{ADDITIONAL}}', $additional, $mail);
			$mail = str_replace("{{USERNAME}}", $username , $mail);
			$mail = str_replace("{{EVENT}}", $event , $mail);
			$mail = str_replace("{{START}}", $start, $mail);
			$mail = str_replace("{{END}}", $end, $mail);
			$mail = str_replace("{{PRICE}}", $price, $mail);
			$mail = str_replace("{{DATE}}", $date, $mail);
			$mail = str_replace("{{CONFIRMDATE}}", $confirmDate, $mail);
		}
	

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_message", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM message" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$message = array();			

			foreach ($rows as $row) {
				$message[] = new Message($row);
			}
				
			return $message;
		}

		public static function customerSearch($searchValue){

			$serachValue = preg_replace( '/[`^~\'"]/', null, iconv( 'UTF-8', 'ASCII//TRANSLIT', $searchValue ) );
			$serachValue = utf8_encode($searchValue);
			$searchValue = str_replace('%20', ' ', $searchValue);
			$searchValue = '%' . $searchValue . '%';
			$message = self::find(array("title"), array($searchValue), "LIKE");
			return $message;
		}

		public static function findLast($date){
			$message = self::find(array("modification_date"), array($date), ">=");
			return $message;
		}

		public static function all(){
			return self::find();
		}

		public static function count(){
			$sql = "SELECT count(id_message) as count FROM message";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		public static function findById($id){
			$message = self::find(array("id_message"), array($id));
			return count($message) > 0 ? $message : NULL;
		}

		public function update($data = array()){

			$data["modification_date"] = date('Y-m-d H:i');

			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE message SET %s WHERE id_message = ".$this->getIdMessage();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		public function save(){
			$sql = 
			"INSERT INTO message
				(id_event, creation_date, modification_date, title, subtitle, content)
			VALUES
				(:id_event, :creation_date, :modification_date, :title, :subtitle, :content)";
			$params = array(
					":id_event" => $this->getIdEvent(),
					":creation_date" => date('Y-m-d H:i'),
					":modification_date" => date('Y-m-d H:i'),
					":title" => $this->getTitle(),
					":subtitle" => $this->getSubtitle(),
					":content" => $this->getContent()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdMessage($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		/**
		 * Envia um e-mail com uma mensagem
		 * 
		 */
		public function messageMail($nameAddress = "Gustavo"){
			$html = file_get_contents("app/views/default/admin/message/templates/base.html");

			$logo = Basecontroller::getResource('img/utfpr/title-header.png');

			$html = str_replace('{{TEMPLATE}}', file_get_contents("app/views/default/admin/message/templates/_message_email.html"), $html);
			$html = str_replace('{{LOGO}}', "<img id='title-banner-img' src='$logo' alt='UTFPR Eventos' style='max-width: 200px'/>", $html);
			$html = str_replace('{{TEXT}}', $this->getContent(), $html);
			$html = str_replace('{{TITLE}}', $this->getTitle(), $html);


			$recipients = str_replace(" ", "", explode(",", $this->getRecipient()));

			self::sendMail($html, $recipients, "", $this->getSubject());
		}

		/**
		 * Envia um e-mail informando que o cadastro foi realizado
		 * @param Participant $participant O participante que efetuou o cadastro
		 */
		public static function registrationMail($participant){

			$html = file_get_contents("app/views/default/admin/message/templates/base.html");

			$logo = Basecontroller::getResource('img/utfpr/title-header.png');

			$html = str_replace('{{TEMPLATE}}', file_get_contents("app/views/default/admin/message/templates/_registration_email.html"), $html);
			$html = str_replace('{{LOGO}}', "<img id='title-banner-img' src='$logo' alt='UTFPR Eventos' style='max-width: 200px'/>", $html);
			$html = str_replace('{{USERNAME}}', $participant->getName(), $html);

			$recipients = str_replace(" ", "", explode(",", $participant->getEmail()));

			self::sendMail($html, $recipients, $participant->getName(), "Cadastro realizado");
		}

		/**
		 * Envia um e-mail sobre uma inscrição realizada
		 * @param Enrollment A inscrição
		 */
		public static function newEnrollmentMail($enrollment){
			$html = file_get_contents("app/views/default/admin/message/templates/base.html");

			$logo = Basecontroller::getResource('img/utfpr/title-header.png');

			$html = str_replace('{{TEMPLATE}}', file_get_contents("app/views/default/admin/message/templates/_new_enrollment_email.html"), $html);
			$html = str_replace('{{LOGO}}', "<img id='title-banner-img' src='$logo' alt='UTFPR Eventos' style='max-width: 200px'/>", $html);
			$html = str_replace('{{USERNAME}}', $enrollment->participant->getName(), $html);
			$html = str_replace('{{EVENT}}', $enrollment->event->getName(), $html);
			$html = str_replace('{{DATE}}', $enrollment->getDateEnrollment("d/m/Y h:m"), $html);
			$html = str_replace('{{COST}}', $enrollment->getCost(), $html);
			$html = str_replace('{{STATUS}}', $enrollment->enrollmentStatus->getName(), $html);

			$recipients = str_replace(" ", "", explode(",", $enrollment->participant->getEmail()));

			self::sendMail($html, $recipients, $enrollment->participant->getName(), "Inscrição Realizada");
		}

		private function sendMail($html, $recipients, $nameAddress = "", $subject = "UTFPR Eventos"){
			require_once APP_ROOT_FOLDER . '/app/resources/php/PHPMailer-master/PHPMailerAutoload.php';
			$mail = new PHPMailer;
			$mail->charSet = "UTF-8";
			$mail->isSMTP(true);
			$mail->isHTML(true);
			$mail->CharSet = 'UTF-8';
			$mail->Debugoutput = 'html';
			$mail->Host = 'smtp.gmail.com';
			$mail->Port = 587;
			$mail->SMTPAuth = true;
			$mail->Username = "ghpk88@gmail.com";
			$mail->Password = "wsk9732fn88";
			$mail->setFrom('', 'UTFPR Eventos teste');
			// $mail->addReplyTo('ghpk88@gmail.com', 'UTFPR Eventos teste');
			foreach ($recipients as $key => $recipient) {
				$mail->addAddress($recipient, $nameAddress);
			}
			$mail->Subject = $subject;
			$mail->msgHTML($html);
			$mail->AltBody = 'E-mail teste';

			// COLOCAR ISTO NUM LOG
			if (!$mail->send()) {
				var_dump($mail->ErrorInfo);
			    return false;
			} else {
			    return true;
			}
		}


		public function remove(){
			$sql = "DELETE FROM message WHERE id_message = :id_message";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_message" => $this->getIdMessage());
			return $statment->execute($params);
		}

		/**
		 * Incrementa o número de visualizações
		 * @param int $id O ID da notícia
		 */	
		public function updateViews($id){
			$sql = "UPDATE message SET views = views + 1 WHERE id_message = " . $id;

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$statment->execute();
		}
	
    /**
     * Gets the value of idMessage.
     *
     * @return mixed
     */
    public function getIdMessage()
    {
        return $this->idMessage;
    }

    /**
     * Sets the value of idMessage.
     *
     * @param mixed $idMessage the id message
     *
     * @return self
     */
    public function setIdMessage($idMessage)
    {
        $this->idMessage = $idMessage;

        return $this;
    }

    /**
     * Gets the value of recipient.
     *
     * @return mixed
     */
    public function getRecipient()
    {
        return $this->recipient;
    }

    /**
     * Sets the value of recipient.
     *
     * @param mixed $recipient the recipient
     *
     * @return self
     */
    public function setRecipient($recipient)
    {
        $this->recipient = $recipient;

        return $this;
    }

    /**
     * Gets the value of subject.
     *
     * @return mixed
     */
    public function getSubject()
    {
        return $this->subject;
    }

    /**
     * Sets the value of subject.
     *
     * @param mixed $subject the subject
     *
     * @return self
     */
    public function setSubject($subject)
    {
        $this->subject = $subject;

        return $this;
    }

    /**
     * Gets the value of title.
     *
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Sets the value of title.
     *
     * @param mixed $title the title
     *
     * @return self
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Gets the value of content.
     *
     * @return mixed
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Sets the value of content.
     *
     * @param mixed $content the content
     *
     * @return self
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Gets the value of status.
     *
     * @return mixed
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Sets the value of status.
     *
     * @param mixed $status the status
     *
     * @return self
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }
}
?>