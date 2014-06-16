<?php
  define('APP_NAME', 'UTFPR - Controle de Eventos');
  define('SITE_ROOT', '/pi2/ProjetoIntegrador/RECUPERADO/pi2_integrador');
  define('APP_ROOT_FOLDER', $_SERVER['DOCUMENT_ROOT'] . '/' . SITE_ROOT);

	/* Adicionar pastas defaults para inclução de arquivos com as funções require e include */
  set_include_path(get_include_path() . PATH_SEPARATOR . APP_ROOT_FOLDER );
  set_include_path(get_include_path() . PATH_SEPARATOR . APP_ROOT_FOLDER . '/main');
  set_include_path(get_include_path() . PATH_SEPARATOR . APP_ROOT_FOLDER . '/app');
  
  date_default_timezone_set('America/Sao_Paulo');
  header('Content-Type: text/html; charset=UTF-8');

  require_once "lib/auto_load_classes.class.php";
  AutoLoadClasses::autoload_register();
?>