----- BUGS CONHECIDOS -----
 
- As mensagens de erro referentes aos preços de evento não são exibidas, mas as validações funcionam
- O participante é excluído, mas o model ou controller gera um erro. Ao atualizar volta à lista, mas exibe outra mensagem de erro.

----------

----- Atualização 055 (22/12) -----

- Documentação Atualizada
- Removidos trechos de código não utilizados
- Atualização na área de certificados
- Verificação de autenticidade via código adicionada (login não necessário)
- Menu do painel de administração fixado no topo e container alterado para fluid
- Vários formulários alterados, alguns componentes foram alinhados lado a lado



----- Atualização 054 (16/12 - 21/12) -----

- Geração de certificados iniciada
- Atualizações na área de relatórios



----- Atualização 053 (04/12 - 15/12) -----

- Atualizações anteriores à 30 guardadas no arquivo readme_old.txt
- BUGS CONHECIDOS agora fica no topo do readme
- Atualizações na área de certificados
- 



----- Atualização 052 (24/11 - 03/12) -----

- Contador de visualizações adicionado nas notícias e nos eventos
- Número de visualizações exibido na página do site e também do painel de admin
- Atualização da documentação

Bugs Conhecidos : 
- As mensagens de erro referentes aos preços de evento não são exibidas, mas as validações funcionam
- O participante é excluído, mas o model ou controller gera um erro. Ao atualizar volta à lista, mas exibe outra mensagem de erro.



----- Atualização 051 (10/11 - 21/11) -----

- Adicionados registros de participantes para testes
- Tabela de preços parcialmente corrigida
- OBS. 1: Não é possível deletar um preço
- Os patrocinadores não são salvos no cadastro de evento (apenas edição)
- jQuery UI modificado para ter apenas datepicker
Bugs Conhecidos : 
- As mensagens de erro referentes aos preços de evento não são exibidas, mas as validações funcionam
- O participante é excluído, mas o model ou controller gera um erro. Ao atualizar volta à lista, mas exibe outra mensagem de erro.


----- Atualização 050 (29/10 - 09/11) -----

- Área de certificados iniciada
- Correção de alguns ícones de formulários
- Link "Sobre" adicionado no footer


----- Atualização 049 (27/10 - 28/10) -----

- Relação patrocinador-evento finalizada (porém falta logo de patrocinador)


----- Atualização 048 (15/10 - 18/10) -----

- Documentação complementada
- Criada tabela events_sponsor para relacionar patrocinadores a eventos
- Pequenas correções e modificações


----- Atualização 047 (01/10 - 14/10) -----
- Documentação iniciada
- Validações com ajax no formulário de cadastro iniciadas
- Pequenas correções e modificações


----- Atualização 046 (08/09 - 09/09) -----
- Área de participantes no painel do admin adicionada (restam ajustes)
- Iniciada área de patrocinadores (sponsor)


----- Atualização 045 (04/09 - 05/09) -----
- Adicionada listagem de eventos com Ajax na página de criação/edição de evento
- Adicionado jQueryUI
- Pequeno progresso na área de relatórios
- Iniciada área de participantes no painel de admin (rotas, controladores)
- Layout vazio (que exibe apenas o conteúdo, para ser usado em ajax ou iframes) criado
- Pequenas correções para validar na W3C
- Tabela de preços de evento iniciada (apenas html)


----- Atualização 044 (30/08 - 31/08) -----
- Modo manutenção adicionado, na área Configurações Gerais
- Adicionados via ajax algumas coisas referente à manutenção, mas acho que precisamos aprimorar
- Dividida lista de links alternativos no footer

- Iniciado relatório de inscrições
- Iniciado sistema de log, em funcionamento nos Eventos e Notícias no painel de admin


----- Atualização 043 (29/08) -----
- Adicionado ORDER BY no find de eventos
- Corrigida ordenação de eventos nas áreas de evento
- Adicionadas tabs nas páginas de criação e modificação de eventos
- Outras pequenas modificações
- Iniciada lista de eventos em modal na criação ou edição de evento

