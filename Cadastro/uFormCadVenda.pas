unit uFormCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, ACBrBase, ACBrSocket, ACBrCEP;

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
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ACBrCEP: TACBrCEP;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure TabSheetCadastroShow(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonExcluirClick(Sender: TObject);
  private
    procedure CarregarLookups;
    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  FormCadVenda: TFormCadVenda;

implementation

{$R *.dfm}

procedure TFormCadVenda.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('VENDA.ID');
  adicionarfiltros('VENDA.DATA_VENDA');
  adicionarfiltros('VENDA.NOME_CLIENTE');
  FecharFiltro;
end;

procedure TFormCadVenda.ButtonExcluirClick(Sender: TObject);
begin
  try
    ACBrCEP.WebService := wsViaCEP;
    ACBrCEP.BuscarPorCEP(DBEditCEP.Text); // Ex: '01001-000'

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

procedure TFormCadVenda.ButtonSalvarClick(Sender: TObject);
begin
  if not(FDMCadBase.CdsCad.FieldByName('DATA_VENDA').IsNull) then
      FDMCadBase.CdsCad.FieldByName('DATA_VENDA').AsDateTime := DateTimePicker2.Date;
  inherited;
end;

procedure TFormCadVenda.FormCreate(Sender: TObject);
begin
  FGeradorNovoCod := 'GEN_VENDA_ID';
  FSQL := 'SELECT *  ' +
          '   FROM VENDA';

  CarregarLookups;
  inherited;
end;

procedure TFormCadVenda.TabSheetCadastroShow(Sender: TObject);
begin
  inherited;
  if (not FDMCadBase.CdsCad.FieldByName('DATA_VENDA').IsNull) then
    DateTimePicker2.Date := FDMCadBase.CdsCad.FieldByName('DATA_VENDA').AsDateTime
  else
    DateTimePicker2.Date := Now;
end;

procedure TFormCadVenda.CarregarLookups;
begin
//  if (Fconnection = nil) then
//    ShowMessage('Erro. Verifique os dados de conexão com o banco');
//  try
//    QueryPessoa.Close;
//    QueryPessoa.Connection := Fconnection;
//    QueryPessoa.SQL.Text := 'SELECT * FROM PESSOA ';
//    QueryPessoa.Open;
//  except
//    on E: Exception do
//      ShowMessage('Erro ao executar SQL: ' + E.Message);
//  end;
end;

procedure TFormCadVenda.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    Pesquisar;

  inherited;
end;

end.
