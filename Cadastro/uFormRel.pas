unit uFormRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls, Vcl.DBCtrls, Data.FMTBcd;

type
  TFormRel = class(TForm)
    RLReport: TRLReport;
    FQuery: TSQLQuery;
    FDataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
  private
    Fconnection: TSQLConnection;
  public
    procedure CarregarRelatorio(DataIni, DataFim: TDate);
    constructor Create(AOwner: TComponent; AConnection: TSQLConnection);
  end;

var
  FormRel: TFormRel;

implementation

{$R *.dfm}

constructor TFormRel.Create(AOwner: TComponent; AConnection: TSQLConnection);
begin
  inherited Create(AOwner);
  Fconnection := AConnection;
end;

procedure TFormRel.CarregarRelatorio(DataIni, DataFim: TDate);
begin
  Fconnection.Connected := True;
  FQuery.SQLConnection := Fconnection;


  FQuery.Close;
  FQuery.SQL.Text := 'SELECT NOME_CLIENTE, DATA_VENDA ' +
                     'FROM VENDA ' +
                     'WHERE DATA_VENDA BETWEEN :DATAINI AND :DATAFIM ' +
                     'ORDER BY DATA_VENDA';

  FQuery.ParamByName('DATAINI').AsDate := DataIni;
  FQuery.ParamByName('DATAFIM').AsDate := DataFim;


  FQuery.Open;

  if FQuery.IsEmpty then
  begin
    ShowMessage('Nenhum dado encontrado para o período informado.');
    Exit;
  end;

  ClientDataSet.Close;
  ClientDataSet.Open;
  RLReport.PreviewModal;
end;

end.
