program ProjectRead;

uses
  Vcl.Forms,
  uFormCadBase in 'Base\uFormCadBase.pas' {FormCadBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCadBase, FormCadBase);
  Application.Run;
end.
