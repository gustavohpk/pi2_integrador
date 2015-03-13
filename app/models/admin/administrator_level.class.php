<?php
	namespace Admin;

	class AdministratorLevel extends \BaseModel{
		private $idAdministratorLevel;
		private $title;
		private $permissions;

		public function setIdAdministratorLevel($idAdministratorLevel){
			$this->idAdministratorLevel = $idAdministratorLevel;
		}

		public function getIdAdministratorLevel(){
			return $this->idAdministratorLevel;
		}

		public function setTitle($title){
			$this->title = $title;
		}

		public function getTitle(){
			return $this->title;
		}

		public function setPermissions($permissions){
			$this->permissions = $permissions;
		}

		public function getPermissions(){
			return json_decode($this->permissions, true);
		}

		public static function all(){
			return self::find();
		}	

		public static function find($params = null){
			$sql = "SELECT * FROM administrator_level " . (is_null($params) ? "" : " WHERE " . $params['paramsName']);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			if (is_null($params)) {
				$statment->execute();
			}
			else {
				$statment->execute($params["paramsValue"]);
			}
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$adminLevels = array();	
			foreach ($rows as $row) {
				$adminLevels[] = new AdministratorLevel($row);
			}
				
			return $adminLevels;
		}

		public static function findById($id){
			$params = array(
				"paramsName" => "id_administrator_level = :id_administrator_level", 
				"paramsValue" => array(":id_administrator_level" => $id)
			);
			//retorna apenas o primeiro objeto (no caso o unico)
			$admin = self::find($params);
			return count($admin) > 0 ? $admin : NULL;
		}

		public function save(){

			$sql = 
			"INSERT INTO administrator_level
				(title, permissions)
			VALUES
				(:title, :permissions)";

			$params = array(
					":title" => $this->getTitle(),
					":permissions" => json_encode($this->getPermissions())
				);

			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		public function update($data = array()){
			$this->setData($data);
			if (!$this->isValidData()) return false;

			$params = "";
			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}
			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);

			$sql = "UPDATE administrator_level SET %s WHERE id_administrator_level = " . $this->getIdAdministratorLevel();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);			
			
			$params = array(
					":title" => $this->getTitle(),
					":permissions" => json_encode($this->getPermissions())
				);

			return $statment->execute($params);
		}

		public function remove(){
			$sql = "DELETE FROM administrator_permissions WHERE id_administrator_permissions = :id_administrator_permissions";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_administrator_permissions" => $this->getIdAdministratorLevel());
			return $statment->execute($params);
		}
	}
?>