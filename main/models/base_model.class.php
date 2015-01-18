<?php

/**
 * Modelo base.
 * @author Rodrigo Miss
 */

	class BaseModel{

		/** @var string[] $errors Lista de erros  */
		protected $errors = array();

		/**
		 * @var int $limitByPage Limite de itens por página
		 * @var int $currentPage Página atual
		 */
		private static $limitByPage = 15, $currentPage = 1;

		public function validateData(){}


		public function __construct($data = array()){
			$this->setData($data);
		}

		/**
		 * Define os dados a serem utilizados pelos controladores e visões
		 * @param string[] $data Array de dados
		 */
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

	    /**
	     * Retorna os erros salvos na variável
	     * return string[] Os erros
	     */
	    public function getErrors(){
	    	return $this->errors;
	    }

	    /**
	     * Define o limite de itens por página
	     * @param int $limitByPage Limite
	     */
	    public static function setLimitByPage($limitByPage){
	    	self::$limitByPage = $limitByPage;
	    }

	    /**
	     * Define a página atual
	     * @param int $currentPage Página atual
	     */
	    public static function setCurrentPage($currentPage){
	    	self::$currentPage = $currentPage;
	    }

	    /**
	     * Retorna o limite de itens por página
	     * @return int Limite
	     */
	    public static function getLimitByPage(){
	    	return self::$limitByPage;
	    }

	    /**
	     * Retorna a página atual
	     * @return int Página atual
	     */
	    public static function getCurrentPage(){
	    	return self::$currentPage;
	    }

	    /**
	     * Retorna os parâmetros para serem utilizados nos PDOs das funções de busca dos modelos
	     * @param string[] $params Os parâmetros (campos no banco)
	     * @param string[] $values Os valores
	     * @param string $operator O operador
	     * @param string $compare O comparador
	     * @return array Uma array com os parâmetros e seus respectivos valores
	     */
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

		/**
		 * Converte o valor no formato "snake case" para o formato "camel case"
		 * @param string $value O valor em snake case
		 * @return string O valor em camel case
		 */
	    public function snakToCamelCase($value){
			$value = str_replace("_", " ", $value);
			$value = lcfirst(str_replace(" ", "", ucwords($value)));
			return $value;
	    }

	    /**
	     * Valida um endereço de e-mail
	     * @param string $email Endereço de e-mail
	     * @return bool Retorna se é válido
	     */
	    public function validateEmail($email){
			return (eregi("^[a-z0-9_\.\-]+@[a-z0-9_\.\-]*[a-z0-9_\-]+\.[a-z]{2,4}$", $email));
		}

		/**
		 * Valida um link de vídeo do Youtube
		 * @param string $link Link do vídeo
		 * @return bool Retorna se é válido
		 */
		public function validateYoutubeLink($link){
			if (strpos($link, 'youtube.com/watch?v=') != false){
				return true;
			}
		}

		/**
		 * Verifica se a data é válida
		 * @param string $date A data
		 * @return boolean Retorna se é válida
		 */
		public function is_date($date) {
			$date = explode("/", $date);
			return checkdate($date[1], $date[0], $date[2]);
		}

		/**
		 * Valida um número de CPF
		 * @param string $cpf O número de CPF
		 * @return boolean Retorna se é válido
		 */
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

		/**
		 * Remove caracteres especiais, incluindo acentos e cedilha
		 * @param string $string A string a ser limpada
		 * @return string A string com os caracteres especiais substituídos
		 */
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