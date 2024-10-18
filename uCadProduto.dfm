inherited FCadProduto: TFCadProduto
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produto'
  KeyPreview = True
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  inherited pnlCabecalho: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblNomeForm: TLabel
      Width = 92
      Caption = 'Produto'
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 92
    end
  end
  inherited pnlGrade: TPanel
    Width = 593
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 593
    inherited dbgrdPrincipal: TDBGrid
      Width = 578
      Columns = <
        item
          Expanded = False
          FieldName = 'cod_product'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'name'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'price'
          Width = 80
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
    object Label1: TLabel
      Left = 20
      Top = 12
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
    object Label2: TLabel
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
    object Label6: TLabel
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
    object Label3: TLabel
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
    object edtCodProd: TDBEdit
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
      DataSource = dsPrincipal
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
      DataSource = dsPrincipal
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
      DataSource = dsPrincipal
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
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
      DataSource = dsPrincipal
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
  inherited pnlBusca: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited lblPesquisa: TLabel
      StyleElements = [seFont, seClient, seBorder]
    end
    inherited btnRegNovo: TSpeedButton
      Left = 810
      Top = 12
      ExplicitLeft = 810
      ExplicitTop = 12
    end
    inherited edtPesquisar: TEdit
      StyleElements = [seFont, seClient, seBorder]
    end
    object btnSelecionarProduto: TBitBtn
      Left = 480
      Top = 15
      Width = 75
      Height = 25
      Hint = 'Seleciona o Produto'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Selecionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = btnSelecionarProdutoClick
    end
  end
  inherited dsPrincipal: TDataSource
    DataSet = DM.FDQueryProdutos
    Left = 144
    Top = 328
  end
end