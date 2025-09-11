unit uFormMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DBXFirebird,
  Data.SqlExpr, System.IniFiles, System.IOUtils;

type
  TFormMenu = class(TForm)
    PopupMenu: TPopupMenu;
    Cadastrarpessoa1: TMenuItem;
    MainMenu: TMainMenu;
    Cadastrodeitem1: TMenuItem;
    Processos1: TMenuItem;
    Vendas1: TMenuItem;
    PanelMenu: TPanel;
    Item1: TMenuItem;
    Relatrios1: TMenuItem;
    Venda1: TMenuItem;
    Connection: TFDConnection;
    procedure Vendas1Click(Sender: TObject);
    procedure Item1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses uFormCadVenda, uFormCadItem, uFormRelBase;

procedure TFormMenu.FormCreate(Sender: TObject);
var
  ArqConfig: string;
  Ini: TIniFile;
begin
  ArqConfig := TPath.Combine(ExtractFilePath(ParamStr(0)), 'config.txt');

  if not FileExists(ArqConfig) then
    raise Exception.Create('Arquivo config.txt não encontrado no diretório do sistema.');

  Ini := TIniFile.Create(ArqConfig);
  try
    Connection.Connected := False;
    Connection.Params.Clear;

    Connection.Params.Values['DriverID'] := 'PG'; // fixo para Postgres
    Connection.Params.Values['Server']   := Ini.ReadString('BD', 'Server', 'localhost');
    Connection.Params.Values['Database'] := Ini.ReadString('BD', 'Database', '');
    Connection.Params.Values['User_Name']:= Ini.ReadString('BD', 'User_Name', 'postgres');
    Connection.Params.Values['Password'] := Ini.ReadString('BD', 'Password', '');
    Connection.Params.Values['Port']     := Ini.ReadString('BD', 'Port', '5432');

    Connection.LoginPrompt := False;
    Connection.Connected := True;

    ShowMessage('Conexão com PostgreSQL estabelecida!');
  finally
    Ini.Free;
  end;
end;
procedure TFormMenu.Item1Click(Sender: TObject);
var
  AFormCad: TFormCadItem;
begin
  AFormCad := TFormCadItem.Create(Self, Connection);
  try
    AFormCad.ShowModal;
  finally
    AFormCad.Free;
  end;
end;

procedure TFormMenu.Venda1Click(Sender: TObject);
//var
//  AFormCad: TFormRelBase;
begin
//  AFormCad := TFormRelBase.Create(Self, Connection);
//  try
//    AFormCad.ShowModal;
//  finally
//    AFormCad.Free;
//  end;
end;

procedure TFormMenu.Vendas1Click(Sender: TObject);
var
  AFormCad: TFormCadVenda;
begin
  AFormCad := TFormCadVenda.Create(Self, Connection);
  try
    AFormCad.ShowModal;
  finally
    AFormCad.Free;
  end;
end;

end.
