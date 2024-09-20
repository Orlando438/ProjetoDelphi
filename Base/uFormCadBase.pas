unit uFormCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uDMCadBase, System.StrUtils;

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
  private
    FDMCadbase: TDMCadBase;
    procedure Alterar;
  public
    FTabela: String;
    FCamposTabela: String;
    FFiltrosSQL: String;
    procedure AdicionarCampos(_Acampo: String);
    procedure AdicionarFiltros(_ACampo: String);
    procedure Pesquisar;
  end;

var
  FormCadBase: TFormCadBase;

implementation

{$R *.dfm}

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
  FDMCadbase.CdsCad.Edit;
  FDMCadbase.CdsCad.Delete;
  FDMCadbase.CdsCad.ApplyUpdates(0);
end;

procedure TFormCadBase.ButtonNovoClick(Sender: TObject);
begin
  TabSheetCadastro.Show;
  FDMCadbase.CdsCad.Append;
end;

procedure TFormCadBase.ButtonPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFormCadBase.Pesquisar;
begin
  FDMCadbase.DataModuleCreate(FTabela, FCamposTabela, FFiltrosSQL);
  FDMCadbase.CdsCad.Refresh;
  FFiltrosSQL := '';
end;

procedure TFormCadBase.ButtonSalvarClick(Sender: TObject);
begin
  FDMCadbase.CdsCad.Post;
  FDMCadbase.CdsCad.ApplyUpdates(0);

  PageControl.ActivePage := TabSheetConsulta;
  FDMCadbase.CdsCad.Refresh;
end;

procedure TFormCadBase.DBGrid1DblClick(Sender: TObject);
begin
  Alterar;
end;

procedure TFormCadBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DsCad.DataSet := nil;
end;

procedure TFormCadBase.FormCreate(Sender: TObject);
begin
  TabSheetCadastro.TabVisible := False;
  TabSheetConsulta.TabVisible := False;

  PageControl.ActivePage := TabSheetConsulta;
  FDMCadbase := TDMCadBase.Create(nil);
  FDMCadbase.DataModuleCreate(FTabela, FCamposTabela);
  DsCad.DataSet := FDMCadbase.CdsCad;
  pesquisar;
end;

procedure TFormCadBase.AdicionarCampos(_Acampo: String);
begin
  if (FCamposTabela = EmptyStr) then
    FCamposTabela := _Acampo
  else
    FCamposTabela := FCamposTabela + ', ' + _Acampo;
end;

procedure TFormCadBase.AdicionarFiltros(_ACampo: String);
begin
  if (FFiltrosSQL = EmptyStr) then
    FFiltrosSQL := ' AND LOWER(' + _ACampo + '::TEXT) LIKE ' + QuotedStr('%' + EditPesquisa.Text + '%')
  else
    FFiltrosSQL := FFiltrosSQL + ' OR LOWER(' + _ACampo + '::TEXT) LIKE ' + QuotedStr('%' + EditPesquisa.Text + '%') ;
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
