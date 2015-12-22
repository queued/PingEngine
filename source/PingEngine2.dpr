program PingEngine2;

{$R *.dres}

uses
  Vcl.Forms,
  uFrmMain in '..\units\uFrmMain.pas' {frmMain},
  uFrmAbout in '..\units\uFrmAbout.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ping Engine';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
