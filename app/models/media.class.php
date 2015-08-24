<?php

	class Media extends BaseModel{


		/**
		 * @var int $idMedia ID da mídia
		 * @var char $mediaType Tipo da mídia (p - photo / v - video)
		 * @var int $idEvent ID do evento relacionado
		 * @var string $label Etiqueta / título da mídia
		 * @var string $path Caminho da mídia (aplicável para mediaType photo)
		 */
		private $idMedia;
		private $mediaType;
		private $idEvent;
		private $label;
		private $path;

		/**
	     * @var Event $event Evento relacionado
	     */
		public $event;

		public function setIdMedia($idMedia){
			$this->idMedia = $idMedia;
		}

		public function setMediaType($mediaType){
			$this->mediaType = $mediaType;
		}

		public function setIdEvent($idEvent){
			$this->idEvent = $idEvent;
			$this->event = Event::findById($idEvent)[0];
		}

		public function setLabel($label){
			$this->label = $label;
		}

		public function setPath($path){
			$this->path = $path;
		}

		public function getIdMedia(){
			return $this->idMedia;
		}

		public function getMediaType(){
			return $this->mediaType;
		}

		public function getIdEvent(){
			return $this->idEvent;
		}

		public function getLabel(){
			return $this->label;
		}

		public function getPath(){
			return $this->path;
		}

		/**
	     * Busca por mídias
	     * @param mixed[] $params Os parâmetros (atributos / colunas)
	     * @param mixed[] $values valores
	     * @param string $comparsion O operador de comparação
	     * @param string $conjunctive O operador de conjunção
	     * @param string $order Ordernar resultados por este campo
	     * @param string $direction Ordem ascendente ou descendente dos resultados
	     * @return Media[] Resultado da busca
	     */
		public static function find($params = array(), $values = array(), $comparsion = "=", $conjunctive = "AND", $order = "id_media", $direction ="DESC"){
			list($paramsName, $paramsValue) = self::getParamsSQL($params, $values, $comparsion, $conjunctive);		
			$limit = self::getLimitByPage();
			$page = self::getCurrentPage();
			$start = ($page * $limit) - $limit;

			$sql = 
			"SELECT 
				*
			FROM 
				media " .($paramsName ? " WHERE $paramsName" : "") . " " ."ORDER BY " . $order . " " . $direction;
			$sql .= " LIMIT $start, $limit";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute($paramsValue);
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			$media = array();		
			foreach ($rows as $row) {
				$media[] = new Media($row);
			}
				
			return $media;
		}

		/**
	     * Conta quantas mídias existem
	     * @return int Resultado da contagem
	     */
		public static function count(){
			$sql = "SELECT id_media FROM media";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetchAll($pdo::FETCH_ASSOC);
			return count($rows);
		}

		/**
	     * Busca todas as mídias
	     * @return Media[] Resultado da busca
	     */
		public static function all(){
			return self::find();
		}

		/**
	     * Busca por mídia a partir do id
	     * @param id $id Id da mídia
	     * @return Media[] Resultado da busca
	     */
		public static function findById($id){
			$sql = "SELECT * FROM media WHERE id_media = :id_media";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_media" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $media = array();

	        if($result){
	            $media[] = new Media($result[0]);
	        }

	        return count($media) > 0 ? $media : NULL;
		}

		/**
	     * Busca por mídia a partir do id do evento relacionado
	     * @param id $id Id do evento
	     * @return Media[] Resultado da busca
	     */
		public static function findByIdEvent($id){
			$sql = "SELECT * FROM media WHERE id_event = :id_event";
	        $pdo = \Database::getConnection();
	        $statment = $pdo->prepare($sql);
	        $params = array(":id_event" => $id);
	        $statment->execute($params);

	        $result = $statment->fetchAll($pdo::FETCH_ASSOC);

	        $media = array();
	        
	        if($result){
	            $media[] = new Media($result[0]);
	        }

	        return count($media) > 0 ? $media : NULL;
		}

		/**
	     * Atualiza a mídia
	     * @param mixed[] $data Dados da mídia
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
			$sql = "UPDATE media SET %s WHERE id_media = ".$this->getIdMedia();
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
	     * Cria uma mídia
	     * @param string $path Caminho da mídia (apenas para mediaType photo)
	     * @param int $index Índice da imagem no diretório temporário de upload
	     * @return boolean Resultado da criação
	     */
		public function save($path, $index){
			if ($this->getMediaType() == "p") {
	            $this->setPath($this->imagePath($path, $index));
	        }else{
	        	if(!$this->validateYoutubeLink($this->getPath()))
	        		return false;
	        }
			$sql = 
			"INSERT INTO media
				(media_type, id_event, label, path)
			VALUES
				(:media_type, :id_event, :label, :path)";

			$params = array(
					":media_type" => $this->getMediaType(),
					":id_event" => $this->getIdEvent(),
					":label" => $this->getLabel(),
					":path" => $this->getPath()
				);
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$statment->execute($params);
			$this->setIdMedia($pdo->lastInsertId());
			return $statment ? $this : false;
		}

		/**
	     * Exclui a notícia
	     * @return boolean Resultado da exclusão
	     */
		public function remove(){
			$sql = "DELETE FROM media WHERE id_media = :id_media";
			$pdo = \Database::getConnection();
			$statment = $pdo->prepare($sql);
			$params = array(":id_media" => $this->getIdMedia());
			return $statment->execute($params);
		}

		/**
	     * Gera um caminho para a imagem
	     * @param string $path Caminho da mídia (apenas para mediaType photo)
	     * @param int $index Índice da imagem no diretório temporário de upload
	     * @return string Caminho da imagem
	     */
		private function imagePath($path, $index){
			switch ($_FILES["photos"]["type"][$index]) {
				case 'image/png': $type = '.png'; break;
				case 'image/jpeg': case 'image/jpg': $type = '.jpg'; break;
				case 'image/gif': $type = '.gif'; break;
			}
			$number = 1;
			$absolutePath = '/var/www/' . $path . 'event' . $this->getIdEvent() . '_' . 'image' . strval($number) . $type;

			while (file_exists($absolutePath)){
				$number = substr($absolutePath, -5, 1);
				$number = intval($number);
				$number++;
				$absolutePath = '/var/www/' . $path . 'event' . $this->getIdEvent() . '_' . 'image' . strval($number) . $type;
			}
			$relativePath = $path . 'event' . $this->getIdEvent() . '_' . 'image' . strval($number) . $type;
			return $relativePath;
		}

		/**
	     * Busca uma miniatura para um vídeo no Youtube a partir do link
	     * @param string $link Link do vídeo
	     * @return string Url da miniatura
	     */
		public function getThumbnail($link){
        	$code = substr($link, (strpos($link, '=')+1), 30);
         	$thumbnailUrl = 'http://img.youtube.com/vi/' . $code . '/0.jpg';
         	return $thumbnailUrl;
    	}

    	/**
	     * Verifica se existem mídias relacionadas a um evento
	     * @param int $idEvent ID do evento
	     * @return boolean Resultado da verificação
	     */
    	public static function hasMedia($idEvent){
			$sql = "SELECT count(id_media) as count FROM media WHERE id_event = $idEvent";
			$pdo = \Database::getConnection();
			$rs = $pdo->prepare($sql);
			$rs->execute();
			$rows = $rs->fetch();
			if($rows["count"] == 0){
				return false;
			}
			return true;
		}
	}
?>