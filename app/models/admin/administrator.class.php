<?php
	namespace Admin;

	class Administrator extends \BaseModel{
		private $id_administrator;
		private $name;
		private $email;
		private $password;
		private $rg;
		private $cpf;
		private $phone;
		private $phone2;

		public function setIdAdministrator($id_administrator){
			$this->id_administrator = $id_administrator;
		}

		public function getIdAdministrator(){
			return $this->id_administrator;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function getName(){
			return $this->name;
		}

		public function setEmail($email){
			$this->email = $email;
		}

		public function getEmail(){
			return $this->email;
		}

		public function setPassword($password){
			$this->password = strlen($password) > 3 ? md5($password) : null;
		}

		public function getPassword(){
			return $this->password;
		}

		public function setRg($rg){
			$this->rg = $rg;
		}

		public function getRg(){
			return $this->rg;
		}

		public function setCpf($cpf){
			$cpf = str_replace(".", "", $cpf);
			$cpf = str_replace("-", "", $cpf);
			$this->cpf = $cpf;
		}

		public function getCpf(){
			return $this->cpf;
		}

		public function setPhone($phone){
			$phone = str_replace(" ", "", $phone);
			$phone = str_replace("(", "", $phone);
			$phone = str_replace(")", "", $phone);
			$this->phone = $phone;
		}

		public function getPhone(){
			return $this->phone;
		}

		public function setPhone2($phone2){
			$phone2 = str_replace(" ", "", $phone2);
			$phone2 = str_replace("(", "", $phone2);
			$phone2 = str_replace(")", "", $phone2);
			$this->phone2 = $phone2;
		}

		public function getPhone2(){
			return $this->phone2;
		}

		public static function all(){
			return self::find();
		}	

		public static function find($params = null){
			$sql = "SELECT * FROM administrator " . (is_null($params) ? "" : " WHERE " . $params['paramsName']);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			if (is_null($params)) {
				$statment->execute();
			}
			else {
				$statment->execute($params["paramsValue"]);
			}
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$admins = array();	
			foreach ($rows as $row) {
				$admins[] = new Administrator($row);
			}
				
			return $admins;
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_administrator = :id_administrator", 
				"paramsValue" => array(":id_administrator" => $id)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			$admin = self::find($params);
			return count($admin) > 0 ? $admin : NULL;
		}

		private function emailExists() {
			$params = array(
				"paramsName" => "email = :email AND id_administrator <> :id_administrator", 
				"paramsValue" => array(":email" => $this->getEmail(), ":id_administrator" => intval($this->getIdAdministrator()))
			);
			return self::find($params) ? true : false;
		}

		private function cpfExists() {
			$params = array(
				"paramsName" => "cpf = :cpf AND id_administrator <> :id_administrator", 
				"paramsValue" => array(":cpf" => $this->getCPF(), ":id_administrator" => intval($this->getIdAdministrator()))
			);
			return self::find($params) ? true : false;
		}

		public function validateData() {
			if (strlen($this->getName()) < 3) $this->errors[] = "Nome do usuário muito curto! [min. 3 caracteres].";
			if (!$this->validateEmail($this->getEmail())) $this->errors[] = "Email inválido.";
			if ($this->emailExists()) $this->errors[] = "Email já cadastrado para outro administrador.";
			if (strlen($this->getPassword()) < 3) $this->errors[] = "Senha fraca! [min. 3 caracteres].";
			if (!$this->validateCpf($this->getCpf())) $this->errors[] = "CPF inválido.";
			if ($this->cpfExists()) $this->errors[] = "CPF já cadastrado para outro administrador.";
			if (strlen($this->getPhone()) < 10) $this->errors[] = "Telefone não informado corretamente.";
		}

		public function save(){
			if (!$this->isValidData()) return false;

			$sql = 
			"INSERT INTO administrator
				(name, email, password, rg, cpf, phone, phone2)
			VALUES
				(:name, :email, :password, :rg, :cpf, :phone, :phone2)";

			$params = array(
					":name" => $this->getName(),
					":email" => $this->getEmail(),
					":password" => $this->getPassword(),
					":rg" => $this->getRg(),
					":cpf" => $this->getCpf(),
					":phone" => $this->getPhone(),
					":phone2" => $this->getPhone2()
				);

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function update($data = array()){
			$this->setData($data);
			if (!$this->isValidData()) return false;

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}
			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);

			$sql = "UPDATE administrator SET %s WHERE id_administrator = " . $this->getIdAdministrator();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);			
			$param = array();
			foreach ($keys as $key){
				$method = $this->snakToCamelCase("get_$key");
				$param[":$key"] = $this->$method();
			}

			return $statment->execute($param);
		}

		public function remove(){
			$sql = "DELETE FROM administrator WHERE id_administrator = :id_administrator";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_administrator" => $this->getIdAdministrator());
			return $statment->execute($params);
		}

		public static function login($email, $password){
			$params = array(
				"paramsName" => "email = :email AND password = :password", 
				"paramsValue" => array(":email" => $email, ":password" => md5($password))
			);
			//recupera apenas o primeiro objeto (no caso o unico)
			$admin = self::find($params);

			if (count($admin) > 0){
				$_SESSION["admin"] = $admin[0];
				return $admin[0]; 
			}
			else{
				return NULL;
			}
		}

		public static function getCurrentAdminLogged(){
			return isset($_SESSION["admin"]) ? $_SESSION["admin"] : NULL;
		}

		public static function logout(){
			unset($_SESSION["admin"]);
		}
	}
?>