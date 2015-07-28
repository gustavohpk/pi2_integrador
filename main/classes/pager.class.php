<?php
/**
 * Classe de paginação.
 * @author Gustavo Pchek
 */

class Pager
{

    /**
     * @var int $totalItems Total de itens existentes na coleção retornada pelo banco de dados.
     * @var int $limit Número de itens por página.
     * @var int $page Número da página atual.
     */
    private $totalItems, $limit, $page;
 
    public function __construct($totalItems, $limit, $page)
    {
        $this->totalItems = $totalItems;
        $this->itemsPerPage = $limit;
        $this->page = $page;
    }

    /**
     * Retorna o html com a paginação
     * @param string $baseUrl URL base para criar os links.
     * @return string O código HTML da paginação.
     */
    public function getPageAnchors($baseUrl)
    {
        $html = "";
        if ($this->hasPrev()) {
            $html .= '<li>';
            $html .= '<a href="'.$baseUrl.'/pagina/1" title="Primeira Página">';
            $html .= '&laquo;';
            $html .= '</a></li>';

            $html .= '<li>';
            $html .= '<a href="'.$baseUrl.'/pagina/'.($this->page-1).'" title="Página Anterior">';
            $html .= '&lsaquo;';
            $html .= '</a></li>';
        } else {
            $html .= '<li class="disabled"><a href="#">&laquo;</a></li>';
            $html .= '<li class="disabled"><a href="#">&lsaquo;</a></li>';
        }
        if($this->getNumPages() <= 7){
            for($i=1; $i<=$this->getNumPages(); $i++) {
                if ($i != $this->page) {
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.$i.'" title="Página '.$i.'">'.$i.'</a></li>';
                } else {
                    $html .= '<li class="active"><a href="#" title="Página '.$i.' (atual)">'.$i.'</a></li>';
                }
            }
        }else{
            for ($i = 1; $i <= 2; $i++) { 
                if ($i != $this->page) {
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.$i.'" title="Página '.$i.'">'.$i.'</a></li>';
                } else {
                    $html .= '<li class="active"><a href="#" title="Página '.$i.' (atual)">'.$i.'</a></li>';
                }
            }
            if($this->page > 2 && $this->page <= $this->getNumPages() - 2){
                if($this->page-2 > 2){
                    $html .= '<li class="disabled"><a href="#" title="...">...</a></li>';
                }

                if($this->page -1 > 2){
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.($this->page -1).'" title="Página '.($this->page -1).'">'.($this->page -1).'</a></li>';
                }

                $html .= '<li class="active"><a href="#" title="Página '.$this->page.' (atual)">'.$this->page.'</a></li>';

                if($this->page + 1 <= $this->getNumPages() - 2){
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.($this->page + 1).'" title="Página '.($this->page + 1).'">'.($this->page + 1).'</a></li>';
                }else{

                }

                if($this->page < $this->getNumPages() -3){
                    $html .= '<li class="disabled"><a href="#" title="...">...</a></li>';
                }
                
            }else{
                if($this->page == 2){
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.($this->page +1).'" title="Página '.($this->page +1).'">'.($this->page +1).'</a></li>';
                }
                $html .= '<li><a href="#" title="...">...</a></li>';
                if($this->getNumPages() - 1 == $this->page){
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.($this->page -1).'" title="Página '.($this->page -1).'">'.($this->page -1).'</a></li>';
                }
            }
            for ($i = $this->getNumPages() - 1; $i <= $this->getNumPages(); $i++) {
                if ($i != $this->page) {
                    $html .= '<li><a href="'.$baseUrl.'/pagina/'.$i.'" title="Página '.$i.'">'.$i.'</a></li>';
                } else {
                    $html .= '<li class="active"><a href="#" title="Página '.$i.' (atual)">'.$i.'</a></li>';
                }
            }
        }
        if ($this->hasNext()) {
            $html .= '<li>';
            $html .= '<a href="'.$baseUrl.'/pagina/'.($this->page+1).'" title="Próxima Página">';
            $html .= '&rsaquo;';
            $html .= '</a></li>';

            $html .= '<li>';
            $html .= '<a href="'.$baseUrl.'/pagina/'.($this->getNumPages()).'" title="Última Página">';
            $html .= '&raquo;';
            $html .= '</a></li>';
        } else {
            $html .= '<li class="disabled"><a href="#">&rsaquo;</a></li>';
            $html .= '<li class="disabled"><a href="#">&raquo;</a></li>';
        }
        return $html;
    }

    /**
     * @return bool A existência de página anterior.
     */
    public function hasPrev()
    {
        if ($this->page > 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @return bool A existência de próxima página.
     */
    public function hasNext()
    {
        if ($this->page < $this->getNumPages()) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * @return bool O número de páginas.
     */ 
    public function getNumPages()
    {
        $numPages = ceil($this->totalItems/$this->itemsPerPage);
 
        return $numPages;
    }   
}
?>