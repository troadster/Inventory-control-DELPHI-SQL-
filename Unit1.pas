unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  Products = record
    Code: string;
    Name: string;
    c_id: integer;
    count: integer;
    price: Extended;
    plist_id: integer;
    normal: integer;
  end;

  TSettings = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    function SQL(query, param: string; var ADOQuery: TADOQuery): string;
    function Search_BarCode(barcode: string; var ADOQuery: TADOQuery): Products;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Settings: TSettings;

implementation

{$R *.dfm}

uses Unit2;

function TSettings.SQL(query, param: string; var ADOQuery: TADOQuery): string;
var
  f: TField;
  s: string;
begin
  with ADOQuery do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add(query);
    Active := True;
    f := ADOQuery.Fieldbyname(param);
  end;
  while not ADOQuery.Eof do
  begin
    s := s + #13#10 + f.AsString;
    ADOQuery.Next;
  end;
  result := s;
end;
function TSettings.Search_BarCode(barcode: string; var ADOQuery: TADOQuery)
  : Products;
var
  itm: Products;
begin
  with ADOQuery do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * from product where code=' + barcode);
    Active := True;
    itm.Code := ADOQuery.Fieldbyname('code').AsString;
    itm.Name := ADOQuery.Fieldbyname('name').AsString;
    itm.c_id := ADOQuery.Fieldbyname('c_id').AsInteger;
    itm.count := ADOQuery.Fieldbyname('count').AsInteger;
    itm.price := ADOQuery.Fieldbyname('price').AsExtended;
    itm.plist_id := ADOQuery.Fieldbyname('plist_id').AsInteger;
    itm.normal := ADOQuery.Fieldbyname('normal').AsInteger;
  end;
  result := itm;
end;

procedure TSettings.Button1Click(Sender: TObject);
begin
  ADOConnection1.ConnectionString := 'Provider=SQLNCLI11.1;Password=' +
    Edit3.Text + ';Persist Security Info=True;User ID=' + Edit2.Text +
    ';Initial Catalog=' + Edit4.Text + ';Data Source=' + Edit1.Text;
  try
    ADOConnection1.Connected := True
  except

    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;

  end;
  if ADOConnection1.Connected then
  begin
    ShowMessage('Успешно подключились');
    Main.SaveSettings;
    edit1.Enabled:=false;
    edit2.Enabled:=false;
    edit3.Enabled:=false;
    edit4.Enabled:=false;
    Button1.Enabled := False;
    Main.ActivateObj(True);
  end
  else
  begin
    ShowMessage('Не удалось подключиться');
    Main.ActivateObj(False);
  end;

end;

end.
