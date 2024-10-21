unit uOrderSP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  uOrder;

type
  TFOrderSP = class(TFOrder)
    cbOrder: TComboBox;
    lblSelectOrderCode: TLabel;
    btnSearch: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function  GetRecordQuantity: Integer;
    procedure SetRecordQuantity;
    procedure LoadOrderID;
    procedure GetOrders(orderID: Integer);
    procedure GetItemOrder(orderID: Integer);
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  FOrderSP: TFOrderSP;

implementation

{$R *.dfm}

uses uDataModule;

procedure TFOrderSP.btnSearchClick(Sender: TObject);
var
  orderID: Integer;
begin
  if cbOrder.ItemIndex = -1 then
  begin
    ShowMessage('Please, select an order.');
    Exit;
  end;

  orderID := StrToInt(cbOrder.Items[cbOrder.ItemIndex]);

  GetOrders(orderID);
end;

procedure TFOrderSP.LoadOrderID;
begin
  cbOrder.Clear;

  DM.qSearch.Close;
  DM.qSearch.SQL.Text := 'SELECT cod_order FROM tab_orders';
  DM.qSearch.Open();

  while not DM.qSearch.Eof do
  begin
    cbOrder.Items.Add(DM.qSearch.FieldByName('cod_order').AsString);
    DM.qSearch.Next;
  end;

   DM.qSearch.Close;
end;

class procedure TFOrderSP.Execute;
var
  oForm: TFOrderSP;
begin
  try
    try
      oForm := TFOrderSP.Create(nil);
      oForm.ShowModal;

    except
      on e: exception do
        raise exception('There was a failure in the form.' + sLineBreak +
                        'Original message: ' + e.Message);
    end;
  finally
    if (Assigned(oForm)) then
      FreeAndNil(oForm);
  end;
end;

procedure TFOrderSP.FormCreate(Sender: TObject);
begin
  LoadOrderID;

  DM.qOrderSP.Close;
  DM.qItemSP.Close;
end;

function TFOrderSP.GetRecordQuantity: Integer;
begin
  if Assigned(DM.dsOrderSP.DataSet) then
    Result := DM.dsOrderSP.DataSet.RecordCount
  else
    Result := 0;
end;

procedure TFOrderSP.GetOrders(orderID: Integer);
begin
  DM.qOrderSP.Close;
  DM.qOrderSP.SQL.Clear;
  DM.qOrderSP.SQL.Add('EXEC sp_Order :cod_order');
  DM.qOrderSP.ParamByName('cod_order').AsInteger := orderID;

  try
    DM.qOrderSP.Open;

    if DM.qOrderSP.RecordCount > 0 then
    begin
      DM.dsOrderSP.DataSet := DM.qOrderSP;
      dbgrdMain.DataSource := DM.dsOrderSP;
      dbgrdMain.Refresh;

      GetItemOrder(orderID);
      SetRecordQuantity;
    end
    else
    begin
      ShowMessage('No orders found for code: ' + IntToStr(orderID));
    end;
  except
    on E: Exception do
      ShowMessage('Error when executing the stored procedure: ' + E.Message);
    end;
end;

procedure TFOrderSP.SetRecordQuantity;
begin
  StatusBar.Panels[0].Text := 'Orders found: ' + IntToStr(GetRecordQuantity);
end;

procedure TFOrderSP.GetItemOrder(orderID: Integer);
begin
  DM.qItemSP.Close;
  DM.qItemSP.SQL.Clear;
  DM.qItemSP.SQL.Add('EXEC sp_OrderDetails :cod_order');
  DM.qItemSP.ParamByName('cod_order').AsInteger := orderID;

  try
    DM.qItemSP.Open;

    if DM.qItemSP.RecordCount > 0 then
    begin
      DM.dsItemSP.DataSet := DM.qItemSP;
      dbgrdItens.DataSource := DM.dsItemSP;
      dbgrdItens.Refresh;
    end
  except
    on E: Exception do
      ShowMessage('Error when executing the stored procedure:' + E.Message);
    end;
end;


// Removed due to incorrect use in the line: DM.qPedidoSP.NextRecordSet;
{procedure TFOrderSP.GetOrder(orderID: Integer);
begin
  DM.qOrderSP.Close;
  DM.qItemSP.Close;

  DM.qOrderSP.SQL.Clear;
  DM.qOrderSP.SQL.Add('EXEC sp_OrderDetails :cod_order');
  DM.qOrderSP.ParamByName('cod_order').AsInteger := orderID;

  try
    DM.qOrderSP.Open;

    if DM.qOrderSP.RecordCount > 0 then
    begin
      DM.dsOrderSP.DataSet := DM.qOrderSP;
      dbgrdMain.Refresh;

      if DM.qOrderSP.NextRecordSet then
      begin
        DM.dsItemSP.DataSet := DM.qOrderSP;
        dbgrdItens.Refresh;
      end;

    end
    else
    begin
      ShowMessage('No orders found for code: ' + IntToStr(orderID));
    end;
  except
    on E: Exception do
      ShowMessage('Error when executing the stored procedure: ' + E.Message);
  end;
end;}

end.
