unit uFrmFirstRun;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzLabel, Vcl.StdCtrls, Vcl.Buttons,
  PngBitBtn, Vcl.ExtCtrls, System.IniFiles;

type
  TfrmFirstRun = class(TForm)
    lblHello: TLabel;
    Bevel: TBevel;
    lblServer: TLabel;
    cmbServer: TComboBox;
    btnDone: TPngBitBtn;
    Bevel1: TBevel;
    lblLink: TRzURLLabel;
    tmrCheck: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrCheckTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDoneClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CloseWindow;
  end;

var
  frmFirstRun: TfrmFirstRun;

implementation

uses
  uFrmMain;

{$R *.dfm}

procedure TfrmFirstRun.CloseWindow;
begin
  frmMain.Show;
  frmFirstRun.Close;
end;

procedure TfrmFirstRun.btnDoneClick(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(frmMain.SettingsFile);
  frmMain.Server := cmbServer.Text;

  try
    Ini.WriteString('APP', 'Server', frmMain.Server);
    Ini.WriteBool('APP', 'Installed', True);

    Ini.UpdateFile;
  finally
    Ini.Free;

    CloseWindow;
  end;
end;

procedure TfrmFirstRun.FormCreate(Sender: TObject);
begin
  frmFirstRun.Caption := Application.Title;
end;

procedure TfrmFirstRun.FormShow(Sender: TObject);
begin
  tmrCheck.Enabled := True;
end;

procedure TfrmFirstRun.tmrCheckTimer(Sender: TObject);
begin
  if cmbServer.Text <> '' then
    btnDone.Enabled := True
  else
    btnDone.Enabled := False;
end;

end.
