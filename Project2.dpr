program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Main},
  Unit1 in 'Unit1.pas' {Settings},
  Unit3 in 'Unit3.pas' {Product},
  Unit4 in 'Unit4.pas' {Auth},
  Unit5 in 'Unit5.pas' {MissProd},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.Title := 'Склад';
  Application.CreateForm(TAuth, Auth);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TSettings, Settings);
  Application.CreateForm(TProduct, Product);
  Application.CreateForm(TMissProd, MissProd);
  Application.Run;
end.
