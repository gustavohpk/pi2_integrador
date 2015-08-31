<?php

	/**
	 * Classe cidade.
	 * @author Rodrigo Miss
	 */

	class City extends BaseModel{

		/**
	     * @var int $idCity ID da cidade
	     * @var string $name Nome da cidade
	     * @var int $idState ID do estado
	     * @var State Estado
	     */
		private $idCity;
		private $name;
		private $idState;
		private $state;

   		public function setIdCity($idCity){
   			$this->idCity = $idCity;
   		}

   		public function setName($name){
   			$this->name = $name;
   		}

   		public function setIdState($idState){
   			$this->idState = $idState;
   		}

   		public function setState($state){
   			$this->state = $state;
   		}

   		public function getIdCity(){
   			return $this->idCity;
   		}

   		public function getName(){
   			return $this->name;
   		}

   		public function getIdState(){
   			return $this->idState;
   		}

   		public function getState(){
   			return $this->state;
   		}

   		public function validateData(){
   			if (strlen(trim($this->getName())) < 4) $this->errors[] = "Cidade não informada.";
   		}


   		/**
	     * Busca por cidades
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @return City[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);

			$sql = 
			"SELECT 
				city.*, state.state 
			FROM
				city
			INNER JOIN
				state ON state.id_state = city.id_state" . 
				($paramsName ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$citys = array();
			foreach ($rows as $row) {
				$citys[] = new City($row);
			}
			return $citys;
		}

		/**
	     * Busca todas as notícias
	     * @return City[] Resultado da busca
	     */
		public static function all(){
			return self::find();
		}

		/**
	     * Busca por cidades a partir do Id
	     * @param int $id Id da cidade
	     * @return City[] Resultado da busca
	     */
		public static function findById($id){
			//retorna apenas o primeiro objeto (no caso o unico)
			$city = self::find(array("id_city"), array($id));
			return count($city) > 0 ? $city[0] : NULL;
		}

		/**
	     * Busca por cidades a partir do nome
	     * @param string $name Nome da cidade
	     * @return City[] Resultado da busca
	     */
		public static function findByName($name){
			return self::find(array("name"), array($name));
		}

		/**
	     * Cria uma cidade
	     * @return boolean Resultado da criação
	     */
		public function save(){
			if ($exists = $this->exists()) return $exists;
			if (!$this->isValidData()) return false;

			$sql = 
			"INSERT INTO city
				(name, id_state)
			VALUES
				(:name, :id_state)";

			$params = array(
					":name" => $this->getName(),
					":id_state" => $this->getIdState()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdCity($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		/**
	     * Retorna a primeira cidade que se encaixe nos parâmetros nome e ID do estado
	     * @return City Resultado
	     */
		public function exists(){
			$city = self::find(
						array("name", "state.id_state"), 
						array($this->getName(), $this->getIdState())
					);
			return $city ? $city : false;
		}
	}
?>