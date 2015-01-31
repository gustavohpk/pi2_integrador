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
			var_dump($contactEmail);
			return count($contactEmail) > 0 ? $contactEmail : NULL;
		}

		public function update($data = array()){

			$this->setData($data);

			$params = "";

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

		public function tests(){
			$tests = array();
			$i = 0;

			$base = new BaseModel();

			$tests[$i]["result"] = $base->validateCpf('');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "CPF nulo";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateCpf('303.29');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "CPF incompleto";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateCpf('352683543');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "CPF incompleto 2";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateCpf('87596741258');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "Número aleatório";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateCpf('33158327813');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "CPF válido";
			$tests[$i]["expected"] = true;
			$i++;

			$tests[$i]["result"] = $base->validateCpf('872.388.686-28');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "CPF válido com máscara";
			$tests[$i]["expected"] = true;
			$i++;

			$tests[$i]["result"] = $base->validateCpf('a7h8dy-326#');
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "String aleatória";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateCpf("'fx'aa");
			$tests[$i]["test"] = "Validação de CPF";
			$tests[$i]["operation"] = "String aleatória com aspas";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("aswkhyuwe");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "String aleatória";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("e74hu5#v^asx");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "String aleatória com números e caracteres especiais";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("e74hu5#v^asx");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "String aleatória com números e caracteres especiais";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("testmail0203@testmail");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "E-mail sem .com";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("testmail0203@testmail.");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "E-mail sem 'com'";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("testmail0203testmail.com");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "E-mail sem '@'";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateEmail("testmail0203@testmail.com");
			$tests[$i]["test"] = "Validação de E-mail";
			$tests[$i]["operation"] = "E-mail válido";
			$tests[$i]["expected"] = true;
			$i++;

			$tests[$i]["result"] = $base->validateYoutubeLink("www.youtube.com");
			$tests[$i]["test"] = "Validação de link do Youtube";
			$tests[$i]["operation"] = "Site do youtube";
			$tests[$i]["expected"] = false;
			$i++;

			$tests[$i]["result"] = $base->validateYoutubeLink("https://www.youtube.com/watch?v=pAgnJDJN4VA");
			$tests[$i]["test"] = "Validação de link do Youtube";
			$tests[$i]["operation"] = "Estrutura de link válida";
			$tests[$i]["expected"] = true;
			$i++;

			$tests[$i]["result"] = $base->validateYoutubeLink("https://www.youtube.com/watchv=pAgnJDJN4VA");
			$tests[$i]["test"] = "Validação de link do Youtube";
			$tests[$i]["operation"] = "Estrutura de link inválida";
			$tests[$i]["expected"] = false;
			$i++;

			return $tests;
		}

		public function checkMaintenance(){
			$sql = "SELECT value FROM setting WHERE description = 'maintenance_status' ";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$settings = array();
				
			$value = $rows[0]["value"];

			return $value;
		}

		public function maintenance(){

			$value = self::checkMaintenance();
			$change = '0';

			if ($value=='0') {
				$change = '1';
			}

			$sql = "UPDATE setting SET value = " . $change . " WHERE description = 'maintenance_status'";

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			if($statment->execute()){
				return $change;
			} else{
				return $value;
			}

		}

	}
?>
