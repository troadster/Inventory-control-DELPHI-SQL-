object Product: TProduct
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSizeToolWin
  ClientHeight = 354
  ClientWidth = 360
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
  object Image1: TImage
    Left = 192
    Top = 156
    Width = 95
    Height = 73
    PopupMenu = PopupMenu1
    Stretch = True
  end
  object Label1: TLabel
    Left = 24
    Top = 102
    Width = 97
    Height = 13
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1090#1086#1074#1072#1088#1072':'
  end
  object Label2: TLabel
    Left = 24
    Top = 142
    Width = 30
    Height = 13
    Caption = #1062#1077#1085#1072':'
  end
  object Label3: TLabel
    Left = 24
    Top = 188
    Width = 64
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
  end
  object Label4: TLabel
    Left = 24
    Top = 232
    Width = 97
    Height = 13
    Caption = #1053#1086#1088#1084#1072' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072':'
  end
  object Button1: TButton
    Left = 78
    Top = 323
    Width = 201
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object edt1: TLabeledEdit
    Left = 24
    Top = 40
    Width = 313
    Height = 21
    EditLabel.Width = 63
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072':'
    MaxLength = 13
    NumbersOnly = True
    TabOrder = 1
    OnChange = edt1Change
  end
  object edt2: TLabeledEdit
    Left = 24
    Top = 75
    Width = 313
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 115
    Width = 313
    Height = 21
    TabOrder = 3
  end
  object edt3: TLabeledEdit
    Left = 24
    Top = 296
    Width = 313
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    TabOrder = 4
  end
  object se2: TSpinEdit
    Left = 24
    Top = 207
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 5
    Value = 0
  end
  object Edit1: TEdit
    Left = 24
    Top = 164
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '0'
  end
  object SpinEdit1: TSpinEdit
    Left = 24
    Top = 251
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 7
    Value = 0
  end
  object Barcode1: TBarcode
    Height = 73
    Top = 0
    Left = 0
    Modul = 1
    Ratio = 2.000000000000000000
    Typ = bcCodeEAN13
  end
  object PopupMenu1: TPopupMenu
    Left = 144
    Top = 160
    object N1: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 296
    Top = 168
  end
end
