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
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
  public
    procedure Pesquisar;
  end;

var
  FormCadPessoa: TFormCadPessoa;

implementation

{$R *.dfm}

procedure TFormCadPessoa.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
end;

procedure TFormCadPessoa.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('CDPESSOA');
  adicionarfiltros('DSNOME');
  FecharFiltro;
end;

procedure TFormCadPessoa.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
   pesquisar;

  inherited;
end;

procedure TFormCadPessoa.FormCreate(Sender: TObject);
begin
  FSQL := 'SELECT * FROM PESSOA';
  inherited;
end;

end.
