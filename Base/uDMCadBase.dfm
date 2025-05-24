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
    Connection = Connection
    Left = 200
    Top = 87
  end
  object DataSetProvider: TDataSetProvider
    DataSet = QueryCad
    Left = 288
    Top = 88
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=Empresa'
      'DriverID=PG'
      'User_Name=postgres'
      'Password=1')
    Left = 440
    Top = 85
  end
end
