unit uFormCadItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uproduto;

type
  TFormCadItem = class(TFormCadBase)
    DBEdit1: TDBEdit;
    Label3: TLabel;
    ButtonSelecionar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
  private
    FItemSelecionado: Variant;
    procedure Pesquisar;
    procedure SetVisualParaSelecao;
  public
    function SelecionarItem(const Filtro: string): TItemVenda;
  end;

var
  FormCadItem: TFormCadItem;

implementation

{$R *.dfm}


function TFormCadItem.SelecionarItem(const Filtro: string): TItemVenda;
var
  Produto: TItemVenda;
begin
  EditPesquisa.Text := Filtro;
  Pesquisar;
  SetVisualParaSelecao;

  if ShowModal = mrOk then
  begin
    Produto := TItemVenda.Create;
    Produto.IDProduto := FDMCadBase.CdsCad.FieldByName('ID').AsInteger;
    Produto.PrecoUnitario := FDMCadBase.CdsCad.FieldByName('PRECO').AsCurrency;
    Result := Produto;
  end
  else
    Result := nil;
end;
procedure TFormCadItem.SetVisualParaSelecao;
begin
  ButtonSalvar.Visible := False;
  ButtonCancelar.Visible := False;
  ButtonExcluir.Visible := False;
  ButtonAlterar.Visible := False;
  ButtonNovo.Visible := False;

  ButtonSelecionar.Visible := True;
end;

procedure TFormCadItem.ButtonNovoClick(Sender: TObject);
begin
  FDMCadbase.FGeradorNovoCod := 'GEN_PRODUTO_ID';
  FDMCadbase.Fconnection := FconnectionCad;
  inherited;
end;

procedure TFormCadItem.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
end;

procedure TFormCadItem.ButtonSelecionarClick(Sender: TObject);
begin
  inherited;
  if not(FDMCadBase.CdsCad.IsEmpty) then
    FItemSelecionado := FDMCadBase.CdsCad.FieldByName('ID').Value;

  ModalResult := mrOk;
end;

procedure TFormCadItem.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Pesquisar;

  inherited;
end;

procedure TFormCadItem.FormCreate(Sender: TObject);
begin
  FGeradorNovoCod := 'GEN_PRODUTO_ID';
  FSQL := 'SELECT *  ' +
          '   FROM PRODUTO ';
  inherited;
end;

procedure TFormCadItem.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('PRODUTO.ID');
  adicionarfiltros('PRODUTO.NOME');
  adicionarfiltros('PRODUTO.PRECO');
  FecharFiltro;
end;

end.
