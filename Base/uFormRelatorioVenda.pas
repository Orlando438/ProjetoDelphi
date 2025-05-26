unit uFormRelatorioVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Data.SqlExpr, uFormRel;

type
  TFormRelatorioVenda = class(TForm)
    Panel1: TPanel;
    dtini: TDateTimePicker;
    Label1: TLabel;
    dtfim: TDateTimePicker;
    Label2: TLabel;
    Panel2: TPanel;
    ButtonImprimir: TButton;
    procedure ButtonImprimirClick(Sender: TObject);
  private
    Fconnection: TSQLConnection;
    FormRel: TFormRel;
  public
    constructor Create(AOwner: TComponent; AConnection: TCustomConnection);
  end;

var
  FormRelatorioVenda: TFormRelatorioVenda;

implementation

{$R *.dfm}

procedure TFormRelatorioVenda.ButtonImprimirClick(Sender: TObject);
begin
  FormRel := TFormRel.Create(Self, Fconnection);
  try
    FormRel.CarregarRelatorio(dtini.Date, dtfim.Date);
  finally
    FormRel.Free;
  end;
end;

constructor TFormRelatorioVenda.Create(AOwner: TComponent; AConnection: TCustomConnection);
begin
  inherited Create(AOwner);
  Fconnection := TSQLConnection(AConnection);
end;

end.
