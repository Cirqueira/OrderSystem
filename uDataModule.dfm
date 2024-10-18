object DM: TDM
  Height = 416
  Width = 687
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=Cirqueira'
      'OSAuthent=Yes'
      'Server=MACWINDOWS\SQLEXPRESS'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=MACWINDOWS'
      'MARS=yes'
      'Database=Pedidos'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 50
    Top = 50
  end
  object FDQueryProdutos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from tab_item')
    Left = 125
    Top = 125
    object FDQueryProdutoscod_product: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'cod_product'
      Origin = 'cod_product'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryProdutosname: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 18
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
    object FDQueryProdutosdescription: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 132
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object FDQueryProdutosprice: TBCDField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 16
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQueryProdutos
    Left = 185
    Top = 200
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 385
    Top = 50
  end
  object FDQueryConsultas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 357
    Top = 133
  end
end
