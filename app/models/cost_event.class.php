<?php

	/**
	 * Classe custo de evento.
	 * @author Gustavo Pchek
	 */
	class CostEvent extends BaseModel {

		/**
	     * @var int $idCostEvent ID do custo de evento
	     * @var int $idEvent ID do evento
	     * @var date $dateMax Data limite
	     * @var float $cost
	     */
		private $idCostEvent;
		private $idEvent;
		private $dateMax;
		private $cost;

		public function setIdCostEvent($idCostEvent) {
			$this->idCostEvent = $idCostEvent;
		}

		public function getIdCostEvent() {
			return $this->idCostEvent;
		}

		public function setIdEvent($idEvent) {
			$this->idEvent = $idEvent;
		}

		public function getIdEvent() {
			return $this->idEvent;
		}

		public function setDateMax($dateMax) {
			$this->dateMax = empty($dateMax) ? null : date("Y-m-d H:i:s", strtotime(str_replace("/", "-", $dateMax)));
		}

		public function getDateMax($format = "Y-m-d H:i:s") {
			return is_null($this->dateMax) ? null : date($format, strtotime($this->dateMax));
		}

		public function setCost($cost) {
			$this->cost = $cost;
		}

		public function getCost() {
			return $this->cost;
		}

		public function validateData() {
			$valid = false;
			if ((intval($this->getIdEvent())) < 1){
				$this->errors[] = "Não foi informado nenhum evento para o preço cadastrado.";
				if($valid == true) $valid = false;
			}
			if (is_null($this->getDateMax())){
				$this->errors[] = "Data Máxima para o preço não foi definida.";
				if($valid == true) $valid = false;
			}
			if ((floatval($this->getCost())) <= 0){
				$this->errors[] = "O preço do evento não pode ser 0.";
				if($valid == true) $valid = false;
			}
			if(strtotime($this->getDateMax()) > strtotime($this->events = \Event::findById($this->getIdEvent())[0]->getEndDateEnrollment())){
				$this->errors[] = "A data máxima de um preço não pode ser posterior à data limite de inscrição.";
				if($valid == true) $valid = false;
			}
			
			return $valid;
		}

 		/**
	     * Busca por preços de evento
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @return News[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);

			$sql = 
			"SELECT 
				*
			FROM
				cost_event" . ($paramsName ? " WHERE " . $paramsName : "");
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($paramsValue);
			$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
			$costEvents = array();		

			foreach ($rows as $row) {
				$costEvents[] = new CostEvent($row);
			}
			
			return $costEvents;
		}

		// public static function all(){
		// 	return self::find();
		// }

		/**
	     * Busca por preços de evento a partir do id
	     * @param int $id Id do preço de evento
	     * @return CostEvent[] Resultado da busca
	     */
		public static function findById($id){
			$sql = "SELECT * FROM cost_event WHERE id_cost_event = :id_cost_event";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_cost_event" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $eventCosts = array();

	        if($result){
	            $eventCosts[] = new CostEvent($result[0]);
	        }

	        return count($eventCosts) > 0 ? $eventCosts : NULL;
		}

		/**
	     * Busca por preços de evento a partir do id do evento
	     * @param int $id Id do preço de evento
	     * @return CostEvent[] Resultado da busca
	     */
		public static function findByIdEvent($idEvent) {
			return self::find(array("id_event"), array($idEvent));
		}

		/**
	     * Busca pelo preço do evento válido para certa data
	     * @param string $date Data
	     * @return News[] Resultado da busca
	     */
		public function getCostOfDay($date = null) {
			$date = is_null($date) ? date("Y-m-d") : $date;
			$sql = 
			"SELECT 
				MIN(date_max), cost
			FROM
				cost_event
			WHERE
				date_max >= :date AND id_event = :id_event";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute(array(":date" => $date, ":id_event" => $this->getIdEvent()));
			$row = $statment->fetch($pdo::FETCH_ASSOC);
			return (float) $row["cost"];
		}

		// public function save(){
		// 	if (!$this->isValidData()) return false;

		// 	$sql = 
		// 	"INSERT INTO cost_event
		// 		(id_event, date_max, cost)
		// 	VALUES
		// 		(:id_event, :data_max, :cost)";
		// 	$params = array(
		// 			":id_event" => $this->getIdEvent(),
		// 			":data_max" => $this->getDateMax(),
		// 			":cost" => $this->getCost()
		// 		);
		// 	$pdo = \Database::getConnection();
		// 	$statment = $pdo->prepare($sql);
		// 	$statment = $statment->execute($params);
		// 	$this->setIdCostEvent($pdo->lastInsertId());
		// 	return $statment ? $this : false;
		// }

		/**
	     * Atualiza a lista de preços de um evento
	     * @param CostEvent[] $costs Os preços
	     * @param int idEvent ID do Evento
	     * @return boolean Resultado
	     */
		public function saveMultiple($costs, $idEvent) {
	        $pdo = \Database::getConnection();

	        $result = true;

	        try {

	        	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	        	$pdo->setAttribute(PDO::ATTR_AUTOCOMMIT, FALSE);
	        	$pdo->beginTransaction();

	        	$sql = "DELETE FROM cost_event WHERE id_event = :id_event";
				$statment = $pdo->prepare($sql);
				$params = array(":id_event" => $idEvent);
				$statment->execute($params);

	        	foreach ($costs as $key => $cost) {
	        		$sql = "INSERT INTO cost_event (id_event, cost, date_max) VALUES (:id_event, :cost, :date_max)";
	        		$params = array(
						":id_event" => $cost->getIdEvent(),
						":cost" => $cost->getCost(),
						":date_max" => $cost->getDateMax()
					);
	        		$statment = $pdo->prepare($sql);
	        		$statment->execute($params);
	        	}

	        	$pdo->commit();
	        	
	        } catch (Exception $e) {
	        	$pdo->rollBack();
	        	$result = false;
	        	
	        }

	        return $result;
		}

		// public function update($data){
		// 	$this->setData($data);
		// 	if (!$this->isValidData()) return false;

		// 	$sql = 
		// 	"UPDATE 
		// 		cost_event
		// 	SET
		// 		date_max = :data_max,
		// 		cost = :cost
		// 	WHERE
		// 		id_cost_event = :id_cost_event";
		// 	$params = array(
		// 			":data_max" => $this->getDateMax(),
		// 			":cost" => $this->getCost(),
		// 			":id_cost_event" => $this->getIdCostEvent()
		// 		);
		// 	$pdo = \Database::getConnection();
		// 	$statment = $pdo->prepare($sql);
		// 	$statment = $statment->execute($params);
		// 	return $statment ? $this : false;
		// }
	}
?>