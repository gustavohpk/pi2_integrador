<?php

class MediaJson implements JsonSerializable{

	private $idMedia;
	private $idEvent;
	private $label;
	private $mediaType;
	private $path;
	private $thumbnail = null;

	public function __construct($media){

		$this->idMedia = $media->getIdMedia();
		$this->idEvent = $media->getIdEvent();
		$this->label = $media->getLabel();
		$this->mediaType = $media->getMediaType();
		$this->path = $media->getPath();
		if($this->mediaType == "v"){
			$this->thumbnail = Media::getThumbnail($this->path);
		}
	}

	public function jsonSerialize(){
		return [
			'id_media' => $this->idMedia,
			'id_event' => $this->idEvent,
			'label' => $this->label,
			'mediaType' => $this->mediaType,
			'path' => $this->path,
			'thumbnail' => $this->thumbnail
		];
	}
}