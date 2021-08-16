object MissProd: TMissProd
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074' '#1076#1083#1103' '#1079#1072#1082#1091#1087#1082#1080
  ClientHeight = 401
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 817
    Height = 369
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 0
    Top = 375
    Width = 107
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1079#1080#1094#1080#1102
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 706
    Top = 375
    Width = 111
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOQuery1: TADOQuery
    Connection = Settings.ADOConnection1
    Parameters = <>
    Left = 16
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 80
    Top = 216
  end
end
