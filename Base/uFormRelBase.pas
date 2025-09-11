unit uFormRelBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Data.SqlExpr;

type
  TFormRelBase = class(TForm)
    Panel1: TPanel;
    dtini: TDateTimePicker;
    Label1: TLabel;
    dtfim: TDateTimePicker;
    Label2: TLabel;
    Panel2: TPanel;
    ButtonImprimir: TButton;
    procedure ButtonImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fconnection: TSQLConnection;
    //FormRel: TFormRel;
  public
    constructor Create(AOwner: TComponent; AConnection: TCustomConnection);
  end;

var
  FormRelBase: TFormRelBase;

implementation

{$R *.dfm}

procedure TFormRelBase.ButtonImprimirClick(Sender: TObject);
begin
//  FormRel := TFormRel.Create(Self, Fconnection);
//  try
//    FormRel.CarregarRelatorio(dtini.Date, dtfim.Date);
//  finally
//    FormRel.Free;
//  end;
end;

constructor TFormRelBase.Create(AOwner: TComponent; AConnection: TCustomConnection);
begin
  inherited Create(AOwner);
  Fconnection := TSQLConnection(AConnection);
end;

procedure TFormRelBase.FormCreate(Sender: TObject);
begin
  dtini.Date := Now;
  dtfim.Date := Now;
end;

end.
