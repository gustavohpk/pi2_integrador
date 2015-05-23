<?php 

   /**
    * Controlador para Emissão de Crachá
    * @author Rodrigo Miss
    */

	namespace Admin;
	
	class BadgeController extends BaseAdminController{
        /**
        * @var Event $events evento relacionado com o cracha
        */
        protected $events;

        /**
        * @var Enrollment $enrollments lista de inscrições relacionados ao evento
        */
        protected $enrollments;
        protected $actionForm;
        protected $titleBtnSubmit;
        protected $id_event;
        protected $badges;

        public function beforeAction() {
            //lib responsável por gerar QRCode
            require_once APP_ROOT_FOLDER . '/app/resources/php/phpqrcode/qrlib.php';
        }

        public function index() {
            $this->setHeadTitle("Crachá dos Participantes");

            //lista eventos que ainda não iniciaram
            $this->events = \Event::find(array("start_date"), array(date("Y-m-d")), ">=", "AND", "name", "ASC");
            $this->actionForm = $this->getUri("admin/eventos/cracha/gerar");
            $this->titleBtnSubmit = "Gerar";
        }

        public function generate(){
            //dados recebidos via POST
            $this->id_event = $this->params['id_event'];
            $this->events = \Event::findById($this->id_event);                     
            //seleciona inscrições no evento escolhido
            $this->enrollments = \Enrollment::findByIdEvent($this->id_event);
            $this->titleBtnSubmit = "Gerar";
            $this->render("index");
        }
	} 
?>