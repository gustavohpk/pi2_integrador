<?php
	class AutoLoadClasses{
		static function load($class_name){
			$class_name = strtolower(preg_replace('/([a-z])([A-Z])/', '$1_$2', $class_name));
			$class_name .= ".class.php";

		  	$files = array();
		    $files[] = APP_ROOT_FOLDER . '/core/routes/' . $class_name;
		    $files[] = APP_ROOT_FOLDER . '/core/controllers/' . $class_name;
		    $files[] = APP_ROOT_FOLDER . '/core/models/' . $class_name;
		    $files[] = APP_ROOT_FOLDER . '/core/lib/' . $class_name;

		    $files[] = APP_ROOT_FOLDER . '/app/controllers/' . $class_name;
		    $files[] = APP_ROOT_FOLDER . '/app/models/' . $class_name;
		    $files[] = APP_ROOT_FOLDER . '/app/models/admin/' . $class_name;
		    $files[] = APP_ROOT_FOLDER . '/lib/' . $class_name;

		    foreach ($files as $file){
		      if (file_exists($file) == true) {
		        return require_once $file;
		      }
		    }
		}

		static function autoload_register(){
			spl_autoload_register(array("AutoLoadClasses", "load"));
		}
	}
?>