unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.ValEdit,
  Vcl.ButtonGroup, Vcl.DBGrids, Unit1, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TMissProd = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    DataSource1: TDataSource;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateParams(var Params: TCreateParams) ; override;
  public
    { Public declarations }
  end;

var
  MissProd: TMissProd;

implementation

{$R *.dfm}
uses
Unit4;

procedure UpdateBD;
begin
  MissProd.ADOQuery1.SQL.Add('SELECT code as "Штрих-Код",name as "Наименование",count as "Нехватка (ед.)" FROM MISSPROD');
try
    MissProd.ADOQuery1.active := true;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TMissProd.Button2Click(Sender: TObject);
begin
UpdateBD;
end;

procedure TMissProd.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

procedure TMissProd.Button1Click(Sender: TObject);
begin
  DBGrid1.DataSource.DataSet.Delete;
end;

procedure TMissProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Auth.Close;
end;

procedure TMissProd.FormShow(Sender: TObject);
begin
UpdateBD;
end;

end.
