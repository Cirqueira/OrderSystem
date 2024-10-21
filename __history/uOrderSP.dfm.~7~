inherited FOrderSP: TFOrderSP
  Caption = 'Order (Stored Procedure)'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlGrid: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblItemOrder: TLabel
      Top = 258
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 258
    end
    inherited lblOrder: TLabel
      Top = 85
      Width = 48
      Caption = 'Order'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitTop = 85
      ExplicitWidth = 48
    end
    object lblSelectOrderCode: TLabel [2]
      AlignWithMargins = True
      Left = 11
      Top = 12
      Width = 155
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Select order code:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited dbgrdMain: TDBGrid
      Left = 12
      Top = 113
      Width = 643
      DataSource = DM.dsOrderSP
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_order'
          Title.Caption = 'Order ID'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_order'
          Title.Caption = 'Date'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cod_client'
          Title.Caption = 'Client ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name_client'
          Title.Caption = 'Name'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'address'
          Title.Caption = 'Address'
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'phone'
          Title.Caption = 'Phone'
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
          Title.Caption = 'Total Order ($)'
          Width = 93
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
          Title.Caption = 'Product ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name_product'
          Title.Caption = 'Product'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Title.Caption = 'Description'
          Width = 229
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Title.Caption = 'Quantity'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'unit_price'
          Title.Caption = 'Price ($)'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total_item'
          Title.Caption = 'Total ($)'
          Width = 74
          Visible = True
        end>
    end
    object cbOrder: TComboBox
      Left = 11
      Top = 40
      Width = 97
      Height = 23
      TabOrder = 2
      OnChange = btnSearchClick
    end
  end
  inherited pnlData: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblOrderId: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblDate: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblClient: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited lblTotalValueOrder: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtCodigoPedido: TDBEdit
      DataSource = DM.dsOrderSP
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtData: TDBEdit
      DataSource = DM.dsOrderSP
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtCliente: TDBEdit
      DataSource = DM.dsOrderSP
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited edtValorTotal: TDBEdit
      DataField = 'total_value'
      DataSource = DM.dsOrderSP
      StyleElements = [seFont, seClient, seBorder]
    end
  end
  inherited pnlButton: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnPrevious: TSpeedButton
      Visible = False
    end
    inherited btnNext: TSpeedButton
      Visible = False
      ExplicitLeft = 742
      ExplicitHeight = 41
    end
    inherited btnNew: TSpeedButton
      ExplicitLeft = 775
    end
    inherited lblNameForm: TLabel
      Caption = 'Order List (Stored Procedure)'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 344
    end
  end
  object btnSearch: TBitBtn [4]
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
    OnClick = btnSearchClick
  end
end
