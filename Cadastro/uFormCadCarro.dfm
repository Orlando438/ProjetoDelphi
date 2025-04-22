inherited FormCadCarro: TFormCadCarro
  Caption = 'Cadastro de carro'
  ClientWidth = 628
  ExplicitWidth = 640
  TextHeight = 15
  inherited PageControl: TPageControl
    Width = 628
    ExplicitWidth = 624
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 620
      inherited DBGrid1: TDBGrid
        Width = 620
        Columns = <
          item
            Expanded = False
            FieldName = 'CDCARRO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DSCARRO'
            Title.Caption = 'Modelo'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANOLANCAMENTO'
            Title.Caption = 'Ano lan'#231'amento'
            Width = 100
            Visible = True
          end>
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitWidth = 620
      object Label3: TLabel [2]
        Left = 53
        Top = 77
        Width = 22
        Height = 15
        Caption = 'Ano'
      end
      inherited DBEditDescricao: TDBEdit
        DataField = 'DSCARRO'
      end
      inherited DBEditCodigo: TDBEdit
        DataField = 'CDCARRO'
      end
      object DBEdit1: TDBEdit
        Left = 81
        Top = 74
        Width = 72
        Height = 23
        DataField = 'ANOLANCAMENTO'
        DataSource = DsCad
        ImeName = 'DBEditAnoLancamento'
        TabOrder = 2
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 628
    ExplicitWidth = 624
  end
end
