<?php
/**
* Classe de relacionamento entre patrocinadores e eventos
* @author Gustavo Pchek
*/

class Sponsorship extends BaseModel {
	/** @var int Id do patrocínio */
	private $idEventSponsor;
	/** @var int Id do evento */
	private $idEvent;
	/** @var int Id do patrocinador */
	private $idSponsor;

	public function setIdSponsorship($idSponsorship) {
		$this->idSponsorship = $idSponsorship;
	}

	public function getIdSponsorship() {
		return $this->idSponsorship;
	}

	public function setIdEvent($idEvent) {
		$this->idEvent = $idEvent;
	}

	public function getIdEvent() {
		return $this->idEvent;
	}

	public function setIdSponsor($idSponsor) {
		$this->idSponsor = $idSponsor;
	}

	public function getIdSponsor($format = "Y-m-d H:i:s") {
		return $this->idSponsor;
	}

		public static function find($params = array(), $values = array(), $operator = "=", $compare = "AND"){
		list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $operator, $compare);

		$sql = 
		"SELECT 
			*
		FROM
			sponsorship" . ($paramsName ? " WHERE " . $paramsName : "");
		$pdo = \Database::getConnection();
		$statment = $pdo->prepare($sql);
		$statment->execute($paramsValue);
		$rows = $statment->fetchAll($pdo::FETCH_ASSOC);
		$sponsorships = array();		

		foreach ($rows as $row) {
			$sponsorships[] = new Sponsorship($row);
		}
		
		return $sponsorships;
	}

	public static function all(){
		return self::find();
	}

	public static function findById($id){
		return self::find(array("id_sponsorship"), array($id));
	}

	public static function findByIdEvent($idEvent) {
		return self::find(array("id_event"), array($idEvent));
	}

	public static function findByIdSponsor($idSponsor) {
		return self::find(array("id_sponsor"), array($idSponsor));
	}

	public function save(){

		$sql = 
		"INSERT INTO sponsorship
			(id_event, id_sponsor)
		VALUES
			(:id_event, :id_sponsor)";
		$params = array(
				":id_event" => $this->getIdEvent(),
				":id_sponsor" => $this->getIdSponsor(),
			);
		$pdo = \Database::getConnection();
		$statment = $pdo->prepare($sql);
		$statment = $statment->execute($params);
		$this->setIdSponsorship($pdo->lastInsertId());
		return $statment ? $this : false;

	}

}
?>