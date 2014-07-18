<?php
	class BaseModel{		
		protected $errors = array();
		private static $limitByPage = 15;
		private static $currentPage = 1;

		public function validateData(){}

		public function __construct($data = array()){
			$this->setData($data);
		}

		public function setData($data){
			foreach ($data as $key => $value) {
				$method = $this->snakToCamelCase("set_$key");
				$this->$method($value);
			}
		}

	    public function isValidData(){
	    	$this->errors = array();
	    	$this->validateData();
	    	return empty($this->errors);
	    }

	    public function getErrors(){
	    	return $this->errors;
	    }

	    public static function setLimitByPage($limitByPage){
	    	self::$limitByPage = $limitByPage;
	    }

	    public static function setCurrentPage($currentPage){
	    	self::$currentPage = $currentPage;
	    }

	    public static function getLimitByPage(){
	    	return self::$limitByPage;
	    }

	    public static function getCurrentPage(){
	    	return self::$currentPage;
	    }

	    /*
	    * Funções auxiliares para os models
	    */
	    //retorna parametros para funcao find()
		protected function getParamsSQL($params, $values, $operator, $compare){
			$paramsValue = array();
			$i = 0;
			$paramsName = "";

			foreach ($params as $param){
				$aux = str_replace(".", "", $param);
				$paramsName .= "$param $operator :$aux $compare ";
				$paramsValue[":$aux"] = $values[$i]; 
				$i++;
			}

			//remove o operador de comparação do final da string
			$paramsName = substr($paramsName, 0, (strlen($compare)+2)*(-1));
			return array($paramsName, $paramsValue);
		}

		//função para conveter campos do DB do formato snak_case para formato camelCase utilizado nas classes
	    public function snakToCamelCase($value){
			$value = str_replace("_", " ", $value);
			$value = lcfirst(str_replace(" ", "", ucwords($value)));
			return $value;
	    }

	    public function validateEmail($email){
			return (eregi("^[a-z0-9_\.\-]+@[a-z0-9_\.\-]*[a-z0-9_\-]+\.[a-z]{2,4}$", $email));
		}

		public function is_date($date) {
			$date = explode("/", $date);
			return checkdate($date[1], $date[0], $date[2]);
		}

		public function validateCpf($cpf){ 
			$cpf = preg_replace("/[^0-9]/", "", $cpf);
			$digitoUm = 0;
			$digitoDois = 0;
			
			if (strlen($cpf) < 11) return false;
			for($i = 0, $x = 10; $i <= 8; $i++, $x--){
			    $digitoUm += $cpf[$i] * $x;
			}
			
			for($i = 0, $x = 11; $i <= 9; $i++, $x--){
				if (str_repeat($i, 11) == $cpf){
				    return false;
				}
				$digitoDois += $cpf[$i] * $x;
			}

			$calculoUm  = (($digitoUm%11) < 2) ? 0 : 11-($digitoUm%11);
			$calculoDois = (($digitoDois%11) < 2) ? 0 : 11-($digitoDois%11);
			
			if ($calculoUm <> $cpf[9] || $calculoDois <> $cpf[10]){
			    return false;
			}
			else{
				return true;
			}
		}
		public function removeSpecialCharacters($string){
	    	$cleanedString = strtr($string,
	    	array (
	 
		      'À' => 'A', 'Á' => 'A', 'Â' => 'A', 'Ã' => 'A', 'Ä' => 'A', 'Å' => 'A',
		      'Æ' => 'A', 'Ç' => 'C', 'È' => 'E', 'É' => 'E', 'Ê' => 'E', 'Ë' => 'E',
		      'Ì' => 'I', 'Í' => 'I', 'Î' => 'I', 'Ï' => 'I', 'Ð' => 'D', 'Ñ' => 'N',
		      'Ò' => 'O', 'Ó' => 'O', 'Ô' => 'O', 'Õ' => 'O', 'Ö' => 'O', 'Ø' => 'O',
		      'Ù' => 'U', 'Ú' => 'U', 'Û' => 'U', 'Ü' => 'U', 'Ý' => 'Y', 'Ŕ' => 'R',
		      'Þ' => 's', 'ß' => 'B', 'à' => 'a', 'á' => 'a', 'â' => 'a', 'ã' => 'a',
		      'ä' => 'a', 'å' => 'a', 'æ' => 'a', 'ç' => 'c', 'è' => 'e', 'é' => 'e',
		      'ê' => 'e', 'ë' => 'e', 'ì' => 'i', 'í' => 'i', 'î' => 'i', 'ï' => 'i',
		      'ð' => 'o', 'ñ' => 'n', 'ò' => 'o', 'ó' => 'o', 'ô' => 'o', 'õ' => 'o',
		      'ö' => 'o', 'ø' => 'o', 'ù' => 'u', 'ú' => 'u', 'û' => 'u', 'ý' => 'y',
		      'þ' => 'b', 'ÿ' => 'y', 'ŕ' => 'r'
		    ));
		    return $cleanedString;
    	}
	}
?>