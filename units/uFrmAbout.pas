unit uFrmAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  PngBitBtn, Winapi.UrlMon;

type
  TfrmAbout = class(TForm)
    btnClose: TPngBitBtn;
    Bevel1: TBevel;
    imgAppIcon: TImage;
    lblCreator: TLabel;
    lblCreatorName: TLabel;
    lblPingEngine: TLabel;
    lblFacebook: TLabel;
    lblFacebookLink: TLabel;
    lblVersionNumber: TLabel;
    lblVersion: TLabel;
    lblLink: TLabel;
    lblGithub: TLabel;
    lblGithubLink: TLabel;
    lblIGN: TLabel;
    lblNickname: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure lblLinkClick(Sender: TObject);
    procedure lblLinkMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblFacebookLinkClick(Sender: TObject);
    procedure lblGithubLinkClick(Sender: TObject);
    procedure lblFacebookLinkMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblGithubLinkMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblFacebookLinkMouseLeave(Sender: TObject);
    procedure lblGithubLinkMouseLeave(Sender: TObject);
    procedure lblLinkMouseLeave(Sender: TObject);
  protected
    procedure WMEnable(var Message: TWMEnable); message WM_ENABLE;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.WMEnable(var Message: TWMEnable);
begin
  if not Message.Enabled then
    EnableWindow(Handle, True);
  inherited;
end;

procedure TfrmAbout.btnCloseClick(Sender: TObject);
begin
  frmAbout.ModalResult := mrClose;
  frmAbout.CloseModal;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  frmAbout.Caption := Application.Title;
  lblLink.Font.Color := clWebRoyalBlue;
  lblGithubLink.Font.Color := clWebRoyalBlue;
  lblFacebookLink.Font.Color := clWebRoyalBlue;
end;

procedure TfrmAbout.lblFacebookLinkClick(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://facebook.com/miranda9k');
end;

procedure TfrmAbout.lblFacebookLinkMouseLeave(Sender: TObject);
begin
  lblFacebookLink.Font.Color := clWebRoyalBlue;
end;

procedure TfrmAbout.lblFacebookLinkMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  lblFacebookLink.Font.Color := clWebFirebrick;
end;

procedure TfrmAbout.lblGithubLinkClick(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://github.com/queued');
end;

procedure TfrmAbout.lblGithubLinkMouseLeave(Sender: TObject);
begin
  lblGithubLink.Font.Color := clWebRoyalBlue;
end;

procedure TfrmAbout.lblGithubLinkMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  lblGithubLink.Font.Color := clWebFirebrick;
end;

procedure TfrmAbout.lblLinkClick(Sender: TObject);
begin
  HlinkNavigateString(nil, 'https://facebook.com/groups/ilhaoficial');
end;

procedure TfrmAbout.lblLinkMouseLeave(Sender: TObject);
begin
  lblLink.Font.Color := clWebRoyalBlue;
end;

procedure TfrmAbout.lblLinkMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  lblLink.Font.Color := clWebFirebrick;
end;

end.
