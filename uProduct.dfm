inherited FProduct: TFProduct
  Caption = 'Product registration'
  KeyPreview = True
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlGrid: TPanel
    Width = 593
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 593
    inherited dbgrdMain: TDBGrid
      Left = 9
      Width = 578
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_product'
          Title.Caption = 'Product ID'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Title.Caption = 'Name'
          Width = 151
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Title.Caption = 'Description'
          Width = 242
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'price'
          Title.Caption = 'Price ($)'
          Width = 98
          Visible = True
        end>
    end
  end
  inherited pnlData: TPanel
    Left = 593
    Width = 389
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 593
    ExplicitWidth = 389
    object lblProductId: TLabel
      Left = 20
      Top = 11
      Width = 51
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Product ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblName: TLabel
      Left = 20
      Top = 84
      Width = 67
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Product Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPrice: TLabel
      Left = 20
      Top = 224
      Width = 23
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Price'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblProductDescription: TLabel
      Left = 20
      Top = 158
      Width = 93
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Product Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtProductId: TDBEdit
      Left = 20
      Top = 32
      Width = 70
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clScrollBar
      DataField = 'cod_product'
      DataSource = DM.dsProduct
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
    object edtProductName: TDBEdit
      Left = 20
      Top = 105
      Width = 175
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      DataField = 'name'
      DataSource = DM.dsProduct
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = edtProductNameKeyPress
    end
    object edtProductDescription: TDBEdit
      Left = 20
      Top = 179
      Width = 350
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      DataField = 'description'
      DataSource = DM.dsProduct
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = edtProductDescriptionKeyPress
    end
    object edtPrice: TDBEdit
      Left = 20
      Top = 245
      Width = 100
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      DataField = 'price'
      DataSource = DM.dsProduct
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = edtPriceKeyPress
    end
  end
  inherited pnlButton: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnPrevious: TSpeedButton
      ExplicitLeft = 724
      ExplicitTop = 10
    end
    inherited btnNext: TSpeedButton
      ExplicitTop = 1
    end
    inherited btnNew: TSpeedButton
      Left = 779
      ExplicitLeft = 810
      ExplicitTop = 10
    end
    inherited btnEdit: TSpeedButton
      ExplicitLeft = 835
      ExplicitTop = 10
    end
    inherited btnSave: TSpeedButton
      ExplicitLeft = 853
    end
    inherited btnErase: TSpeedButton
      ExplicitTop = 1
    end
    inherited btnClose: TSpeedButton
      ExplicitLeft = 952
      ExplicitTop = -4
      ExplicitHeight = 41
    end
    inherited bevel1: TBevel
      Left = 812
      ExplicitLeft = 812
    end
    inherited lblNameForm: TLabel
      Caption = 'Products'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 102
    end
  end
  inherited dsMain: TDataSource
    DataSet = DM.qProduct
  end
end
