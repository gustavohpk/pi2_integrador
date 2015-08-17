<?php
/**
* Classe de relacionamento entre colaboradores e eventos
* @author Gustavo Pchek
*/

class Sponsorship extends BaseModel {
	/** @var int Id do patrocínio */
	private $idEventSponsor;
	/** @var int Id do evento */
	private $idEvent;
	/** @var int Id do colaborador */
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

	public function getIdSponsor() {
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

	/**
     * Atualiza a lista de colaboradores de um evento
     * @param Sponsorship[] $sponsorships As colaborações (relação entre colaborador e evento)
     * @param int idEvent ID do Evento
     * @return boolean Resultado
     */
	public function saveMultiple($sponsorships, $idEvent) {

        $pdo = \Database::getConnection();

        $result = true;

        try {

        	$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        	$pdo->beginTransaction();

        	$sql = "DELETE FROM sponsorship WHERE id_event = :id_event";
			$statment = $pdo->prepare($sql);
			$params = array(":id_event" => $idEvent);
			$statment->execute($params);

        	foreach ($sponsorships as $key => $sponsorship) {
        		$sql = "INSERT INTO sponsorship (id_event, id_sponsor) VALUES (:id_event, :id_sponsor)";
        		$params = array(
					":id_event" => $sponsorship->getIdEvent(),
					":id_sponsor" => $sponsorship->getIdSponsor(),
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

}
?>