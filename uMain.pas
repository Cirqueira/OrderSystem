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
    lblHour: TLabel;
    MainMenu1: TMainMenu;
    mnuProduct: TMenuItem;
    mnuOrder: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    mnuReport: TMenuItem;
    mnuOrder1: TMenuItem;
    mnuOrderSP: TMenuItem;
    lblddmmaaaa: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mnuProductClick(Sender: TObject);
    procedure mnuReportClick(Sender: TObject);
    procedure mnuOrder1Click(Sender: TObject);
    procedure mnuOrderSPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses uOrder, uOrderSP, uProduct, uReport;



{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
begin
  FMain.Caption := CentralizaFormCaption(FMain.Caption, 385);

  lblddmmaaaa.Caption := DateUS(Date);
end;

procedure TFMain.mnuProductClick(Sender: TObject);
begin
  TFProduct.Execute;
end;

procedure TFMain.mnuReportClick(Sender: TObject);
begin
  TFReport.Execute;
end;

procedure TFMain.mnuOrder1Click(Sender: TObject);
begin
  TFOrder.Execute;
end;

procedure TFMain.mnuOrderSPClick(Sender: TObject);
begin
  TFOrderSP.Execute;
end;

procedure TFMain.Timer1Timer(Sender: TObject);
begin
  lblHour.Caption := FormatDateTime('hh:nn', Time);
end;

end.
