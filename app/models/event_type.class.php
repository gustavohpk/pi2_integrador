<?php

	/**
	 * Classe de gerência de Tipos de Evento
	 * @author Rodrigo Miss
	 * @author Gustavo Pchek
	 */
	class EventType extends BaseModel{

		/**
		 * @var int $idEventType ID do tipo de evento
		 * @var string $eventType Nome do tipo de evento
		 * @var string $teacherType Tipo de ministrante
		 * @var string $code Código do tipo de evento
		 */
		private $idEventType;
		private $eventType;
		private $teacherType;
		private $code;
		
		public function setIdEventType($idEventType){
			$this->idEventType = $idEventType;
		}

		public function setEventType($eventType){
			$this->eventType = $eventType;
		}

		public function setTeacherType($teacherType){
			$this->teacherType = $teacherType;
		}

		public function setCode($code){
			$this->code = $code;
		}

		public function getIdEventType(){
			return $this->idEventType;
		}

		public function getEventType(){
			return $this->eventType;
		}

		public function getTeacherType(){
			return $this->teacherType;
		}

		public function getCode(){
			return $this->code;
		}

		/**
	     * Busca por tipos de evento
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @param string $order Ordernar resultados por este campo
	     * @param string $direction Ordem ascendente ou descendente dos resultados
	     * @return EventType[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND", $order = "id_event_type", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM event_type" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$eventTypes = array();			

			foreach ($rows as $row) {
				$eventTypes[] = new EventType($row);
			}
				
			return $eventTypes;
		}

		/**
	     * Busca todos os tipos de evento
	     * @return EventType[] Resultado da busca
	     */
		public static function all(){
			return self::find();
		}


		/**
	     * Busca por tipos de evento a partir do id
	     * @param id $id Id do tipo de evento
	     * @return EventType[] Resultado da busca
	     */
		public static function findById($id){
			$sql = "SELECT * FROM event_type WHERE id_event_type = :id_event_type";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_event_type" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $eventTypes = array();

	        if($result){
	            $eventTypes[] = new EventType($result[0]);
	        }

	        return count($eventTypes) > 0 ? $eventTypes : NULL;
		}

		/**
	     * Cria um tipo de evento
	     * @return boolean Resultado da criação
	     */
		public function save(){
			$sql = 
			"INSERT INTO event_type
				(event_type, teacher_type, code)
			VALUES
				(:event_type, :teacher_type, :code)";

			$params = array(
					":event_type" => $this->getEventType(),
					":teacher_type" => $this->getTeacherType(),
					":code" => $this->getCode()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		/**
	     * Atualiza o tipo de evento
	     * @param mixed[] $data Dados do tipo de evento
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
			$sql = "UPDATE event_type SET %s WHERE id_event_type = ".$this->getIdEventType();
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
	     * Exclui o tipo de evento
	     * @return boolean Resultado da exclusão
	     */
		public function remove(){
			$sql = "DELETE FROM event_type WHERE id_event_type = :id_event_type";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_event_type" => $this->getIdEventType());
			return $statment->execute($params);
		}

		/**
	     * Conta quantos tipos de evento existem
	     * @return int Resultado da contagem
	     */
		public static function count(){
			$sql = "SELECT count(id_event_type) as count FROM event_type";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}
	}
?>