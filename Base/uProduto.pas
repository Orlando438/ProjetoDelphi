unit uproduto;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, Data.DB,
  System.JSON, Datasnap.DBClient;

type
  TItemVenda = class
  public
    IDProduto: Integer;
    Quantidade: Integer;
    PrecoUnitario: Currency;
    ValorTotal: Currency;
  end;

  TVenda = class
  public
    ID: Integer;
    DataVenda: TDateTime;
    NomeCliente: string;
    CEP: string;
    Rua: string;
    Numero: string;
    Bairro: string;
    Cidade: string;
    Estado: string;
    ValorTotal: Currency;
    Itens: TObjectList<TItemVenda>;

    constructor Create;
    destructor Destroy; override;

    procedure DataSetToObject(VendaDataSet, ItensDataSet: TDataSet);
    function ObjectToJSON: string;
  end;

implementation

uses
  System.JSON.Writers, System.JSON.Types;

{ TVenda }

constructor TVenda.Create;
begin
  inherited;
  Itens := TObjectList<TItemVenda>.Create(True);
end;

destructor TVenda.Destroy;
begin
  Itens.Free;
  inherited;
end;

procedure TVenda.DataSetToObject(VendaDataSet, ItensDataSet: TDataSet);
begin
  if not Assigned(VendaDataSet) then Exit;

  ID          := VendaDataSet.FieldByName('ID').AsInteger;
  DataVenda   := VendaDataSet.FieldByName('DATA_VENDA').AsDateTime;
  NomeCliente := VendaDataSet.FieldByName('NOME_CLIENTE').AsString;
  CEP         := VendaDataSet.FieldByName('CEP').AsString;
  Rua         := VendaDataSet.FieldByName('RUA').AsString;
  Numero      := VendaDataSet.FieldByName('NUMERO').AsString;
  Bairro      := VendaDataSet.FieldByName('BAIRRO').AsString;
  Cidade      := VendaDataSet.FieldByName('CIDADE').AsString;
  Estado      := VendaDataSet.FieldByName('ESTADO').AsString;
  ValorTotal  := VendaDataSet.FieldByName('VALOR_TOTAL').AsCurrency;

  Itens.Clear;
  if Assigned(ItensDataSet) then
  begin
    ItensDataSet.First;
    while not ItensDataSet.Eof do
    begin
      var Item := TItemVenda.Create;
      Item.IDProduto     := ItensDataSet.FieldByName('ID_PRODUTO').AsInteger;
      Item.Quantidade    := ItensDataSet.FieldByName('QUANTIDADE').AsInteger;
      Item.PrecoUnitario := ItensDataSet.FieldByName('PRECO_UNITARIO').AsCurrency;
      Item.ValorTotal    := ItensDataSet.FieldByName('VALOR_TOTAL').AsCurrency;

      Itens.Add(Item);
      ItensDataSet.Next;
    end;
  end;
end;

function TVenda.ObjectToJSON: string;
var
  JSONObject, EnderecoObj, ItemObj: TJSONObject;
  ItemsArray: TJSONArray;
  Item: TItemVenda;
begin
  JSONObject := TJSONObject.Create;
  try
    JSONObject.AddPair('ID', TJSONNumber.Create(Self.ID));
    JSONObject.AddPair('DataVenda', FormatDateTime('yyyy-mm-dd"T"hh:nn:ss', Self.DataVenda));
    JSONObject.AddPair('NomeCliente', Self.NomeCliente);

    EnderecoObj := TJSONObject.Create;
    EnderecoObj.AddPair('CEP', Self.CEP);
    EnderecoObj.AddPair('Rua', Self.Rua);
    EnderecoObj.AddPair('Numero', Self.Numero);
    EnderecoObj.AddPair('Bairro', Self.Bairro);
    EnderecoObj.AddPair('Cidade', Self.Cidade);
    EnderecoObj.AddPair('Estado', Self.Estado);
    JSONObject.AddPair('Endereco', EnderecoObj);

    ItemsArray := TJSONArray.Create;
    for Item in Self.Itens do
    begin
      ItemObj := TJSONObject.Create;
      ItemObj.AddPair('ProdutoID', TJSONNumber.Create(Item.IDProduto));
      ItemObj.AddPair('Quantidade', TJSONNumber.Create(Item.Quantidade));
      ItemObj.AddPair('PrecoUnitario', TJSONNumber.Create(Item.PrecoUnitario));
      ItemObj.AddPair('ValorTotal', TJSONNumber.Create(Item.ValorTotal));
      ItemsArray.AddElement(ItemObj);
    end;
    JSONObject.AddPair('Itens', ItemsArray);

    JSONObject.AddPair('ValorTotal', TJSONNumber.Create(Self.ValorTotal));

    Result := JSONObject.ToJSON;
  finally
    JSONObject.Free;
  end;
end;


end.

