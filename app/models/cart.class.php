<?php
	class Cart extends BaseModel {	
		private $cart;

		public function __construct(){
			if (!isset($_SESSION["cart"])) {
				$_SESSION["cart"] = array();
			}
			$this->cart = &$_SESSION["cart"];
		}

		public function getErrors(){
			$errors = $this->errors;
			$this->errors = array();
			return $errors;
		}

		public function add($idEvent) {
			if (!$event = Event::findById($idEvent)) {
				$this->errors[] = "Evento não localizado.";
				return false;
			}
			$event = $event[0];

			if (!$costEvent = CostEvent::findByIdEvent($idEvent)) {
				$this->errors[] = "Problemas ao tentar localizar o valor do evento.";
				return false;
			}

			$this->cart[] = array(
					"id_event" => $event->getIdEvent(),
					"id_payment_type" => $event->getIdPaymentType(),
					"cost" => $costEvent[0]->getCost()
				);
			return true;
		}

		public function remove($idItem) {
			if (array_key_exists($idItem, $this->cart)) {
				unset(self::$this->cart[$idItem]);
			}
		}

		public function getSum(){
			$sum = 0;
			foreach ($this->cart as $item) {
				$sum += $item["cost"];
			}
			return $sum;
		}

		public function getItems() {
			return $this->cart;
		}

		public function close(){
			$cart = $this->cart;
			$this->cart = array();
			return $cart;
		}

	}
?>