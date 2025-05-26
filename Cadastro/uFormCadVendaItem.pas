unit uFormCadVendaItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Data.SqlExpr, uProduto;

type
  TFormCadVendaItem = class(TForm)
    Panel1: TPanel;
    DBEditItem: TDBEdit;
    Label1: TLabel;
    DBEditQuantidade: TDBEdit;
    Label2: TLabel;
    DBEditValorUnitario: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEditValorTotal: TDBEdit;
    EditDescricao: TEdit;
    Panel2: TPanel;
    ButtonCancelar: TButton;
    DataSource: TDataSource;
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure DBEditValorUnitarioExit(Sender: TObject);
    procedure DBEditValorTotalExit(Sender: TObject);
  private
    Fconnection: TSQLConnection;
  public
    constructor CreateInserir(AOwner: TComponent; AConnection: TCustomConnection; Data: TDataSource); reintroduce;
    constructor CreateAlterar(AOwner: TComponent; AConnection: TCustomConnection; Data: TDataSource); reintroduce;
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

constructor TFormCadVendaItem.CreateInserir(AOwner: TComponent; AConnection: TCustomConnection; Data: TDataSource);
var
  FDMCadbase: TDMCadBase;
begin
  inherited Create(AOwner);
  Fconnection := TSQLConnection(AConnection);

  DataSource.DataSet := Data.DataSet;
  DataSource.DataSet.Append;

  FDMCadbase := TDMCadBase.Create(nil);
  try
    DataSource.DataSet.FieldByName('ID').AsInteger := FDMCadbase.GetNovoCod('GEN_VENDAITEM_ID', Fconnection);
  finally
    FDMCadbase.Free;
  end;
end;

constructor TFormCadVendaItem.CreateAlterar(AOwner: TComponent; AConnection: TCustomConnection; Data: TDataSource);
var
  FDMCadbase: TDMCadBase;
begin
  inherited Create(AOwner);
  Fconnection := TSQLConnection(AConnection);
  DataSource.DataSet := Data.DataSet;
  DataSource.DataSet.Edit;
end;


procedure TFormCadVendaItem.DBEditValorTotalExit(Sender: TObject);
begin
  DataSource.DataSet.Edit;
  DataSource.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := DataSource.DataSet.FieldByName('PRECO_UNITARIO').AsCurrency *
                                                              DataSource.DataSet.FieldByName('QUANTIDADE').AsFloat;
end;

procedure TFormCadVendaItem.DBEditValorUnitarioExit(Sender: TObject);
begin
  DataSource.DataSet.Edit;
  DataSource.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := DataSource.DataSet.FieldByName('PRECO_UNITARIO').AsCurrency *
                                                              DataSource.DataSet.FieldByName('QUANTIDADE').AsFloat;
end;

procedure TFormCadVendaItem.EditDescricaoKeyPress(Sender: TObject; var Key: Char);
var
  ProdutoSelecionado: TItemVenda;
begin
  if Key = #13 then
  begin
    FormCadItem := TFormCadItem.Create(self, Fconnection);
    try
      ProdutoSelecionado := FormCadItem.SelecionarItem(EditDescricao.Text);

      if Assigned(ProdutoSelecionado) then
      begin
        DataSource.DataSet.Edit;
        DataSource.DataSet.FieldByName('PRODUTO_ID').AsInteger := ProdutoSelecionado.IDProduto;
        DataSource.DataSet.FieldByName('QUANTIDADE').AsFloat := 1;
        DataSource.DataSet.FieldByName('PRECO_UNITARIO').AsCurrency := ProdutoSelecionado.PrecoUnitario;
        DataSource.DataSet.FieldByName('VALOR_TOTAL').AsCurrency := ProdutoSelecionado.PrecoUnitario;
      end;
    finally
      ProdutoSelecionado.Free;
      FormCadItem.Free;
    end;
  end;
end;

end.
