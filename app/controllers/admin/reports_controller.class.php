<?php 
    namespace Admin;
  
    class ReportsController extends BaseAdminController{
        protected $report;
        protected $actionForm;

        public function _new(){
        $this->setHeadTitle("Relatório de Inscrições");
        $this->report = new \Reports();
        $this->events = \Events::find(array(), array(), "=", "AND", "name", "ASC");
            $this->actionForm = $this->getUri("admin/relatorios/inscricoes/gerar");
            $this->titleBtnSubmit = "Gerar";
        }

        public function generate(){
            $this->setHeadTitle("Relatório de Inscrições");
            $this->report = new \Reports($this->params["reports"]);
            if ($this->enrollments = $this->report->generate()){
                $this->render("report");
            }
            else{
                \FlashMessage::errorMessage("Erro ao gerar relatório.");
                $this->redirectTo("admin/relatorios/inscricoes");
            }
        }
    } 
?>