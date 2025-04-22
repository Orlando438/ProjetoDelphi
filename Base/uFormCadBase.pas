unit uFormCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uDMCadBase, System.StrUtils, FireDAC.Comp.Client;

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
    EditPesquisa: TEdit;
    ButtonPesquisar: TButton;
    DBGrid1: TDBGrid;
    ButtonAlterar: TButton;
    ButtonNovo: TButton;
    DBEditCodigo: TDBEdit;
    Label2: TLabel;
    DsCad: TDataSource;
    PanelGrid: TPanel;
    PanelConsulta: TPanel;
    procedure TabSheetConsultaShow(Sender: TObject);
    procedure TabSheetCadastroShow(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonNovoClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ButtonAlterarClick(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Alterar;
  public
    FDMCadbase: TDMCadBase;
    FSQL: String;
    FFiltrosSQL: String;
    Fconnection: TFDConnection;
    procedure AdicionarFiltros(_ACampo: String);
    procedure ExecutarSQL;
    procedure InserirDadosBD;
    procedure FecharFiltro;
    constructor Create(AOwner: TComponent; AConnection: TFDConnection); reintroduce;
  end;

var
  FormCadBase: TFormCadBase;

implementation

{$R *.dfm}

constructor TFormCadBase.Create(AOwner: TComponent; AConnection: TFDConnection);
begin
  inherited Create(AOwner);
  Fconnection := AConnection;
end;

procedure TFormCadBase.Alterar;
begin
  PageControl.ActivePage := TabSheetCadastro;
  FDMCadbase.CdsCad.Edit;
end;

procedure TFormCadBase.ButtonAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFormCadBase.ButtonCancelarClick(Sender: TObject);
begin
  if (PageControl.ActivePage = TabSheetCadastro)  then
  begin
    PageControl.ActivePage := TabSheetConsulta;
    FDMCadbase.CdsCad.Cancel;
  end
  else
    Close;
end;

procedure TFormCadBase.ButtonExcluirClick(Sender: TObject);
begin
  try
    FDMCadbase.CdsCad.Edit;
    FDMCadbase.CdsCad.Delete;
    FDMCadbase.CdsCad.ApplyUpdates(0);
  except
    on E: Exception do
      ShowMessage('Erro ao deletar: ' + E.Message);
  end;
end;

procedure TFormCadBase.ButtonNovoClick(Sender: TObject);
begin
  TabSheetCadastro.Show;
  FDMCadbase.CdsCad.Append;
end;

procedure TFormCadBase.ButtonPesquisarClick(Sender: TObject);
begin
  ExecutarSQL;
end;

procedure TFormCadBase.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    ExecutarSQL;
end;

procedure TFormCadBase.ExecutarSQL;
begin
  if (FDMCadbase= nil) or (FSQL = EmptyStr)  then
    Exit;

  try
    FDMCadbase.ExecutarSQLBD(FSQL, FFiltrosSQL, Fconnection);
  except
    on E: Exception do
      ShowMessage('Erro ao executar SQL: ' + E.Message);
  end;
end;

procedure TFormCadBase.InserirDadosBD;
var
  AQtdErros: Integer;
begin
  if (FDMCadbase = nil) then
    Exit;

  if (FDMCadbase.CdsCad = nil) then
    Exit;

  if (FDMCadbase.CdsCad.IsEmpty) then
    Exit;

  try
    FDMCadbase.CdsCad.Post;
    AQtdErros := FDMCadbase.CdsCad.ApplyUpdates(0);

    if (AQtdErros > 0) then
      ShowMessage('Erro ao salvar');
  except
    on E: Exception do
      ShowMessage('Erro ao salvar dados: ' + E.Message);
  end;

  PageControl.ActivePage := TabSheetConsulta;
  FDMCadbase.CdsCad.Refresh;
end;

procedure TFormCadBase.ButtonSalvarClick(Sender: TObject);
begin
  InserirDadosBD;
end;

procedure TFormCadBase.DBGrid1DblClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFormCadBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(DsCad.DataSet);
end;

procedure TFormCadBase.FormCreate(Sender: TObject);
begin
  TabSheetCadastro.TabVisible := False;
  TabSheetConsulta.TabVisible := False;

  PageControl.ActivePage := TabSheetConsulta;
  FDMCadbase := TDMCadBase.Create(Self);
  FDMCadbase.ExecutarSQLBD(FSQL, '', Fconnection);
  DsCad.DataSet := FDMCadbase.CdsCad;
  ExecutarSQL;
end;

procedure TFormCadBase.AdicionarFiltros(_ACampo: String);
begin
  if (FFiltrosSQL = EmptyStr) then
    FFiltrosSQL := 'AND ( ' + _ACampo + '::TEXT ILIKE ' + QuotedStr('%' + EditPesquisa.Text + '%')
  else
    FFiltrosSQL := FFiltrosSQL + ' OR ' + _ACampo + '::TEXT ILIKE ' + QuotedStr('%' + EditPesquisa.Text + '%') ;
end;

procedure TFormCadBase.FecharFiltro;
begin
  FFiltrosSQL := FFiltrosSQL + ')';
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
