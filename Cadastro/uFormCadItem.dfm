inherited FormCadItem: TFormCadItem
  Caption = 'Item'
  ClientWidth = 625
  ExplicitWidth = 637
  TextHeight = 15
  inherited PageControl: TPageControl
    Width = 625
    ActivePage = TabSheetCadastro
    ExplicitWidth = 621
    ExplicitHeight = 424
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 617
      inherited PanelGrid: TPanel
        Width = 617
        inherited DBGrid1: TDBGrid
          Width = 615
          Height = 313
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO'
              Title.Caption = 'Pre'#231'o'
              Width = 90
              Visible = True
            end>
        end
        object PanelSelecionar: TPanel
          Left = 1
          Top = 314
          Width = 615
          Height = 29
          Align = alBottom
          TabOrder = 1
          Visible = False
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
            ExplicitLeft = 490
            ExplicitTop = 8
          end
        end
      end
      inherited PanelConsulta: TPanel
        Width = 617
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitWidth = 617
      object Label3: TLabel [2]
        Left = 45
        Top = 77
        Width = 30
        Height = 15
        Caption = 'Pre'#231'o'
      end
      inherited DBEditDescricao: TDBEdit
        DataField = 'NOME'
      end
      inherited DBEditCodigo: TDBEdit
        DataField = 'ID'
      end
      object EditPreco: TEdit
        Left = 81
        Top = 74
        Width = 121
        Height = 23
        TabOrder = 2
        StyleName = 'Windows'
        OnExit = EditPrecoExit
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 625
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
