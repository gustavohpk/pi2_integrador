<?php
	class Reports extends BaseModel{
		private $dateFrom;
		private $dateTo;
		private $event;

		public function setDateFrom($dateFrom){
			$this->dateFrom = empty($dateFrom) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $dateFrom)));
		}

		public function setDateTo($dateTo){
			$this->dateTo = empty($dateTo) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $dateTo)));
		}

		public function setEvent($event){
			$this->event = $event;
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