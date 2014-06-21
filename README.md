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
