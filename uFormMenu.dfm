object FormMenu: TFormMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  TextHeight = 15
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 442
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 441
    object GroupBoxMenu: TGroupBox
      Left = 15
      Top = 13
      Width = 298
      Height = 268
      Caption = 'Dados de conex'#227'o'
      TabOrder = 0
      object Label1: TLabel
        Left = 46
        Top = 35
        Width = 42
        Height = 15
        Caption = 'DriverID'
      end
      object Label2: TLabel
        Left = 56
        Top = 64
        Width = 32
        Height = 15
        Caption = 'Server'
      end
      object Label3: TLabel
        Left = 40
        Top = 93
        Width = 48
        Height = 15
        Caption = 'Database'
      end
      object Label4: TLabel
        Left = 48
        Top = 122
        Width = 40
        Height = 15
        Caption = 'Usu'#225'rio'
      end
      object Label5: TLabel
        Left = 56
        Top = 151
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      object Label6: TLabel
        Left = 60
        Top = 180
        Width = 28
        Height = 15
        Caption = 'Porta'
      end
      object ButtonSalvarBD: TButton
        Left = 198
        Top = 206
        Width = 75
        Height = 25
        Caption = 'Salvar'
        DisabledImageName = 'ButtonSalvar'
        TabOrder = 0
        OnClick = ButtonSalvarBDClick
      end
      object EditDataBase: TEdit
        Left = 94
        Top = 90
        Width = 179
        Height = 23
        TabOrder = 1
        Text = 'C:\Users\Orlando\Desktop\empresa.fdb'
      end
      object EditDriverID: TEdit
        Left = 94
        Top = 32
        Width = 179
        Height = 23
        TabOrder = 2
        Text = 'Firebird'
      end
      object EditPorta: TEdit
        Left = 94
        Top = 177
        Width = 179
        Height = 23
        TabOrder = 3
        Text = '3050'
      end
      object EditSenha: TEdit
        Left = 94
        Top = 148
        Width = 179
        Height = 23
        TabOrder = 4
        Text = 'masterkey'
      end
      object EditServer: TEdit
        Left = 94
        Top = 61
        Width = 179
        Height = 23
        ImeName = 'EditServer'
        TabOrder = 5
        Text = 'localhost'
      end
      object EditUsuario: TEdit
        Left = 94
        Top = 119
        Width = 179
        Height = 23
        TabOrder = 6
        Text = 'SYSDBA'
      end
    end
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
  object Connection: TSQLConnection
    Left = 560
    Top = 192
  end
end
