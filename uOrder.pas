unit uOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, Vcl.DBCtrls, uRegister;

type
  TFOrder = class(TFRegister)
    dbgrdItens: TDBGrid;
    lblItemOrder: TLabel;
    lblOrder: TLabel;
    lblOrderId: TLabel;
    edtCodigoPedido: TDBEdit;
    lblDate: TLabel;
    edtData: TDBEdit;
    lblClient: TLabel;
    edtCliente: TDBEdit;
    lblTotalValueOrder: TLabel;
    edtValorTotal: TDBEdit;
    procedure dsOrderDataChange(Sender: TObject; Field: TField);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
  private
    { Private declarations }
    function  GetRecordQuantity: Integer;
    procedure SetRecordQuantity;
    function  GetDataSetInstantiated: Boolean;
    procedure LoadOrderItems;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  FOrder: TFOrder;

implementation

{$R *.dfm}

uses uDataModule;

procedure TFOrder.SetRecordQuantity;
begin
  StatusBar.Panels[0].Text := 'Orders found:' + IntToStr(GetRecordQuantity);
end;

function TFOrder.GetRecordQuantity: Integer;
begin
  if (GetDataSetInstantiated) then
    Result := DM.dsOrder.DataSet.RecordCount
  else
    Result := 0;
end;

function TFOrder.GetDataSetInstantiated: Boolean;
begin
  Result := Assigned(DM.dsOrder.DataSet);
end;

procedure TFOrder.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFOrder.btnNextClick(Sender: TObject);
begin
  DM.dsOrder.DataSet.Next;
  btnNext.Enabled  := (DM.dsOrder.DataSet.RecNo < DM.dsOrder.DataSet.RecordCount);
  btnPrevious.Enabled := True;

  LoadOrderItems;
  SetRecordQuantity;

end;

procedure TFOrder.btnPreviousClick(Sender: TObject);
begin
  DM.dsOrder.DataSet.Prior;
  btnPrevious.Enabled := (DM.dsOrder.DataSet.RecNo > 1);
  btnNext.Enabled  := True;

  LoadOrderItems;
  SetRecordQuantity;
end;

procedure TFOrder.LoadOrderItems;
var
  total: Double;
begin
  if not DM.fdqOrder.FieldByName('cod_order').IsNull then
  begin
    DM.fdqItem.Close;
    DM.fdqItem.ParamByName('OrderID').AsInteger := DM.fdqOrder.FieldByName('cod_order').AsInteger;
    DM.fdqItem.Open;

    total := 0;
  end;
end;

procedure TFOrder.dsOrderDataChange(Sender: TObject; Field: TField);
begin
  LoadOrderItems;
end;

class procedure TFOrder.Execute;
var
  oForm: TFOrder;
begin
  try
    try
      oForm := TFOrder.Create(nil);

      if not DM.dsOrder.DataSet.Active then
        DM.dsOrder.DataSet.Open;

      oForm.ShowModal;

    except
      on e: exception do
        raise exception('There was a glitch in the form.' + sLineBreak +
                        'Original message: ' + e.Message);
    end;
  finally
    if (Assigned(oForm)) then
      FreeAndNil(oForm);
  end;
end;

procedure TFOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Do you really want to close this screen?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Abort;
end;

procedure TFOrder.FormShow(Sender: TObject);
begin
  if DM.dsOrder.DataSet.Active and (DM.dsOrder.DataSet.RecordCount > 0) then
  begin
    DM.dsOrder.DataSet.First;
    LoadOrderItems;
    SetRecordQuantity;
  end;
end;

end.
