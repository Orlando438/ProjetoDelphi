object FormCadBase: TFormCadBase
  Left = 0
  Top = 0
  Caption = 'FormCadBase'
  ClientHeight = 460
  ClientWidth = 629
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
    Width = 629
    Height = 426
    ActivePage = TabSheetConsulta
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 625
    ExplicitHeight = 425
    object TabSheetConsulta: TTabSheet
      Caption = 'Consulta'
      ImageName = 'TabSheetConsulta'
      OnShow = TabSheetConsultaShow
      object PanelGrid: TPanel
        Left = 0
        Top = 52
        Width = 621
        Height = 344
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 176
        ExplicitTop = 128
        ExplicitWidth = 185
        ExplicitHeight = 41
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 619
          Height = 342
          Align = alClient
          DataSource = DsCad
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
        end
      end
      object PanelConsulta: TPanel
        Left = 0
        Top = 0
        Width = 621
        Height = 52
        Align = alTop
        TabOrder = 1
        object ButtonPesquisar: TButton
          Left = 515
          Top = 14
          Width = 91
          Height = 23
          Cancel = True
          Caption = 'Pesquisar'
          DisabledImageName = 'ButtonPesquisar'
          TabOrder = 0
          OnClick = ButtonPesquisarClick
        end
        object EditPesquisa: TEdit
          Left = 9
          Top = 14
          Width = 500
          Height = 23
          ImeName = 'EditPesquisa'
          TabOrder = 1
          OnKeyPress = EditPesquisaKeyPress
        end
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
    Top = 426
    Width = 629
    Height = 34
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 425
    ExplicitWidth = 625
    object ButtonSalvar: TButton
      Left = 533
      Top = 2
      Width = 75
      Height = 22
      Cancel = True
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = ButtonSalvarClick
    end
    object ButtonCancelar: TButton
      Left = 445
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
