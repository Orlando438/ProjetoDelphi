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
    DBEditPreco: TDBEdit;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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
  TFloatField(FDMCadBase.CdsCad.FieldByName('VL_VENDA')).DisplayFormat := '#,##0.00';
  SetVisualParaSelecao;

  if ShowModal = mrOk then
  begin
    Produto := TItemVenda.Create;
    Produto.IDProduto := FDMCadBase.CdsCad.FieldByName('CD_ITEM').AsInteger;
    Produto.PrecoUnitario := FDMCadBase.CdsCad.FieldByName('VL_VENDA').AsFloat;
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

procedure TFormCadItem.ButtonNovoClick(Sender: TObject);
begin
  FDMCadbase.Fconnection := FconnectionCad;
  FDMCadbase.FCampoCodigo := 'CD_ITEM';
  FGeradorNovoCod := 'item_seq';
  inherited;
end;

procedure TFormCadItem.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
  TFloatField(FDMCadBase.CdsCad.FieldByName('VL_VENDA')).DisplayFormat := '#,##0.00';
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
    FItemSelecionado := FDMCadBase.CdsCad.FieldByName('CD_ITEM').Value;

  ModalResult := mrOk;
end;

procedure TFormCadItem.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Pesquisar;

  inherited;
  TFloatField(FDMCadBase.CdsCad.FieldByName('VL_VENDA')).DisplayFormat := '#,##0.00';
end;

procedure TFormCadItem.FormCreate(Sender: TObject);
begin
  FEmSelecao := False;
  FSQL := 'SELECT *  ' +
          '   FROM ITEM ';
  inherited;

  TFloatField(FDMCadBase.CdsCad.FieldByName('VL_VENDA')).DisplayFormat := '#,##0.00';
end;

procedure TFormCadItem.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('ITEM.CD_ITEM');
  adicionarfiltros('ITEM.DS_ITEM');
  FecharFiltro;
end;

end.
