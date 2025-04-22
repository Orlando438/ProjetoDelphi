inherited FormCadPessoa: TFormCadPessoa
  Caption = 'Cadastro de pessoas'
  ClientWidth = 628
  ExplicitWidth = 640
  TextHeight = 15
  inherited PageControl: TPageControl
    Width = 628
    ExplicitWidth = 624
    inherited TabSheetConsulta: TTabSheet
      ExplicitWidth = 620
      inherited PanelGrid: TPanel
        Width = 620
        ExplicitLeft = 0
        ExplicitTop = 52
        ExplicitWidth = 620
        ExplicitHeight = 344
        inherited DBGrid1: TDBGrid
          Width = 618
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          Columns = <
            item
              Expanded = False
              FieldName = 'CDPESSOA'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DSNOME'
              Title.Caption = 'Nome'
              Width = 200
              Visible = True
            end>
        end
      end
      inherited PanelConsulta: TPanel
        Width = 620
        ExplicitWidth = 620
        inherited ButtonPesquisar: TButton
          Width = 86
          ExplicitWidth = 86
        end
      end
    end
    inherited TabSheetCadastro: TTabSheet
      ExplicitWidth = 620
      inherited DBEditDescricao: TDBEdit
        DataField = 'DSNOME'
      end
      inherited DBEditCodigo: TDBEdit
        DataField = 'CDPESSOA'
      end
    end
  end
  inherited ControlBar1: TControlBar
    Width = 628
    ExplicitWidth = 624
  end
end
