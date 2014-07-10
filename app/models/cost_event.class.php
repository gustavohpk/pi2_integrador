<?php
	class CostEvent extends BaseModel {	
		private $id_cost_event;
		private $id_event;
		private $date_max;
		private $cost;

		public function setIdCostEvent($idCostEvent) {
			$this->setIdCostEvent = $idCostEvent;
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
			$this->dateMax = $dateMax;
		}

		public function getDateMax() {
			return $this->dateMax;
		}

		public function setCost($cost) {
			$this->cost = $cost;
		}

		public function getCost() {
			return $this->cost;
		}

 		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);

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

		public static function all(){
			return self::find();
		}

		public static function findById($id){
			return self::find(array("id_cost_event"), array($id));
		}

		public static function findByIdEvent($idEvent, $listAll = false) {
			if ($listAll) {
				return self::find(array("id_event"), array($idEvent));
			}
			else{
				//return self::find(array("id_event", "date_max"), array($idEvent, date("Y-m-d")), "");
				return self::find(array("id_event"), array($idEvent));
			}
		}

	}
?>