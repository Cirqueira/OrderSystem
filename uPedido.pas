unit uPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFPedido = class(TFCadPai)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  FPedido: TFPedido;

implementation

{$R *.dfm}

class procedure TFPedido.Execute;
var
  oForm: TFPedido;
begin
  try
    try
      oForm := TFPedido.Create(nil);
      oForm.ShowModal;

    except
      on e: exception do
        raise exception('Houve uma falha no formulário.' + sLineBreak +
                        'Mensagem original: ' + e.Message);
    end;
  finally
    if (Assigned(oForm)) then
      FreeAndNil(oForm);
  end;
end;

end.
