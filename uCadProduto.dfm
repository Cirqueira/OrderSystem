inherited FCadProduto: TFCadProduto
  Caption = 'Cadastro de produtos'
  KeyPreview = True
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlGrid: TPanel
    Width = 593
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 593
    inherited dbgrdPrincipal: TDBGrid
      Left = 9
      Top = 6
      Width = 578
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_product'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'price'
          Visible = True
        end>
    end
  end
  inherited pnlDados: TPanel
    Left = 593
    Width = 389
    StyleElements = [seFont, seClient, seBorder]
    ExplicitLeft = 593
    ExplicitWidth = 389
    object lblCodigoProduto: TLabel
      Left = 20
      Top = 11
      Width = 33
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblNomeProduto: TLabel
      Left = 20
      Top = 84
      Width = 83
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Nome do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblPrecoVenda: TLabel
      Left = 20
      Top = 224
      Width = 75
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Preco de venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblDescricaoProduto: TLabel
      Left = 20
      Top = 158
      Width = 102
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Descri'#231#227'o do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtCodigoProduto: TDBEdit
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
      DataSource = DM.dsProdutos
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
    object edtNomeProduto: TDBEdit
      Left = 20
      Top = 105
      Width = 175
      Height = 23
      Hint = 'Digite o nome do produto'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      DataField = 'name'
      DataSource = DM.dsProdutos
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnKeyPress = edtNomeProdutoKeyPress
    end
    object edtDescricaoProduto: TDBEdit
      Left = 20
      Top = 179
      Width = 350
      Height = 23
      Hint = 'Digite a descri'#231#227'o do produto'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      DataField = 'description'
      DataSource = DM.dsProdutos
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = edtDescricaoProdutoKeyPress
    end
    object edtPrecoVenda: TDBEdit
      Left = 20
      Top = 245
      Width = 100
      Height = 23
      Hint = 'Digite o pre'#231'o de venda'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      DataField = 'price'
      DataSource = DM.dsProdutos
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = edtPrecoVendaKeyPress
    end
  end
  inherited pnlBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnRegAnterior: TSpeedButton
      ExplicitLeft = 724
      ExplicitTop = 10
    end
    inherited btnRegProximo: TSpeedButton
      ExplicitTop = 1
    end
    inherited btnRegNovo: TSpeedButton
      Left = 779
      ExplicitLeft = 810
      ExplicitTop = 10
    end
    inherited btnRegEditar: TSpeedButton
      ExplicitLeft = 835
      ExplicitTop = 10
    end
    inherited btnRegSalvar: TSpeedButton
      ExplicitLeft = 853
      ExplicitHeight = 41
    end
    inherited btnRegApagar: TSpeedButton
      ExplicitTop = 1
    end
    inherited btnFechar: TSpeedButton
      ExplicitLeft = 952
      ExplicitTop = -4
      ExplicitHeight = 41
    end
    inherited bevelNavegar: TBevel
      Left = 812
      ExplicitLeft = 812
    end
    inherited lblNomeForm: TLabel
      Caption = 'Produtos'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 104
    end
  end
  inherited dsPrincipal: TDataSource
    DataSet = DM.qProdutos
    Left = 144
    Top = 328
  end
end
