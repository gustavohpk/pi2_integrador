<?php
	namespace Admin;

	class Administrator extends \BaseModel{
		private $id_administrator;
		private $name;
		private $email;
		private $phone;
		private $login;
		private $password;

		public function setIdAdministrator($id_administrator){
			$this->id_administrator = $id_administrator;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function setEmail($email){
			$this->email = $email;
		}

		public function setPhone($phone){
			$this->phone = $phone;
		}

		public function setLogin($login){
			$this->login = $login;
		}

		public function setPassword($password){
			$this->password = $password;
		}

		public function getIdAdministrator(){
			return $this->id_administrator;
		}

		public function getName(){
			return $this->name;
		}

		public function getEmail(){
			return $this->email;
		}

		public function getPhone(){
			return $this->phone;
		}

		public function getLogin(){
			return $this->login;
		}

		public function getPassword(){
			return $this->password;
		}

		public static function all(){
			$sql = "SELECT * FROM administrator";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute();
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$admins = array();			

			foreach ($rows as $row) {
				$admins[] = new Administrator($row);
			}
				
			return $admins;
		}	

		public static function find($params){
			$sql = "SELECT * FROM administrator WHERE " . $params['paramsName'];
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params["paramsValue"]);
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
			return count($admin) > 0 ? $admin[0] : NULL;
		}

		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE administrator SET %s WHERE id_administrator = " . $this->getIdEvent();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}

			$statment->execute($param);
		}

		public function save(){
			$sql = 
			"INSERT INTO administrator
				(name, email, phone, login, password)
			VALUES
				(:name, :email, :phone, :login, :password)";

			$params = array(
					":name" => $this->getName(),
					":email" => $this->getEmail(),
					":phone" => $this->getPhone(),
					":login" => $this->getLogin(),
					":password" => $this->getPassword()
				);

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM administrator WHERE id_administrator = :id_administrator";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_administrator" => $this->getIdAdministrator());
			$statment->execute($params);
		}

		public static function login($login, $password){
			$params = array(
				"paramsName" => "login = :login AND password = :password", 
				"paramsValue" => array(":login" => $login, ":password" => $password)
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