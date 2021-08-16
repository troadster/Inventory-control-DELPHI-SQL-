unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdHashMessageDigest, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus;

type
  TAuth = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Auth: TAuth;
  access: string;

implementation

{$R *.dfm}

uses Unit1, Unit2, unit5;

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

function md5(s: string): string;
begin
  Result := '';
  with TIdHashMessageDigest5.Create do
    try
      Result := AnsiLowerCase(HashStringAsHex(s));
    finally
      Free;
    end;
end;

function LoadSettings: boolean;
var
  Sett: TStringList;
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + 'settings';
  if FileExists(Path) then
  begin
    Sett := TStringList.Create;
    Sett.LoadFromFile(Path);
    if Pars('<checkbox1>', Sett.Text, '</checkbox1>') = 'True' then
      Main.CheckBox1.Enabled := true;
    Settings.Edit1.Text := Pars('<host>', Sett.Text, '</host>');
    Settings.Edit2.Text := Pars('<login>', Sett.Text, '</login>');
    Settings.Edit3.Text := Pars('<pass>', Sett.Text, '</pass>');
    Settings.Edit4.Text := Pars('<db>', Sett.Text, '</db>');
    Sett.Free;
  end
  else
    Result := False;
  Result := true;
end;

procedure TAuth.Button1Click(Sender: TObject);
var
  s: string;
begin
  access := trim(Settings.SQL('SELECT access FROM Users where login=' + #39 +
    LabeledEdit1.Text + #39 + ' and pass=' + #39 + md5(LabeledEdit2.Text) + #39,
    'access', Main.ADOQuery1));
  if access = '' then
    ShowMessage('Ошибка авторизации')
  else if access = '1' then
  begin
    Auth.Hide;

    Main.ShowModal;
  end
  else if access = '2' then
  begin
    Auth.Hide;

    MissProd.ShowModal;
  end;

end;

procedure TAuth.FormShow(Sender: TObject);
begin
  if LoadSettings then
    Settings.Button1.Click;
end;

procedure TAuth.N1Click(Sender: TObject);
begin
  Settings.ShowModal;
end;

end.
