<?php
	class News extends BaseModel{
		private $idNews;
		private $idEvent;
		private $creationDate;
		private $modificationDate;
		private $title;
		private $subtitle;		
		private $content;

		public function setIdNews($idNews){
			$this->idNews = $idNews;
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

		public function getIdNews(){
			return $this->idNews;
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function getCreationDate($format = "Y-m-d H:i:s"){
			//return date("d/m/Y H:i", $this->creationDate);
			if (empty($this->idNews)) $this->creationDate = date("Y-m-d H:i:s");
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

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM news" .($paramsName ? " WHERE $paramsName" : "");

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