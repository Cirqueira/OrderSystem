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
    dsPedido: TDataSource;
    dsItemPedido: TDataSource;
    fdqPedido: TFDQuery;
    fdqItem: TFDQuery;
    fdqPedidocod_order: TIntegerField;
    fdqPedidodate_order: TDateField;
    fdqPedidocod_client: TIntegerField;
    fdqPedidoname_client: TStringField;
    fdqItemproduct: TStringField;
    fdqItemquantity: TIntegerField;
    fdqItemunit_price: TBCDField;
    fdqItemtotal_value_item: TFMTBCDField;
    lblCodigoPedido: TLabel;
    edtCodigoPedido: TDBEdit;
    lblData: TLabel;
    edtData: TDBEdit;
    lblCliente: TLabel;
    edtCliente: TDBEdit;
    lblValorTotal: TLabel;
    edtValorTotal: TDBEdit;
    fdqItemtotal_value_order: TFMTBCDField;
    procedure dsPedidoDataChange(Sender: TObject; Field: TField);
    procedure btnRegAnteriorClick(Sender: TObject);
    procedure btnRegProximoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    Result := dsPedido.DataSet.RecordCount
  else
    Result := 0;
end;

function TFPedido.GetDataSetInstanciado: Boolean;
begin
  Result := Assigned(dsPedido.DataSet);
end;

procedure TFPedido.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFPedido.btnRegAnteriorClick(Sender: TObject);
begin
  dsPedido.DataSet.Prior;
  btnRegAnterior.Enabled := (dsPedido.DataSet.RecNo > 1);
  btnRegProximo.Enabled  := True;

  CarregarItensPedido;
  SetQtdeRegistros;
end;

procedure TFPedido.btnRegProximoClick(Sender: TObject);
begin
  dsPedido.DataSet.Next;
  btnRegProximo.Enabled  := (dsPedido.DataSet.RecNo < dsPedido.DataSet.RecordCount);
  btnRegAnterior.Enabled := True;

  CarregarItensPedido;
  SetQtdeRegistros;
end;

procedure TFPedido.CarregarItensPedido;
var
  total: Double;
begin
  if not fdqPedido.FieldByName('cod_order').IsNull then
  begin
    fdqItem.Close;
    fdqItem.ParamByName('OrderID').AsInteger := fdqPedido.FieldByName('cod_order').AsInteger;
    fdqItem.Open;

    total := 0;
//    if not fdqItem.IsEmpty then
//    begin
//      fdqItem.First;
//      while not fdqItem.Eof do
//      begin
//        Total := Total + fdqItem.FieldByName('total_value_item').AsFloat;
//        fdqItem.Next;
//      end;
//    end;
//
//    edtValorTotal.DataField := 'total_value_order';
//    edtValorTotal.Text := FormatFloat('0.00', Total);
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

end.
