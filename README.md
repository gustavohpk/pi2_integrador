----- TO DO -----
 
- Organizar o layout da galeria de mídia, que acaba deixando espaços em branco quando as imagens exibidas na mesma linha tem grande variação de altura
- Corrigir tabela de preços de evento
- Alterar o campo (e o model) "local" dos eventos para "place" ou "location"
- Trocar a checagem de eventos do tipo sem inscrição de nome para id
- Editar a classe das flash messages para suportar links, ícones e opção de "fechar" a mensagem
- Requisitar Google Maps Embed API da faculdade
- Alterar funções "find" e "getParamsSQL" para suportar múltiplos comparadores e múltiplos operadores conjuntivos
- Alterar a classe dos certificados, adicionando os objetos Evento e Participante como atributo público
- Adicionar a listagem de eventos (via json) nas diversas áreas do painel
- Configurar API Google Maps dinâmica
- Melhorar função de geração/validação de url de evento
- Consertar a pardonização de nomenclaturas (nomes com "_" na frente, arrumar singular e plural)
- Geração de miniaturas ao cadastrar imagem
- A paginação está infinita. Limitar em 8 ou 10
- Mudar links estáticos para dinâmicos, editando pelo painel
- Desvincular "Settings" do "Main"
- Adicionar mensagens flash no template de manutenção
- Adicionar validações de data de abertura e término de inscrição (para inscrições feitas pelo site, não pelo painel)
- Herdar patrocinadores do evento pai
- Finalizar o javascript da página de inscrição
- Adicionar validação de conflito de horário

- Analisar o uso do campo "desativado/invisível" na tabela de eventos
- Analisar replicação de dados do usuário para a inscrição
- Analisar o uso do campo "status" na inscrição
- Analisar o uso de descrição customizada no certificado
- Analisar o uso do campo "usou bônus" na tabela de inscrição

----------

----- BUGS CONHECIDOS -----
 
- As mensagens de erro referentes aos preços de evento não são exibidas, mas as validações funcionam
- O participante é excluído, mas o model ou controller gera um erro. Ao atualizar volta à lista, mas exibe outra mensagem de erro.
- Problema na contagem de vagas
- Mensagens de confirmação ou erro de inscrição não estão funcionando corretamente
- Pequeno bug no javascript da avaliação de eventos
- Mensagens flash do admin/settings sendo exibidas várias vezes
- Layout da galeria: as imagens estão quebrando a linha em algumas situações
- O menu principal se sobrepõe ao conteúdo em algumas situações
- Problema nas mensagens flash dos bônus de evento

----------

----- Atualização 073 (27/02/15 - )

- Iniciada classe administrator_level


----- Atualização 072 (26/02/15) -----

- Paginação corrigida


----- Atualização 071 (24/02/15 - 25/02/15) -----

- Atualizações no sistema de créditos/bônus


----- Atualização 070 (18/02/15 - 23/02/15) -----

- Correções do tema "utfpr" - painel do usuário
- Atualizações no sistema de créditos/bônus


----- Atualização 069 (10/02/15 - 14/02/15) -----

- Iniciado sistema bônus de evento
- Tabela event_bonus criada
- Restrição adicionada na tabela event_bonus : Apenas uma combinação entre os campos (id_event, id_event_type)
- Classe event_bonus criada
- Adição de bônus de evento adicionada, porém a falta a verificação no ato da inscrição


----- Atualização 068 (03/02/15 - 09/02/15) -----

- Várias correções de layout do tema "utfpr"
- Classe "Events" alterada para "Event"
- Classe "EventsType" alterada para "EventType"
- Classe "Certificates" alterada para "Certificate"
- Modificações na página de cadastro/edição de evento no painel do admin


----- Atualização 067 (31/01/15 - 01/02/15)

- Iniciado calendário de eventos
- Iniciados botões para mudar o zoom


----- Atualização 066 (27/01/15 - 29/01/15) -----

- Pequenas alterações de layout
- Correções na área de Settings


----- Atualização 065 (22/01/15 - 23/01/15) -----

- Atualizações no tema "UTFPR"
- Modificações na página "Sobre"


----- Atualização 064 (19/01/15 - 20/01/15) -----

- Atualizações no Layout
- Modificações no menu principal
- Iniciado suporte a múltiplos temas (templates)
- Iniciado tema "UTFPR"


----- Atualização 063 (18/01/15) -----

- Refinamento da documentação


----- Atualização 062 (12/01/15 - 16/01/15) -----

- Adicionado campo "rating" na tabela "enrollment"
- Adicionado campo "rating" na tabela "event"
- Adicionado campo "evaluations" na tabela "event"
- Avaliação de eventos finalizada
- Criada trigger para atualizar média das avaliações
- Lista de inscrições do participante alterada, agora uma <ul> é utilizada


