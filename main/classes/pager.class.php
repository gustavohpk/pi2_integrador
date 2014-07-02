<?php
class Pager
{
    private $totalItems;
    private $limit;
    private $page;
 
    public function __construct($totalItems, $limit, $page)
    {
        $this->totalItems = $totalItems;
        $this->itemsPerPage = $limit;
        $this->page = $page;
    }
 
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
 
    public function hasPrev()
    {
        if ($this->page > 1) {
            return true;
        } else {
            return false;
        }
    }
 
    public function hasNext()
    {
 
 
        if ($this->page < $this->getNumPages()) {
            return true;
        } else {
            return false;
        }
    }
 
    public function getNumPages()
    {
        $numPages = ceil($this->totalItems/$this->itemsPerPage);
 
        return $numPages;
    }   
}
?>