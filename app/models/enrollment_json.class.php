<?php

/**
 * Classe Inscrição Json
 * @author Gustavo Pchek
 */

class EnrollmentJson implements JsonSerializable{

	/**
     * @var int $idEnrollment ID da inscricao
     * @var int $idEvent ID do evento
     * @var int $idParticipant ID do participante
     * @var string $participantName Nome do participante
     */
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