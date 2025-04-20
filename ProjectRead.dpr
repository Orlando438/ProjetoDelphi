program ProjectRead;

uses
  Vcl.Forms,
  uFormCadBase in 'Base\uFormCadBase.pas' {FormCadBase},
  uDMCadBase in 'Base\uDMCadBase.pas' {DMCadBase},
  uFormCadPessoa in 'Cadastro\uFormCadPessoa.pas' {FormCadPessoa},
  uConstante in 'uConstante.pas',
  uFormMenu in 'uFormMenu.pas' {FormMenu},
  uFormCadCarro in 'Cadastro\uFormCadCarro.pas' {FormCadCarro},
  uFormCadVenda in 'Cadastro\uFormCadVenda.pas' {FormCadVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormMenu, FormMenu);
  Application.Run;
end.
