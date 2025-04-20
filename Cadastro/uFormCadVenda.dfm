inherited FormCadVenda: TFormCadVenda
  Caption = 'Vendas'
  ClientWidth = 628
  OnShow = FormShow
  ExplicitWidth = 640
  TextHeight = 15
  inherited PageControl: TPageControl
    Width = 628
    ActivePage = TabSheetCadastro
    ExplicitWidth = 624
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 620
      inherited ButtonPesquisar: TButton
        Top = 15
        ExplicitTop = 15
      end
      inherited DBGrid1: TDBGrid
        Width = 620
        Columns = <
          item
            Expanded = False
            FieldName = 'CDVENDA'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DHVENDA'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DSNOME'
            Title.Caption = 'Cliente'
            Width = 120
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitWidth = 620
      inherited Label1: TLabel
        Left = 51
        Top = 76
        Width = 24
        Caption = 'Data'
        ExplicitLeft = 51
        ExplicitTop = 76
        ExplicitWidth = 24
      end
      object Label3: TLabel [2]
        Left = 38
        Top = 49
        Width = 37
        Height = 15
        Caption = 'Cliente'
      end
      object Label4: TLabel [3]
        Left = 37
        Top = 105
        Width = 38
        Height = 15
        Caption = 'Ve'#237'culo'
      end
      inherited DBEditDescricao: TDBEdit
        Left = 361
        Top = 16
        DataSource = nil
        Visible = False
        ExplicitLeft = 361
        ExplicitTop = 16
      end
      inherited DBEditCodigo: TDBEdit
        DataField = 'CDVENDA'
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 81
        Top = 45
        Width = 145
        Height = 23
        KeyField = 'CDPESSOA'
        ListField = 'DSNOME'
        ListSource = DataSourcePessoa
        TabOrder = 2
      end
      object DateTimePicker2: TDateTimePicker
        Left = 81
        Top = 74
        Width = 145
        Height = 23
        Date = 45764.000000000000000000
        Time = 0.039194849538034760
        TabOrder = 3
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 81
        Top = 103
        Width = 145
        Height = 23
        KeyField = 'CDCARRO'
        ListField = 'DSCARRO'
        ListSource = DataSourceCarro
        TabOrder = 4
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 628
    ExplicitWidth = 624
  end
  inherited DsCad: TDataSource
    Left = 452
    Top = 286
  end
  object QueryPessoa: TFDQuery
    Left = 548
    Top = 138
  end
  object DataSourcePessoa: TDataSource
    DataSet = QueryPessoa
    Left = 452
    Top = 138
  end
  object QueryCarro: TFDQuery
    Left = 548
    Top = 218
  end
  object DataSourceCarro: TDataSource
    DataSet = QueryCarro
    Left = 452
    Top = 218
  end
end
