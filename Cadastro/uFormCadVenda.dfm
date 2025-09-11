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
              FieldName = 'CD_VENDA'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_VENDA'
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DS_PESSOA'
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
      object Label9: TLabel [3]
        Left = 22
        Top = 107
        Width = 53
        Height = 15
        Caption = 'Valor total'
        Enabled = False
      end
      object Label4: TLabel [4]
        Left = 17
        Top = 135
        Width = 58
        Height = 15
        Caption = 'Valor deco.'
        Enabled = False
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
        DataField = 'CD_VENDA'
      end
      object DataVenda: TDateTimePicker
        Left = 81
        Top = 74
        Width = 145
        Height = 23
        Date = 45764.000000000000000000
        Time = 0.039194849538034760
        ImeName = 'DateVenda'
        TabOrder = 2
      end
      object DBEdit1: TDBEdit
        Left = 81
        Top = 45
        Width = 145
        Height = 23
        DataField = 'DS_PESSOA'
        DataSource = DsCad
        TabOrder = 3
      end
      object Panel1: TPanel
        Left = 0
        Top = 160
        Width = 761
        Height = 333
        Align = alBottom
        TabOrder = 4
        ExplicitTop = 159
        ExplicitWidth = 757
        object Panel2: TPanel
          Left = 1
          Top = 303
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
          Height = 302
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
              FieldName = 'CD_ITEM'
              Title.Caption = 'C'#243'digo'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QT_ITEM'
              Title.Caption = 'Quantidade'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_TOTAL'
              Title.Caption = 'Valor total'
              Width = 90
              Visible = True
            end>
        end
      end
      object DBEditValorTotal: TDBEdit
        Left = 81
        Top = 103
        Width = 145
        Height = 23
        DataField = 'VL_TOTAL'
        DataSource = DsCad
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 81
        Top = 131
        Width = 145
        Height = 23
        DataField = 'VL_DESCONTO'
        DataSource = DsCad
        TabOrder = 6
      end
    end
  end
  inherited ControlBar1: TControlBar
    Top = 523
    Width = 769
    ExplicitTop = 522
    ExplicitWidth = 765
    inherited ButtonSalvar: TButton
      Left = 684
      ExplicitLeft = 684
    end
    inherited ButtonCancelar: TButton
      Left = 596
      ExplicitLeft = 596
    end
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
    object CdsItemsVALOR_TOTAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VALOR_TOTAL'
      Calculated = True
    end
  end
end
