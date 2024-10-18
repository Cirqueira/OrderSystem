unit uPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPedido = class(TForm)
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
  FreeAndNil(Self);
end;

end.
