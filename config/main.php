<?php
ini_set("display_errors", false);
  define('APP_NAME', 'UTFPR Eventos');
  define('SITE_ROOT', '/pi2_integrador');
  define('APP_ROOT_FOLDER', $_SERVER['DOCUMENT_ROOT'] . '/' . SITE_ROOT);

  define('RESOURCES_FOLDER', SITE_ROOT.'/app/resources');
  define('MEDIA_FOLDER', SITE_ROOT.'/media');
  define('UPLOAD_FOLDER', APP_ROOT_FOLDER . '/media');

	/* Adicionar pastas defaults para inclução de arquivos com as funções require e include */
  set_include_path(get_include_path() . PATH_SEPARATOR . APP_ROOT_FOLDER );
  set_include_path(get_include_path() . PATH_SEPARATOR . APP_ROOT_FOLDER . '/main');
  set_include_path(get_include_path() . PATH_SEPARATOR . APP_ROOT_FOLDER . '/app');
    
  date_default_timezone_set('America/Sao_Paulo');
  header('Content-Type: text/html; charset=UTF-8');

  require_once 'classes/auto_load_classes.class.php';
  AutoLoadClasses::autoload_register();
?>