----- Atualização 061 (08/01/15) -----

- Área de mídia atualizada, upload de várias fotos finalizado (restando apenas a listagem de eventos por json)
- Miniatura de imagens/vídeos na listagem do admin
- Na home, caso não existam 4 próximos eventos, o espaço será preenchido por eventos anteriores.
- Criadas funções saveUrl, retrieveUrl e unsetUrl no controlador base, para guardar uma url que pode ser recuperada posteriormente. Utilizada no login quando o usuário deslogado entra numa página que requer login.
- Adicionada validação que impede duas inscrições do mesmo usuário no mesmo evento.
- Verificação de tipo de pagamento alterada para comparar o código e não mais o nome do tipo de pagamento
- Paginação corrigida na listagem de tipos de evento
- Pequenas correções


----- Atualização 060 (06/01/15) -----

- Atualizações na geração de relatórios
- Validação para impedir registro de presença antes do início do evento adicionada
- Validação para impedir registro de presença em eventos do tipo sem_inscricao
- Alterações na página do evento



----- Atualização 059 (04/01/15) -----

- Adicionado campo "path" na tabela de notícias
- Adicionado campo "code" na tabela de tipos de evento
- Adicionado campo "code" na tabela de formas de pagamento
- Corrigidos vários erros pelo validador da W3c
- Largura mínima "800px" adicionada no painel do admin (em análise)
- Iniciado formulário para cadastro de várias mídias
- Lista de certificados no painel do participante iniciada


----- Atualização 058 (02/01/15 - 03/01/15) -----

- Eventos estão acessíveis através do link customizado
- Geração de relatórios de inscrições com filtro de período, confirmações, presenças e eventos finalizada
- Página "Sobre" criada, utilizando o controller da home
- Login em modal adicionado


----- Atualização 057 (28/12/14 - 31/12/14) -----

- Adicionado ano nas datas do readme
- Adicionado campo path (caminho) na tabela de eventos
- Adicionado campo address (endereço) na tabela de eventos
- Modificações na página do evento
- Adicionado mapa do google maps na página do evento
- Galeria de mídia por evento adicionada (faltam alguns ajustes de javascript)
- Adicionado campo booleano "send_participant_data" na tabela de eventos
- Adicionado campo texto "participant_data" na tabela de inscrição
- "Modais" de informações adicionados em algumas áreas do painel de administração


----- Atualização 056 (23/12/14 - 27/12/14) -----

- Logo do evento (BLOB) adicionado, e será exibido onde anteriormente era uma mídia
- Galeria de mídia atualizada, está trazendo as imagens dinamicamente
- Seção TO DO (fazer) adicionada no topo do README
- Função getThumbnail adicionada no model Media
- Criada classe media_json para utilização nas galerias



----- Atualização 055 (22/12/14) -----

- Documentação Atualizada
- Removidos trechos de código não utilizados
- Atualização na área de certificados
- Verificação de autenticidade via código adicionada (login não necessário)
- Menu do painel de administração fixado no topo e container alterado para fluid
- Vários formulários alterados, alguns componentes foram alinhados lado a lado



----- Atualização 054 (16/12/14 - 21/12/14) -----

- Geração de certificados iniciada
- Atualizações na área de relatórios



----- Atualização 053 (04/12/14 - 15/12/14) -----

- Atualizações anteriores à 30 guardadas no arquivo readme_old.txt
- BUGS CONHECIDOS agora fica no topo do readme
- Atualizações na área de certificados



----- Atualização 052 (24/11/14 - 03/12/14) -----

- Contador de visualizações adicionado nas notícias e nos eventos
- Número de visualizações exibido na página do site e também do painel de admin
- Atualização da documentação

Bugs Conhecidos : 
- As mensagens de erro referentes aos preços de evento não são exibidas, mas as validações funcionam
- O participante é excluído, mas o model ou controller gera um erro. Ao atualizar volta à lista, mas exibe outra mensagem de erro.



----- Atualização 051 (10/11/14 - 21/11/14) -----

- Adicionados registros de participantes para testes
- Tabela de preços parcialmente corrigida
- OBS. 1: Não é possível deletar um preço
- Os patrocinadores não são salvos no cadastro de evento (apenas edição)
- jQuery UI modificado para ter apenas datepicker
Bugs Conhecidos : 
- As mensagens de erro referentes aos preços de evento não são exibidas, mas as validações funcionam
- O participante é excluído, mas o model ou controller gera um erro. Ao atualizar volta à lista, mas exibe outra mensagem de erro.


----- Atualização 050 (29/10/14 - 09/11/14) -----

- Área de certificados iniciada
- Correção de alguns ícones de formulários
- Link "Sobre" adicionado no footer


----- Atualização 049 (27/10/14 - 28/10/14) -----

- Relação patrocinador-evento finalizada (porém falta logo de patrocinador)


