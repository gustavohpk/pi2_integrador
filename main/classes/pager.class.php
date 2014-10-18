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
     * @param string $baseUrl URL base para criar os links.
     * @return string O código HTML da paginação.
     */
    public function getPageAnchors($baseUrl)
    {
        $html = "";
        if ($this->hasPrev()) {
            $html .= '<li>';
            $html .= '<a href="'.$baseUrl.'/pagina/'.($this->page-1).'">';
            $html .= '&laquo;';
            $html .= '</a></li>';
        } else {
            $html .= '<li class="disabled"><a href="#">&laquo;</a></li>';
        }
        for($i=1; $i<=$this->getNumPages(); $i++) {
            if ($i != $this->page) {
                $html .= '<li><a href="'.$baseUrl.'/pagina/'.$i.'">'.$i.'</a></li>';
            } else {
                $html .= '<li class="active"><a href="#">'.$i.'</a></li>';
            }
        }
        if ($this->hasNext()) {
            $html .= '<li>';
            $html .= '<a href="'.$baseUrl.'/pagina/'.($this->page+1).'">';
            $html .= '&raquo;';
            $html .= '</a></li>';
        } else {
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