object frmFirstRun: TfrmFirstRun
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmFirstRun'
  ClientHeight = 131
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblHello: TLabel
    Left = 8
    Top = 0
    Width = 311
    Height = 52
    Caption = 
      'Macaco '#233' irm'#227'o! :-)'#13#10#13#10'Parece que esta '#233' a primeira vez que voc'#234 +
      ' est'#225' utilizando o Ping Engine. Insira seu servidor para continu' +
      'ar.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Bevel: TBevel
    Left = -10
    Top = 58
    Width = 345
    Height = 1
    Shape = bsTopLine
  end
  object lblServer: TLabel
    Left = 6
    Top = 69
    Width = 44
    Height = 13
    Caption = 'Servidor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = -10
    Top = 93
    Width = 345
    Height = 1
    Shape = bsTopLine
  end
  object lblLink: TRzURLLabel
    Left = 6
    Top = 105
    Width = 84
    Height = 13
    Cursor = crHandPoint
    Caption = 'Ilha da Macacada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    URL = 'https://www.facebook.com/groups/ilhaoficial'
  end
  object cmbServer: TComboBox
    Left = 136
    Top = 66
    Width = 177
    Height = 21
    Cursor = crHandPoint
    Style = csDropDownList
    DropDownCount = 9
    TabOrder = 0
    Items.Strings = (
      'LAN'
      'LAS'
      'NA'
      'BR'
      'KR'
      'EUNE'
      'EUW'
      'OCE'
      'RU'
      'TR')
  end
  object btnDone: TPngBitBtn
    Left = 216
    Top = 100
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = '&Conclu'#237'do'
    Enabled = False
    TabOrder = 1
    OnClick = btnDoneClick
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000001974455874536F6674776172650041646F626520496D616765526561
      647971C9653C000001D04944415478DA63FCFFFF3F03258091EE06442CF69FF8
      FBF79F776B93B636926C40F822BF89E24262797FFEFC6178F0E851D5B6BC7DED
      441B10B6D017AC59595E81E1DBF71F0CB7EFDD65B87FEF610D5106842EF09928
      26280AD4ACC8F00F08AFDDB809D2CCF0EBE76F4EB801D97B129CFFFEF9AB34C3
      63F16C64CD21F3419A45F2148136FF07C2EB40CD77EF3CF8FBE7F71F9E634D67
      7E800DC8DE9D60F3E7CFDF55C25C8292CFDEBC285810BC6A224873F03C6FA866
      79A0BDFF196EDCB805D77CBCF9EC0F702066EE8C7303DA3C4F41444E9A9D959D
      E1EC8D8B2005C5C090961113142E9107D9FCFF2FC38D9BB719EEDD7908D67CA2
      E5DC0F7834A66E89E2FCF7E7FF37615E210629514986AFDFBF313C7DF98C8199
      8999414C5494E13F1303C3AD1B60CDFFFEFCFECB7DB215A1191E8DB1AB42B8FE
      FDFDF755985F884146529AE1DFBFBF0CBFFEFD6600BA9AE1E6CD3B0C0FEE3CFA
      0F7411D7A9B6F33FD003181E88C0C0E2FAF70768889010839C9C0CC31FA021B7
      6FDC657870F7D1FF3F20CDED173034632424AFC9CE6043444545187EFFF9CDF0
      F0EE63B0E6D31D17B16AC69A121DDBACB8FEFEFBF7F5D78F5F7F807EE639D379
      F127BE3482352199571B71016DFE7BB6EB125ECD380D200500003D651960AF74
      142F0000000049454E44AE426082}
  end
  object tmrCheck: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrCheckTimer
    Left = 8
    Top = 8
  end
end
