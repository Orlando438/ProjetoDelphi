object DMCadBase: TDMCadBase
  Height = 480
  Width = 640
  object CdsCad: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 368
    Top = 86
  end
  object QueryCad: TFDQuery
    ChangeAlertName = 'Query'
    Left = 200
    Top = 87
  end
  object DataSetProvider: TDataSetProvider
    DataSet = QueryCad
    Left = 288
    Top = 88
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files\Firebird\Firebird_5_0\fbclient.dll'
    Left = 96
    Top = 96
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 192
  end
  object Connection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Connection')
    Left = 440
    Top = 88
  end
end
