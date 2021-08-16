unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB, Data.Win.ADODB, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls, unit1,
  Barcode;

type
  TMain = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Elfkbnm1: TMenuItem;
    Button3: TButton;
    Button4: TButton;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Button5: TButton;
    Edit1: TLabeledEdit;
    Button6: TButton;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    procedure Elfkbnm1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ActivateObj(active: boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button6Click(Sender: TObject);
    procedure SaveSettings;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams) ; override;
  public
    { Public declarations }
  end;

var
  Main: TMain;
  table: integer;

implementation

{$R *.dfm}

uses unit3,unit4;

procedure TMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

function Pars(T_, ForS, _T: string): string;
var
  a, b: integer;
begin
  Result := '';
  if (T_ = '') or (ForS = '') or (_T = '') then
    Exit;
  a := Pos(T_, ForS);
  if a = 0 then
    Exit
  else
    a := a + Length(T_);
  ForS := Copy(ForS, a, Length(ForS) - a + 1);
  b := Pos(_T, ForS);
  if b > 0 then
    Result := Copy(ForS, 1, b - 1);
end;

procedure TMain.SaveSettings;
var
  Sett: TStringList;
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + 'settings';
  Sett := TStringList.Create;
  Sett.Add('<host>' + Settings.Edit1.Text + '</host>');
  Sett.Add('<login>' + Settings.Edit2.Text + '</login>');
  Sett.Add('<pass>' + Settings.Edit3.Text + '</pass>');
  Sett.Add('<db>' + Settings.Edit4.Text + '</db>');
  if Main.CheckBox1.Enabled then
    Sett.Add('<checkbox1>True</checkbox1>')
  else
    Sett.Add('<checkbox1>False</checkbox1>');
  Sett.SaveToFile(Path);
  Sett.Free;
End;

procedure TMain.Button1Click(Sender: TObject);
begin
try
Settings.SQL('DELETE FROM MISSPROD','',ADOQuery1);
except
end;
try
Settings.SQL('INSERT INTO MISSPROD SELECT code,name,(normal-count) from product where count < FLOOR (normal / 100.0 * 40)','',ADOQuery1);
except
 on e: Exception do
      begin
        if pos('CommandText does not return a result set', e.Message) <> 0 then
        begin
          ShowMessage('Запрос отослан в отдел закупок!');
        end
        else

          ShowMessage(e.Message);
end;
end;
end;

procedure TMain.Button2Click(Sender: TObject);
begin
  prod.Name := 'Добавить товар';
  Product.ShowModal;
end;

procedure TMain.Button3Click(Sender: TObject);
var
  s: string;
begin
  s := Settings.SQL('SELECT COUNT(id) as cnt FROM category', 'cnt',
    Settings.ADOQuery1);
  Button3.Caption := 'Категории (' + s + ')';
  Settings.ADOQuery1.SQL.Clear;
  Settings.ADOQuery1.SQL.Add('SELECT * FROM category;');
  try
    Settings.ADOQuery1.active := true;
  except

    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
  table := 1;
end;

procedure TMain.Button4Click(Sender: TObject);
var
  s: string;
begin
  s := Settings.SQL('SELECT COUNT(code) as cnt FROM product', 'cnt',
    Settings.ADOQuery1);
  Button4.Caption := 'Отобразить все продукты (' + s + ')';
  Settings.ADOQuery1.SQL.Clear;
  Settings.ADOQuery1.SQL.Add('SELECT * FROM product;');
  try
    Settings.ADOQuery1.active := true;
  except

    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
  table := 2;
end;

procedure CreateBar_Codes(BCodes: TStringList);
var
  Img: TBitmap;
  i: integer;
  Barcode: tBarcode;
begin

  for i := 0 to BCodes.Count - 1 do
  begin
    Img := TBitmap.Create;
    Barcode := tBarcode.Create(nil);
    Barcode.Height := 50;
    Img.Height := 50;
    Img.Width := 95;
    Barcode.Text := BCodes[i];
    Barcode.DrawBarcode(Img.Canvas);
    Img.SaveToFile(ExtractFilePath(Application.ExeName) + BCodes[i] + '.bmp');
    Img.Free;
    Barcode.Free;
  end;

end;

procedure TMain.Button5Click(Sender: TObject);
var
  s,normal: string;
  i: integer;
  DataProd: array of Products;
  DataCategory: TStringList;
  Res, BCodes: TStringList;
  sum: Extended;
  style, form: string;
