unit uFormCadItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, uproduto;

type
  TFormCadItem = class(TFormCadBase)
    Label3: TLabel;
    PanelSelecionar: TPanel;
    ButtonSelecionar: TButton;
    EditPreco: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TabSheetCadastroShow(Sender: TObject);
    procedure EditPrecoExit(Sender: TObject);
  private
    FItemSelecionado: Variant;
    FEmSelecao: Boolean;
    procedure Pesquisar;
    procedure SetVisualParaSelecao;
    procedure SetItemSelecionado;
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
  PanelSelecionar.Visible := True;
  FEmSelecao := True;
end;

procedure TFormCadItem.TabSheetCadastroShow(Sender: TObject);
var
  AValor: Double;
begin
  inherited;
  AValor := Dscad.DataSet.FieldByName('PRECO').AsFloat;
  EditPreco.Text := FormatFloat('#,##0.00', AValor);;
end;

procedure TFormCadItem.ButtonNovoClick(Sender: TObject);
begin
  FDMCadbase.FGeradorNovoCod := 'GEN_PRODUTO_ID';
  FDMCadbase.Fconnection := FconnectionCad;
  inherited;
  EditPreco.Text := '0';
end;

procedure TFormCadItem.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
end;

procedure TFormCadItem.ButtonSelecionarClick(Sender: TObject);
begin
  inherited;
  SetItemSelecionado;
end;

procedure TFormCadItem.DBGrid1DblClick(Sender: TObject);
begin
  if FEmSelecao then
  begin
    SetItemSelecionado;
    Exit;
  end;

  inherited;
end;

procedure TFormCadItem.SetItemSelecionado;
begin
  if not(FDMCadBase.CdsCad.IsEmpty) then
    FItemSelecionado := FDMCadBase.CdsCad.FieldByName('ID').Value;

  ModalResult := mrOk;
end;

procedure TFormCadItem.EditPrecoExit(Sender: TObject);
var
  AValor: Double;
begin
  inherited;
  if DsCad.DataSet.IsEmpty then
    Exit;

  AValor := StrToFloat(EditPreco.Text);
  EditPreco.Text := FormatFloat('#,##0.00', AValor);;

  DsCad.DataSet.Edit;
  DsCad.DataSet.FieldByName('PRECO').AsFloat := AValor;
end;


procedure TFormCadItem.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Pesquisar;

  inherited;
end;

procedure TFormCadItem.FormCreate(Sender: TObject);
begin
  FEmSelecao := False;
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
