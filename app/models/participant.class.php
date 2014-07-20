<?php 
	class Participant extends BaseModel{
		private $idParticipant;
		private $name;
		private $cpf;
		private $rg;
		private $gender;
		private $birthday;
		private $idCity;
		private $city;
		private $idState;
		private $state;
		private $address;
		private $number;
		private $district;
		private $zipcode;
		private $complement;
		private $phone;
		private $phone2;
		private $email;
		private $password;

   		public function setIdParticipant($idParticipant){
   			$this->idParticipant = $idParticipant;
   		}

   		public function setName($name){
   			$this->name = $name;
   		}

   		public function setCpf($cpf){
   			$this->cpf = $cpf;
   		}

   		public function setRg($rg){
   			$this->rg = $rg;
   		}

   		public function setGender($gender){
   			$this->gender = $gender;
   		}

   		public function setBirthday($birthday){
   			$this->birthday = $birthday;
   		}

   		public function setIdCity($idCity){
   			$this->idCity = $idCity;
   		}

   		public function setCity($city){
   			$this->city = $city;
   		}

   		public function setIdState($idState){
   			$this->idState = $idState;
   		}

   		public function setState($state){
   			$this->state = $state;
   		}

   		public function setAddress($address){
   			$this->address = $address;
   		}

   		public function setNumber($number){
   			$this->number = $number;
   		}

   		public function setDistrict($district){
   			$this->district = $district;
   		}

   		public function setZipcode($zipcode){
   			$this->zipcode = $zipcode;
   		}

   		public function setComplement($complement){
   			$this->complement = $complement;
   		}

   		public function setPhone($phone){
   			$this->phone = $phone;
   		}

   		public function setPhone2($phone2){
   			$this->phone2 = $phone2;
   		}

   		public function setEmail($email){
   			$this->email = $email;
   		}

   		public function setPassword($password){
   			$password = trim($password);
   			$this->password = (empty($password) ? NULL : md5($password));
   		}

   		public function getIdParticipant(){
   			return $this->idParticipant;
   		}

   		public function getName(){
   			return $this->name;
   		}

   		public function getCpf(){
   			return $this->cpf;
   		}

   		public function getRg(){
   			return $this->rg;
   		}

   		public function getGender(){
   			return $this->gender;
   		}

   		public function getBirthday(){
   			return $this->birthday;
   		}

   		public function getIdCity(){
   			return $this->idCity;
   		}

   		public function getCity(){
   			return $this->city;
   		}

   		public function getIdState($idState){
   			return $this->idState;
   		}

   		public function getState($state){
   			return $this->state;
   		}

   		public function getAddress(){
   			return $this->address;
   		}

   		public function getNumber(){
   			return $this->number;
   		}

   		public function getDistrict(){
   			return $this->district;
   		}

   		public function getZipcode(){
   			return $this->zipcode;
   		}

   		public function getComplement(){
   			return $this->complement;
   		}

   		public function getPhone(){
   			return $this->phone;
   		}

   		public function getPhone2(){
   			return $this->phone2;
   		}

   		public function getEmail(){
   			return $this->email;
   		}

   		public function getPassword(){
   			return $this->password;
   		}

   		public function validateData(){
   			if (strlen($this->getName()) < 4) $this->errors[] = "O nome deve ter no mínimo 4 caracteres.";
   			if ($this->getGender() != "M" && $this->getGender() != "F") $this->errors[] = "Sexo não informado corretamente.";
			if (!$this->validateEmail($this->getEmail())) $this->errors[] = "O e-mail informado é inválido";
			if (self::findByEmail($this->getEmail())) $this->errors[] = "O e-mail informado já está sendo usado por outro participante";
   			if (is_null($this->getPassword())) $this->errors[] = "Nenhuma senha foi informada.";
   			if (!$this->validateCpf($this->getCpf())) $this->errors[] = "CPF inválido";   			
   			if (self::findByCpf($this->getCpf())) $this->errors[] = "O CPF informado já esta sendo usado por outro participante.";
   			if ((int) $this->getIdCity() < 1) $this->errors[] = "O nome da cidade é um campo obrigatório.";   			
   		}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);
			
			$sql = 
			"SELECT 
				participant.*, city.name AS city, city.id_state, state.state 
			FROM
				participant
			INNER JOIN
				city ON city.id_city = participant.id_city
			INNER JOIN
				state ON state.id_state = city.id_state" . 
				(!is_null($paramsName) ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$participants = array();			

			foreach ($rows as $row) {
				$participants[] = new Participant($row);
			}
			
			return $participants;
		}

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			return self::find(array("id_participant"), array($id));
		}

		public static function findByCpf($cpf){
			return self::find(array("cpf"), array($cpf));
		}

		public static function findByEmail($email){
			return self::find(array("email"), array($email));
		}

		public function save(){
			if (!$this->isValidData()) return false;

			$sql = 
			"INSERT INTO participant
				(name, cpf, rg, gender, birthday, id_city, address, number, district, zipcode, 
				complement, phone, phone2, email, password)
			VALUES
				(:name, :cpf, :rg, :gender, :birthday, :id_city, :address, :number, :district, :zipcode, 
				:complement, :phone, :phone2, :email, :password)";

			$params = array(
					":name" => $this->getName(),
					":cpf" => $this->getCpf(),
					":rg" => $this->getRg(),
					":gender" => $this->getGender(),
					":birthday" => $this->getBirthday(),
					":id_city" => $this->getIdCity(),
					":address" => $this->getAddress(),
					":number" => $this->getNumber(),
					":district" => $this->getDistrict(),
					":zipcode" => $this->getZipcode(),
					":complement" => $this->getComplement(),
					":phone" => $this->getPhone(),
					":phone2" => $this->getPhone2(),
					":email" => $this->getEmail(),
					":password" => $this->getPassword()
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
			$sql = "UPDATE participant SET %s WHERE id_participant = ".$this->getIdParticipant();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		public function remove(){
			$sql = "DELETE FROM participant WHERE id_participant = :id_participant";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_participant" => $this->getIdParticipant());
			return $statment->execute($params);
		}

		public function login($email, $password){
			$participant = self::findByEmail($email);

			if (count($participant) == 0){
				$this->errors = array("Email incorreto!");
				return false;
			}
			
			$participant = self::find(array("password"), array(md5($password)));

			if (count($participant) == 0){
				$this->errors = array("Senha incorreta!");
				return false;
			}			

			$_SESSION["participant"] = $participant[0];
			return true;			
		}

		public static function logout(){
			unset($_SESSION["participant"]);
		}
	}
?>