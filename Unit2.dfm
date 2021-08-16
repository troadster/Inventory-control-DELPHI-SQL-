object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1095#1105#1090' '#1090#1086#1074#1072#1088#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077
  ClientHeight = 451
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 127
    Width = 745
    Height = 320
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 10
      Top = 53
      Width = 727
      Height = 252
      DataSource = Settings.DataSource1
      DrawingStyle = gdsGradient
      Enabled = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Edit1: TLabeledEdit
      Left = 3
      Top = 26
      Width = 198
      Height = 21
      EditLabel.Width = 30
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1080#1089#1082
      Enabled = False
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object Button6: TButton
      Left = 224
      Top = 26
      Width = 75
      Height = 21
      Caption = #1048#1089#1082#1072#1090#1100
      Enabled = False
      TabOrder = 2
      OnClick = Button6Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 409
    Height = 121
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 201
      Top = 90
      Width = 189
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1085#1077#1080#1079#1074#1077#1089#1090#1085#1099#1077' '#1090#1086#1074#1072#1088#1099'?'
      Enabled = False
      TabOrder = 0
    end
    object Button2: TButton
      Left = 16
      Top = 24
      Width = 145
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1076#1091#1082#1090
      Enabled = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 16
      Top = 55
      Width = 145
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1105#1090
      Enabled = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button4: TButton
      Left = 200
      Top = 24
      Width = 190
      Height = 25
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074#1089#1077' '#1087#1088#1086#1076#1091#1082#1090#1099
      Enabled = False
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button3: TButton
      Left = 200
      Top = 55
      Width = 190
      Height = 25
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
      Enabled = False
      TabOrder = 4
      OnClick = Button3Click
    end
    object Button1: TButton
      Left = 16
      Top = 86
      Width = 169
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1079#1072#1087#1088#1086#1089' '#1085#1072' '#1079#1072#1082#1091#1087#1082#1091
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 936
    Top = 56
    object Elfkbnm1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = Elfkbnm1Click
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Settings.ADOConnection1
    Parameters = <>
    Left = 688
    Top = 24
  end
end
