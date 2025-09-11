object FormCadVendaItem: TFormCadVendaItem
  Left = 0
  Top = 0
  Caption = 'Venda de item'
  ClientHeight = 207
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 207
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 469
    ExplicitHeight = 206
    object Label1: TLabel
      Left = 86
      Top = 27
      Width = 24
      Height = 15
      Caption = 'Item'
    end
    object Label2: TLabel
      Left = 48
      Top = 56
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label3: TLabel
      Left = 40
      Top = 85
      Width = 70
      Height = 15
      Caption = 'Valor unit'#225'rio'
    end
    object Label4: TLabel
      Left = 57
      Top = 114
      Width = 53
      Height = 15
      Caption = 'Valor total'
    end
    object DBEditItem: TDBEdit
      Left = 116
      Top = 24
      Width = 45
      Height = 23
      DataField = 'CD_ITEM'
      DataSource = DataSource
      Enabled = False
      TabOrder = 2
    end
    object DBEditQuantidade: TDBEdit
      Left = 116
      Top = 53
      Width = 121
      Height = 23
      DataField = 'QT_ITEM'
      DataSource = DataSource
      TabOrder = 1
      OnExit = DBEditQuantidadeExit
    end
    object EditDescricao: TEdit
      Left = 167
      Top = 24
      Width = 162
      Height = 23
      TabOrder = 0
      OnKeyPress = EditDescricaoKeyPress
    end
    object Panel2: TPanel
      Left = 1
      Top = 173
      Width = 471
      Height = 33
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 172
      ExplicitWidth = 467
      object ButtonCancelar: TButton
        Left = 395
        Top = 1
        Width = 75
        Height = 31
        Align = alRight
        Cancel = True
        Caption = 'Confirmar'
        TabOrder = 0
        OnClick = ButtonCancelarClick
        ExplicitLeft = 391
      end
    end
    object DbEditValorTot: TDBEdit
      Left = 116
      Top = 111
      Width = 121
      Height = 23
      DataField = 'VL_TOTAL'
      DataSource = DataSource
      TabOrder = 4
    end
    object DBEditValorUni: TDBEdit
      Left = 116
      Top = 82
      Width = 121
      Height = 23
      DataField = 'VL_UNITARIO'
      DataSource = DataSource
      TabOrder = 5
    end
  end
  object DataSource: TDataSource
    Left = 400
    Top = 64
  end
end
