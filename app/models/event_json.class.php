<?php

/**
 * Classe utilizada para serializar objeto javascript de evento - para ser utilizado no calendário
 */

class EventJson implements JsonSerializable{

	private $idEvent;
	private $name;
	private $date;
	private $path;

	public function __construct($enrollment){

		$this->idEvent = $event->getIdEvent();
		$this->name = $event->getName();
		$this->date = $event->getDate("m-d-Y");
		$this->path = $event->getPath();
	}

	public function jsonSerialize(){
		return [
			'id_enrollment' => $this->idEnrollment,
			'id_event' => $this->idEvent,
			'id_participant' => $this->idParticipant,
			'participant_name' => $this->participantName
		];

		return [
			$this->date [
				

			]
		];
	}



}