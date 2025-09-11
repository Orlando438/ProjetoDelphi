object DMCadBase: TDMCadBase
  Height = 480
  Width = 640
  object CdsCad: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    OnNewRecord = CdsCadNewRecord
    Left = 368
    Top = 86
  end
  object DataSetProvider: TDataSetProvider
    DataSet = QueryCad
    Left = 288
    Top = 88
  end
  object CdsCadItems: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DpsCadItem'
    Left = 368
    Top = 158
  end
  object DpsCadItem: TDataSetProvider
    DataSet = QueryCadItems
    Left = 288
    Top = 160
  end
  object DsCad: TDataSource
    DataSet = CdsCad
    Left = 88
    Top = 96
  end
  object Connection: TFDConnection
    Left = 432
    Top = 352
  end
  object QueryCad: TFDQuery
    Connection = Connection
    Left = 184
    Top = 88
  end
  object QueryCadItems: TFDQuery
    Connection = Connection
    Left = 184
    Top = 168
  end
end
