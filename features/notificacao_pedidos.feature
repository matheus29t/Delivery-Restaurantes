Scenario: Apresentação de notificação de novo pedido (bem sucedido)
    Given Estou na página "Início"
    When Um cliente tenta fazer um novo pedido
    And O limite de pedidos do restaurante ainda não foi alcançado
    Then Vejo uma mensagem de novo pedido na tela

Scenario: Apresentação de notificação de novo pedido (mal sucedido)
    Given Estou na página "Início"
    When Um cliente tenta fazer um novo pedido
    And O limite de pedidos do restaurante já foi alcançado
    Then Não vejo uma mensagem de novo pedido na tela

Scenario: Apresentação de notificação de pedido cancelado (bem sucedido)
    Given Estou na página "Início"
    When Um usuário tenta cancelar um pedido
    And O pedido ainda está dentro do prazo estabelecido para cancelamento
    Then Consigo ver uma mensagem de pedido cancelado
    
Scenario: Apresentação de notificação de pedido cancelado (mal sucedido)
    Given Estou na página "Início"
    When Um usuário tenta cancelar um pedido
    And O pedido ultrapassou o prazo estabelecido para cancelamento
    Then Não consigo ver uma mensagem de pedido cancelado

Scenario: Notificação quando dois usuários realizam pedidos quase ao mesmo tempo 
    Given Estou na página "Início"
    When "João" tenta fazer um novo pedido às 17:50:12 e "Gabriel" tenta fazer um pedido Às 17:50:14
    Then Vejo uma mensagem referente ao pedido de João na tela
    And após 10 segundos, vejo uma mensagem referente ao pedido de Gabriel na tela

Scenario: Notificação quando um usuário realiza um pedido quase ao mesmo tempo que outro usuário cancela um pedido 
    Given Estou na página "Início"
    When "João" tenta fazer um novo pedido às 17:50:12 e "Gabriel" tenta cancelar um pedido Às 17:50:14
    Then Vejo uma mensagem referente ao pedido de João na tela
    And após 10 segundos, vejo uma mensagem referente ao cancelamento de Gabriel na tela
    Then Notificação explode

Scenario: Perda de conexão inesperada assim que um pedido é feito e antes da exibição da notificação
    Given Estou na página "Início"
    When Um usuário faz um pedido
    And a conexão ao sistema é interrompida antes da apresentação da notificação
    Then A notificação é exibida assim que a conexão é re-estabelecida.

Scenario: Fechando uma notificação
    Given Estou na página "Início"
    When Uma notificação de pedido aparece na tela
    And Clico na opção para fechar a notificação
    Then A notificação desaparece da tela
