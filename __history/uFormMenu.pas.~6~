unit uFormMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormMenu = class(TForm)
    PopupMenu: TPopupMenu;
    Cadastrarpessoa1: TMenuItem;
    MainMenu: TMainMenu;
    Cadastrodeitem1: TMenuItem;
    Cadastrodepessoas1: TMenuItem;
    Cadastrodeveculo1: TMenuItem;
    Processos1: TMenuItem;
    Vendas1: TMenuItem;
    Connection: TFDConnection;
    EditDriverID: TEdit;
    EditServer: TEdit;
    EditDataBase: TEdit;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    EditPorta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ButtonSalvarBD: TButton;
    PanelMenu: TPanel;
    GroupBoxMenu: TGroupBox;
    procedure Cadastrodepessoas1Click(Sender: TObject);
    procedure Cadastrodeveculo1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure ButtonSalvarBDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses uFormCadPessoa, uFormCadCarro, uFormCadVenda;

procedure TFormMenu.ButtonSalvarBDClick(Sender: TObject);
begin
  try
    Connection.Params.Values['DriverID'] := EditDriverID.Text;
    Connection.Params.Values['Server'] := EditServer.Text;
    Connection.Params.Values['Database'] := EditDataBase.Text;
    Connection.Params.Values['User_Name'] := EditUsuario.Text;
    Connection.Params.Values['Password'] := EditSenha.Text;

    Connection.Connected := True;
    ShowMessage('Configuração de conexão salva!');
  except
    on E: Exception do
      ShowMessage('Erro de conexão, verifique os dados e tenta novamente: ' + E.Message);
  end;
end;

procedure TFormMenu.Cadastrodepessoas1Click(Sender: TObject);
var
  AFormCad: TFormCadPessoa;
begin
  AFormCad := TFormCadPessoa.Create(Self, Connection);
  try
    AFormCad.ShowModal;
  finally
    AFormCad.Free;
  end;
end;

procedure TFormMenu.Cadastrodeveculo1Click(Sender: TObject);
var
  AFormCad: TFormCadCarro;
begin
  AFormCad := TFormCadCarro.Create(Self, Connection);
  try
    AFormCad.ShowModal;
  finally
    AFormCad.Free;
  end;
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
