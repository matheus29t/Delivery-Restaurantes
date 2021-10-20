Scenario: Apresentação de notificação de novo pedido (bem sucedido)
    Given Estou na página “Início”
    When Um cliente tenta fazer um novo pedido
    And O limite de pedidos do restaurante ainda não foi alcançado
    Then Vejo uma mensagem de novo pedido na telaa

Scenario: Apresentação de notificação de novo pedido (mal sucedido)
    Given Estou na página “Início”
    When Um cliente tenta fazer um novo pedido
    And O limite de pedidos do restaurante já foi alcançado
    Then Não vejo uma mensagem de novo pedido na tela

Scenario: Apresentação de notificação de pedido cancelado (bem sucedido)
    Given Estou na página “Início”
    When Um usuário tenta cancelar um pedido
    And O pedido ainda está dentro do prazo estabelecido para cancelamento
    Then Consigo ver uma mensagem de pedido cancelado
    
Scenario: Apresentação de notificação de pedido cancelado (mal sucedido)
    Given Estou na página “Início”
    When Um usuário tenta cancelar um pedido
    And O pedido ultrapassou o prazo estabelecido para cancelamento
    Then Não consigo ver uma mensagem de pedido cancelado