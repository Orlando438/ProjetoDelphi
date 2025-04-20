unit uFormCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Datasnap.DBClient;

type
  TFormCadPessoa = class(TFormCadBase)
    procedure FormCreate(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FormCadPessoa: TFormCadPessoa;

implementation

{$R *.dfm}

procedure TFormCadPessoa.ButtonPesquisarClick(Sender: TObject);
begin
  FFiltrosSQL := '';
  adicionarfiltros('CDPESSOA');
  adicionarfiltros('DSNOME');
  FecharFiltro;
  inherited;
end;

procedure TFormCadPessoa.FormCreate(Sender: TObject);
begin
  FSQL := 'SELECT * FROM PESSOA';
  inherited;
end;

end.
