program ProjectRead;

uses
  Vcl.Forms,
  uFormCadBase in 'Base\uFormCadBase.pas' {FormCadBase},
  uDMCadBase in 'Base\uDMCadBase.pas' {DMCadBase},
  uFormCadPessoa in 'Cadastro\uFormCadPessoa.pas' {FormCadPessoa},
  uConstante in 'uConstante.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCadPessoa, FormCadPessoa);
  Application.Run;
end.
