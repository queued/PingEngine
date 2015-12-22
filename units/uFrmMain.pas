unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdRawBase, IdRawClient, IdIcmpClient, Vcl.StdCtrls,
  Vcl.Graphics, Vcl.Buttons, PngBitBtn, IdThreadComponent, Winapi.ShlObj;

type
  TDataType = (dtURL, dtName);

  TfrmMain = class(TForm)
    lblPing: TLabel;
    lblPingStatus: TLabel;
    Bevel2: TBevel;
    IdICMP: TIdIcmpClient;
    imgStatus: TImage;
    btnExit: TPngBitBtn;
    PingThread: TIdThreadComponent;
    lstPingHistory: TListBox;
    Bevel1: TBevel;
    btnAbout: TPngBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure PingThreadRun(Sender: TIdThreadComponent);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstPingHistoryDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnAboutClick(Sender: TObject);
  private
    { Private Declarations }

    procedure SetupAppFolder;
    procedure ExtractResources;
  public
    Path: string;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uFrmAbout;

{$R *.dfm}

function LocalAppDataPath : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  AppDataPath: array [0..MaxChar] of char;
begin
  SHGetFolderPath(0, CSIDL_LOCAL_APPDATA, 0, SHGFP_TYPE_CURRENT, @AppDataPath[0]);
  Result := StrPas(AppDataPath);
end;

procedure TfrmMain.SetupAppFolder;
begin
  Path := LocalAppDataPath + '\PingEngine';

  if not DirectoryExists(Path) then
  begin
    CreateDirectory(PChar(Path), nil);
    ExtractResources;
  end;
end;

procedure TfrmMain.ExtractResources;
var
  RStream: array[0..3] of TResourceStream;
  FStream: array[0..3] of TFileStream;
  I: Integer;
begin
  RStream[0] := TResourceStream.Create(hInstance, 'STATUS_NEUTRAL', RT_RCDATA);
  RStream[1] := TResourceStream.Create(hInstance, 'STATUS_GOOD', RT_RCDATA);
  RStream[2] := TResourceStream.Create(hInstance, 'STATUS_MODERATED', RT_RCDATA);
  RStream[3] := TResourceStream.Create(hInstance, 'STATUS_BAD', RT_RCDATA);

  try
    FStream[0] := TFileStream.Create(Path + '\status_neutral.png', fmCreate);
    FStream[1] := TFileStream.Create(Path + '\status_good.png', fmCreate);
    FStream[2] := TFileStream.Create(Path + '\status_moderated.png', fmCreate);
    FStream[3] := TFileStream.Create(Path + '\status_bad.png', fmCreate);

    try
      for I := 0 to Length(FStream) - 1 do
        FStream[I].CopyFrom(RStream[I], 0);
    finally
      for I := 0 to Length(FStream) - 1 do
        FStream[I].Free;
    end;
  finally
    for I := 0 to Length(RStream) - 1 do
      RStream[I].Free;
  end;
end;

procedure TfrmMain.PingThreadRun(Sender: TIdThreadComponent);
var
  Latency: Integer;
  PingHistoryString: string;
begin
  Sleep(1000);
  Application.ProcessMessages;
  IdICMP.Ping();

  lstPingHistory.TopIndex := lstPingHistory.Items.Count - 1;
  lstPingHistory.Repaint;
  lstPingHistory.Update;
  Application.ProcessMessages;

  Latency := IdICMP.ReplyStatus.MsRoundTripTime;
  lblPing.Caption := IntToStr(Latency) + 'ms';
  PingHistoryString := '[' + FormatDateTime('HH:MM:SS', Now) + '] Latência aproximada: ~ '
                            + lblPing.Caption;

  frmMain.Caption := Application.Title + ' (' +IntToStr(Latency) + 'ms)';

  if (Latency <= 85) then
  begin
    lblPingStatus.Caption := 'Excelente';
    lblPingStatus.Font.Color := clWebForestGreen;
    lblPing.Font.Color := clWebForestGreen;
    lstPingHistory.Items.AddObject(PingHistoryString, Pointer(clWebForestGreen));
    imgStatus.Picture.LoadFromFile(Path + '\status_good.png');
  end
  else if (Latency >= 86) and (Latency < 140) then
  begin
    lblPingStatus.Caption := 'Moderado';
    lblPingStatus.Font.Color := clWebGreenYellow;
    lblPing.Font.Color := clWebGreenYellow; // clWebOrangeRed
    lstPingHistory.Items.AddObject(PingHistoryString, Pointer(clWebOrange));
    imgStatus.Picture.LoadFromFile(Path + '\status_moderated.png');
  end
  else if Latency >= 140 then
  begin
    lblPingStatus.Caption := 'Péssimo';
    lblPingStatus.Font.Color := clWebDarkRed;
    lblPing.Font.Color := clWebDarkRed;
    lstPingHistory.Items.AddObject(PingHistoryString, Pointer(clWebDarkRed));
    imgStatus.Picture.LoadFromFile(Path + '\status_bad.png');
  end;
end;

procedure TfrmMain.btnAboutClick(Sender: TObject);
begin
  frmAbout.ModalResult := mrNone;
  frmAbout.ShowModal;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PingThread.Stop;
  PingThread.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SetupAppFolder; // Bootstrap from here

  IdICMP.Host := 'br.leagueoflegends.com';
  lblPing.Caption := '0ms';
  lblPingStatus.Caption := 'Neutro';
  imgStatus.Picture.LoadFromFile(Path + '\status_neutral.png');

  frmMain.Caption := Application.Title + ' (0ms)';

  lstPingHistory.Style := lbOwnerDrawFixed;
  lstPingHistory.Items.Clear;

  PingThread.Start;
end;

procedure TfrmMain.lstPingHistoryDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with Control as TListBox do
  begin
    Canvas.FillRect(Rect);
    Canvas.Font.Color := TColor(Items.Objects[Index]);
    Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
  end;
end;

end.
