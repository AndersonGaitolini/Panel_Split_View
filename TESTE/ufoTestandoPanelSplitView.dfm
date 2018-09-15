object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 257
    Top = 51
    Width = 75
    Height = 25
    Caption = 'btn1'
    TabOrder = 1
    OnClick = btn1Click
  end
  object cbAnimation: TCheckBox
    Left = 257
    Top = 82
    Width = 97
    Height = 17
    Caption = 'Use Animation'
    TabOrder = 2
  end
  object cbCloseStyle: TCheckBox
    Left = 257
    Top = 105
    Width = 97
    Height = 17
    Caption = 'Compacto'
    TabOrder = 3
  end
  object pnlspltvw1: TPanelSplitView
    Left = 0
    Top = 0
    Width = 176
    Height = 242
    Align = alLeft
    Caption = 'pnlspltvw1'
    Color = cl3DDkShadow
    ParentBackground = False
    TabOrder = 0
    SplitViewState = Expandido
    SaveWidthSplitView = 0
    ImageVisibleWidth = 0
    UseAnimation = True
    Placement = svLeft
    CloseStyle = svColapse
    WidthCompact = 50
  end
end
