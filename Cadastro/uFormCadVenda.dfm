inherited FormCadVenda: TFormCadVenda
  Caption = 'Vendas'
  ClientHeight = 557
  ClientWidth = 769
  ExplicitWidth = 781
  ExplicitHeight = 595
  TextHeight = 15
  inherited PageControl: TPageControl
    Width = 769
    Height = 523
    ActivePage = TabSheetCadastro
    ExplicitWidth = 765
    ExplicitHeight = 522
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 761
      ExplicitHeight = 493
      inherited PanelGrid: TPanel
        Width = 761
        Height = 441
        ExplicitWidth = 761
        ExplicitHeight = 441
        inherited DBGrid1: TDBGrid
          Width = 759
          Height = 439
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_VENDA'
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Title.Caption = 'Cliente'
              Width = 120
              Visible = True
            end>
        end
      end
      inherited PanelConsulta: TPanel
        Width = 761
        ExplicitWidth = 761
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitWidth = 761
      ExplicitHeight = 493
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
        Left = 54
        Top = 106
        Width = 21
        Height = 15
        Caption = 'CEP'
      end
      object Label9: TLabel [4]
        Left = 22
        Top = 290
        Width = 53
        Height = 15
        Caption = 'Valor total'
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
        DataField = 'ID'
      end
      object DateTimePicker2: TDateTimePicker
        Left = 81
        Top = 74
        Width = 145
        Height = 23
        Date = 45764.000000000000000000
        Time = 0.039194849538034760
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 81
        Top = 45
        Width = 145
        Height = 23
        DataField = 'NOME_CLIENTE'
        DataSource = DsCad
        TabOrder = 3
      end
      object DBEditCEP: TDBEdit
        Left = 81
        Top = 103
        Width = 145
        Height = 23
        DataField = 'CEP'
        DataSource = DsCad
        TabOrder = 4
      end
      object Endereço: TGroupBox
        Left = 81
        Top = 132
        Width = 237
        Height = 149
        Caption = 'Endere'#231'o'
        TabOrder = 5
        object Label5: TLabel
          Left = 26
          Top = 26
          Width = 20
          Height = 15
          Caption = 'Rua'
        end
        object Label6: TLabel
          Left = 15
          Top = 55
          Width = 31
          Height = 15
          Alignment = taRightJustify
          Caption = 'Bairro'
        end
        object Label7: TLabel
          Left = 9
          Top = 84
          Width = 37
          Height = 15
          Alignment = taRightJustify
          Caption = 'Cidade'
        end
        object Label8: TLabel
          Left = 11
          Top = 113
          Width = 35
          Height = 15
          Alignment = taRightJustify
          Caption = 'Estado'
        end
        object DBEditRua: TDBEdit
          Left = 52
          Top = 23
          Width = 145
          Height = 23
          DataField = 'RUA'
          DataSource = DsCad
          TabOrder = 0
        end
        object DBEditBairro: TDBEdit
          Left = 52
          Top = 52
          Width = 145
          Height = 23
          DataField = 'BAIRRO'
          DataSource = DsCad
          TabOrder = 1
        end
        object DBEditCidade: TDBEdit
          Left = 52
          Top = 81
          Width = 145
          Height = 23
          DataField = 'CIDADE'
          DataSource = DsCad
          TabOrder = 2
        end
        object DBEditEstado: TDBEdit
          Left = 52
          Top = 110
          Width = 145
          Height = 23
          DataField = 'ESTADO'
          DataSource = DsCad
          TabOrder = 3
          StyleName = 'Windows'
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 320
        Width = 761
        Height = 173
        Align = alBottom
        TabOrder = 6
        ExplicitTop = 319
        ExplicitWidth = 757
        object Panel2: TPanel
          Left = 1
          Top = 143
          Width = 759
          Height = 29
          Align = alBottom
          TabOrder = 0
          ExplicitWidth = 755
          object ButtonInserir: TButton
            Left = 1
            Top = 1
            Width = 86
            Height = 27
            Align = alLeft
            Caption = 'Inserir'
            DisabledImageName = 'ButtonInserir'
            TabOrder = 0
            OnClick = ButtonInserirClick
          end
          object ButtonAlterarItem: TButton
            Left = 87
            Top = 1
            Width = 86
            Height = 27
            Align = alLeft
            Caption = 'Alterar'
            DisabledImageName = 'ButtonAlterar'
            TabOrder = 1
            OnClick = ButtonAlterarItemClick
            ExplicitLeft = 93
          end
          object ButtonExcluirItem: TButton
            Left = 173
            Top = 1
            Width = 86
            Height = 27
            Align = alLeft
            Cancel = True
            Caption = 'Excluir'
            DisabledImageName = 'Button'
            TabOrder = 2
            OnClick = ButtonExcluirItemClick
          end
        end
        object DBGrid2: TDBGrid
          Left = 1
          Top = 1
          Width = 759
          Height = 142
          Align = alClient
          DataSource = DsItems
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PRODUTO_ID'
              Title.Caption = 'cod. Item'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Caption = 'Quantidade'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valor total'
              Width = 90
              Visible = True
            end>
        end
      end
      object Button4: TButton
        Left = 232
        Top = 104
        Width = 86
        Height = 22
        Align = alCustom
        Cancel = True
        Caption = 'Buscar'
        DisabledImageName = 'Button'
        TabOrder = 7
        OnClick = Button4Click
      end
      object DBEditValorTotal: TDBEdit
        Left = 81
        Top = 287
        Width = 145
        Height = 23
        DataField = 'VALOR_TOTAL'
        DataSource = DsCad
        TabOrder = 8
      end
    end
  end
  inherited ControlBar1: TControlBar
    Top = 523
    Width = 769
    ExplicitTop = 522
    ExplicitWidth = 765
  end
  inherited DsCad: TDataSource
    Left = 532
    Top = 294
  end
  object QueryPessoa: TFDQuery
    Left = 548
    Top = 138
  end
  object DataSourcePessoa: TDataSource
    DataSet = QueryPessoa
    Left = 452
    Top = 122
  end
  object ACBrCEP: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    PesquisarIBGE = True
    Left = 612
    Top = 210
  end
  object DsItems: TDataSource
    Left = 620
    Top = 282
  end
  object CdsItems: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 620
    Top = 353
  end
end
