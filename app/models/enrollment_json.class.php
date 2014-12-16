<?php

class EnrollmentJson implements JsonSerializable{

	private $idEnrollment;
	private $idEvent;
	private $idParticipant;
	private $participantName;

	public function __construct($enrollment){

		$this->idEnrollment = $enrollment->getIdEnrollment();
		$this->idEvent = $enrollment->event->getIdEvent();
		$this->idParticipant = $enrollment->participant->getIdParticipant();
		$this->participantName = $enrollment->participant->getName();
	}

	public function jsonSerialize(){
		return [
			'id_enrollment' => $this->idEnrollment,
			'id_event' => $this->idEvent,
			'id_participant' => $this->idParticipant,
			'participant_name' => $this->participantName
		];
	}



}