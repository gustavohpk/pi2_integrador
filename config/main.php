<?php
  define('APP_NAME', 'UTFPR - Controle de Eventos');
  define('SITE_ROOT', '/pi2/Projeto Integrador/master/pi2_integrador');
  define('APP_ROOT_FOLDER', $_SERVER['DOCUMENT_ROOT'] . '/' . SITE_ROOT );
  
  date_default_timezone_set('America/Sao_Paulo');

  require_once APP_ROOT_FOLDER."/core/config/auto_load_classes.class.php";
  AutoLoadClasses::autoload_register();
?>