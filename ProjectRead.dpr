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
  uFormRelatorioVenda in 'Base\uFormRelatorioVenda.pas' {FormRelatorioVenda},
  uFormRel in 'Cadastro\uFormRel.pas' {FormRel};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormRelatorioVenda, FormRelatorioVenda);
  Application.CreateForm(TFormRel, FormRel);
  Application.Run;
end.
