inherited FPedido: TFPedido
  Caption = 'Lista de pedidos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited pnlDados: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblNomeForm: TLabel
      Caption = 'Pedidos'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 90
    end
  end
end
