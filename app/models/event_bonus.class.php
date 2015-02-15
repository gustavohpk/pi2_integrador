<?php
/**
* Classe de bônus de evento
* Utilizada para relacionar um evento e um tipo de evento, além de definir a quantidade de eventos bônus
* @author Gustavo Pchek
*/

class EventBonus extends BaseModel {
	/** @var int Id do bonus */
	private $idEventBonus;
	/** @var int Id do tipo de evento */
	private $idEventType;
	/** @var int Id do evento */
	private $idEvent;
	/** @var int Número de eventos bônus*/
	private $quantity;

	public function setIdEventBonus($idEventBonus) {
		$this->idEventBonus = $idEventBonus;
	}

	public function getIdEventBonus() {
		return $this->idEventBonus;
	}

	public function setIdEventType($idEventType) {
		$this->idEventType = $idEventType;
	}

	public function getIdEventType() {
		return $this->idEventType;
	}

	public function setIdEvent($idEvent) {
		$this->idEvent = $idEvent;
	}

	public function getIdEvent() {
		return $this->idEvent;
	}

	public function setQuantity($quantity) {
		$this->quantity = $quantity;
	}

	public function getQuantity() {
		return $this->quantity;
	}

	public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
		list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);

		$sql = 
		"SELECT 
			*
		FROM
			event_bonus" . ($paramsName ? " WHERE " . $paramsName : "");
		$pdo = \Database::getConnection();
		$statment = $pdo->prepare($sql);
		$statment->execute($paramsValue);
		$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
		$eventBonuses = array();		

		foreach ($rows as $row) {
			$eventBonuses[] = new EventBonus($row);
		}
		
		return $eventBonuses;
	}

	public static function all(){
		return self::find();
	}

	public static function findById($id){
		return self::find(array("id_event_bonus"), array($id));
	}

	public static function findByIdEvent($idEvent) {
		return self::find(array("id_event"), array($idEvent));
	}

	public function save(){

		$sql = 
		"INSERT INTO event_bonus
			(id_event_type, id_event, quantity)
		VALUES
			(:id_event_type, :id_event, :quantity)";
		$params = array(
				":id_event_type" => $this->getIdEventType(),
				":id_event" => $this->getIdEvent(),
				":quantity" => $this->getQuantity(),
			);
		$pdo = \Database::getConnection();
		$statment = $pdo->prepare($sql);
		$statment = $statment->execute($params);
		$this->setIdEventBonus($pdo->lastInsertId());
		return $statment ? $this : false;
	}

	public function update($data = array()){
		$this->setData($data);

		$keys = array_keys($data);
		foreach ($keys as $key) {
			$params .= "$key = :$key, ";
		}

		//remove a ultima (",") virgula
		$params = substr($params, 0, -2);
		$sql = "UPDATE event_bonus SET %s WHERE id_event_bonus = ".$this->getIdEventBonus();
		$sql = sprintf($sql, $params);
		$pdo = \Database::getConnection();
		$statment = $pdo->prepare($sql);
		
		$param = array();
		foreach ($keys as $key){
			$param[":$key"] = $data[$key];
		}

		return $statment->execute($param);
	}

}
?>