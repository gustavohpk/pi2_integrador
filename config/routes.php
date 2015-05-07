<?php
    /*
    * rotas para acesso geral
    */ 

    $routes = array();

    //rota para raiz
    $routes['GET'][] = array('route' => '/', 'controller' => 'HomeController', 'action' => 'index');

    //rota para sobre
    $routes['GET'][] = array('route' => '/sobre', 'controller' => 'HomeController', 'action' => 'about');

    //validacoes ajax
    $routes['GET'][] = array('route' => '/validarcpf/:cpf', 'controller' => 'BaseController', 'action' => 'validateCpf');
    
    $routes['GET'][] = array('route' => '/eventos/calendario', 'controller' => 'EventsController', 'action' => 'calendar');

    //rotas para eventos
    $routes['GET'][] = array('route' => '/eventos/proximos', 'controller' => 'EventsController', 'action' => 'next');
    $routes['GET'][] = array('route' => '/eventos/proximos/pagina/:p', 'controller' => 'EventsController', 'action' => 'next');
    $routes['GET'][] = array('route' => '/eventos/anteriores', 'controller' => 'EventsController', 'action' => 'previous');
    $routes['GET'][] = array('route' => '/eventos/anteriores/pagina/:p', 'controller' => 'EventsController', 'action' => 'previous');
    $routes['GET'][] = array('route' => '/eventos/:id/ver', 'controller' => 'EventsController', 'action' => 'show');
    $routes['GET'][] = array('route' => '/eventos/:url', 'controller' => 'EventsController', 'action' => 'show');

    //rota para setar nota do evento pelo participante
    $routes['GET'][] = array('route' => '/eventos/:id/avaliacao/:r', 'controller' => 'EnrollmentController', 'action' => 'updateRating');

    //rotas para notícias
    $routes['GET'][] = array('route' => '/noticias/lista', 'controller' => 'NewsController', 'action' => 'show');
    $routes['GET'][] = array('route' => '/noticias/lista/pagina/:p', 'controller' => 'NewsController', 'action' => 'show');
    $routes['GET'][] = array('route' => '/noticias/:id/ler', 'controller' => 'NewsController', 'action' => 'item');

    //rotas para mídia
    $routes['GET'][] = array('route' => '/midia/galeria', 'controller' => 'MediaController', 'action' => 'gallery');
    $routes['GET'][] = array('route' => '/midia/galeria/pagina/:p', 'controller' => 'MediaController', 'action' => 'gallery');
    $routes['GET'][] = array('route' => '/midia/fotos/pagina/:p', 'controller' => 'MediaController', 'action' => 'photos');
    $routes['GET'][] = array('route' => '/midia/videos/pagina/:p', 'controller' => 'MediaController', 'action' => 'videos');

    $routes['GET'][] = array('route' => '/midia/galeria/evento/:id', 'controller' => 'MediaController', 'action' => 'gallery');

    $routes['GET'][] = array('route' => '/midia/galeria/fotos', 'controller' => 'MediaController', 'action' => 'photoGallery');
    $routes['GET'][] = array('route' => '/midia/galeria/fotos/pagina/:p', 'controller' => 'MediaController', 'action' => 'photoGallery');
    $routes['GET'][] = array('route' => '/midia/galeria/fotos/evento/:id/pagina/:p', 'controller' => 'MediaController', 'action' => 'photoGallery');


    $routes['GET'][] = array('route' => '/midia/galeria/videos', 'controller' => 'MediaController', 'action' => 'videoGallery');
    $routes['GET'][] = array('route' => '/midia/galeria/videos/pagina/:p', 'controller' => 'MediaController', 'action' => 'videoGallery');
    $routes['GET'][] = array('route' => '/midia/galeria/videos/evento/:id/pagina/:p', 'controller' => 'MediaController', 'action' => 'videoGallery');

    //rotas para contato
    $routes['GET'][] = array('route' => '/contato', 'controller' => 'ContactsController', 'action' => 'index');
    $routes['POST'][] = array('route' => '/contato', 'controller' => 'ContactsController', 'action' => 'sendMessage');

    /*
    * rotas para area do participante
    */
    //rota para login/cadastro - usuários
    $routes['GET'][] = array('route' => '/conta/login', 'controller' => 'ParticipantController', 'action' => 'login');
    $routes['POST'][] = array('route' => '/conta/login', 'controller' => 'ParticipantController', 'action' => 'executeLogin');
    $routes['GET'][] = array('route' => '/conta/alterar', 'controller' => 'ParticipantController', 'action' => 'edit'); 
    $routes['POST'][] = array('route' => '/conta/:id/alterar', 'controller' => 'ParticipantController', 'action' => 'update'); 
    $routes['GET'][] = array('route' => '/conta/sair', 'controller' => 'ParticipantController', 'action' => 'logout');
    $routes['GET'][] = array('route' => '/conta/nova', 'controller' => 'ParticipantController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/conta/nova', 'controller' => 'ParticipantController', 'action' => 'create');
    $routes['GET'][] = array('route' => '/conta/painel', 'controller' => 'ParticipantController', 'action' => 'dashboard');

    $routes['GET'][] = array('route' => '/conta/inscricoes', 'controller' => 'EnrollmentController', 'action' => '_list');    
    $routes['GET'][] = array('route' => '/conta/inscricoes/:id', 'controller' => 'EnrollmentController', 'action' => 'show');  

    $routes['GET'][] = array('route' => '/conta/certificados', 'controller' => 'CertificatesController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/conta/certificados/:code/ver', 'controller' => 'CertificatesController', 'action' => 'show');

    $routes['GET'][] = array('route' => '/inscricao/evento/:id', 'controller' => 'EnrollmentController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/inscricao/finalizar', 'controller' => 'EnrollmentController', 'action' => 'save');
    $routes['GET'][] = array('route' => '/inscricao/confirmacao', 'controller' => 'EnrollmentController', 'action' => 'confirmation');

    //rota para validação de certificados
    $routes['GET'][] = array('route' => '/certificados', 'controller' => 'CertificatesController', 'action' => 'index');
    $routes['POST'][] = array('route' => '/certificados/verificar', 'controller' => 'CertificatesController', 'action' => 'verification');

    //$routes['GET'][] = array('route' => '/conta/inscricoes', 'controller' => 'ParticipantController', 'action' => 'enrollments');


    //rotas para pesquisa
    $routes['GET'][] = array('route' => '/pesquisa/eventos', 'controller' => 'SearchController', 'action' => 'events');
    $routes['GET'][] = array('route' => '/pesquisa/eventos/:s', 'controller' => 'SearchController', 'action' => 'events');
    $routes['GET'][] = array('route' => '/pesquisa/eventos/:s/pagina/:p', 'controller' => 'SearchController', 'action' => 'events');
    $routes['POST'][] = array('route' => '/pesquisa/eventos', 'controller' => 'SearchController', 'action' => 'findEvents');

    $routes['GET'][] = array('route' => '/pesquisa/noticias', 'controller' => 'SearchController', 'action' => 'news');
    $routes['GET'][] = array('route' => '/pesquisa/noticias/:s', 'controller' => 'SearchController', 'action' => 'news');
    $routes['GET'][] = array('route' => '/pesquisa/noticias/:s/pagina/:p', 'controller' => 'SearchController', 'action' => 'news');
    $routes['POST'][] = array('route' => '/pesquisa/noticias', 'controller' => 'SearchController', 'action' => 'findNews');


    $routes['GET'][] = array('route' => '/pesquisa/midia', 'controller' => 'SearchController', 'action' => 'media');
    $routes['GET'][] = array('route' => '/pesquisa/midia/pagina/:p', 'controller' => 'SearchController', 'action' => 'media');


    /*
    * rotas para area do admin
    */ 

    //root do admin
    $routes['GET'][] = array('route' => '/admin', 'controller' => 'Admin\HomeController', 'action' => 'index');

    //rotas para login
    $routes['GET'][] = array('route' => '/admin/login', 'controller' => 'Admin\LoginController', 'action' => 'index');
    $routes['POST'][] = array('route' => '/admin/login', 'controller' => 'Admin\LoginController', 'action' => 'login');
    $routes['GET'][] = array('route' => '/admin/logout', 'controller' => 'Admin\LoginController', 'action' => 'logout');

    //rotas para tipos de eventos
    $routes['GET'][] = array('route' => '/admin/eventos/tipos', 'controller' => 'Admin\EventsTypeController', 'action' => '_list'); 
    $routes['GET'][] = array('route' => '/admin/eventos/tipos/novo', 'controller' => 'Admin\EventsTypeController', 'action' => '_new'); 
    $routes['POST'][] = array('route' => '/admin/eventos/tipos/novo', 'controller' => 'Admin\EventsTypeController', 'action' => 'create'); 
    $routes['GET'][] = array('route' => '/admin/eventos/tipos/:id/alterar', 'controller' => 'Admin\EventsTypeController', 'action' => '_edit'); 
    $routes['POST'][] = array('route' => '/admin/eventos/tipos/:id/alterar', 'controller' => 'Admin\EventsTypeController', 'action' => 'update'); 
    $routes['GET'][] = array('route' => '/admin/eventos/tipos/:id/remover', 'controller' => 'Admin\EventsTypeController', 'action' => 'remove'); 

    //rotas para eventos
    $routes['GET'][] = array('route' => '/admin/eventos/lista', 'controller' => 'Admin\EventsController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/eventos/lista/pagina/:p', 'controller' => 'Admin\EventsController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/eventos/lista/id/:id', 'controller' => 'Admin\EventsController', 'action' => '_list');
    
    //rotas para lista de seleção de eventos
    $routes['GET'][] = array('route' => '/admin/eventos/lista/selecao', 'controller' => 'Admin\EventsController', 'action' => 'selectionList');
    $routes['GET'][] = array('route' => '/admin/eventos/lista/selecao/pagina/:p', 'controller' => 'Admin\EventsController', 'action' => 'selectionList');

    $routes['GET'][] = array('route' => '/admin/eventos/novo', 'controller' => 'Admin\EventsController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/eventos', 'controller' => 'Admin\EventsController', 'action' => 'create');    
    $routes['GET'][] = array('route' => '/admin/eventos/:id/alterar', 'controller' => 'Admin\EventsController', 'action' => '_edit');
    $routes['POST'][] = array('route' => '/admin/eventos/:id', 'controller' => 'Admin\EventsController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/eventos/:id/remover', 'controller' => 'Admin\EventsController', 'action' => 'remove');
    $routes['GET'][] = array('route' => '/admin/eventos/:id/presenca', 'controller' => 'Admin\EventsController', 'action' => 'attendance');
    $routes['POST'][] = array('route' => '/admin/eventos/:id/presenca', 'controller' => 'Admin\EventsController', 'action' => 'checkAttendance');

    //rotas para notícias
    $routes['GET'][] = array('route' => '/admin/noticias/lista', 'controller' => 'Admin\NewsController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/noticias/lista/pagina/:p', 'controller' => 'Admin\NewsController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/noticias/nova', 'controller' => 'Admin\NewsController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/noticias', 'controller' => 'Admin\NewsController', 'action' => 'create');    
    $routes['GET'][] = array('route' => '/admin/noticias/:id/alterar', 'controller' => 'Admin\NewsController', 'action' => '_edit');
    $routes['POST'][] = array('route' => '/admin/noticias/:id', 'controller' => 'Admin\NewsController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/noticias/:id/remover', 'controller' => 'Admin\NewsController', 'action' => 'remove');    

    //rotas para mídia
    $routes['GET'][] = array('route' => '/admin/midia/lista', 'controller' => 'Admin\MediaController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/midia/lista/pagina/:p', 'controller' => 'Admin\MediaController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/midia/novo/video', 'controller' => 'Admin\MediaController', 'action' => '_new');
    $routes['GET'][] = array('route' => '/admin/midia/novas/fotos', 'controller' => 'Admin\MediaController', 'action' => '_newMultiple');
    $routes['GET'][] = array('route' => '/admin/midia/:id/alterar', 'controller' => 'Admin\MediaController', 'action' => '_edit');
    $routes['POST'][] = array('route' => '/admin/midia/fotos', 'controller' => 'Admin\MediaController', 'action' => 'createPhotos');
    $routes['POST'][] = array('route' => '/admin/midia/video', 'controller' => 'Admin\MediaController', 'action' => 'createVideo');
    $routes['POST'][] = array('route' => '/admin/midia/:id', 'controller' => 'Admin\MediaController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/midia/:id/remover', 'controller' => 'Admin\MediaController', 'action' => 'remove');

    //rotas para inscrições
    $routes['GET'][] = array('route' => '/admin/inscricoes/lista', 'controller' => 'Admin\EnrollmentController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/inscricoes/lista/pagina/:p', 'controller' => 'Admin\EnrollmentController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/inscricoes/:id/remover', 'controller' => 'Admin\EnrollmentController', 'action' => 'remove');
    $routes['GET'][] = array('route' => '/admin/inscricoes/nova', 'controller' => 'Admin\EnrollmentController', 'action' => '_new');
    $routes['GET'][] = array('route' => '/admin/inscricoes/:id/ver', 'controller' => 'Admin\EnrollmentController', 'action' => 'show');
    $routes['GET'][] = array('route' => '/admin/inscricoes/:id/pagamento', 'controller' => 'Admin\EnrollmentController', 'action' => 'payment');
    $routes['GET'][] = array('route' => '/admin/inscricoes/:id/cancela-pagamento', 'controller' => 'Admin\EnrollmentController', 'action' => 'cancelPayment');

    //rotas para status de inscricao
    $routes['GET'][] = array('route' => '/admin/inscricoes/estados', 'controller' => 'Admin\EnrollmentStatusController', 'action' => '_list'); 
    $routes['GET'][] = array('route' => '/admin/inscricoes/estados/novo', 'controller' => 'Admin\EnrollmentStatusController', 'action' => '_new'); 
    $routes['POST'][] = array('route' => '/admin/inscricoes/estados/novo', 'controller' => 'Admin\EnrollmentStatusController', 'action' => 'create'); 
    $routes['GET'][] = array('route' => '/admin/inscricoes/estados/:id/alterar', 'controller' => 'Admin\EnrollmentStatusController', 'action' => '_edit'); 
    $routes['POST'][] = array('route' => '/admin/inscricoes/estados/:id/alterar', 'controller' => 'Admin\EnrollmentStatusController', 'action' => 'update'); 
    $routes['GET'][] = array('route' => '/admin/inscricoes/estados/:id/remover', 'controller' => 'Admin\EnrollmentStatusController', 'action' => 'remove'); 


    //rotas para certificados
    $routes['GET'][] = array('route' => '/admin/certificados', 'controller' => 'Admin\CertificatesController', 'action' => '_list'); 
    $routes['GET'][] = array('route' => '/admin/certificados/lista/pagina/:p', 'controller' => 'Admin\CertificatesController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/certificados/:id/remover', 'controller' => 'Admin\CertificatesController', 'action' => 'remove');
    $routes['GET'][] = array('route' => '/admin/certificados/novo', 'controller' => 'Admin\CertificatesController', 'action' => '_new');
    $routes['GET'][] = array('route' => '/admin/certificados/:id/ver', 'controller' => 'Admin\CertificatesController', 'action' => 'show');
    //rota para JSon
    $routes['GET'][] = array('route' => '/admin/certificados/inscricoes/:id', 'controller' => 'Admin\CertificatesController', 'action' => 'enrollments');
    $routes['POST'][] = array('route' => '/admin/certificados', 'controller' => 'Admin\CertificatesController', 'action' => 'create');   

    //rotas para usuários (do painel de administração)
    $routes['GET'][] = array('route' => '/admin/usuarios/lista', 'controller' => 'Admin\AdministratorController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/usuarios/novo', 'controller' => 'Admin\AdministratorController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/usuarios/novo', 'controller' => 'Admin\AdministratorController', 'action' => 'save');
    $routes['GET'][] = array('route' => '/admin/usuarios/:id/alterar', 'controller' => 'Admin\AdministratorController', 'action' => 'edit');
    $routes['POST'][] = array('route' => '/admin/usuarios/:id/alterar', 'controller' => 'Admin\AdministratorController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/usuarios/:id/remover', 'controller' => 'Admin\AdministratorController', 'action' => 'remove');

    //rotas para níveis de administrador
    $routes['GET'][] = array('route' => '/admin/niveis/lista', 'controller' => 'Admin\AdministratorLevelController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/niveis/novo', 'controller' => 'Admin\AdministratorLevelController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/niveis/novo', 'controller' => 'Admin\AdministratorLevelController', 'action' => 'create');
    $routes['GET'][] = array('route' => '/admin/niveis/:id/alterar', 'controller' => 'Admin\AdministratorLevelController', 'action' => 'edit');
    $routes['POST'][] = array('route' => '/admin/niveis/:id/alterar', 'controller' => 'Admin\AdministratorLevelController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/niveis/:id/remover', 'controller' => 'Admin\AdministratorLevelController', 'action' => 'remove');

    //rotas para participantes (administração)
    $routes['GET'][] = array('route' => '/admin/participantes/lista', 'controller' => 'Admin\ParticipantController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/participantes/novo', 'controller' => 'Admin\ParticipantController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/participantes/novo', 'controller' => 'Admin\ParticipantController', 'action' => 'save');
    $routes['GET'][] = array('route' => '/admin/participantes/:id/alterar', 'controller' => 'Admin\ParticipantController', 'action' => 'edit');
    $routes['POST'][] = array('route' => '/admin/participantes/:id/alterar', 'controller' => 'Admin\ParticipantController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/participantes/:id/remover', 'controller' => 'Admin\ParticipantController', 'action' => 'remove');

    //rotas para cidades
    $routes['GET'][] = array('route' => '/admin/cidades/lista', 'controller' => 'Admin\CityController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/cidades/nova', 'controller' => 'Admin\CityController', 'action' => '_new');
    $routes['GET'][] = array('route' => '/admin/cidades/:id/alterar', 'controller' => 'Admin\CityController', 'action' => 'edit');

    //rotas para configuracoes
    $routes['GET'][] = array('route' => '/admin/config/geral', 'controller' => 'Admin\SettingsController', 'action' => 'general');
    $routes['GET'][] = array('route' => '/admin/config/geral/manutencao', 'controller' => 'Admin\SettingsController', 'action' => 'maintenance');
    $routes['GET'][] = array('route' => '/admin/config/tema', 'controller' => 'Admin\SettingsController', 'action' => 'theme');
    $routes['GET'][] = array('route' => '/admin/config/banners', 'controller' => 'Admin\SettingsController', 'action' => 'banners');
    //forma de pgto
    $routes['GET'][] = array('route' => '/admin/config/pagamento', 'controller' => 'Admin\PaymentTypeController', 'action' => '_list');
    $routes['GET'][] = array('route' => '/admin/config/pagamento/nova', 'controller' => 'Admin\PaymentTypeController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/config/pagamento/nova', 'controller' => 'Admin\PaymentTypeController', 'action' => 'create');
    
    $routes['GET'][] = array('route' => '/admin/config/pagamento/:id/alterar', 'controller' => 'Admin\PaymentTypeController', 'action' => 'edit');
    $routes['POST'][] = array('route' => '/admin/config/pagamento/:id/alterar', 'controller' => 'Admin\PaymentTypeController', 'action' => 'update');
    $routes['GET'][] = array('route' => '/admin/config/pagamento/:id/remover', 'controller' => 'Admin\PaymentTypeController', 'action' => 'remove');
    $routes['GET'][] = array('route' => '/admin/config/email', 'controller' => 'Admin\SettingsController', 'action' => 'email');
    $routes['GET'][] = array('route' => '/admin/config/programador', 'controller' => 'Admin\SettingsController', 'action' => 'developer');

    $routes['POST'][] = array('route' => '/admin/config', 'controller' => 'Admin\SettingsController', 'action' => 'update');

    //rotas para relatorios
    $routes['GET'][] = array('route' => '/admin/relatorios/inscricoes', 'controller' => 'Admin\ReportsController', 'action' => '_new');
    $routes['POST'][] = array('route' => '/admin/relatorios/inscricoes/gerar', 'controller' => 'Admin\ReportsController', 'action' => 'generate');

    //rotas para tipos de eventos
    $routes['GET'][] = array('route' => '/admin/patrocinadores/lista', 'controller' => 'Admin\SponsorsController', 'action' => '_list'); 
    $routes['GET'][] = array('route' => '/admin/patrocinadores/lista/pagina/:p', 'controller' => 'Admin\SponsorsController', 'action' => '_list'); 
    $routes['GET'][] = array('route' => '/admin/patrocinadores/novo', 'controller' => 'Admin\SponsorsController', 'action' => '_new'); 
    $routes['POST'][] = array('route' => '/admin/patrocinadores/novo', 'controller' => 'Admin\SponsorsController', 'action' => 'create'); 
    $routes['GET'][] = array('route' => '/admin/patrocinadores/:id/alterar', 'controller' => 'Admin\SponsorsController', 'action' => 'edit'); 
    $routes['POST'][] = array('route' => '/admin/patrocinadores/:id/alterar', 'controller' => 'Admin\SponsorsController', 'action' => 'update'); 
    $routes['GET'][] = array('route' => '/admin/patrocinadores/:id/remover', 'controller' => 'Admin\SponsorsController', 'action' => 'remove'); 

    //rotas para mensagens
    $routes['GET'][] = array('route' => '/admin/mensagens/nova', 'controller' => 'Admin\MessageController', 'action' => '_new');
    $routes['GET'][] = array('route' => '/admin/mensagens/lista', 'controller' => 'Admin\MessageController', 'action' => '_list');
    return $routes;

?>