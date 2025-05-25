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
  FireDAC.Phys.TDBX, FireDAC.Phys.TDBXDef;

type
  TDMCadBase = class(TDataModule)
    CdsCad: TClientDataSet;
    QueryCad: TFDQuery;
    DataSetProvider: TDataSetProvider;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    Connection: TFDConnection;
  private
    FFiltroSQL: String;
  public
    FTextoEditPesquisa: String;
    procedure ExecutarSQLBD(_ASQL, _AFiltro: String; _AConnection: TFDConnection);
    function GetNovoCod(_AGerador: String; _AConnection: TFDConnection): Integer;
  end;

var
  DMCadBase: TDMCadBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMCadBase.GetNovoCod(_AGerador: String; _AConnection: TFDConnection): Integer;
var
  AQuery: TFDQuery;
begin
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection := _AConnection;
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
    QueryCad.Connection := Connection;

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


end.
