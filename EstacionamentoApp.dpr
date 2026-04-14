program EstacionamentoApp;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uEntrada in 'uEntrada.pas' {frmEntrada},
  uSaida in 'uSaida.pas' {frmSaida},
  uRelatorio in 'uRelatorio.pas' {frmRelatorio},
  uConfig in 'uConfig.pas' {frmConfig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Sistema de Estacionamento';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
