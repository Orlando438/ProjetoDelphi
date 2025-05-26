unit uFormCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, ACBrBase, ACBrSocket, ACBrCEP, Datasnap.DBClient;

type
  TFormCadVenda = class(TFormCadBase)
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    QueryPessoa: TFDQuery;
    DataSourcePessoa: TDataSource;
    DBEdit1: TDBEdit;
    DBEditCEP: TDBEdit;
    Label4: TLabel;
    Endereço: TGroupBox;
    DBEditRua: TDBEdit;
    Label5: TLabel;
    DBEditBairro: TDBEdit;
    Label6: TLabel;
    DBEditCidade: TDBEdit;
    Label7: TLabel;
    DBEditEstado: TDBEdit;
    Label8: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    ButtonInserir: TButton;
    ButtonAlterarItem: TButton;
    ButtonExcluirItem: TButton;
    Button4: TButton;
    ACBrCEP: TACBrCEP;
    DsItems: TDataSource;
    CdsItems: TClientDataSet;
    DBEditValorTotal: TDBEdit;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure TabSheetCadastroShow(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure ButtonExcluirItemClick(Sender: TObject);
    procedure ButtonAlterarItemClick(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
  private
    procedure Pesquisar;
    procedure CalcularValorTotal;
  public
    { Public declarations }
  end;

var
  FormCadVenda: TFormCadVenda;

implementation

{$R *.dfm}

uses uFormCadVendaItem;

procedure TFormCadVenda.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('VENDA.ID');
  adicionarfiltros('VENDA.DATA_VENDA');
  adicionarfiltros('VENDA.NOME_CLIENTE');
  FecharFiltro;
end;

procedure TFormCadVenda.Button4Click(Sender: TObject);
begin
  inherited;
   try
    ACBrCEP.WebService := wsViaCEP;
    ACBrCEP.BuscarPorCEP(trim(DBEditCEP.Text));

    if ACBrCEP.Enderecos.Count > 0 then
    begin
      DBEditRua.Text    := ACBrCEP.Enderecos[0].Tipo_Logradouro + ' ' + ACBrCEP.Enderecos[0].Logradouro;
      DBEditBairro.Text := ACBrCEP.Enderecos[0].Bairro;
      DBEditCidade.Text := ACBrCEP.Enderecos[0].Municipio;
      DBEditEstado.Text := ACBrCEP.Enderecos[0].UF;
    end
    else
      ShowMessage('CEP não encontrado.');

  except
    on E: Exception do
      ShowMessage('Erro ao buscar CEP: ' + E.Message);
  end;
end;

procedure TFormCadVenda.ButtonAlterarItemClick(Sender: TObject);
var
  AFormCad: TFormCadVendaItem;
begin
  if (DsItems.DataSet.IsEmpty) then
  begin
    ShowMessage('Sem dados para alterar');
    Abort;
  end;

  AFormCad := TFormCadVendaItem.CreateAlterar(self, FconnectionCad , DsItems);
  try
    AFormCad.ShowModal;
  finally
    AFormCad.Free;
  end;

  DsItems.dataset.post;
  CalcularValorTotal
end;

procedure TFormCadVenda.ButtonExcluirItemClick(Sender: TObject);
begin
  inherited;
  if (DsItems.DataSet.IsEmpty) then
  begin
    ShowMessage('Sem dados para excluir');
    Abort;
  end;

  DsItems.dataset.Edit;
  DsItems.dataset.Delete;
  CalcularValorTotal;
end;

procedure TFormCadVenda.ButtonInserirClick(Sender: TObject);
var
  AFormCad: TFormCadVendaItem;
begin
  AFormCad := TFormCadVendaItem.CreateInserir(self, FconnectionCad , DsItems);
  try
    AFormCad.ShowModal;
  finally
    AFormCad.Free;
  end;

  DsItems.dataset.post;
  CalcularValorTotal;
end;

procedure TFormCadVenda.ButtonNovoClick(Sender: TObject);
begin
  FDMCadbase.FGeradorNovoCod := 'GEN_VENDA_ID';
  FDMCadbase.Fconnection := FconnectionCad;
  inherited;
end;

procedure TFormCadVenda.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
end;

procedure TFormCadVenda.ButtonSalvarClick(Sender: TObject);
begin
  if not(FDMCadBase.CdsCad.FieldByName('DATA_VENDA').IsNull) then
  begin
    FDMCadBase.CdsCad.Edit;
    FDMCadBase.CdsCad.FieldByName('DATA_VENDA').AsDateTime := DateTimePicker2.Date;
    FDMCadBase.CdsCad.Post;
  end;

  inherited;

  if not(FDMCadbase.CdsCadItems.IsEmpty) then
  begin
    FDMCadBase.CdsCad.Edit;
    FDMCadBase.SalvaDadosItem;
  end;
end;

procedure TFormCadVenda.CalcularValorTotal;
var
  AValorTotalVenda: double;
begin
  if (DsItems.DataSet.IsEmpty) then
    Exit;

  AValorTotalVenda := 0;

  DsItems.DataSet.First;
  while not(DsItems.DataSet.Eof) do
  begin
    AValorTotalVenda := AValorTotalVenda + DsItems.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
    DsItems.DataSet.Next;
  end;

  DsCad.DataSet.edit;
  DsCad.DataSet.FieldByName('VALOR_TOTAL').AsFloat := AValorTotalVenda;
end;

procedure TFormCadVenda.FormCreate(Sender: TObject);
begin
  FGeradorNovoCod := 'GEN_VENDA_ID';
  FSQL := 'SELECT *  ' +
          '   FROM VENDA';
  inherited;
end;

procedure TFormCadVenda.TabSheetCadastroShow(Sender: TObject);
begin
  inherited;
  if (not FDMCadBase.CdsCad.FieldByName('DATA_VENDA').IsNull) then
    DateTimePicker2.Date := FDMCadBase.CdsCad.FieldByName('DATA_VENDA').AsDateTime
  else
  begin
    DateTimePicker2.Date := Now;

    FDMCadBase.CdsCad.Edit;
    FDMCadBase.CdsCad.FieldByName('DATA_VENDA').AsDateTime := Now;
  end;

  FDMCadBase.ExecutarSQLItems(FconnectionCad);
  DsItems.DataSet := FDMCadbase.CdsCadItems;
end;

procedure TFormCadVenda.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Pesquisar;

  inherited;
end;

end.
