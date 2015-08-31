<?php

	/**
	 * Classe de gerência de Tipos de Evento
	 * @author Rodrigo Miss
	 * @author Gustavo Pchek
	 */
	class ParticipantType extends BaseModel{

		/**
		 * @var int $idParticipantType ID do tipo de participante
		 * @var string $participantType Nome do tipo de participante
		 * @var string $name Tipo de ministrante
		 * @var string $code Código do tipo de participante
		 */
		private $idParticipantType;
		private $name;
		private $code;
		private $description;
		
		public function setIdParticipantType($idParticipantType){
			$this->idParticipantType = $idParticipantType;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function setCode($code){
			$this->code = $code;
		}

		public function setDescription($description){
			$this->description = $description;
		}


		public function getIdParticipantType(){
			return $this->idParticipantType;
		}

		public function getName(){
			return $this->name;
		}

		public function getCode(){
			return $this->code;
		}

		public function getDescription(){
			return $this->description;
		}


		/**
	     * Busca por tipos de participante
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @param string $order Ordernar resultados por este campo
	     * @param string $direction Ordem ascendente ou descendente dos resultados
	     * @return ParticipantType[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND", $order = "id_participant_type", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM participant_type" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$participantTypes = array();			

			foreach ($rows as $row) {
				$participantTypes[] = new ParticipantType($row);
			}
				
			return $participantTypes;
		}

		/**
	     * Busca todos os tipos de participante
	     * @return ParticipantType[] Resultado da busca
	     */
		public static function all(){
			return self::find();
		}


		/**
	     * Busca por tipos de participante a partir do id
	     * @param id $id Id do tipo de participante
	     * @return ParticipantType[] Resultado da busca
	     */
		public static function findById($id){
			$sql = "SELECT * FROM participant_type WHERE id_participant_type = :id_participant_type";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_participant_type" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $participantTypes = array();

	        if($result){
	            $participantTypes[] = new ParticipantType($result[0]);
	        }

	        return count($participantTypes) > 0 ? $participantTypes : NULL;
		}

		/**
	     * Cria um tipo de participante
	     * @return boolean Resultado da criação
	     */
		public function save(){
			$sql = 
			"INSERT INTO participant_type
				(name, code, description)
			VALUES
				(:name, :code, :description)";

			$params = array(
					":name" => $this->getName(),
					":code" => $this->getCode(),
					":description" => $this->getDescription(),
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		/**
	     * Atualiza o tipo de participante
	     * @param mixed[] $data Dados do tipo de participante
	     * @return boolean Resultado da atualização
	     */
		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE participant_type SET %s WHERE id_participant_type = ".$this->getIdParticipantType();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		/**
	     * Exclui o tipo de participante
	     * @return boolean Resultado da exclusão
	     */
		public function remove(){
			$sql = "DELETE FROM participant_type WHERE id_participant_type = :id_participant_type";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_participant_type" => $this->getIdParticipantType());
			return $statment->execute($params);
		}

		/**
	     * Conta quantos tipos de participante existem
	     * @return int Resultado da contagem
	     */
		public static function count(){
			$sql = "SELECT count(id_participant_type) as count FROM participant_type";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}
	}
?>