program ProjectRead;

uses
  Vcl.Forms,
  uFormCadBase in 'Base\uFormCadBase.pas' {FormCadBase},
  uDMCadBase in 'Base\uDMCadBase.pas' {DMCadBase},
  uConstante in 'uConstante.pas',
  uFormMenu in 'uFormMenu.pas' {FormMenu},
  uFormCadVenda in 'Cadastro\uFormCadVenda.pas' {FormCadVenda},
  uFormCadItem in 'Cadastro\uFormCadItem.pas' {FormCadItem},
  uFormCadVendaItem in 'Cadastro\uFormCadVendaItem.pas' {FormCadVendaItem},
  uProduto in 'Base\uProduto.pas',
  uFormRelBase in 'Base\uFormRelBase.pas' {FormRelBase},
  uDMRelBase in 'Base\uDMRelBase.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormRelBase, FormRelBase);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
