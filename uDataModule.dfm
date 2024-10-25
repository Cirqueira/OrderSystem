object DM: TDM
  Height = 430
  Width = 569
  object fdConnection: TFDConnection
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
    Left = 144
    Top = 40
  end
  object qProduct: TFDQuery
    Active = True
    Connection = fdConnection
    SQL.Strings = (
      'select * from tab_item')
    Left = 68
    Top = 116
    object qProductcod_product: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'cod_product'
      Origin = 'cod_product'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProductname: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 18
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
    object qProductdescription: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 132
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object qProductprice: TBCDField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 16
      FieldName = 'price'
      Origin = 'price'
      Precision = 10
      Size = 2
    end
  end
  object dsProduct: TDataSource
    DataSet = qProduct
    Left = 68
    Top = 184
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 476
    Top = 24
  end
  object qSearch: TFDQuery
    Connection = fdConnection
    SQL.Strings = (
      '')
    Left = 222
    Top = 114
  end
  object dsSearch: TDataSource
    DataSet = qSearch
    Left = 220
    Top = 184
  end
  object fdqOrder: TFDQuery
    Connection = fdConnection
    SQL.Strings = (
      
        'SELECT o.cod_order, o.date_order, o.cod_client, c.name AS name_c' +
        'lient'
      'FROM tab_orders o'
      'JOIN tab_clients c'
      '  ON (o.cod_client = c.cod_client)')
    Left = 357
    Top = 112
    object fdqOrdercod_order: TIntegerField
      DisplayLabel = 'Pedido ID'
      DisplayWidth = 10
      FieldName = 'cod_order'
      Origin = 'cod_order'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqOrderdate_order: TDateField
      DisplayLabel = 'Data'
      DisplayWidth = 15
      FieldName = 'date_order'
      Origin = 'date_order'
    end
    object fdqOrdercod_client: TIntegerField
      DisplayLabel = 'Cliente ID'
      DisplayWidth = 15
      FieldName = 'cod_client'
      Origin = 'cod_client'
    end
    object fdqOrdername_client: TStringField
      DisplayLabel = 'Nome Cliente'
      DisplayWidth = 50
      FieldName = 'name_client'
      Origin = 'name_client'
      Size = 50
    end
  end
  object dsOrder: TDataSource
    DataSet = fdqOrder
    Left = 359
    Top = 172
  end
  object fdqItem: TFDQuery
    Connection = fdConnection
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
      ' WHERE oi.cod_order = :OrderID'
      
        'GROUP BY i.name, oi.quantity, oi.unit_price, o.total_value_order' +
        ';'
      '')
    Left = 437
    Top = 109
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
  object dsItemOrder: TDataSource
    DataSet = fdqItem
    Left = 440
    Top = 173
  end
  object qOrderSP: TFDQuery
    Connection = fdConnection
    SQL.Strings = (
      '')
    Left = 368
    Top = 256
  end
  object qItemSP: TFDQuery
    Connection = fdConnection
    SQL.Strings = (
      '')
    Left = 448
    Top = 256
    object qItemSPcod_item_order: TIntegerField
      FieldName = 'cod_item_order'
      Origin = 'cod_item_order'
      Required = True
    end
    object qItemSPcod_product: TIntegerField
      FieldName = 'cod_product'
      Origin = 'cod_product'
      Required = True
    end
    object qItemSPname_product: TStringField
      FieldName = 'name_product'
      Origin = 'name_product'
      Size = 100
    end
    object qItemSPdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 255
    end
    object qItemSPquantity: TIntegerField
      FieldName = 'quantity'
      Origin = 'quantity'
    end
    object qItemSPunit_price: TBCDField
      FieldName = 'unit_price'
      Origin = 'unit_price'
      Precision = 10
      Size = 2
    end
    object qItemSPtotal_item: TFMTBCDField
      FieldName = 'total_item'
      Origin = 'total_item'
      ReadOnly = True
      Precision = 21
      Size = 2
    end
  end
  object dsOrderSP: TDataSource
    DataSet = qOrderSP
    Left = 368
    Top = 312
  end
  object dsItemSP: TDataSource
    DataSet = qItemSP
    Left = 456
    Top = 312
  end
end
