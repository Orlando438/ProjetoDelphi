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
    Connection: TSQLConnection;
    QueryCad: TSQLQuery;
    CdsCadItems: TClientDataSet;
    DpsCadItem: TDataSetProvider;
    QueryCadItems: TSQLQuery;
    DsCad: TDataSource;
    procedure CdsCadNewRecord(DataSet: TDataSet);
  private
    FFiltroSQL: String;
  public
    FConnection: TSQLConnection;
    FGeradorNovoCod: String;
    FTextoEditPesquisa: String;
    procedure ExecutarSQLBD(_ASQL, _AFiltro: String; _AConnection: TSQLConnection);
    function GetNovoCod(_AGerador: String; _AConnection: TCustomConnection): Integer;
    procedure ExecutarSQLItems(_AConnection: TSQLConnection);
    procedure SalvaDadosItem;
  end;

var
  DMCadBase: TDMCadBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMCadBase.GetNovoCod(_AGerador: String; _AConnection: TCustomConnection): Integer;
var
  AQuery: TSQLQuery;
begin
  AQuery := TSQLQuery.Create(nil);
  try
    AQuery.SQLConnection := TSQLConnection(_AConnection);
    AQuery.SQL.Text := 'SELECT NEXT VALUE FOR ' + _AGerador + ' AS ID FROM RDB$DATABASE';
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
  DataSet.Edit;
  DataSet.FieldByName('ID').AsInteger := GetNovoCod(FGeradorNovoCod, Fconnection);
end;

procedure TDMCadBase.ExecutarSQLBD(_ASQL, _AFiltro: String; _AConnection: TSQLConnection);
begin
  if not Assigned(_AConnection) then
  begin
    ShowMessage('Conexão não inicializada!');
    Abort;
  end;

  try
    Connection := _AConnection;
    Connection.Connected := True;
    QueryCad.SQLConnection := Connection;

    CdsCad.Close;
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

procedure TDMCadBase.ExecutarSQLItems(_AConnection: TSQLConnection);
begin
  if not Assigned(_AConnection) then
  begin
    ShowMessage('Conexão não inicializada!');
    Abort;
  end;

  try
    Connection := _AConnection;
    Connection.Connected := True;
    QueryCadItems.SQLConnection := Connection;

    CdsCadItems.Close;
    CdsCadItems.MasterSource := DsCad;
    CdsCadItems.MasterFields := 'ID';
    CdsCadItems.IndexFieldNames := 'VENDA_ID';

    QueryCadItems.SQL.Text := 'SELECT * FROM VENDA_ITEM WHERE VENDA_ID = :VENDA_ID';
    QueryCadItems.ParamByName('VENDA_ID').AsInteger := DsCad.DataSet.FieldByName('ID').AsInteger;
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
