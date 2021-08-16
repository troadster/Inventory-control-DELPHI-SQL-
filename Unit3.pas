unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ExtCtrls, Unit1, FloatSpinEdit, Barcode, Vcl.Menus;

type
  TProduct = class(TForm)
    Button1: TButton;
    edt1: TLabeledEdit;
    Image1: TImage;
    edt2: TLabeledEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt3: TLabeledEdit;
    se2: TSpinEdit;
    Edit1: TEdit;
    Barcode1: TBarcode;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure edt1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Product: TProduct;
  prod: Products;

implementation

{$R *.dfm}

uses Unit2;

procedure TProduct.Button1Click(Sender: TObject);
var
  s: string;
begin
  if (edt1.Text <> '') and (edt1.Text <> '') and (edt1.Text <> '') and
    (ComboBox1.ItemIndex > -1) then
  begin
    s := Edit1.Text;
    s := StringReplace(s, ',', '.', [rfReplaceAll, rfIgnoreCase]);
    try
      if Product.Caption = 'Добавить товар' then
      begin
        Settings.SQL('INSERT INTO PRODUCT SELECT ' + edt1.Text + ', ' + #39 +
          edt2.Text + #39 + ' , ' + inttostr(ComboBox1.ItemIndex + 1) + ', ' +
          se2.Text + ',' + s + ',' + edt3.Text+','+SpinEdit1.Text, '', Main.ADOQuery1);
      end
      else
        Settings.SQL('UPDATE PRODUCT SET CODE=' + edt1.Text + ', NAME=' + #39 +
          edt2.Text + #39 + ', c_id=' + inttostr(ComboBox1.ItemIndex + 1) +
          ', count=' + se2.Text + ', price=' + s + ', plist_id=' + edt3.Text +
          ' where code=' + edt1.Text+ ', normal='+SpinEdit1.Text, '', Main.ADOQuery1);
    except
      on e: Exception do
      begin
        if pos('CommandText does not return a result set', e.Message) <> 0 then
        begin
          Main.Button4.Click;
          Product.Close;
        end
        else

          ShowMessage(e.Message);
      end;
    end;
  end
  else
    ShowMessage('Заполните все поля!');
end;

procedure TProduct.edt1Change(Sender: TObject);
begin

  Image1.Picture := nil;
  Barcode1.Text := edt1.Text;
  Barcode1.DrawBarcode(Image1.Canvas);

end;
procedure TProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edt1.Text:='';
edt2.Text:='';
edt3.Text:='';
ComboBox1.ItemIndex:=-1;
Edit1.Text:='0';
se2.Value:=0;
SpinEdit1.Value:=0;

end;

procedure TProduct.FormShow(Sender: TObject);
begin
  ComboBox1.Items.Text := trim(Settings.SQL('SELECT Name from category', 'name',
    Main.ADOQuery1));
  ComboBox1.ItemIndex := prod.c_id - 1;
  Product.Caption := prod.Name;
  edt1.Text := prod.Code;
  if prod.Name = 'Добавить товар' then
  begin
    prod.Name := '';
    Button1.Caption := 'Добавить';
  end;
  edt2.Text := prod.Name;
  Edit1.Text := FloatToStr(prod.price);
  se2.Value := prod.count;
  edt3.Text := inttostr(prod.plist_id);
  SpinEdit1.Value:=prod.normal;
  Image1.Picture := nil;
  Barcode1.Text := prod.Code;
  Barcode1.DrawBarcode(Image1.Canvas);
end;
procedure TProduct.N1Click(Sender: TObject);
begin
  SaveDialog1.InitialDir := GetCurrentDir;
  SaveDialog1.DefaultExt := 'bmp';
  if SaveDialog1.Execute then
  begin
    Image1.Picture.SaveToFile(SaveDialog1.FileName);
    Product.Close;
  end;
end;

end.
