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
  object EditDriverID: TEdit
    Left = 94
    Top = 32
    Width = 179
    Height = 23
    TabOrder = 0
    Text = 'PG'
  end
  object EditServer: TEdit
    Left = 94
    Top = 61
    Width = 179
    Height = 23
    ImeName = 'EditServer'
    TabOrder = 1
    Text = 'localhost'
  end
  object EditDataBase: TEdit
    Left = 94
    Top = 90
    Width = 179
    Height = 23
    TabOrder = 2
    Text = 'Empresa'
  end
  object EditUsuario: TEdit
    Left = 94
    Top = 119
    Width = 179
    Height = 23
    TabOrder = 3
    Text = 'postgres'
  end
  object EditSenha: TEdit
    Left = 94
    Top = 148
    Width = 179
    Height = 23
    TabOrder = 4
    Text = '1'
  end
  object EditPorta: TEdit
    Left = 94
    Top = 177
    Width = 179
    Height = 23
    TabOrder = 5
    Text = '5432'
  end
  object ButtonSalvarBD: TButton
    Left = 198
    Top = 206
    Width = 75
    Height = 25
    Caption = 'Salvar'
    DisabledImageName = 'ButtonSalvar'
    TabOrder = 6
    OnClick = ButtonSalvarBDClick
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
      object Cadastrodepessoas1: TMenuItem
        Caption = 'Cadastro de pessoas'
        OnClick = Cadastrodepessoas1Click
      end
      object Cadastrodeveculo1: TMenuItem
        Caption = 'Cadastro de ve'#237'culo'
        OnClick = Cadastrodeveculo1Click
      end
    end
    object Processos1: TMenuItem
      Caption = 'Processos'
      object Vendas1: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas1Click
      end
    end
  end
  object Connection: TFDConnection
    Left = 544
    Top = 184
  end
end