begin
  Button5.Enabled := False;
  SetLength(DataProd, 0);
  DataCategory := TStringList.Create;
  BCodes := TStringList.Create;
  i := 0;
  DataCategory.Text := trim(Settings.SQL('SELECT name FROM CATEGORY', 'name',
    ADOQuery1));
  with ADOQuery1 do
  begin
    active := False;
    SQL.Clear;
    SQL.Add('SELECT * From Product');
    active := true;
  end;
  while not ADOQuery1.Eof do
  begin
    SetLength(DataProd, Length(DataProd) + 1);
    DataProd[i].Code := ADOQuery1.Fieldbyname('code').AsString;
    DataProd[i].Name := ADOQuery1.Fieldbyname('name').AsString;
    DataProd[i].c_id := ADOQuery1.Fieldbyname('c_id').AsInteger;
    DataProd[i].Count := ADOQuery1.Fieldbyname('count').AsInteger;
    DataProd[i].price := ADOQuery1.Fieldbyname('price').AsExtended;
    DataProd[i].plist_id := ADOQuery1.Fieldbyname('plist_id').AsInteger;
    DataProd[i].normal := ADOQuery1.Fieldbyname('normal').AsInteger;
    ADOQuery1.Next;
    Inc(i);
  end;
  Res := TStringList.Create;
  Res.Add('<table border="1"><caption>Отчёт о товарах</caption><tr><th>№</th><th>Наименование'+
  '</th><th>Категория</th><th>Колличество</th><th>Нехватка</th><th>Цена (руб.)</th><th>Сумма (руб.)</th></tr>');
  sum := 0;
  for i := 0 to Length(DataProd) - 1 do
  begin
  normal:='';
  if DataProd[i].count <= round(DataProd[i].normal / 100 * 40) then
  normal:=' style="background:red"';
    BCodes.Add(DataProd[i].Code);
    Res.Add('<tr'+normal+'><td>' + IntTostr(i + 1) + '</td><td>' + DataProd[i].Name +
      '</td><td>' + DataCategory[(DataProd[i].c_id) - 1] + '</td><td>' +
      IntTostr(DataProd[i].Count) + '</td><td>' +IntToStr(DataProd[i].normal-DataProd[i].count)+ '</td><td>'+ FloatToStr(DataProd[i].price)
      + '</td><td>' + FloatToStr(DataProd[i].price * DataProd[i].Count) +
      '</td></tr>');
    sum := sum + (DataProd[i].price * DataProd[i].Count);
  end;
  Res.Add('<tr><td><b>Итого:</b></td><td></td><td></td><td></td><td></td><td></td><td>' +
    FloatToStr(sum) + '</td></tr>');
  Res.Add('</table>');
  if FileExists(ExtractFilePath(Application.ExeName) + 'price') then
  begin
    CreateBar_Codes(BCodes);
    Res.Add('<br><br><center><b>Ценники:</b></center><br>');
    s := Res.Text;
    Res.Text := '';
    Res.LoadFromFile(ExtractFilePath(Application.ExeName) + 'price');
    style := '<style>' + Pars('<style>', Res.Text, '</style>') + '</style>';
    form := '<div class="price">' + Pars('<div class="price">', Res.Text,
      '</div>') + '</div>';
    Res.Text := style + #13#10 + s;
    for i := 0 to Length(DataProd) - 1 do
    begin
      s := form;
      s := StringReplace(s, '{name}', DataProd[i].Name,
        [rfReplaceAll, rfIgnoreCase]);
      s := StringReplace(s, '{price}', FloatToStr(DataProd[i].price),
        [rfReplaceAll, rfIgnoreCase]);
      s := StringReplace(s, '{img}', DataProd[i].Code + '.bmp',
        [rfReplaceAll, rfIgnoreCase]);
      Res.Add(s);
    end;
  end
  else
    Res.Add('<center><b>Ценники не удалось сгенерировать..</b></censter>');
  Res.SaveToFile(ExtractFilePath(Application.ExeName) + 'Отчёт.html');
  Res.Free;
  DataCategory.Free;
  BCodes.Free;
  ShowMessage('Отчёт создан!'+#13#10+ExtractFilePath(Application.ExeName) + 'Отчёт.html');
  Button5.Enabled := true;
end;

procedure TMain.ActivateObj(active: boolean);
begin
  Main.Button2.Enabled := active;
  Main.Button3.Enabled := active;
  Main.Button4.Enabled := active;
  Main.Button5.Enabled := active;
  Main.Button6.Enabled := active;
  Main.CheckBox1.Enabled := active;
  Main.Edit1.Enabled := active;
  Main.DBGrid1.Enabled := active;
end;

function JustDigits(str: string): boolean;
var
  i: integer;
begin

  for i := 1 to Length(str) do
    if str[i] in ['0' .. '9'] then
    else
    begin
      Result := False;
      Exit;
    end;
  Result := true;
end;

procedure TMain.Button6Click(Sender: TObject);
var
  s: string;
begin
  Settings.ADOQuery1.SQL.Clear;
  if JustDigits(Edit1.Text) and (Length(Edit1.Text) > 5) then
    Settings.ADOQuery1.SQL.Add('SELECT * FROM product where (code = ' +
      Edit1.Text + ') or (plist_id = ' + Edit1.Text + ')')
  else
    Settings.ADOQuery1.SQL.Add('SELECT * FROM product where name like ' + #39 +
      '%' + Edit1.Text + '%' + #39);
  try
    Settings.ADOQuery1.active := true;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TMain.Elfkbnm1Click(Sender: TObject);
begin
  DBGrid1.DataSource.DataSet.Delete;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
  Auth.Close;
  end;

procedure TMain.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 36 then
  begin
    prod := Settings.Search_BarCode(Edit1.Text, ADOQuery1);
    if prod.Code = '' then
      if CheckBox1.Checked then
      begin
        prod.Code := Edit1.Text;
        prod.Name := 'Добавить товар';
        Product.ShowModal;
        Edit1.Text := '';
      end
      else
        ShowMessage('Неизвестный товар!')
    else
    begin
      Product.ShowModal;
      Edit1.Text := '';
    end;
  end;
end;

end.
