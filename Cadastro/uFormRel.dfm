object FormRel: TFormRel
  Left = 0
  Top = 0
  Caption = 'FormRel'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport: TRLReport
    AlignWithMargins = True
    Left = -8
    Top = 0
    Width = 794
    Height = 1123
    AdjustableMargins = True
    DataSource = FDataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLDetailGrid1: TRLDetailGrid
      Left = 38
      Top = 38
      Width = 718
      Height = 91
      object RLDBText1: TRLDBText
        Left = 26
        Top = 61
        Width = 103
        Height = 16
        DataField = 'NOME_CLIENTE'
        DataSource = FDataSource
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 186
        Top = 61
        Width = 90
        Height = 16
        DataField = 'DATA_VENDA'
        DataSource = FDataSource
        Text = ''
      end
    end
    object RLLabel2: TRLLabel
      Left = 64
      Top = 77
      Width = 44
      Height = 16
      Caption = 'Cliente'
    end
    object RLLabel3: TRLLabel
      Left = 224
      Top = 77
      Width = 68
      Height = 16
      Caption = 'Data venda'
    end
    object RLLabel1: TRLLabel
      Left = 360
      Top = 38
      Width = 48
      Height = 16
      Caption = 'Vendas'
    end
  end
  object FQuery: TSQLQuery
    Params = <>
    Left = 368
    Top = 192
  end
  object FDataSource: TDataSource
    DataSet = ClientDataSet
    Left = 272
    Top = 200
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 552
    Top = 192
  end
  object DataSetProvider: TDataSetProvider
    DataSet = FQuery
    Left = 464
    Top = 192
  end
end
