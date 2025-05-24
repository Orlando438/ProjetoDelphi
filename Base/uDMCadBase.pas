unit uDMCadBase;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  Datasnap.DBClient, Datasnap.DSConnect, FireDAC.Comp.DataSet, Datasnap.Provider, Dialogs;

type
  TDMCadBase = class(TDataModule)
    CdsCad: TClientDataSet;
    QueryCad: TFDQuery;
    DataSetProvider: TDataSetProvider;
    Connection: TFDConnection;
  private
    FFiltroSQL: String;
  public
    FTabela: String;
    FTextoEditPesquisa: String;
    procedure ExecutarSQLBD(_ASQL, _AFiltro: String; _AConnection: TFDConnection);
  end;

var
  DMCadBase: TDMCadBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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
