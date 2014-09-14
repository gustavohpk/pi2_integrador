<?php
	class Sponsors extends BaseModel{
		private $idSponsor;
		private $name;
		private $webAddress;
		private $description;
		private $image;
		
		public function setIdSponsor($idSponsor){
			$this->idSponsor = $idSponsor;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function setWebAddress($webAddress){
			$this->webAddress = $webAddress;
		}

		public function setDescription($description){
			$this->description = $description;
		}

		public function getIdSponsor(){
			return $this->idSponsor;
		}

		public function getName(){
			return $this->name;
		}

		public function getWebAddress(){
			return $this->webAddress;
		}

		public function getDescription(){
			return $this->description;
		}

		public static function find($params = null){
			$sql = "SELECT * FROM sponsor " . (!is_null($params) ? " WHERE " . $params['paramsName'] : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$sponsors = array();			

			foreach ($rows as $row) {
				$sponsors[] = new Sponsors($row);
			}
				
			return $sponsors;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_sponsor = :id_sponsor", 
				"paramsValue" => array(":id_sponsor" => $id)
			);
			$sponsors = self::find($params);
			return count($sponsors) > 0 ? $sponsors : NULL;
		}

		public function save(){
			$sql = 
			"INSERT INTO sponsor
				(name, web_address, description)
			VALUES
				(:name, :web_address, :description)";

			$params = array(
					":name" => $this->getName(),
					":web_address" => $this->getWebAddress(),
					":description" => $this->getDescription(),
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE sponsor SET %s WHERE id_sponsor = ".$this->getIdSponsor();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		public static function count(){
			$sql = "SELECT count(id_sponsor) as count FROM sponsor";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		public function remove(){
			$sql = "DELETE FROM sponsor WHERE id_sponsor = :id_sponsor";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_sponsor" => $this->getIdSponsor());
			return $statment->execute($params);
		}
	}
?>