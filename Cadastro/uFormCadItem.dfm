inherited FormCadItem: TFormCadItem
  Caption = 'Item'
  ExplicitWidth = 637
  ExplicitHeight = 497
  TextHeight = 15
  inherited PageControl: TPageControl
    ExplicitWidth = 621
    ExplicitHeight = 424
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 617
      ExplicitHeight = 395
      inherited PanelGrid: TPanel
        Width = 617
        Height = 343
        ExplicitWidth = 613
        ExplicitHeight = 342
        inherited DBGrid1: TDBGrid
          Width = 615
          Height = 312
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
              FieldName = 'DS_ITEM'
              Title.Caption = 'Nome'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_VENDA'
              Title.Caption = 'Pre'#231'o'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QT_ESTOQUE'
              Title.Caption = 'Estoque'
              Visible = True
            end>
        end
        object PanelSelecionar: TPanel
          Left = 1
          Top = 313
          Width = 615
          Height = 29
          Align = alBottom
          TabOrder = 1
          Visible = False
          ExplicitTop = 312
          ExplicitWidth = 611
          object ButtonSelecionar: TButton
            Left = 539
            Top = 1
            Width = 75
            Height = 27
            Align = alRight
            Caption = 'Selecionar'
            TabOrder = 0
            Visible = False
            OnClick = ButtonSelecionarClick
            ExplicitLeft = 535
          end
        end
      end
      inherited PanelConsulta: TPanel
        Width = 617
        ExplicitWidth = 613
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitWidth = 617
      ExplicitHeight = 395
      object Label3: TLabel [2]
        Left = 14
        Top = 77
        Width = 61
        Height = 15
        Caption = 'Valor venda'
      end
      object Label4: TLabel [3]
        Left = 33
        Top = 103
        Width = 42
        Height = 15
        Caption = 'Estoque'
      end
      inherited DBEditDescricao: TDBEdit
        DataField = 'DS_ITEM'
      end
      inherited DBEditCodigo: TDBEdit
        DataField = 'CD_ITEM'
      end
      object DBEditPreco: TDBEdit
        Left = 81
        Top = 74
        Width = 121
        Height = 23
        DataField = 'VL_VENDA'
        DataSource = DsCad
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 81
        Top = 103
        Width = 121
        Height = 23
        DataField = 'QT_ESTOQUE'
        DataSource = DsCad
        TabOrder = 3
      end
    end
  end
  inherited ControlBar1: TControlBar
    ExplicitTop = 424
    ExplicitWidth = 621
    inherited ButtonSalvar: TButton
      Left = 540
      ExplicitLeft = 540
    end
    inherited ButtonCancelar: TButton
      Left = 452
      ExplicitLeft = 452
    end
  end
end
