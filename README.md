----- Atualização 021 (08/07) -----

- Listagem de notícias adicionada na página de notícias do site, com limite de 8 por página, como estava no layout.
- Pequenas modificações na área de notícias do admin


----- Atualização 020 (06/07 - 07/07) -----
- Atualizações na área de notícias
- Campo 'news' da tabela 'news' alterado para 'content'
- Campo 'date' da tabela 'news' alterado para 'creation_date'
- Campo 'modification_date' criado na tabela 'news'
- Campo 'subtitle' criado na tabela 'news'
- Área de notícias funcional (admin)
- Adicionada confirmação em javascript para todos os botões de exclusão (btn-danger)
- Data de criação e modificação corrigidas

----- Atualização 019 (05/07) -----
- Concluido as validações no cadastro do participante
- Criado função getParamsSQL() em base_model, destinado a otimizar as consultas ... esta funçao retorna um array contendo uma string com os parametros de comparação para o comando SQL e um array com os parametros que serão executados pelo statment.... facilita nas consultas, porque podemos chamandar a função assim: find(array(campos), array(valores), operador, comparador)
- Colocado pagina atual e limite por pagina em base_model....

----- Atualização 018 (05/07) -----
- Alterando alguns comentários do código
- Iniciando controller de notícias

----- Atualização 017 (04/07) -----
- Implementado biblioteca para listar cidades em /resources/js
- Implementado cadastro dinamico das cidades no cadastro do participante
- Implementado validações no cadastro do participante (falta otimizar)
- Implementado controller e model para State
- Implementado controller e model para City

----- Atualização 016 (03/07 - 04/07) -----
- Área de eventos atualizada. Os eventos estão sendo exibidos corretamente nas áreas Próximos Eventos e Eventos Anteriores
- Modais atualizados
- Serão exibidas labels "HOJE" e "AGORA" caso se apliquem, na listagem dos eventos
- Iniciadas visões admin/noticias
- Criadas funções e visões para registro de presença
- Adicionadas algumas validações em HTML5


----- Atualização 015 (02/07 - 04/07) -----
- Na base_model foi implementado um array errors[] que será usado nos models para armazenar os erros durante as validações.
- Implementado assinatura para função validateData() em base_model que sera implementado de forma diferente em cada modelo. Nesta função alimentamos o array errors[] com os erros....
- Implementado funçao getErrors() em base_models para retornar para o array errors() para os controllers...
- Implementado model, view e controller para Participant (POR ENQUANTO PRA FUNCIONAR a cidade e estado deve ser cadastrada diretamente no banco de dados, e no cadastro do participante informar o codigo da cidade no campo cidade .... depois terminarei para deixar tudo dinamico .... por enquanto é pra teste)
- Implementado Login do Participante em ParticipantController e ParticipantModel
- Alterado Banco de Dados -> campo password da tabela participant alterado tamanho para varchar(32) por causa da criptografia da senha
- Implementado funções auxiliares em base_models para auxiliar a validação de email e cpf nos models.

----- Atualização 014 (02/07) -----
- Paginação incluída em admin/eventos
- Iniciada listagem de eventos no site, área próximos eventos (porém está listando todos não importando a data), limitando a 6 eventos por página por enquanto.
- _modals.html alterado para _modals.phtml
- Modals criados. Eles serão carregados apenas para os eventos referentes à página.

----- Atualização 013 (01/07) -----
- Estilização das mensagens flash modificada - agora é possível fechar a 'janela' das mensagens flash.
- Novas mensagens flash adicionadas
- Classe Pager criada, paginação adicionada nas mídias com limite fixo de 3 itens por página para teste - precisa ser otimizado
- Para a paginação também foi alterado o método find do modelo media, recebendo o parâmetro página (que é a página atual) e também o parâmetro limite (limite de itens por página)
- Alguns bugs de links resolvidos
- Desativada função do beforeAction da classe login

----- Atualização 012 (30/06) -----
- Criado modelo, controlador e visão para Forma de Pagamento (otimizar posteriormente implementando a API do PagSeguro)
- Finalizado area Admin\Events ... (Falta implementar filtros, msgFlash e validações ...)
- Criadas Flash Messages
- Implementado Flash Messages no Controladores de Login, Forma de Pgto, Tipos de Eventos e Eventos

----- Atualização 011 (29/06) -----
- Criados modelos e atualizadas visões e controladores de mídia
- OBS.: No momento está funcionando apenas cadastro de vídeos, e ainda não há validações para link e para id de evento.
- Campo 'legend' da tabela media alterado para 'label'
- Na visão da mídia foi usada uma forma diferente de código de if/else e foreach, para evitar echos com todo o conteúdo.
- Iniciada classe FlashMessage, no main
- Iniciada função stylizeFlashMessage na views_function.php

