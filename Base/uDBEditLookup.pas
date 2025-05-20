unit uDBEditLookup;

interface

uses
  System.Classes, Vcl.DBCtrls, Vcl.Forms, Vcl.Controls, System.SysUtils, Winapi.Windows;

type
  TDBEditLookup = class(TDBEdit)
  private
    FTabela: string;
    FFormClass: TFormClass;
    procedure Lookup;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  published
    property Tabela: string read FTabela write FTabela;
    property FormClass: TFormClass read FFormClass write FFormClass;
  end;

procedure Register;

implementation

uses
  Vcl.Dialogs; // Se quiser usar ShowMessage para teste

{ TDBEditLookup }

procedure TDBEditLookup.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then  // Vamos dizer que F2 chama o lookup
  begin
    Lookup;
    Key := 0; // Evitar bip
  end;
end;

procedure TDBEditLookup.Lookup;
var
  Form: TForm;
begin
  if Assigned(FFormClass) then
  begin
    Form := FFormClass.Create(nil);
    try
      Form.ShowModal;
      // Aqui você poderia ainda pegar um valor selecionado e preencher no Edit
    finally
      Form.Free;
    end;
  end
  else
    ShowMessage('Formulário de pesquisa não atribuído.');
end;

procedure Register;
begin
  RegisterComponents('MeusComponentes', [TDBEditLookup]);
end;

end.
