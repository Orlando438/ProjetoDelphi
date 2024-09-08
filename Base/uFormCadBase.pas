unit uFormCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, uDMCadBase;

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
  private
    FDMCadbase: TDMCadBase;
  public
    FTabela: String;
    FCamposTabela: String;
    FFiltrosSQL: String;
    procedure AdicionarCampos(_Acampo: String);
  end;

var
  FormCadBase: TFormCadBase;

implementation

{$R *.dfm}

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

procedure TFormCadBase.FormCreate(Sender: TObject);
begin
  FFiltrosSQL := '';
  TabSheetCadastro.TabVisible := False;
  TabSheetConsulta.TabVisible := False;

  PageControl.ActivePage := TabSheetConsulta;
  FDMCadbase := TDMCadBase.Create(nil);
  FDMCadbase.DataModuleCreate(FTabela, FCamposTabela);
  DsCad.DataSet := FDMCadbase.CdsCad;
end;

procedure TFormCadBase.AdicionarCampos(_Acampo: String);
begin
  if (FCamposTabela = EmptyStr) then
    FCamposTabela := _Acampo
  else
    FCamposTabela := FCamposTabela + ', ' + _Acampo;

  if (FFiltrosSQL = EmptyStr) then
    FFiltrosSQL := ' AND ' + _Acampo +  '::TEXT LIKE ' + QuotedStr('%'+ EditPesquisa.text +'%')
  else
    FFiltrosSQL := FFiltrosSQL + ' OR ' + _Acampo + '::TEXT LIKE ' + QuotedStr('%'+ EditPesquisa.text +'%');
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