----- Atualização 010 (29/06) -----
- Iniciados controllers e views de Usuários e Inscrições (enrollments)
- Criada função javascript openEvent, que é utilizada no cadastro/edição de inscrições e mídia. Podemos otimizá-la posteriormente
- Alterado redirecionamento de logout (vai para página de login novamente) e corrigido banner
- Modificado form media e adicionada função javascript para o form (também precisa ser otimizada)

----- Atualização 009 (28/06) -----
- Pequenas alterações no model Admin/events -> implementado opção para salvar as datas (melhorar isso depois)
- Implementado model, view, controller para Admin/events_type 

----- Atualização 008 (27/06) -----
- Implementado controller "Admin/login" para login do administrador, para isto alterado
- Pequenas modificações em "base_admin_controller" para auxiliar login admin
- Implementado "Admin/models/administrator.class.php" para auxiliar no login e para uso posterior no aplicação

----- Atualização 007 (27/06) -----
- Alterado rotas para exibir "uri" no idioma pt-br para adequar o projeto com a materia de IHC

----- Atualização 006 (22/06 - 26/06) -----
- Modificado o tipo de retorno de dados para as views.... Agora ao renderizar é retornado um objeto, sendo este objeto responsável por executar os métodos acessadores "gets" para alimentar as view
- Implementado função "redirectTo" em "/main/controllers/base_controllers.class.php"
- criado pasta "db" -> incluido nela o diagrama e script para criação do banco de dados
- Implementado base para models em "/main/models/base_models.class.php" com a idéia de automatizar os métodos modificadores das classes (set) pra carregar os dados do banco de dados nos atributos da classe. Por exemplo ao executar um select em uma tabela e retornar um campo "name", será executado o método "setName()" da classe...
- Implementado model, view e controller para "Admin\Events/"

----- Atualização 005 (24/06 - 25/06) -----
- Criadas rotas para as settings (configurações) do admin
- Criadas views e controllers
- Foi criada a página configuração de pagamento, para posteriormente adicionarmos a API do PagSeguro
- Criada página para configurações de contato
- Criadas rotas, views e controllers para Media


----- Atualização 004 (23/06) -----
- Criadas funções getUri, getMedia e getResource, que retornam a constante referente ao caminho junto com o parâmetro passado
- Criada função getApplicationName, que retorna a constante com o nome da aplicação. A princípio é só utilizada na função getHeaderTitle.
- Substituídas as constantes da home-site, account, events

- OBS.: Podemos integrar essas funções get dentro das views_functions.php e deixar padrão no site todo, pra usarmos o mínimo possível de constantes no código

- Criada view inicial para login no painel do admin (está em views/admin/home/login.phtml, mas provavelmente ficará separada)

----- Atualização 003 (21/06) -----
- Implementado view para Admin\events
- Pequenas modificações no Admin\layout

----- Atualização 002 (21/06) -----
- Adicionado arquivo "views_functions.php" em "/main/views" visando implementar funções para auxiliar a manutenção das views, tais como criação de tags, liks e urls
- Removido o arquivo "/views/includes/_head.phtml". Na tag <head> de "/views/layout/layout.phtml" utilizado funções para gerar as tags de inclusão de stylesheets e shortcut icon
- Criado layout para administrador em "/views/admin/layout/layout.php"
- Iniciado implementação do controlador Admin\HomeController

----- Atualização 001 (20/06) -----

- Controllers e views para as demais páginas criadas
- Função setHeaderTitle e getHeaderTitle adicionadas, sendo usadas nos controlles e no _head.phtml respectivamente (extenderemos posteriormente pra poder setar através da configuração da tabela de configurações)
- Pequenas modificações de layout

* Acho que antes de continuarmos o site, melhor começarmos o admin desde já

----- Atualização 000 (19/06) -----

- Iniciado implementação dos Controllers, Views, Models e Layout


-----



Estrutura do Framework

app/ - Arquivos da aplicação
	app/resources/ - Recursos (assets) da aplicação (css, javascript, imagens do template, etc).
	app/models/ - Modelos da aplicação
	app/views/ - Visões da aplicação
	app/controllers - Controladores da aplicação
	app/classes - Outras classes

config/ - Arquivos de configuração

lib/ - Biblioteca do framework (validações, testes e funções do tipo)

main/ - Arquivos do framework
	main/resources - Recursos (assets) do framework
	main/models/ - Modelos do framework
	main/views/ - Visões do framework
	main/controllers/ - Controladores do framework
	main/classes - Outras classes

----------------------------------
.htaccess - Regra direciona todas as requisições para o /config/routers.php
na sequencia main.php é iniciado, criado as constantes
----------------------------------

Arquivos .php - Arquivos com código PHP em geral
Arquivos .phtml - Arquivos com código PHP e HTML
Arquivos .html - Arquivos apenas com HTML
Arquivos .class.php - Arquivos de classes
