program OrderSystem;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FMain},
  Utils in 'Utils.pas',
  uCadPai in 'uCadPai.pas' {FCadPai},
  uCadProduto in 'uCadProduto.pas' {FCadProduto},
  UtilMensagens in 'UtilMensagens.pas' {$R *.res},
  uPedido in 'uPedido.pas' {FPedido},
  uDataModule in 'uDataModule.pas' {DM: TDataModule},
  uRelatorio in 'uRelatorio.pas' {FRelatorio},
  uPedidoSP in 'uPedidoSP.pas' {FPedidoSP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
