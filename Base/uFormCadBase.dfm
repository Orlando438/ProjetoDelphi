object FormCadBase: TFormCadBase
  Left = 0
  Top = 0
  Caption = 'FormCadBase'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 628
    Height = 408
    ActivePage = TabSheetConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 407
    object TabSheetConsulta: TTabSheet
      Caption = 'Consulta'
      ImageName = 'TabSheetConsulta'
      OnShow = TabSheetConsultaShow
      object EditPesquisa: TEdit
        Left = 0
        Top = 16
        Width = 520
        Height = 23
        ImeName = 'EditPesquisa'
        TabOrder = 0
      end
      object ButtonPesquisar: TButton
        Left = 526
        Top = 14
        Width = 91
        Height = 25
        Cancel = True
        Caption = 'Pesquisar'
        DisabledImageName = 'ButtonPesquisar'
        TabOrder = 1
        OnClick = ButtonPesquisarClick
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 48
        Width = 620
        Height = 330
        Align = alBottom
        DataSource = DsCad
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object TabSheetCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      ImageName = 'TabSheetCadastro'
      OnShow = TabSheetCadastroShow
      object Label1: TLabel
        Left = 24
        Top = 48
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
      end
      object Label2: TLabel
        Left = 36
        Top = 19
        Width = 39
        Height = 15
        Caption = 'Codigo'
        Enabled = False
      end
      object DBEditDescricao: TDBEdit
        Left = 81
        Top = 45
        Width = 225
        Height = 23
        DataSource = DsCad
        TabOrder = 0
      end
      object DBEditCodigo: TDBEdit
        Left = 81
        Top = 16
        Width = 72
        Height = 23
        DataSource = DsCad
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 408
    Width = 628
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 407
    ExplicitWidth = 624
    object ButtonSalvar: TButton
      Left = 539
      Top = 2
      Width = 75
      Height = 22
      Cancel = True
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = ButtonSalvarClick
    end
    object ButtonCancelar: TButton
      Left = 451
      Top = 2
      Width = 75
      Height = 22
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = ButtonCancelarClick
    end
    object ButtonExcluir: TButton
      Left = 209
      Top = 2
      Width = 86
      Height = 22
      Align = alLeft
      Cancel = True
      Caption = 'Excluir'
      DisabledImageName = 'Button'
      TabOrder = 2
      OnClick = ButtonExcluirClick
    end
    object ButtonAlterar: TButton
      Left = 110
      Top = 2
      Width = 86
      Height = 22
      Align = alLeft
      Caption = 'Alterar'
      DisabledImageName = 'ButtonAlterar'
      TabOrder = 3
      OnClick = ButtonAlterarClick
    end
    object ButtonNovo: TButton
      Left = 11
      Top = 2
      Width = 86
      Height = 22
      Align = alLeft
      Caption = 'Novo'
      DisabledImageName = 'ButtonNovo'
      TabOrder = 4
      OnClick = ButtonNovoClick
    end
  end
  object DsCad: TDataSource
    Left = 436
    Top = 62
  end
end
