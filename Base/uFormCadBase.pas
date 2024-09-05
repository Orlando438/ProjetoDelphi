unit uFormCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadBase = class(TForm)
    Label1: TLabel;
    DBEditDescricao: TDBEdit;
    ControlBar1: TControlBar;
    ButtonSalvar: TButton;
    ButtonCancelar: TButton;
    ButtonExcluir: TButton;
    PageControl: TPageControl;
    TabSheetConsulta: TTabSheet;
    TabSheetCadastro: TTabSheet;
    Edit1: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    ButtonAlterar: TButton;
    ButtonNovo: TButton;
    DBEditCodigo: TDBEdit;
    Label2: TLabel;
    procedure TabSheetConsultaShow(Sender: TObject);
    procedure TabSheetCadastroShow(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    FTabela: String;
  end;

var
  FormCadBase: TFormCadBase;

implementation

{$R *.dfm}

procedure TFormCadBase.ButtonCancelarClick(Sender: TObject);
begin
  if (PageControl.ActivePage = TabSheetCadastro)  then
    PageControl.ActivePage := TabSheetConsulta
  else
    Close;
end;

procedure TFormCadBase.ButtonNovoClick(Sender: TObject);
begin
  TabSheetCadastro.Show;
end;

procedure TFormCadBase.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage := TabSheetConsulta;
end;

procedure TFormCadBase.TabSheetCadastroShow(Sender: TObject);
begin
  ButtonNovo.Enabled := False;
  ButtonAlterar.Enabled := False;
  ButtonExcluir.Enabled := False;
  ButtonSalvar.Enabled := True;
end;

procedure TFormCadBase.TabSheetConsultaShow(Sender: TObject);
begin
  ButtonNovo.Enabled := True;
  ButtonAlterar.Enabled := True;
  ButtonExcluir.Enabled := True;
  ButtonSalvar.Enabled := False;
end;

end.
