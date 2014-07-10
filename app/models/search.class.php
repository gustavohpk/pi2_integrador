<?php
	class Search extends BaseModel{
		public function formatSearchString($searchValue){
			return self::removeSpecialCharacters($searchValue);
		}
	}