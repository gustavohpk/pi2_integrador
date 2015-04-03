<?php

/**
 * Classe para gerenciamento de mensagens e e-mails
 * @author Gustavo Pchek
 */

	class Message extends BaseModel{
		private $idMessage;
		private $idEvent;
		private $creationDate;
		private $modificationDate;
		private $title;
		private $subtitle;		
		private $content;
		private $views;
		private $path;

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

		public function setIdMessage($idMessage){
			$this->idMessage = $idMessage;
		}

		public function setIdEvent($idEvent){
			$this->idEvent = $idEvent;
		}

		public function setCreationDate($creationDate){
			//$this->creationDate = $creationDate;
			$this->creationDate = empty($creationDate) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $creationDate)));
		}

		public function setModificationDate($modificationDate){
			//$this->modificationDate = $modificationDate;
			$this->modificationDate = empty($modificationDate) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $modificationDate)));
		}

		public function setTitle($title){
			$this->title = $title;
		}

		public function setSubtitle($subtitle){
			$this->subtitle = $subtitle;
		}

		public function setContent($content){
			$this->content = $content;
		}

		public function setViews($views){
			$this->views = $views;
		}

		public function setPath($path){
			$this->path = $path;
		}

		public function getIdMessage(){
			return $this->idMessage;
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function getCreationDate($format = "Y-m-d H:i:s"){
			//return date("d/m/Y H:i", $this->creationDate);
			if (empty($this->idMessage)) $this->creationDate = date("Y-m-d H:i:s");
			return is_null($this->creationDate) ? null : date($format, strtotime($this->creationDate));
		}

		public function getModificationDate($format = "Y-m-d H:i:s"){
			//return date("d/m/Y H:i", $this->modificationDate);
			return is_null($this->modificationDate) ? null : date($format, strtotime($this->modificationDate));
		}

		public function getTitle(){
			return $this->title;
		}

		public function getSubtitle(){
			return $this->subtitle;
		}

		public function getContent(){
			return $this->content;
		}

		public function getMedia($type = "p") {
			return Media::findByIdEvent($this->getIdEvent(), $type);
		}

		public function getViews(){
			return $this->views;
		}

		public function getPath(){
			return $this->path;
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
	}
?>