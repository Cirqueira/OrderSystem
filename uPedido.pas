unit uPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCadPai, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, Vcl.DBCtrls;

type
  TFPedido = class(TFCadPai)
    dbgrdItens: TDBGrid;
    lblItemPedido: TLabel;
    lblPedido: TLabel;
    lblCodigoPedido: TLabel;
    edtCodigoPedido: TDBEdit;
    lblData: TLabel;
    edtData: TDBEdit;
    lblCliente: TLabel;
    edtCliente: TDBEdit;
    lblValorTotal: TLabel;
    edtValorTotal: TDBEdit;
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure btnRegAnteriorClick(Sender: TObject);
    procedure btnRegProximoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function  GetQtdeRegistros: Integer;
    procedure SetQtdeRegistros;
    function  GetDataSetInstanciado: Boolean;
    procedure CarregarItensPedido;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  FPedido: TFPedido;

implementation

{$R *.dfm}

uses uDataModule;

procedure TFPedido.SetQtdeRegistros;
begin
  StatusBar.Panels[0].Text := 'Pedidos encontrados: ' + IntToStr(GetQtdeRegistros);
end;

function TFPedido.GetQtdeRegistros: Integer;
begin
  if (GetDataSetInstanciado) then
    Result := DM.dsPedido.DataSet.RecordCount
  else
    Result := 0;
end;

function TFPedido.GetDataSetInstanciado: Boolean;
begin
  Result := Assigned(DM.dsPedido.DataSet);
end;

procedure TFPedido.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPedido.btnRegAnteriorClick(Sender: TObject);
begin
  DM.dsPedido.DataSet.Prior;
  btnRegAnterior.Enabled := (DM.dsPedido.DataSet.RecNo > 1);
  btnRegProximo.Enabled  := True;

  CarregarItensPedido;
  SetQtdeRegistros;
end;

procedure TFPedido.btnRegProximoClick(Sender: TObject);
begin
  DM.dsPedido.DataSet.Next;
  btnRegProximo.Enabled  := (DM.dsPedido.DataSet.RecNo < DM.dsPedido.DataSet.RecordCount);
  btnRegAnterior.Enabled := True;

  CarregarItensPedido;
  SetQtdeRegistros;
end;

procedure TFPedido.CarregarItensPedido;
var
  total: Double;
begin
  if not DM.fdqPedido.FieldByName('cod_order').IsNull then
  begin
    DM.fdqItem.Close;
    DM.fdqItem.ParamByName('OrderID').AsInteger := DM.fdqPedido.FieldByName('cod_order').AsInteger;
    DM.fdqItem.Open;

    total := 0;
  end;
end;

procedure TFPedido.dsPedidoDataChange(Sender: TObject; Field: TField);
begin
  CarregarItensPedido;
end;

class procedure TFPedido.Execute;
var
  oForm: TFPedido;
begin
  try
    try
      oForm := TFPedido.Create(nil);

      if not DM.dsPedido.DataSet.Active then
        DM.dsPedido.DataSet.Open;

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

procedure TFPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja realmente fechar esta tela ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TFPedido.FormShow(Sender: TObject);
begin
  if DM.dsPedido.DataSet.Active and (DM.dsPedido.DataSet.RecordCount > 0) then
  begin
    DM.dsPedido.DataSet.First;
    CarregarItensPedido;
    SetQtdeRegistros;
  end;
end;

end.
