<?php
/**
 *   @author Gustavo Pchek
 *   Gerência de logs do sistema
*/
class Logger {

    /**
     * Log para criação de registros.
     * @param string $author O usuário que efetuou a ação que gerou o log.
     * @param string $area A área em que o log foi gerado.
     * @param int $id O id do registro.
     */  
    static function creationLog($author, $area, $id){
        $log = " - [CREATION] ";
        $log.= "$author criou um novo registro em $area - #$id \n";
        self::crudLog($log);
    }

    /**
     * Log para atualização de registros.
     * @param string $author O usuário que efetuou a ação que gerou o log.
     * @param string $area A área em que o log foi gerado.
     * @param int $id O id do registro.
     */ 
    static function updateLog($author, $area, $id){
        $log = " - [UPDATE] ";
        $log.= "$author atualizou o registro #$id em $area \n";
        self::crudLog($log);
    }

    /**
     * Log para exclusão de registros.
     * @param string $author O usuário que efetuou a ação que gerou o log.
     * @param string $area A área em que o log foi gerado.
     * @param int $id O id do registro.
     */ 
    static function deletionLog($author, $area, $id){
        $log = " - [DELETION] ";
        $log.= "$author excluiu o registro #$id em $area \n";
        self::crudLog($log);
    }

    /**
     * Função privada utilizada pelas outras funções de log crud.
     * @param string $log A mensagem do log.
    */
    private static function crudLog($log){
        $datetime = date("d/m/Y H:i:s");
        $finalLog = $datetime;
        $finalLog .= $log;

        file_put_contents(APP_ROOT_FOLDER . "/log/crud.log", $finalLog, FILE_APPEND);   
    }

    /**
     * Log geral para eventos do sistema
    */
    static function systemLog(){

    }

    /**
     * Log para excessões
    */
    static function exceptionLog(){

    }

    /**
     *   Log personalizado
    */
    static function customLog(){

    }

}