program OrderSystem;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FMain},
  Utils in 'Utils.pas',
  UtilMensagens in 'UtilMensagens.pas' {$R *.res},
  uOrder in 'uOrder.pas' {FOrder},
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  uReport in 'uReport.pas' {FReport},
  uOrderSP in 'uOrderSP.pas' {FOrderSP},
  uRegister in 'uRegister.pas' {FRegister},
  uProduct in 'uProduct.pas' {FProduct};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