- Iniciado layout da área 'Manutenção'
- Validação na lista de presença adicionada
- Alguns nomes e textos alterados
- Removidos alguns arquivos desnecessários


----- Atualização 042 (28/08) -----
- Deletados arquivos .fuse_hidden
- Criado arquivo PERMISSIONS.md para documentarmos temporariamente as permissões
- Iniciada função para validar link do youtube

----- Atualização 041 (23/07) -----
- Corrigido vários detalhes concernentes a labels para informar que o evento é gratuito ou sem inscrição
- Alterado controller para permitir cadastrar evento com valor zerado caso seja evento sem_pagamento
- Alterado para não exibir botão para selecionar forma de pagamento caso o evento seja gratuito
- Implementado botão "definir como pago" na view de inscrições na area admin
- Implementado tela para ver inscrições na area do admin

----- Atualização 040 (22/07) -----
- Testes funcionando

----- Atualização 039 (21/07) -----
- Iniciando área de testes
- Finalizando Lista de Chamada

----- Atualização 038 (20/07 - 21/07) -----
- Finalizando manual de ajuda
- Retirados selects "Exibir no máximo ** itens por página"
- Criada view para lista de inscrições no painel do usuário (estática por enquanto)
- Algumas pequenas correções e alterações
- Criada função returnToLastPage()
- Área de configuração:
- - Geral OK
- - Contato OK
- - Banners +- (está puxando os cadastrados, inclusive na home, mas ainda não está alterando)
- Charset ISO-8859-1 mudado para windows-1252
- Outras correções para validar na W3C
- Iniciada função de e-mail de contato
- Iniciada lista de presença
> Criada função attendanceList() que traz os dados necessários para a lista de presença, no enrollments.class.php
> Criadas funções set e get participantName, para utilizar na anterior
> Criada coluna "attendance" (boolean) na tabela enrollment OBS.: o banco exibe como tinyint(1)
- Ocultando o método de pagamento "sem_pagamento" na tela de inscrição

----- Atualização 037 (20/07) -----
- Corrigido bug cadastro participant
- Implementado JS na view _form do cadastro participant para buscar no DB e setar o <option> da cidade e estado
- Implementado consulta à inscrições na area do participant, opção para clicar no link para pagamento
- Adicionado campo uri_payment tabela enrollment
- Feito várias pequenas modificações com relaçao a encapsulamente de classes

----- Atualização 036 (19/07) -----
- Iniciado implementação PagSeguro .... para funcionar deve instalar o curl [no terminal digitar apt-get install php5-curl]

----- Atualização 035 (18 - 19/07) -----
- Removido Forma de Pgto da tabela de events (verificar diagrama)
- Alterado constraint fk_cost_event_event para fazer remoção em cascata, qdo remove evento -> remover preços
- Implementado cadastro de preços no momento de cadastrar evento

----- Atualização 034 (18/07) -----
- Update na área de ajuda
- Corrigido _foot da área do admin
- Adicionada busca na página de notícias, próximos eventos e eventos anteriores
- Adicionada função que bloqueia a tecla enter no campo search
- Atualizações na área de participante
- Outras pequenas correções

----- Atualização 033 (17/07) -----
- Finalizado implementação do cadastro de administradores area Admin
- Alterado estrutura da tabela administrators (verificar diagrama)

----- Atualização 032 (16/07) -----
- Iniciado implementação do cadastro de administradores area Admin

----- Atualização 031 (17/07) -----
- Iniciando página de ajuda do painel do admin
- Correções em media.class.php
- Adicionando ORDER BY na função find da news.class.php
- Arrumando layout da listagem de mídia
- Outras pequenas modificações

----- Atualização 030 (16/07) -----
- Corrigido bug getMedia() do model Media
- Implementado remoção da imagem ao remover o registro do banco de dados
- View editar Media -> no modo edição liberado apenas para alterar o label da media