----- Atualização 048 (15/10/14 - 18/10/14) -----

- Documentação complementada
- Criada tabela events_sponsor para relacionar patrocinadores a eventos
- Pequenas correções e modificações


----- Atualização 047 (01/10/14 - 14/10/14) -----
- Documentação iniciada
- Validações com ajax no formulário de cadastro iniciadas
- Pequenas correções e modificações


----- Atualização 046 (08/09/14 - 09/09/14) -----
- Área de participantes no painel do admin adicionada (restam ajustes)
- Iniciada área de patrocinadores (sponsor)


----- Atualização 045 (04/09/14 - 05/09/14) -----
- Adicionada listagem de eventos com Ajax na página de criação/edição de evento
- Adicionado jQueryUI
- Pequeno progresso na área de relatórios
- Iniciada área de participantes no painel de admin (rotas, controladores)
- Layout vazio (que exibe apenas o conteúdo, para ser usado em ajax ou iframes) criado
- Pequenas correções para validar na W3C
- Tabela de preços de evento iniciada (apenas html)


----- Atualização 044 (30/08/14 - 31/08/14) -----
- Modo manutenção adicionado, na área Configurações Gerais
- Adicionados via ajax algumas coisas referente à manutenção, mas acho que precisamos aprimorar
- Dividida lista de links alternativos no footer

- Iniciado relatório de inscrições
- Iniciado sistema de log, em funcionamento nos Eventos e Notícias no painel de admin


----- Atualização 043 (29/08/14) -----
- Adicionado ORDER BY no find de eventos
- Corrigida ordenação de eventos nas áreas de evento
- Adicionadas tabs nas páginas de criação e modificação de eventos
- Outras pequenas modificações
- Iniciada lista de eventos em modal na criação ou edição de evento

- Iniciado layout da área 'Manutenção'
- Validação na lista de presença adicionada
- Alguns nomes e textos alterados
- Removidos alguns arquivos desnecessários


----- Atualização 042 (28/08/14) -----
- Deletados arquivos .fuse_hidden
- Criado arquivo PERMISSIONS.md para documentarmos temporariamente as permissões
- Iniciada função para validar link do youtube

----- Atualização 041 (23/07/14) -----
- Corrigido vários detalhes concernentes a labels para informar que o evento é gratuito ou sem inscrição
- Alterado controller para permitir cadastrar evento com valor zerado caso seja evento sem_pagamento
- Alterado para não exibir botão para selecionar forma de pagamento caso o evento seja gratuito
- Implementado botão "definir como pago" na view de inscrições na area admin
- Implementado tela para ver inscrições na area do admin

----- Atualização 040 (22/07/14) -----
- Testes funcionando

----- Atualização 039 (21/07/14) -----
- Iniciando área de testes
- Finalizando Lista de Chamada

----- Atualização 038 (20/07/14 - 21/07/14) -----
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

----- Atualização 037 (20/07/14) -----
- Corrigido bug cadastro participant
- Implementado JS na view _form do cadastro participant para buscar no DB e setar o <option> da cidade e estado
- Implementado consulta à inscrições na area do participant, opção para clicar no link para pagamento
- Adicionado campo uri_payment tabela enrollment
- Feito várias pequenas modificações com relaçao a encapsulamente de classes

----- Atualização 036 (19/07/14) -----
- Iniciado implementação PagSeguro .... para funcionar deve instalar o curl [no terminal digitar apt-get install php5-curl]

----- Atualização 035 (18 - 19/07/14) -----
- Removido Forma de Pgto da tabela de events (verificar diagrama)
- Alterado constraint fk_cost_event_event para fazer remoção em cascata, qdo remove evento -> remover preços
- Implementado cadastro de preços no momento de cadastrar evento

----- Atualização 034 (18/07/14) -----
- Update na área de ajuda
- Corrigido _foot da área do admin
- Adicionada busca na página de notícias, próximos eventos e eventos anteriores
- Adicionada função que bloqueia a tecla enter no campo search
- Atualizações na área de participante
- Outras pequenas correções

----- Atualização 033 (17/07/14) -----
- Finalizado implementação do cadastro de administradores area Admin
- Alterado estrutura da tabela administrators (verificar diagrama)

----- Atualização 032 (16/07/14) -----
- Iniciado implementação do cadastro de administradores area Admin

----- Atualização 031 (17/07/14) -----
- Iniciando página de ajuda do painel do admin
- Correções em media.class.php
- Adicionando ORDER BY na função find da news.class.php
- Arrumando layout da listagem de mídia
- Outras pequenas modificações

----- Atualização 030 (16/07/14) -----
- Corrigido bug getMedia() do model Media
- Implementado remoção da imagem ao remover o registro do banco de dados
- View editar Media -> no modo edição liberado apenas para alterar o label da media

