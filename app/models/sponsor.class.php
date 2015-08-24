<?php
	class Sponsor extends BaseModel{

		/**
		 * @var int $idSponsor ID do patrocinador / colaborador
		 * @var string $name Nome do patrocinador / colaborador
		 * @var string $webAddress Link do site / endereço web
		 * @var string $description Descrição
		 * @var mixed $image Imagem do patrocinador / colaborador
		 */
		private $idSponsor;
		private $name;
		private $webAddress;
		private $description;
		private $image;
		
		public function setIdSponsor($idSponsor){
			$this->idSponsor = $idSponsor;
		}

		public function setName($name){
			$this->name = $name;
		}

		public function setWebAddress($webAddress){
			$this->webAddress = $webAddress;
		}

		public function setDescription($description){
			$this->description = $description;
		}

		public function getIdSponsor(){
			return $this->idSponsor;
		}

		public function getName(){
			return $this->name;
		}

		public function getWebAddress(){
			return $this->webAddress;
		}

		public function getDescription(){
			return $this->description;
		}

		/**
	     * Busca por patrocinadores / colaboradores
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @param string $order Ordernar resultados por este campo
	     * @param string $direction Ordem ascendente ou descendente dos resultados
	     * @return Sponsor[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND", $order = "id_sponsor", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);			
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT * FROM sponsor" .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;

			$sql .= " LIMIT $start, $limit";

			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$sponsors = array();			

			foreach ($rows as $row) {
				$sponsors[] = new Sponsor($row);
			}
				
			return $sponsors;
		}

		/**
	     * Busca todos os patrocinadores / colaboradores
	     * @return Sponsor[] Resultado da busca
	     */
		public static function all(){
			return self::find();
		}

		/**
	     * Busca por colaboradores / patrocinadores a partir do id
	     * @param id $id Id do patrocinador / colaborador
	     * @return Sponsor[] Resultado da busca
	     */
		public static function findById($id){
			$sql = "SELECT * FROM sponsor WHERE id_sponsor = :id_sponsor";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_sponsor" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $sponsors = array();

	        if($result){
	            $sponsors[] = new Sponsor($result[0]);
	        }

	        return count($sponsors) > 0 ? $sponsors : NULL;
		}

		/**
	     * Cria um patrocinador / colaborador
	     * @return boolean Resultado da criação
	     */
		public function save(){
			$sql = 
			"INSERT INTO sponsor
				(name, web_address, description)
			VALUES
				(:name, :web_address, :description)";

			$params = array(
					":name" => $this->getName(),
					":web_address" => $this->getWebAddress(),
					":description" => $this->getDescription(),
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			return $statment->execute($params);
		}

		/**
	     * Atualiza o patrocinador / colaborador
	     * @param mixed[] $data Dados do patrocinador / colaborador
	     * @return boolean Resultado da atualização
	     */
		public function update($data = array()){
			$this->setData($data);

			$keys = array_keys($data);
			foreach ($keys as $key) {
				$params .= "$key = :$key, ";
			}

			//remove a ultima (",") virgula
			$params = substr($params, 0, -2);
			$sql = "UPDATE sponsor SET %s WHERE id_sponsor = ".$this->getIdSponsor();
			$sql = sprintf($sql, $params);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			
			$param = array();
			foreach ($keys as $key){
				$param[":$key"] = $data[$key];
			}
	
			return $statment->execute($param);
		}

		/**
	     * Conta quantos patrocinadores / colaboradores existem
	     * @return int Resultado da contagem
	     */
		public static function count(){
			$sql = "SELECT count(id_sponsor) as count FROM sponsor";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			return $rows["count"];
		}

		/**
	     * Exclui o patrocinador / colaborador
	     * @return boolean Resultado da exclusão
	     */
		public function remove(){
			$sql = "DELETE FROM sponsor WHERE id_sponsor = :id_sponsor";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_sponsor" => $this->getIdSponsor());
			return $statment->execute($params);
		}
	}
?>