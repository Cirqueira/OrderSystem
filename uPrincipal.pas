unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPrincipal = class(TForm)
    pnlCorpo: TPanel;
    pnlTopo: TPanel;
    pnlBarras: TPanel;
    spbFechar: TSpeedButton;
    spbMinimizar: TSpeedButton;
    lblNomeSistema: TLabel;
    pnlMenu: TPanel;
    spbRelatorio: TSpeedButton;
    spbPedido: TSpeedButton;
    spbCadastro: TSpeedButton;
    pnlFormulario: TPanel;
    procedure spbFecharClick(Sender: TObject);
    procedure spbMinimizarClick(Sender: TObject);
    procedure spbCadastroClick(Sender: TObject);
    procedure spbPedidoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadProduto, uPedido, uDataModule;

procedure TfrmPrincipal.spbFecharClick(Sender: TObject);
begin
  Application.terminate;
end;

procedure TfrmPrincipal.spbMinimizarClick(Sender: TObject);
begin
  application.Minimize;
end;

procedure TfrmPrincipal.spbPedidoClick(Sender: TObject);
begin
  frmPedido        := TfrmPedido.Create(Self);
  frmPedido.Parent := frmMain.pnlFormulario;
  frmPedido.Show;
end;

procedure TfrmPrincipal.spbCadastroClick(Sender: TObject);
begin
  frmCadProduto        := TfrmCadProduto.Create(Self);
  frmCadProduto.Parent := frmMain.pnlFormulario;
  frmCadProduto.Show;
end;

end.
