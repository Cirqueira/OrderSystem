inherited FOrder: TFOrder
  Caption = 'Order List'
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  TextHeight = 15
  inherited StatusBar: TStatusBar
    Panels = <
      item
        Text = 'Orders found: 0'
        Width = 50
      end>
  end
  inherited pnlGrid: TPanel
    Width = 661
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 661
    object lblItemOrder: TLabel [0]
      AlignWithMargins = True
      Left = 11
      Top = 204
      Width = 103
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Order Items'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblOrder: TLabel [1]
      AlignWithMargins = True
      Left = 11
      Top = 19
      Width = 57
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Orders'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited dbgrdMain: TDBGrid
      Left = 13
      Top = 47
      Width = 642
      Height = 121
      Enabled = False
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_order'
          Title.Caption = 'Order ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_order'
          Title.Caption = 'Date'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_client'
          Title.Caption = 'Client ID'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name_client'
          Title.Caption = 'Client Name'
          Width = 362
          Visible = True
        end>
    end
    object dbgrdItens: TDBGrid
      Left = 11
      Top = 233
      Width = 643
      Height = 225
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DM.dsItemOrder
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
      Columns = <
        item
          Expanded = False
          FieldName = 'product'
          Title.Caption = 'Product'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Title.Caption = 'Quantity'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unit_price'
          Title.Caption = 'Price ($)'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_value_item'
          Title.Caption = 'Total value ($)'
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_value_order'
          Title.Caption = 'Total value order'
          Visible = False
        end>
    end
  end
  inherited pnlData: TPanel
    Left = 661
    Width = 321
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 661
    ExplicitWidth = 321
    object lblOrderId: TLabel
      Left = 44
      Top = 59
      Width = 42
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Order ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDate: TLabel
      Left = 44
      Top = 156
      Width = 23
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblClient: TLabel
      Left = 44
      Top = 266
      Width = 27
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Client'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTotalValueOrder: TLabel
      Left = 44
      Top = 370
      Width = 72
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Order Total ($)'
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
      DataSource = DM.dsOrder
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
      DataSource = DM.dsOrder
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
      DataSource = DM.dsOrder
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
      DataSource = DM.dsItemOrder
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
    end
  end
  inherited pnlButton: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnNew: TSpeedButton
      Visible = False
    end
    inherited btnEdit: TSpeedButton
      Visible = False
    end
    inherited btnSave: TSpeedButton
      Visible = False
    end
    inherited btnUndo: TSpeedButton
      Visible = False
    end
    inherited btnErase: TSpeedButton
      Visible = False
    end
    inherited bevel1: TBevel
      Visible = False
    end
    inherited lblNameForm: TLabel
      Width = 706
      Height = 35
      Caption = 'Order List'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 115
    end
  end
  inherited dsMain: TDataSource
    Left = 328
    Top = 16
  end
end
