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

		public static function find($params = null, $limit = 6, $page = 1){
			$start = ($page * $limit) - $limit;
			$sql = "SELECT * FROM media";

			if (!is_null($params)){
				$sql .= " WHERE " . $params['paramsName'];
			}

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($params["paramsValue"]);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$media = array();			

			foreach ($rows as $row) {
				$media[] = new Media($row);
			}
				
			return $media;
		}

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
			$params = array("paramsName" => "id_media = :id_media", "paramsValue" => array(":id_media" => $id));
			//retorna apenas o primeiro objeto (no caso o unico)
			$media = self::find($params);
			return count($media) > 0 ? $media[0] : NULL;
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

		public function save(){
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
			//var_dump($params); exit;
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM media WHERE id_media = :id_media";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_media" => $this->getIdMedia());
			return $statment->execute($params);
		}
	}
?>