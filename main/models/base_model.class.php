<?php
	class BaseModel{		
		//função para conveter campos do DB do formato snak_case para formato camelCase utilizado nas classes
	    public function snakToCamelCase($value){
			$value = str_replace("_", " ", $value);
			$value = lcfirst(str_replace(" ", "", ucwords($value)));
			return $value;
	    }

		public function __construct($data = array()){
			$this->setData($data);
		}

		public function setData($data){
			foreach ($data as $key => $value) {
				$method = $this->snakToCamelCase("set_$key");
				$this->$method($value);
			}
		}
	}
?>