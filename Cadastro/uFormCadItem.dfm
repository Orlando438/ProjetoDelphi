inherited FormCadItem: TFormCadItem
  Caption = 'Item'
  TextHeight = 15
  inherited PageControl: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetConsulta: TTabSheet
      inherited PanelGrid: TPanel
        ExplicitWidth = 621
        ExplicitHeight = 344
        inherited DBGrid1: TDBGrid
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
      end
      inherited PanelConsulta: TPanel
        ExplicitWidth = 621
      end
    end
    inherited TabSheetCadastro: TTabSheet
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
      object DBEdit1: TDBEdit
        Left = 81
        Top = 74
        Width = 121
        Height = 23
        DataField = 'PRECO'
        DataSource = DsCad
        TabOrder = 2
      end
    end
  end
  inherited ControlBar1: TControlBar
    inherited ButtonSalvar: TButton
      Left = 456
      ExplicitLeft = 456
    end
    inherited ButtonCancelar: TButton
      Left = 368
      ExplicitLeft = 368
    end
    object ButtonSelecionar: TButton
      Left = 544
      Top = 2
      Width = 75
      Height = 22
      Caption = 'Selecionar'
      TabOrder = 5
      Visible = False
      OnClick = ButtonSelecionarClick
    end
  end
end
