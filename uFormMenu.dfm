object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'khg'
  ClientHeight = 542
  ClientWidth = 1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  OnCreate = FormCreate
  TextHeight = 15
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 1078
    Height = 542
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1074
    ExplicitHeight = 541
  end
  object PopupMenu: TPopupMenu
    Left = 544
    Top = 32
    object Cadastrarpessoa1: TMenuItem
      Caption = 'Cadastrar pessoa'
    end
  end
  object MainMenu: TMainMenu
    Left = 544
    Top = 104
    object Cadastrodeitem1: TMenuItem
      Caption = 'Cadastros'
      object Item1: TMenuItem
        Caption = 'Item'
        OnClick = Item1Click
      end
    end
    object Processos1: TMenuItem
      Caption = 'Processos'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Venda1: TMenuItem
        Caption = 'Venda'
        OnClick = Venda1Click
      end
    end
  end
  object Connection: TFDConnection
    Left = 472
    Top = 216
  end
end
