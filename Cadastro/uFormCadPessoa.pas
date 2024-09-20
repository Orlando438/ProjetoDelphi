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
    procedure PrepararPesquisa;
  public
    { Public declarations }
  end;

var
  FormCadPessoa: TFormCadPessoa;

implementation

{$R *.dfm}

procedure TFormCadPessoa.ButtonPesquisarClick(Sender: TObject);
begin
  PrepararPesquisa;
  inherited;
end;

procedure TFormCadPessoa.FormCreate(Sender: TObject);
begin
  FTabela := 'PESSOA';
  FCamposTabela := 'CODIGO, NOME';
  inherited;
end;

procedure TFormCadPessoa.PrepararPesquisa;
begin
  inherited;
  adicionarfiltros('CODIGO');
  adicionarfiltros('NOME');
end;

end.
