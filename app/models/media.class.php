<?php

	class Media extends BaseModel{
		private $idMedia;
		private $mediaType;
		private $idEvent;
		private $label;
		private $path;

		public function setIdMedia($idMedia){
			$this->idMedia = $idMedia;
		}

		public function setMediaType($mediaType){
			$this->mediaType = $mediaType;
		}

		public function setIdEvent($idEvent){
			$this->idEvent = $idEvent;
		}

		public function setLabel($label){
			$this->label = $label;
		}

		public function setPath($path){
			$this->path = $path;
		}

		public function getIdMedia(){
			return $this->idMedia;
		}

		public function getMediaType(){
			return $this->mediaType;
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function getLabel(){
			return $this->label;
		}

		public function getPath(){
			return $this->path;
		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_media", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);		
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT 
				*
			FROM 
				media " .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;
			$sql .= " LIMIT $start, $limit";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$media = array();		
			foreach ($rows as $row) {
				$media[] = new Media($row);
			}
				
			return $media;
		}

		// public static function find($params = null, $limit = 6, $page = 1){
		// 	$start = ($page * $limit) - $limit;
		// 	$sql = "SELECT * FROM media";

		// 	if (!is_null($params)){
		// 		$sql .= " WHERE " . $params['paramsName'];
		// 	}

		// 	$sql .= " LIMIT $start, $limit";

		// 	$pdo = \Database::getConnection();
		// 	$rs = $pdo->prepare($sql);
		// 	$rs->execute($params["paramsValue"]);
		// 	$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
		// 	$media = array();			

		// 	foreach ($rows as $row) {
		// 		$media[] = new Media($row);
		// 	}
				
		// 	return $media;
		// }

		public static function count(){
			$sql = "SELECT id_media FROM media";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			return count($rows);
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			return self::find(array("id_media"), array($id))[0];
		}

		public function findByIdEvent($idEvent, $mediaType = "p") {
			return self::find(array("id_event", "media_type"), array($idEvent, $mediaType));
		}

		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE media SET %s WHERE id_media = ".$this->getIdMedia();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		public function save($path, $index){
			if ($this->getMediaType() == "p") {
	            $this->setPath($this->imagePath($path, $index));
	        }else{
	        	if(!$this->validateYoutubeLink($this->getPath()))
	        		return false;
	        }
			$sql = 
			"INSERT INTO media
				(media_type, id_event, label, path)
			VALUES
				(:media_type, :id_event, :label, :path)";

			$params = array(
					":media_type" => $this->getMediaType(),
					":id_event" => $this->getIdEvent(),
					":label" => $this->getLabel(),
					":path" => $this->getPath()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params);
			$this->setIdMedia($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		public function remove(){
			$sql = "DELETE FROM media WHERE id_media = :id_media";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_media" => $this->getIdMedia());
			return $statment->execute($params);
		}

		private function imagePath($path, $index){
			switch ($_FILES["photos"]["type"][$index]) {
				case 'image/png': $type = '.png'; break;
				case 'image/jpeg': case 'image/jpg': $type = '.jpg'; break;
				case 'image/gif': $type = '.gif'; break;
			}
			$number = 1;
			$absolutePath = '/var/www/' . $path . 'event' . $this->getIdEvent() . '_' . 'image' . strval($number) . $type;

			while (file_exists($absolutePath)){
				$number = substr($absolutePath, -5, 1);
				$number = intval($number);
				$number++;
				$absolutePath = '/var/www/' . $path . 'event' . $this->getIdEvent() . '_' . 'image' . strval($number) . $type;
			}
			$relativePath = $path . 'event' . $this->getIdEvent() . '_' . 'image' . strval($number) . $type;
			return $relativePath;
		}

		public function getThumbnail($link){
        	$code = substr($link, (strpos($link, '=')+1), 30);
         	$thumbnailUrl = 'http://img.youtube.com/vi/' . $code . '/0.jpg';
         	return $thumbnailUrl;
    	}

    	public static function hasMedia($idEvent){
			$sql = "SELECT count(id_media) as count FROM media WHERE id_event = $idEvent";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			if($rows["count"] == 0){
				return false;
			}
			return true;
		}
	}
?>