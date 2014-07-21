<?php
	class Settings extends BaseModel{
		private $idSetting;
		private $description;
		private $value;

		public function setIdSetting($idSetting){
			$this->idSetting = $idSetting;
		}

		public function setDescription($description){
			$this->description = $description;
		}

		public function setValue($value){
			$this->value = $value;
		}

		public function getIdSetting(){
			return $this->idSetting;
		}

		public function getDescription(){
			return $this->description;
		}

		public function getValue(){
			return $this->value;
		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND", $order = "id_setting", $direction ="ASC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM setting" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$settings = array();			

			foreach ($rows as $row) {
				$settings[] = new Settings($row);
			}
				
			return $settings;
		}

		public static function all(){
			return self::find();
		}

		public static function findByDescription($description){
			$settings = self::find(array("description"), array($description));
			return count($settings) > 0 ? $settings : NULL;
		}

		public static function getSiteTitle(){
			$siteTitle = self::find(array("description"), array("site_title"))[0];
			return count($siteTitle) > 0 ? $siteTitle : NULL;
		}

		public static function getContactEmail(){
			$contactEmail = self::find(array("description"), array("contact_mail"))[0];
			return count($contactEmail) > 0 ? $contactEmail : NULL;
		}

		public function update($data = array()){

			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE setting SET %s WHERE id_setting = ".$this->getIdSetting();
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
			"INSERT INTO setting
				(id_setting, description, value)
			VALUES
				(:id_setting, :description, :value, :title)";
			$params = array(
					":id_setting" => $this->getIdSetting(),
					":description" => $this->getDescription(),
					":value" => $this->getValue()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM setting WHERE id_setting = :id_setting";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_setting" => $this->getIdSetting());
			return $statment->execute($params);
		}
	}
?>