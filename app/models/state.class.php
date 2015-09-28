<?php 

	/**
	 * Classe Estado.
	 * @author Rodrigo Miss
	 */

	class State extends BaseModel{

		/**
	     * @var int $idState ID do estado
	     * @var string $state Nome do estado
	     */
		private $idState;
		private $state;

   		public function setIdState($idState){
   			$this->idState = $idState;
   		}

   		public function setState($state){
   			$this->state = $state;
   		}

   		public function getIdState(){
   			return $this->idState;
   		}

   		public function getState(){
   			return $this->state;
   		}

   		public function validateData(){
   			if (strlen($this->getState()) < 2) $this->errors[] = "Estado não informado.";
   		}

   		/**
	     * Busca por estados
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @return State[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);
			$sql = "SELECT * FROM state" . (!is_null($paramsName) ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$states = array();			

			foreach ($rows as $row) {
				$states[] = new State($row);
			}
			
			return $states;
		}

		/**
	     * Busca todos os estados
	     * @return State[] Resultado da busca
	     */
		public static function all(){
			return self::find();
		}

		/**
	     * Busca por estados a partir do Id
	     * @param int $id Id do estado
	     * @return State[] Resultado da busca
	     */
		public static function findById($id){
			//retorna apenas o primeiro objeto (no caso o unico)
			$state = self::find(array("id_state"), array($id));
			return count($state) > 0 ? $state[0] : NULL;
		}

		/**
	     * Busca por estados a partir do Nome
	     * @param int $name Nome do estado
	     * @return State[] Resultado da busca
	     */
		public static function findByName($state){
			$states = self::find(array("state"), array($state));
			return count($states) > 0 ? $states : NULL;
		}

		/**
	     * Cria um estado
	     * @return boolean Resultado da criação
	     */
		public function save(){
			if ($exists = $this->exists()) return $exists;
			if (!$this->isValidData()) return false;
			
			$sql = 
			"INSERT INTO state
				(state)
			VALUES
				(:state)";

			$params = array(
					":state" => $this->getState()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment = $statment->execute($params);
			$this->setIdState($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		/**
	     * Retorna o primeiro estado que se encaixe no parâmetro nome
	     * @return State Resultado
	     */
		public function exists(){
			$states = self::findByName($this->getState());
			return $states ? $states : false;
		}
	}
?>