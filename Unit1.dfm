object Settings: TSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 227
  ClientWidth = 139
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 100
    Width = 30
    Height = 13
    Caption = #1051#1086#1075#1080#1085
  end
  object Label3: TLabel
    Left = 8
    Top = 146
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label4: TLabel
    Left = 8
    Top = 54
    Width = 89
    Height = 13
    Caption = #1048#1084#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  end
  object Button1: TButton
    Left = 8
    Top = 192
    Width = 121
    Height = 25
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 8
    Top = 119
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 8
    Top = 165
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 8
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 154
    Top = 80
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 154
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 154
    Top = 88
  end
end
