object FReport: TFReport
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Order report'
  ClientHeight = 282
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 291
    Height = 282
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lblClient: TLabel
      Left = 14
      Top = 60
      Width = 34
      Height = 15
      Caption = 'Client:'
    end
    object lblStartDate: TLabel
      Left = 14
      Top = 142
      Width = 54
      Height = 15
      Caption = 'Start Date:'
    end
    object lblEndDate: TLabel
      Left = 175
      Top = 142
      Width = 50
      Height = 15
      Caption = 'End Date:'
    end
    object dtpStartDate: TDateTimePicker
      Left = 15
      Top = 163
      Width = 100
      Height = 23
      Date = 45584.000000000000000000
      Time = 0.801061550926533500
      TabOrder = 0
    end
    object dtpEndDate: TDateTimePicker
      Left = 175
      Top = 163
      Width = 100
      Height = 23
      Date = 45584.000000000000000000
      Time = 0.801158703703549700
      TabOrder = 1
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 0
      Width = 291
      Height = 43
      Align = alTop
      TabOrder = 2
      object btnClose: TSpeedButton
        Left = 257
        Top = 1
        Width = 33
        Height = 41
        Align = alRight
        Flat = True
        Glyph.Data = {
          96090000424D9609000000000000360000002800000028000000140000000100
          18000000000060090000120B0000120B0000000000000000000000FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF66DAE0E7B9C6D893A8C66F8AB45574A7033783113C86
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF66E9E9E9DDDDDDCFCFCFC1C1C1B6B6B69A9A9A9C9C9C00FF6600
          FF6600FF6600FF668C8C8C5353532A2A2A2626262323231F1F1F1C1C1C171717
          1515150045920057A10963AB176EB42177BB0B66A8143E8700FF6600FF6600FF
          6600FF66BEBEBEA1A1A18D8D8D8B8B8B898989878787868686838383828282A0
          A0A0A8A8A8ADADADB3B3B3B7B7B7AEAEAE9D9D9D00FF6600FF6600FF6600FF66
          00FF6600FF663030309999999999999A9A9A9C9C9C9C9C9C9D9D9D00509D5DA5
          DE5DA5E056A0DD4896D70E67AA14418A00FF6600FF6600FF6600FF6600FF6600
          FF66909090C4C4C4C4C4C4C5C5C5C6C6C6C6C6C6C6C6C6A5A5A5CDCDCDCECECE
          CBCBCBC7C7C7AFAFAF9E9E9E00FF6600FF6600FF6600FF6600FF6600FF663535
          3597979708560E9697979A9A9A9A9A9A9C9C9C0057A464ABE1348DD12A86CF30
          88D00F68AA14448E00FF6600FF6600FF6600FF6600FF6600FF66929292C3C3C3
          989898C3C3C3C5C5C5C5C5C5C6C6C6A8A8A8D0D0D0C2C2C2BFBFBFC0C0C0AFAF
          AFA0A0A000FF6600FF6600FF6600FF6600FF6600FF663B3B3B969696095A0F00
          53049999999999999A9A9A095EAD6BB1E53E94D6328DD1388FD3126AAB144A92
          00FF6600FF6600FF6600FF6600FF6600FF66959595C3C3C39A9A9A969696C4C4
          C4C4C4C4C5C5C5ACACACD3D3D3C5C5C5C2C2C2C3C3C3B0B0B0A2A2A200FF6600
          FF6600FF6600FF66016B0B006606005E010059001A8124167E1F045609979797
          9999991566B274B7E8459ADA3C93D63F94D6156DAE144F9800FF6600FF6600FF
          6600FF669F9F9F9D9D9D999999979797AAAAAAA9A9A9979797C3C3C3C4C4C4B0
          B0B0D6D6D6C8C8C8C5C5C5C5C5C5B2B2B2A5A5A500FF6600FF6600FF6600FF66
          06721075D4826ED07B68CC7461C86D5CC567177E2006570C9797971F6EBB7BBC
          EB4FA1DD439EDD3AB2F1176FAE14569E00FF6600FF6600FF6600FF66A2A2A2D5
          D5D5D3D3D3D1D1D1CECECECCCCCCA9A9A9989898C3C3C3B4B4B4D8D8D8CBCBCB
          CACACAD3D3D3B3B3B3A8A8A800FF6600FF6600FF6600FF660B78167ED98C64CC
          725DC86A56C36357C3635EC66A1A7F232A672E2A75C285C2EE59A8E13FB8F41D
          E1FF1078B8145CA500FF6600FF6600FF6600FF66A5A5A5D9D9D9D0D0D0CECECE
          CBCBCBCBCBCBCDCDCDAAAAAAA3A3A3B7B7B7DBDBDBCFCFCFD6D6D6E4E4E4B7B7
          B7ABABAB00FF6600FF6600FF6600FF660F7F1C85DE9481DB8D7BD78875D4826E
          D07B268A300F6316949494327CC98AC8F263B1E557ABE438C9FF1D74B11463AB
          00FF6600FF6600FF6600FF66A8A8A8DBDBDBD9D9D9D7D7D7D5D5D5D3D3D3AFAF
          AF9E9E9EC2C2C2BBBBBBDEDEDED3D3D3D0D0D0DDDDDDB5B5B5AEAEAE00FF6600
          FF6600FF6600FF6613852010811D0C7B19097515379C4232963C156D1D939393
          9393933B82D193CFF56DB8EA64B2E566B1E52375B2196AB300FF6600FF6600FF
          6600FF66ABABABA9A9A9A7A7A7A4A4A4B8B8B8B5B5B5A2A2A2C1C1C1C1C1C1BE
          BEBEE1E1E1D6D6D6D3D3D3D3D3D3B6B6B6B2B2B200FF6600FF6600FF6600FF66
          00FF6600FF665C5C5C8D8D8D0977151A77239090909292929292924388D699D4
          F675BFEC6DB9EA6EB9EA2678B42471BA00FF6600FF6600FF6600FF6600FF6600
          FF66A6A6A6BEBEBEA5A5A5A7A7A7C0C0C0C1C1C1C1C1C1C1C1C1E3E3E3D9D9D9
          D6D6D6D7D7D7B7B7B7B5B5B500FF6600FF6600FF6600FF6600FF6600FF666060
          608C8C8C2781318C8D8C8F8F8F9090909090904C8DDBA0D9F97EC5F175BFEC78
          BFEC287BB52E79C200FF6600FF6600FF6600FF6600FF6600FF66A8A8A8BEBEBE
          ACACACBEBEBEBFBFBFC0C0C0C0C0C0C4C4C4E5E5E5DCDCDCD9D9D9D9D9D9B8B8
          B8B9B9B900FF6600FF6600FF6600FF6600FF6600FF666464648C8C8C8C8C8C8D
          8D8D8D8D8D8F8F8F8F8F8F5092E0A4DDFCA5DDFC8ACFF481C6EF2D7EB7377FC8
          00FF6600FF6600FF6600FF6600FF6600FF66AAAAAABEBEBEBEBEBEBEBEBEBEBE
          BEBFBFBFBFBFBFC6C6C6E7E7E7E7E7E7E0E0E0DCDCDCBABABABDBDBD00FF6600
          FF6600FF6600FF6600FF6600FF666868686666666363636060605C5C5C595959
          5555555393E15093E472AFECA5E0FEA3DBFB307FB84185CF00FF6600FF6600FF
          6600FF6600FF6600FF66ACACACABABABA9A9A9A8A8A8A6A6A6A4A4A4A2A2A2C7
          C7C7C7C7C7D3D3D3E9E9E9E6E6E6BABABAC0C0C000FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6668A0E54D90E16FAEEA3281B94A8CD600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66CDCDCD
          C6C6C6D3D3D3BBBBBBC3C3C300FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6698
          BBE74C8FDE4E90DB00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66D9D9D9C5C5
          C5C6C6C600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCloseClick
        ExplicitLeft = 258
      end
      object bevelSair: TBevel
        Left = 255
        Top = 1
        Width = 2
        Height = 41
        Align = alRight
        ExplicitLeft = 644
        ExplicitHeight = 49
      end
      object lblNomeForm: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 248
        Height = 35
        Align = alClient
        Caption = 'Report'
        Font.Charset = ANSI_CHARSET
        Font.Color = clMenuHighlight
        Font.Height = -23
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 79
        ExplicitHeight = 28
      end
    end
    object btnSearch: TButton
      Left = 46
      Top = 232
      Width = 184
      Height = 25
      Caption = 'Search'
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object cbClient: TComboBox
      Left = 14
      Top = 81
      Width = 260
      Height = 23
      TabOrder = 4
      Text = 'cbClient'
    end
  end
  object frxReport: TfrxReport
    Version = '2024.2.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45584.856862488400000000
    ReportOptions.LastChange = 45586.476100509300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 64
    Top = 200
    Datasets = <
      item
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = -10.000000000000000000
          Width = 718.110717773437500000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Customer order report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 12.000000000000000000
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 78.250207020000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Date')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 85.809267020000000000
          Width = 70.086774320000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Order ID')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 159.675571340000000000
          Width = 123.647644470000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Client')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 287.102745810000000000
          Width = 136.836353930000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Product')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 431.498159740000000000
          Width = 58.656559460000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantity')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 497.713779200000000000
          Width = 103.223297030000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Unit value ($)')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 604.716606220000000000
          Width = 108.000000000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total item ($)')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 177.637910000000000000
        Width = 718.110700000000000000
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Width = 78.250207020000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'data'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."data"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 85.809267020000000000
          Width = 70.086774320000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'cod_order'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."cod_order"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 159.675571340000000000
          Width = 123.647644470000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'client'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."client"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 287.102745810000000000
          Width = 136.836353930000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'product'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."product"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 435.277689740000000000
          Width = 58.656559460000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'quantity'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."quantity"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 502.272839200000000000
          Top = 0.220470000000000000
          Width = 99.443767030000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '$ [frxDBDataset1."unit_price"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 604.716606220000000000
          Width = 108.000000000000000000
          Height = 41.574830000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '$ [frxDBDataset1."total_value_item"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110717773437500000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo21: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520117773437500000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
      object Memo22: TfrxMemoView
        AllowVectorExport = True
        Left = 3.779530000000000000
        Top = 283.008040000000000000
        Width = 718.110236220000000000
        Height = 22.677180000000000000
        ContentScaleOptions.Constraints.MaxIterationValue = 0
        ContentScaleOptions.Constraints.MinIterationValue = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
        ParentFont = False
        Style = 'Header line'
      end
      object Memo31: TfrxMemoView
        AllowVectorExport = True
        Left = 421.692796220000000000
        Top = 238.433210000000000000
        Width = 175.472480000000000000
        Height = 22.677180000000000000
        ContentScaleOptions.Constraints.MaxIterationValue = 0
        ContentScaleOptions.Constraints.MinIterationValue = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Memo.UTF8W = (
          'Total order value ($)')
        ParentFont = False
        Style = 'Header'
      end
      object Memo23: TfrxMemoView
        AllowVectorExport = True
        Left = 597.165740000000000000
        Top = 238.008040000000000000
        Width = 115.000000000000000000
        Height = 22.677180000000000000
        ContentScaleOptions.Constraints.MaxIterationValue = 0
        ContentScaleOptions.Constraints.MinIterationValue = 0
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
        DisplayFormat.FormatStr = '%2.2f'
        DisplayFormat.Kind = fkNumeric
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          '$ [frxDBDataset1."total_value_order"]')
        ParentFont = False
        Style = 'Data'
      end
    end
  end
  object frxDB: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = fdqReport
    BCDToCurrency = False
    DataSetOptions = []
    Left = 16
    Top = 200
  end
  object fdqReport: TFDQuery
    Active = True
    Connection = DM.fdConnection
    SQL.Strings = (
      '  SELECT o.date_order AS data, '
      '         o.cod_order, '
      '         c.name AS client, '
      '         i.name AS product, '
      '         oi.quantity, '
      '         oi.unit_price, '
      '         (oi.quantity * oi.unit_price) AS total_value_item, '
      '         (SELECT SUM(oi2.quantity * oi2.unit_price) '
      '          FROM tab_orders_item oi2 '
      
        '          WHERE oi2.cod_order = o.cod_order) AS total_value_orde' +
        'r '
      '  FROM tab_orders o '
      '  JOIN tab_orders_item oi ON (o.cod_order = oi.cod_order)'
      '  JOIN tab_clients c ON (o.cod_client = c.cod_client) '
      '  JOIN tab_item i ON (oi.cod_product = i.cod_product) '
      '  WHERE c.name = '#39'Antonio Alves'#39
      '    --AND o.date_order BETWEEN :DataInicio AND :DataFim '
      '  GROUP BY o.date_order, o.cod_order, c.name, i.name, '
      '           oi.quantity, oi.unit_price')
    Left = 230
    Top = 202
    object fdqReportdata: TDateField
      DisplayLabel = 'Data'
      FieldName = 'data'
      Origin = 'data'
    end
    object fdqReportcod_order: TIntegerField
      DisplayLabel = 'Pedido ID'
      FieldName = 'cod_order'
      Origin = 'cod_order'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqReportclient: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'client'
      Origin = 'client'
      Size = 100
    end
    object fdqReportproduct: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'product'
      Origin = 'product'
      Size = 100
    end
    object fdqReportquantity: TIntegerField
      DisplayLabel = 'Qtde.'
      FieldName = 'quantity'
      Origin = 'quantity'
    end
    object fdqReportunit_price: TBCDField
      DisplayLabel = 'Valor unit. (R$)'
      FieldName = 'unit_price'
      Origin = 'unit_price'
      Precision = 10
      Size = 2
    end
    object fdqReporttotal_value_item: TFMTBCDField
      DisplayLabel = 'Valor total (R$)'
      FieldName = 'total_value_item'
      Origin = 'total_value_item'
      ReadOnly = True
      Precision = 21
      Size = 2
    end
    object fdqReporttotal_value_order: TFMTBCDField
      DisplayLabel = 'Total do pedido (R$)'
      FieldName = 'total_value_order'
      Origin = 'total_value_order'
      ReadOnly = True
      Precision = 38
      Size = 2
    end
  end
  object fdqClient: TFDQuery
    Connection = DM.fdConnection
    SQL.Strings = (
      '')
    Left = 94
    Top = 58
  end
  object DataSource: TDataSource
    DataSet = fdqClient
    Left = 168
    Top = 56
  end
end
