unit uDMCadBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, FireDAC.Comp.DataSet, Datasnap.Provider, Dialogs,
  FireDAC.Phys.FBDef, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Phys.TDBX, FireDAC.Phys.TDBXDef, Data.SqlExpr, Data.FMTBcd,
  Data.DBXInterBase;

type
  TDMCadBase = class(TDataModule)
    CdsCad: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    CdsCadItems: TClientDataSet;
    DpsCadItem: TDataSetProvider;
    DsCad: TDataSource;
    Connection: TFDConnection;
    QueryCad: TFDQuery;
    QueryCadItems: TFDQuery;
    procedure CdsCadNewRecord(DataSet: TDataSet);
  private
    FFiltroSQL: String;
  public
    FConnection: TFDConnection;
    FGeradorNovoCod: String;
    FCampoCodigo: String;
    FTextoEditPesquisa: String;
    procedure ExecutarSQLBD(_ASQL, _AFiltro: String; _AConnection: TFDConnection);
    function GetNovoCod(_AGerador: String): Integer;
    procedure ExecutarSQLItems(_AConnection: TFDConnection);
    procedure SalvaDadosItem;
  end;

var
  DMCadBase: TDMCadBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMCadBase.GetNovoCod(_AGerador: String): Integer;
var
  AQuery: TFDQuery;
begin
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection := TFDConnection(FConnection);
    AQuery.SQL.Text := 'SELECT nextval('+ QuotedStr(_AGerador) + ') AS ID ';
    AQuery.Open;

    if not(AQuery.IsEmpty) then
    begin
      Result := AQuery.FieldByName('ID').AsInteger;
    end;
  finally
    AQuery.Free;
  end;
end;

procedure TDMCadBase.CdsCadNewRecord(DataSet: TDataSet);
begin
  if (FCampoCodigo = EmptyStr) then
  begin
    ShowMessage('Campo codigo nao foi definido na ação do botão "novo"');
    Abort;
  end;

  DataSet.Edit;
  DataSet.FieldByName(FCampoCodigo).AsInteger := GetNovoCod(FGeradorNovoCod);
end;

procedure TDMCadBase.ExecutarSQLBD(_ASQL, _AFiltro: String; _AConnection: TFDConnection);
begin
  if not Assigned(_AConnection) then
  begin
    ShowMessage('Conexão não inicializada!');
    Abort;
  end;

  try
    Connection := _AConnection;
    Connection.Connected := True;

    CdsCad.Close;
    QueryCad.Connection := Connection;
    QueryCad.SQL.Text := _ASQL + ' WHERE 1 = 1 ' + _AFiltro;
    CdsCad.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao executar o SQL: ' + E.Message);
      Abort;
    end;
  end;
end;

procedure TDMCadBase.SalvaDadosItem;
begin
  try
    CdsCadItems.ApplyUpdates(0);
  except
    on E: Exception do
      ShowMessage('Erro ao salvar itens da venda: ' + E.Message);
  end;
end;

procedure TDMCadBase.ExecutarSQLItems(_AConnection: TFDConnection);
begin
  if not Assigned(_AConnection) then
  begin
    ShowMessage('Conexão não inicializada!');
    Abort;
  end;

  try
    Connection := _AConnection;
    Connection.Connected := True;

    QueryCad.Connection := Connection;
    QueryCadItems.Connection := Connection;

    CdsCadItems.Close;
    CdsCadItems.MasterSource := DsCad;
    CdsCadItems.MasterFields := 'CD_VENDA';
    CdsCadItems.IndexFieldNames := 'CD_VENDA';

    QueryCadItems.SQL.Text := ' SELECT * ' +
                              '    FROM VENDAITEM ' +
                              '   WHERE CD_VENDA = :CD_VENDA';

    QueryCadItems.ParamByName('CD_VENDA').AsInteger := DsCad.DataSet.FieldByName('CD_VENDA').AsInteger;
    CdsCadItems.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao executar o SQL: ' + E.Message);
      Abort;
    end;
  end;
end;


end.
