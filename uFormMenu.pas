unit uFormMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DBXFirebird,
  Data.SqlExpr;

type
  TFormMenu = class(TForm)
    PopupMenu: TPopupMenu;
    Cadastrarpessoa1: TMenuItem;
    MainMenu: TMainMenu;
    Cadastrodeitem1: TMenuItem;
    Processos1: TMenuItem;
    Vendas1: TMenuItem;
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
    Connection: TSQLConnection;
    Item1: TMenuItem;
    Relatrios1: TMenuItem;
    Venda1: TMenuItem;
    procedure Vendas1Click(Sender: TObject);
    procedure ButtonSalvarBDClick(Sender: TObject);
    procedure Item1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMenu: TFormMenu;

implementation

{$R *.dfm}

uses uFormCadVenda, uFormCadItem, uFormRelatorioVenda;

procedure TFormMenu.ButtonSalvarBDClick(Sender: TObject);
begin
  try
    Connection.Connected := False;

    Connection.DriverName := Trim(EditDriverID.Text);
    Connection.Params.Values['Database'] := Trim(EditDataBase.Text);
    Connection.Params.Values['User_Name'] := Trim(EditUsuario.Text);
    Connection.Params.Values['Password'] := Trim(EditSenha.Text);
    Connection.Params.Values['Server'] := Trim(EditServer.Text);
    Connection.Params.Values['Port'] := Trim(EditPorta.Text);

    Connection.LoginPrompt := False;
    Connection.Connected := True;

    ShowMessage('Configuração de conexão salva!');
  except
    on E: Exception do
      ShowMessage('Erro de conexão, verifique os dados e tente novamente: ' + E.Message);
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
var
  AFormCad: TFormRelatorioVenda;
begin
  AFormCad := TFormRelatorioVenda.Create(Self, Connection);
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
