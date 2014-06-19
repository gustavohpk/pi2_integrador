<?php
	class Users{
		public function getName($id){
			/*$pdo = Database::getConnection();
			$rows = $pdo->query("SELECT * FROM cidade");
			
			foreach ($rows as $row) {
				echo $row["nome"]."<br>";
			}
			*/
			$usuarios = array(
				"users" => array(
				array('nome' => 'Rodrigo Miss', 'Idade'=>27), 
				array('nome' => 'Samuel Pereira Miss', 'Idade'=>1)
				)
			);

			return $usuarios;
		}		
	}
?>