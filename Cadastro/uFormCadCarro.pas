unit uFormCadCarro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFormCadCarro = class(TFormCadBase)
    DBEdit1: TDBEdit;
    Label3: TLabel;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  FormCadCarro: TFormCadCarro;

implementation

{$R *.dfm}

procedure TFormCadCarro.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
end;

procedure TFormCadCarro.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('CDCARRO');
  adicionarfiltros('DSCARRO');
  adicionarfiltros('ANOLANCAMENTO');
  FecharFiltro;
end;

procedure TFormCadCarro.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
   pesquisar;

  inherited;
end;

procedure TFormCadCarro.FormCreate(Sender: TObject);
begin
  FSQL := 'SELECT * FROM CARRO';
  inherited;
end;

end.
