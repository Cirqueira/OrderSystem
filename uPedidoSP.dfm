inherited FPedidoSP: TFPedidoSP
  Caption = 'Pedido (Stored Procedure)'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblItemPedido: TLabel
      Left = 11
      Top = 258
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 11
      ExplicitTop = 258
    end
    inherited lblPedido: TLabel
      Left = 11
      Top = 85
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 11
      ExplicitTop = 85
    end
    object lblSelecaoCodigoPedido: TLabel [2]
      AlignWithMargins = True
      Left = 11
      Top = 12
      Width = 258
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Selecione o c'#243'digo do pedido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited dbgrdPrincipal: TDBGrid
      Left = 12
      Top = 113
      Width = 643
      DataSource = DM.dsPedidoSP
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_order'
          Title.Caption = 'Pedido ID'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_order'
          Title.Caption = 'Data'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_client'
          Title.Caption = 'Cliente ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name_client'
          Title.Caption = 'Nome'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'address'
          Title.Caption = 'Endere'#231'o'
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'phone'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email'
          Title.Caption = 'Email'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_value'
          Title.Caption = 'Total Pedido (R$)'
          Visible = True
        end>
    end
    inherited dbgrdItens: TDBGrid
      Top = 287
      Height = 171
      DataSource = DM.dsItemSP
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_product'
          Title.Caption = 'Produto ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name_product'
          Title.Caption = 'Produto'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 229
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Title.Caption = 'Qtde.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unit_price'
          Title.Caption = 'Valor Unit. (R$)'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_item'
          Title.Caption = 'Total (R$)'
          Width = 74
          Visible = True
        end>
    end
    object cbPedidos: TComboBox
      Left = 11
      Top = 40
      Width = 97
      Height = 23
      TabOrder = 2
      OnChange = btnPesquisaClick
    end
  end
  inherited pnlDados: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblCodigoPedido: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblData: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblCliente: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblValorTotal: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtCodigoPedido: TDBEdit
      DataSource = DM.dsPedidoSP
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtData: TDBEdit
      DataSource = DM.dsPedidoSP
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtCliente: TDBEdit
      DataSource = DM.dsPedidoSP
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtValorTotal: TDBEdit
      DataField = 'total_value'
      DataSource = DM.dsPedidoSP
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnRegAnterior: TSpeedButton
      Visible = False
      ExplicitLeft = 716
      ExplicitTop = -4
      ExplicitHeight = 41
    end
    inherited btnRegProximo: TSpeedButton
      Visible = False
      ExplicitLeft = 742
      ExplicitHeight = 41
    end
    inherited btnRegNovo: TSpeedButton
      ExplicitLeft = 775
      ExplicitTop = -4
      ExplicitHeight = 41
    end
    inherited lblNomeForm: TLabel
      Caption = 'Lista de Pedidos (Stored Procedure)'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 417
    end
  end
  object btnPesquisa: TBitBtn [4]
    Left = 114
    Top = 83
    Width = 31
    Height = 25
    Cursor = crHandPoint
    Hint = 'Pesquisar'
    Anchors = [akRight, akBottom]
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333300003333333333333333333300003333373333333333333300003333
      07733333333333330000333000773333333333330000330F0007733333333333
      00003330F000777777733333000033330F000000007733330000333330F00788
      87077333000033333300788FF870773300003333330788888F87073300003333
      3308888888F80733000033333307888888F807330000333333078FF888880733
      0000333333777FF8888773330000333333307788887033330000333333330777
      7703333300003333333337000733333300003333333333333333333300003333
      33333333333333330000}
    ParentShowHint = False
    ShowHint = True
    Spacing = 1
    TabOrder = 4
    OnClick = btnPesquisaClick
  end
end
