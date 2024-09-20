inherited FormCadPessoa: TFormCadPessoa
  Caption = 'Cadastro de pessoas'
  TextHeight = 15
  inherited PageControl: TPageControl
    inherited TabSheetConsulta: TTabSheet
      inherited ButtonPesquisar: TButton
        Width = 86
        ExplicitWidth = 86
      end
      inherited DBGrid1: TDBGrid
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      end
    end
    inherited TabSheetCadastro: TTabSheet
      inherited DBEditDescricao: TDBEdit
        DataField = 'Nome'
      end
      inherited DBEditCodigo: TDBEdit
        DataField = 'Codigo'
      end
    end
  end
end
