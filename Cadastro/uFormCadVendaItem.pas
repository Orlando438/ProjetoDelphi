unit uFormCadVendaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Data.SqlExpr, uProduto, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  TFormCadVendaItem = class(TForm)
    Panel1: TPanel;
    DBEditItem: TDBEdit;
    Label1: TLabel;
    DBEditQuantidade: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditDescricao: TEdit;
    Panel2: TPanel;
    ButtonCancelar: TButton;
    DataSource: TDataSource;
    DbEditValorTot: TDBEdit;
    DBEditValorUni: TDBEdit;
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure EditValorUniExit(Sender: TObject);
    procedure DBEditQuantidadeExit(Sender: TObject);
  private
    Fconnection: TFDConnection;
  public
    constructor CreateInserir(AOwner: TComponent; AConnection: TFDConnection; Data: TDataSource); reintroduce;
    constructor CreateAlterar(AOwner: TComponent; AConnection: TFDConnection; Data: TDataSource); reintroduce;
  end;

var
  FormCadVendaItem: TFormCadVendaItem;

implementation

{$R *.dfm}

uses uFormCadItem, uDMCadBase;

procedure TFormCadVendaItem.ButtonCancelarClick(Sender: TObject);
begin
  Close;
end;

constructor TFormCadVendaItem.CreateInserir(AOwner: TComponent; AConnection: TFDConnection; Data: TDataSource);
var
  FDMCadbase: TDMCadBase;
begin
  inherited Create(AOwner);
  Fconnection := TFDConnection(AConnection);

  DataSource.DataSet := Data.DataSet;
  DataSource.DataSet.Append;

  FDMCadbase := TDMCadBase.Create(nil);
  try
    FDMCadbase.FConnection := Fconnection;
    DataSource.DataSet.FieldByName('CD_VENDAITEM').AsInteger := FDMCadbase.GetNovoCod('vendaitem_seq');
  finally
    FDMCadbase.Free;
  end;
end;

constructor TFormCadVendaItem.CreateAlterar(AOwner: TComponent; AConnection: TFDConnection; Data: TDataSource);
var
  FDMCadbase: TDMCadBase;
  AValor: Double;
begin
  inherited Create(AOwner);
  Fconnection := AConnection;
  DataSource.DataSet := Data.DataSet;
  DataSource.DataSet.Edit;

  AValor := DataSource.DataSet.FieldByName('VL_TOTAL').AsFloat;
  DataSource.DataSet.FieldByName('VL_TOTAL').Text := FormatFloat('#,##0.00', AValor);
  DbEditValorTot.Text := FormatFloat('#,##0.00', AValor);

  AValor := DataSource.DataSet.FieldByName('VL_UNITARIO').AsFloat;
  DataSource.DataSet.FieldByName('VL_UNITARIO').Text := FormatFloat('#,##0.00', AValor);
  DBEditValorUni.Text := FormatFloat('#,##0.00', AValor);
end;

procedure TFormCadVendaItem.EditDescricaoKeyPress(Sender: TObject; var Key: Char);
var
  ProdutoSelecionado: TItemVenda;
  AValor: Double;
begin
  if Key = #13 then
   begin
    FormCadItem := TFormCadItem.Create(self, Fconnection);
    try
      ProdutoSelecionado := FormCadItem.SelecionarItem(EditDescricao.Text);

      if Assigned(ProdutoSelecionado) then
      begin
        DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('CD_ITEM').AsInteger := ProdutoSelecionado.IDProduto;
        DataSource.DataSet.FieldByName('QT_ITEM').AsFloat := 1;
        DataSource.DataSet.FieldByName('VL_UNITARIO').AsFloat := ProdutoSelecionado.PrecoUnitario;
        DataSource.DataSet.FieldByName('VL_TOTAL').AsFloat := ProdutoSelecionado.PrecoUnitario;

        AValor := DataSource.DataSet.FieldByName('VL_TOTAL').AsFloat;
        DbEditValorTot.Text  := FormatFloat('#,##0.00', AValor);

        AValor := DataSource.DataSet.FieldByName('VL_UNITARIO').AsFloat;
        DBEditValorUni.Text  := FormatFloat('#,##0.00', AValor);
      end;
    finally
      ProdutoSelecionado.Free;
      FormCadItem.Free;
    end;
  end;
end;

procedure TFormCadVendaItem.DBEditQuantidadeExit(Sender: TObject);
var
  AValor: Double;
begin
  DataSource.DataSet.Edit;
  DataSource.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := StrToFloat(DBEditValorUni.Text) *
                                                              StrToFloat(DBEditQuantidade.Text);

  AValor := DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
  DataSource.DataSet.FieldByName('VALOR_TOTAL').Text := FormatFloat('#,##0.00', AValor);
  DbEditValorTot.Text := FormatFloat('#,##0.00', AValor);
end;


procedure TFormCadVendaItem.EditValorUniExit(Sender: TObject);
var
  AValor: Double;
begin
  DataSource.DataSet.Edit;
  DataSource.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := StrToFloat(DBEditValorUni.Text) *
                                                              StrToFloat(DBEditQuantidade.Text);

  AValor := DataSource.DataSet.FieldByName('VALOR_TOTAL').AsFloat;
  DataSource.DataSet.FieldByName('VALOR_TOTAL').Text := FormatFloat('#,##0.00', AValor);
  DBEditValorUni.Text := FormatFloat('#,##0.00', StrToFloat(DBEditValorUni.Text));
  DbEditValorTot.Text := FormatFloat('#,##0.00', AValor);
end;

end.
