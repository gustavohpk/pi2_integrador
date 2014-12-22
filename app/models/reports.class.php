<?php

/**
 * Classe para geração de relatórios.
 * @author Gustavo Pchek
 */

	class Reports extends BaseModel{
		/**
	     * @var string $dateTo Data inicial
	     * @var string $timeTo Hora inicial
	     * @var string $dateTo Data final
	     * @var string $timeTo Hora final
	     * @var bool $confirmed Se o relatório incluirá inscrições confirmadas
	     * @var bool $unconfirmed Se o relatório incluirá inscrições não confirmadas
	     * @var bool $present Se o relatório incluirá inscrições com presença confirmada
	     * @var bool $absent Se o relatório incluirá inscrições com presença não confirmada
	     * @var int|null $event O evento que as inscrições serão relacionadas, pode ser nulo para ser relatório geral
	     */
		private $dateFrom, $timeFrom, $dateTo, $timeTo, $confirmed = false, $unconfirmed = false, $present = false, $absent = false, $event;

		public function setDateFrom($dateFrom){
			$this->dateFrom = empty($dateFrom) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $dateFrom)));
		}

		public function setTimeFrom($timeFrom){
			$this->timeFrom = empty($timeFrom) ? null : date("H:i", strtotime(str_replace("/", "-", $timeFrom)));
		}

		public function setDateTo($dateTo){
			$this->dateTo = empty($dateTo) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $dateTo)));
		}

		public function setTimeTo($timeTo){
			$this->timeTo = empty($timeTo) ? null : date("H:i", strtotime(str_replace("/", "-", $timeTo)));
		}

		public function setEvent($event){
			if($event)
				$this->event = true;
			else
				$this->event = false;
		}

		public function setConfirmed($confirmed){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($confirmed)
				$this->confirmed = true;
			else
				$this->confirmed = false;
		}

		public function setUnconfirmed($unconfirmed){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($unconfirmed)
				$this->unconfirmed = true;
			else
				$this->unconfirmed = false;
		}

		public function setPresent($present){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($present)
				$this->present = true;
			else
				$this->present = false;
		}

		public function setAbsent($absent){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($absent)
				$this->absent = true;
			else
				$this->absent = false;
		}

		public function getDateFrom(){
			return is_null($this->dateFrom) ? null : date($format, strtotime($this->dateFrom));
		}

		public function getDateTo(){
			return is_null($this->dateTo) ? null : date($format, strtotime($this->dateTo));
		}

		public function getEvent(){
			return $this->event;
		}

		public function getConfirmed(){
			return $this->confirmed;
		}

		public function getUnconfirmed(){
			return $this->unconfirmed;
		}

		public function getPresent(){
			return $this->present;
		}

		public function getAbsent(){
			return $this->absent;
		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_news", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM news" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$news = array();			

			foreach ($rows as $row) {
				$news[] = new News($row);
			}
				
			return $news;
		}

		public static function customerSearch($searchValue){

			$serachValue = preg_replace( '/[`^~\'"]/', null, iconv( 'UTF-8', 'ASCII//TRANSLIT', $searchValue ) );
			$serachValue = utf8_encode($searchValue);
			$searchValue = str_replace('%20', ' ', $searchValue);
			$searchValue = '%' . $searchValue . '%';
			$news = self::find(array("title"), array($searchValue), "LIKE");
			return $news;
		}

		public static function findLast($date){
			$news = self::find(array("modification_date"), array($date), ">=");
			return $news;
		}

		public static function all(){
			return self::find();
		}

		public static function count(){
			$sql = "SELECT count(id_news) as count FROM news";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		public static function findById($id){
			$news = self::find(array("id_news"), array($id));
			return count($news) > 0 ? $news : NULL;
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
			$sql = "UPDATE news SET %s WHERE id_news = ".$this->getIdNews();
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
			"INSERT INTO news
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
			return $statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM news WHERE id_news = :id_news";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_news" => $this->getIdNews());
			return $statment->execute($params);
		}
	}
?>