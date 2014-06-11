Estrutura do Framework

app/ - Arquivos da aplicação
	app/resources/ - Recursos da aplicação (css, javascript, imagens do template, etc).
	app/model/ - Modelos da aplicação
	app/view/ - Visões da aplicação
	app/controller - Controladores da aplicação

config/ - Arquivos de configuração

lib/ - Biblioteca do framework (validações, testes e funções do tipo)

main/ - Arquivos do framework
	main/model/ - Modelos do framework
	main/view/ - Visões do framework
	main/controller/ - Controladores do framework

----------------------------------
toda a aplicaçao estará em app/
todos os outros diretorios serão do framework sendo a pasta /core no lugar de /main

no .htaccess tem uma regra que direciona todas as requisições para o /config/routers.php
na sequencia main.php é iniciado, criado as constantes
