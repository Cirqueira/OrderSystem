program OrderSystem;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FMain},
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  Utils in 'Utils.pas',
  uCadPai in 'uCadPai.pas' {FCadPai},
  uCadProduto in 'uCadProduto.pas' {FCadProduto},
  UtilMensagens in 'UtilMensagens.pas',
  uPedido in 'uPedido.pas' {FPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
