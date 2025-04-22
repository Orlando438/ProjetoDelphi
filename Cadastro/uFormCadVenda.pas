unit uFormCadVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormCadBase, Data.DB, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons;

type
  TFormCadVenda = class(TFormCadBase)
    DBLookupComboBoxCli: TDBLookupComboBox;
    Label3: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label4: TLabel;
    QueryPessoa: TFDQuery;
    DataSourcePessoa: TDataSource;
    QueryCarro: TFDQuery;
    DataSourceCarro: TDataSource;
    DBLookupComboBoxVeiculo: TDBLookupComboBox;
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure TabSheetCadastroShow(Sender: TObject);
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

procedure TFormCadVenda.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
  inherited;
end;

procedure TFormCadVenda.Pesquisar;
begin
  FFiltrosSQL := '';
  adicionarfiltros('VENDA.CDVENDA');
  adicionarfiltros('VENDA.DHVENDA');
  adicionarfiltros('PESSOA.DSNOME');
  adicionarfiltros('CARRO.DSCARRO');
  FecharFiltro;
end;

procedure TFormCadVenda.ButtonSalvarClick(Sender: TObject);
begin
  if not(FDMCadBase.CdsCad.FieldByName('DHVENDA').IsNull) then
      FDMCadBase.CdsCad.FieldByName('DHVENDA').AsDateTime := DateTimePicker2.Date;
  inherited;
end;

procedure TFormCadVenda.FormCreate(Sender: TObject);
begin
  FSQL := 'SELECT VENDA.*, PESSOA.DSNOME, CARRO.DSCARRO ' +
          '   FROM VENDA' +
          '  LEFT JOIN PESSOA ON PESSOA.CDPESSOA = VENDA.CDPESSOA' + 
          '  LEFT JOIN CARRO ON CARRO.CDCARRO = VENDA.CDCARRO ';
  CarregarLookups;
  inherited;
end;

procedure TFormCadVenda.TabSheetCadastroShow(Sender: TObject);
begin
  inherited;
  if (not FDMCadBase.CdsCad.FieldByName('DHVENDA').IsNull) then
    DateTimePicker2.Date := FDMCadBase.CdsCad.FieldByName('DHVENDA').AsDateTime;
end;

procedure TFormCadVenda.CarregarLookups;
begin
  if (Fconnection = nil) then
    ShowMessage('Erro. Verifique os dados de conexão com o banco');
  try
    QueryPessoa.Close;
    QueryPessoa.Connection := Fconnection;
    QueryPessoa.SQL.Text := 'SELECT * FROM PESSOA ';
    QueryPessoa.Open;

    QueryCarro.Close;
    QueryCarro.Connection := Fconnection;
    QueryCarro.SQL.Text := 'SELECT * FROM CARRO ';
    QueryCarro.Open;
  except
    on E: Exception do
      ShowMessage('Erro ao executar SQL: ' + E.Message);
  end;
end;

end.
