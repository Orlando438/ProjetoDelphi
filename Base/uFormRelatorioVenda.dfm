object FormRelBase: TFormRelBase
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 138
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 138
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 447
    ExplicitHeight = 137
    object Label1: TLabel
      Left = 9
      Top = 46
      Width = 46
      Height = 15
      Caption = 'Dt Inicial'
    end
    object Label2: TLabel
      Left = 217
      Top = 46
      Width = 40
      Height = 15
      Caption = 'Dt Final'
    end
    object dtini: TDateTimePicker
      Left = 61
      Top = 43
      Width = 145
      Height = 23
      Date = 45764.000000000000000000
      Time = 0.039194849538034760
      TabOrder = 0
    end
    object dtfim: TDateTimePicker
      Left = 263
      Top = 43
      Width = 145
      Height = 23
      Date = 45764.000000000000000000
      Time = 0.039194849538034760
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 1
      Top = 103
      Width = 449
      Height = 34
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 102
      ExplicitWidth = 445
      object ButtonImprimir: TButton
        Left = 362
        Top = 1
        Width = 86
        Height = 32
        Align = alRight
        Cancel = True
        Caption = 'Imprimir'
        DisabledImageName = 'Button'
        TabOrder = 0
        OnClick = ButtonImprimirClick
        ExplicitLeft = 358
      end
    end
  end
end
