<?php

/**
 * Classe para geração de relatórios.
 * @author Gustavo Pchek
 */

	class Reports extends BaseModel{
		/**
	     * @var string $dateTo Data inicial
	     * @var string $timeTo Hora inicial
	     * @var string $dateTo Data final
	     * @var string $timeTo Hora final
	     * @var bool $confirmed Se o relatório incluirá inscrições confirmadas
	     * @var bool $unconfirmed Se o relatório incluirá inscrições não confirmadas
	     * @var bool $present Se o relatório incluirá inscrições com presença confirmada
	     * @var bool $absent Se o relatório incluirá inscrições com presença não confirmada
	     * @var int[] $events Os eventos que as inscrições serão relacionadas, pode ser vazio para relatório geral
	     */
		private $dateFrom, $timeFrom, $dateTo, $timeTo, $confirmed = false, $unconfirmed = false, $present = false, $absent = false, $events = array();

		/**
		 * Define a data inicial
		 * 
		 * @param string $dateFrom Data inicial
		 */
		public function setDateFrom($dateFrom){
			$this->dateFrom = empty($dateFrom) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $dateFrom)));
		}

		/**
		 * Define a hora inicial
		 * 
		 * @param string $timeFrom Hora inicial
		 */
		public function setTimeFrom($timeFrom){
			$this->timeFrom = empty($timeFrom) ? null : date("H:i", strtotime(str_replace("/", "-", $timeFrom)));
		}

		/**
		 * Define a data final
		 * 
		 * @param string $dateTo Data final
		 */
		public function setDateTo($dateTo){
			$this->dateTo = empty($dateTo) ? null : date("Y-m-d", strtotime(str_replace("/", "-", $dateTo)));
		}

		/**
		 * Define a hora final
		 * 
		 * @param string $timeTo Hora inicial
		 */
		public function setTimeTo($timeTo){
			$this->timeTo = empty($timeTo) ? null : date("H:i", strtotime(str_replace("/", "-", $timeTo)));
		}

		/**
		 * Define os eventos
		 * 
		 * @param mixed[] $Eventos Eventos
		 */
		public function setEvents($events){
			$this->events = $events;
		}

		/**
		 * Define se inscrições confirmadas serão incluídas no relatório
		 * 
		 * @param string $confirmed parâmetro
		 */
		public function setConfirmed($confirmed){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($confirmed)
				$this->confirmed = true;
			else
				$this->confirmed = false;
		}

		/**
		 * Define se inscrições não confirmadas serão incluídas no relatório
		 * 
		 * @param string $unconfirmed parâmetro
		 */
		public function setUnconfirmed($unconfirmed){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($unconfirmed)
				$this->unconfirmed = true;
			else
				$this->unconfirmed = false;
		}

		/**
		 * Define se inscrições com presença confirmada serão incluídas no relatório
		 * 
		 * @param string $present parâmetro
		 */
		public function setPresent($present){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($present)
				$this->present = true;
			else
				$this->present = false;
		}

		/**
		 * Define se inscrições com presença não confirmada serão incluídas no relatório
		 * 
		 * @param string $absent parâmetro
		 */
		public function setAbsent($absent){
			//O formulário manda a string "on" se a checkbox está marcada, então é necessária esta verificação para guardar true ou false
			if($absent)
				$this->absent = true;
			else
				$this->absent = false;
		}

		/**
		 * Retorna a data inicial
		 * 
		 * @return date Data inicial
		 */
		public function getDateFrom($format = "Y-m-d"){
			return is_null($this->dateFrom) ? null : date($format, strtotime($this->dateFrom));
		}

		/**
		 * Retorna a data final
		 * 
		 * @return date Data final
		 */
		public function getDateTo($format = "Y-m-d"){
			return is_null($this->dateTo) ? null : date($format, strtotime($this->dateTo));
		}

		/**
		 * Retorna a hora inicial
		 * 
		 * @return date Hora inicial
		 */
		public function getTimeFrom($format = "H:i"){
			return is_null($this->timeFrom) ? null : date($format, strtotime($this->timeFrom));
		}

		/**
		 * Retorna a hora final
		 * 
		 * @return date Hora final
		 */
		public function getTimeTo($format = "H:i"){
			return is_null($this->timeTo) ? null : date($format, strtotime($this->timeTo));
		}

		/**
		 * Retorna os eventos
		 * 
		 * @return mixed[] Eventos
		 */
		public function getEvents(){
			return $this->events;
		}

		/**
		 * Retorna se inscrições confirmadas farão parte do relatório
		 * 
		 * @return boolean Verificação
		 */
		public function getConfirmed(){
			return $this->confirmed;
		}

		/**
		 * Retorna se inscrições não confirmadas farão parte do relatório
		 * 
		 * @return boolean Verificação
		 */
		public function getUnconfirmed(){
			return $this->unconfirmed;
		}

		/**
		 * Retorna se inscrições com presença confirmada farão parte do relatório
		 * 
		 * @return boolean Verificação
		 */
		public function getPresent(){
			return $this->present;
		}

		/**
		 * Retorna se inscrições com presença não confirmada farão parte do relatório
		 * 
		 * @return boolean Verificação
		 */
		public function getAbsent(){
			return $this->absent;
		}

		/**
		 * Gera o relatório de inscrições
		 * 
		 * @return Enrollment[] Resultado
		 */
		public function generate(){

			$sql = "SELECT * FROM enrollment WHERE";

			if($this->getConfirmed() && $this->getUnconfirmed()){
				// não faz nada
			}else if($this->getConfirmed()){
				$sql .= " date_payment IS NOT NULL AND";
			}else if($this->getUnconfirmed()){
				$sql .= " date_payment IS NULL AND";
			}

			$sql .= " date_enrollment BETWEEN '" . $this->getDateFrom() . " " . $this->getTimeFrom() . "' AND '" . $this->getDateTo() . " " . $this->getTimeTo() . "'";

			if($this->getConfirmed()){
				if($this->getPresent() && $this->getAbsent()){
				// não faz nada
				}else if($this->getPresent()){
					$sql .= " AND attendance = 1";
				}else if($this->getAbsent()){
					$sql .= " AND attendance = 0";
				}
			}		

			if($this->getEvents())
				$sql .= " AND id_event IN (" . implode(',', array_map('intval', $this->getEvents())) . ")";

			$sql .= " ORDER BY date_enrollment ASC";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$enrollments = array();			

			foreach ($rows as $row) {
				$enrollments[] = new Enrollment($row);
			}
				
			return $enrollments;
		}
	}
?>