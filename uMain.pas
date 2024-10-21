unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.Menus, Vcl.StdCtrls, Utils;

type
  TFMain = class(TForm)
    pnlFundo: TPanel;
    pnlBemvindo: TPanel;
    Panel1: TPanel;
    lblHora: TLabel;
    lblddmmaaaa: TLabel;
    MainMenu1: TMainMenu;
    mnuProduto: TMenuItem;
    mnuPedido: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    mnuRelatorio: TMenuItem;
    Pedido: TMenuItem;
    PedidoSP: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnuProdutoClick(Sender: TObject);
    procedure mnuRelatorioClick(Sender: TObject);
    procedure PedidoClick(Sender: TObject);
    procedure PedidoSPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses uCadProduto, uPedido, uRelatorio, uPedidoSP;

{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
begin
  FMain.Caption := CentralizaFormCaption(FMain.Caption, 385);

  lblddmmaaaa.Caption := DataExtenso(Date);
end;

procedure TFMain.mnuProdutoClick(Sender: TObject);
begin
  TFCadProduto.Execute;
end;

procedure TFMain.mnuRelatorioClick(Sender: TObject);
begin
  TFRelatorio.Execute;
end;

procedure TFMain.PedidoClick(Sender: TObject);
begin
  TFPedido.Execute;
end;

procedure TFMain.PedidoSPClick(Sender: TObject);
begin
  TFPedidoSP.Execute;
end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
  lblHora.Caption := FormatDateTime('hh:nn', Time);
end;

end.
