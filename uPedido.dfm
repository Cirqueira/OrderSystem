inherited FPedido: TFPedido
  Caption = 'Lista de pedidos'
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = -121
  TextHeight = 15
  inherited StatusBar: TStatusBar
    Panels = <
      item
        Text = 'Pedidos encontrados: 0'
        Width = 50
      end>
  end
  inherited pnlGrid: TPanel
    Width = 661
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 661
    object lblItemPedido: TLabel [0]
      AlignWithMargins = True
      Left = 6
      Top = 204
      Width = 136
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Itens do pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPedido: TLabel [1]
      AlignWithMargins = True
      Left = 7
      Top = 19
      Width = 68
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Pedidos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited dbgrdPrincipal: TDBGrid
      Top = 54
      Width = 642
      Height = 121
      DataSource = dsPedido
      Enabled = False
    end
    object dbgrdItens: TDBGrid
      Left = 6
      Top = 240
      Width = 643
      Height = 225
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = dsItemPedido
      Enabled = False
      FixedColor = clMenuHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  inherited pnlDados: TPanel
    Left = 661
    Width = 321
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 661
    ExplicitWidth = 321
    object lblCodigoPedido: TLabel
      Left = 44
      Top = 59
      Width = 46
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Pedido ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblData: TLabel
      Left = 44
      Top = 156
      Width = 23
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblCliente: TLabel
      Left = 44
      Top = 266
      Width = 33
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 44
      Top = 370
      Width = 98
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Total do Pedido (R$)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigoPedido: TDBEdit
      Left = 44
      Top = 80
      Width = 70
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clScrollBar
      DataField = 'cod_order'
      DataSource = dsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object edtData: TDBEdit
      Left = 44
      Top = 177
      Width = 85
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      Color = clScrollBar
      DataField = 'date_order'
      DataSource = dsPedido
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object edtCliente: TDBEdit
      Left = 44
      Top = 287
      Width = 221
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      Color = clScrollBar
      DataField = 'name_client'
      DataSource = dsPedido
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object edtValorTotal: TDBEdit
      Left = 44
      Top = 391
      Width = 85
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      Color = clScrollBar
      DataField = 'total_value_order'
      DataSource = dsItemPedido
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnRegNovo: TSpeedButton
      Visible = False
    end
    inherited btnRegEditar: TSpeedButton
      Visible = False
    end
    inherited btnRegSalvar: TSpeedButton
      Visible = False
    end
    inherited btnRegDesfazer: TSpeedButton
      Visible = False
    end
    inherited btnRegApagar: TSpeedButton
      Visible = False
    end
    inherited bevelNavegar: TBevel
      Visible = False
    end
    inherited lblNomeForm: TLabel
      Caption = 'Lista de Pedidos'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 1
      ExplicitTop = 2
      ExplicitWidth = 706
      ExplicitHeight = 35
    end
  end
  inherited dsPrincipal: TDataSource
    Left = 328
    Top = 16
  end
  object dsPedido: TDataSource
    DataSet = fdqPedido
    OnDataChange = dsPedidoDataChange
    Left = 424
    Top = 152
  end
  object dsItemPedido: TDataSource
    DataSet = fdqItem
    Left = 424
    Top = 440
  end
  object fdqPedido: TFDQuery
    Active = True
    Connection = DM.FDConnection1
    SQL.Strings = (
      
        'SELECT o.cod_order, o.date_order, o.cod_client, c.name AS name_c' +
        'lient'
      'FROM tab_orders o'
      'JOIN tab_clients c'
      '  ON (o.cod_client = c.cod_client)')
    Left = 333
    Top = 152
    object fdqPedidocod_order: TIntegerField
      DisplayLabel = 'Pedido ID'
      DisplayWidth = 10
      FieldName = 'cod_order'
      Origin = 'cod_order'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqPedidodate_order: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 15
      FieldName = 'date_order'
      Origin = 'date_order'
    end
    object fdqPedidocod_client: TIntegerField
      DisplayLabel = 'Cliente ID'
      DisplayWidth = 15
      FieldName = 'cod_client'
      Origin = 'cod_client'
    end
    object fdqPedidoname_client: TStringField
      DisplayLabel = 'Nome Cliente'
      DisplayWidth = 50
      FieldName = 'name_client'
      Origin = 'name_client'
      Size = 50
    end
  end
  object fdqItem: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT i.name AS product,'
      '       oi.quantity,'
      '       oi.unit_price,'
      '       (oi.quantity * oi.unit_price) AS total_value_item,'
      '       o.total_value_order'
      'FROM tab_orders_item oi'
      'JOIN tab_item i '
      '  ON oi.cod_product = i.cod_product'
      'JOIN (SELECT cod_order'
      '           , SUM(quantity * unit_price) AS total_value_order'
      '        FROM tab_orders_item'
      '       WHERE cod_order = :OrderID'
      '--       WHERE cod_order = 1'
      '       GROUP BY cod_order) o '
      '   ON (oi.cod_order = o.cod_order)'
      '-- WHERE oi.cod_order = 1'
      'WHERE oi.cod_order = :OrderID'
      
        'GROUP BY i.name, oi.quantity, oi.unit_price, o.total_value_order' +
        ';'
      '')
    Left = 349
    Top = 440
    ParamData = <
      item
        Name = 'ORDERID'
        ParamType = ptInput
      end>
    object fdqItemproduct: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 25
      FieldName = 'product'
      Origin = 'product'
      Size = 100
    end
    object fdqItemquantity: TIntegerField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'quantity'
      Origin = 'quantity'
    end
    object fdqItemunit_price: TBCDField
      DisplayLabel = 'Pre'#231'o (R$)'
      DisplayWidth = 15
      FieldName = 'unit_price'
      Origin = 'unit_price'
      Precision = 10
      Size = 2
    end
    object fdqItemtotal_value_item: TFMTBCDField
      DisplayLabel = 'Valor Total (R$)'
      DisplayWidth = 15
      FieldName = 'total_value_item'
      Origin = 'total_value_item'
      ReadOnly = True
      Precision = 21
      Size = 2
    end
    object fdqItemtotal_value_order: TFMTBCDField
      FieldName = 'total_value_order'
      Origin = 'total_value_order'
      ReadOnly = True
      Visible = False
      Precision = 38
      Size = 2
    end
  end
end
