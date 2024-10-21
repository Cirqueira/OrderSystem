unit uReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, frCoreClasses, frxClass,
  frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.DBCtrls;

type
  TFReport = class(TForm)
    frxReport: TfrxReport;
    frxDB: TfrxDBDataset;
    fdqReport: TFDQuery;
    pnlFundo: TPanel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    lblClient: TLabel;
    pnlBotoes: TPanel;
    btnClose: TSpeedButton;
    bevelSair: TBevel;
    lblNomeForm: TLabel;
    lblStartDate: TLabel;
    lblEndDate: TLabel;
    btnSearch: TButton;
    fdqClient: TFDQuery;
    DataSource: TDataSource;
    cbClient: TComboBox;
    fdqReportdata: TDateField;
    fdqReportcod_order: TIntegerField;
    fdqReportclient: TStringField;
    fdqReportproduct: TStringField;
    fdqReportquantity: TIntegerField;
    fdqReportunit_price: TBCDField;
    fdqReporttotal_value_item: TFMTBCDField;
    fdqReporttotal_value_order: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    function ValidatePeriod: Boolean;
    procedure LoadReport;
    procedure LoadClients;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  FReport: TFReport;

implementation

{$R *.dfm}

uses uDataModule, UtilMensagens;

procedure TFReport.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFReport.btnSearchClick(Sender: TObject);
begin
  if ValidatePeriod then
  begin
    try
      LoadReport;

    except
      on E: Exception do
      begin
        raise Exception.Create('There was a failure to load the report.' + sLineBreak +
                               'Original message: ' + E.Message);
      end;
    end;
  end;
end;

class procedure TFReport.Execute;
var
  oForm: TFReport;
begin
  try
    try
      oForm := TFReport.Create(nil);

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

procedure TFReport.LoadClients;
begin
  cbClient.Clear;

  fdqClient.Close;
  fdqClient.SQL.Text := 'SELECT name FROM tab_clients';
  fdqClient.Open();

  while not fdqClient.Eof do
  begin
    cbClient.Items.Add(fdqClient.FieldByName('name').AsString);
    fdqClient.Next;
  end;

  fdqClient.Close;
end;

procedure TFReport.LoadReport;
var
  clientName: string;
  startDate, endDate: TDate;
begin
  if cbClient.ItemIndex >= 0 then
    clientName := cbClient.Text
  else
  begin
    msgAlert('please, select customer');
    Exit;
  end;

  startDate := dtpStartDate.Date;
  endDate := dtpEndDate.Date;

  fdqReport.Close;
  fdqReport.ParamByName('NameClient').AsString := clientName;
  fdqReport.ParamByName('DataInicio').AsDate := startDate;
  fdqReport.ParamByName('DataFim').AsDate := endDate;

  try
    fdqReport.Open;

    if fdqReport.RecordCount > 0 then
      frxReport.ShowReport
    else
      ShowMessage('No order selected!');
  except
    on E: Exception do
      raise Exception.Create('Error loading report: ' + E.Message);
  end;
end;

function TFReport.ValidatePeriod: Boolean;
var
  slErros: TStringList;
begin
  slErros := TStringList.Create;

  if (dtpStartDate.Date = 0) then
    slErros.Add('  - Start date needs to be filled in.');

  if (dtpEndDate.Date = 0) then
    slErros.Add('  - The end date needs to be filled in.');

  if (dtpStartDate.Date <> 0) and (dtpEndDate.Date <> 0) then
  begin
    if (dtpStartDate.Date > dtpEndDate.Date ) then
      slErros.Add('  - The end date cannot be less than the start date.')
  end;

  if (slErros.Count > 0) then
  begin
    msgAlert('Please, check the following alert(s):' + sLineBreak +
              slErros.Text);

    Result := False;
  end
  else
    Result := True;

  FreeAndNil(slErros);
end;

procedure TFReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Do you really want to close this screen?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
end;

procedure TFReport.FormCreate(Sender: TObject);
begin
  LoadClients;

  fdqReport.SQL.Clear;
  fdqReport.SQL.Text :=
  'SELECT o.date_order AS data, ' +
  '       o.cod_order, ' +
  '       c.name AS client, ' +
  '       i.name AS product, ' +
  '       oi.quantity, ' +
  '       oi.unit_price, ' +
  '       (oi.quantity * oi.unit_price) AS total_value_item, ' +
  '       (SELECT SUM(oi2.quantity * oi2.unit_price) ' +
  '        FROM tab_orders_item oi2 ' +
  '        WHERE oi2.cod_order = o.cod_order) AS total_value_order ' +
  'FROM tab_orders o ' +
  'JOIN tab_orders_item oi ON (o.cod_order = oi.cod_order) ' +
  'JOIN tab_clients c ON (o.cod_client = c.cod_client) ' +
  'JOIN tab_item i ON (oi.cod_product = i.cod_product) ' +
  'WHERE c.name = :NameClient ' +
  '  AND o.date_order BETWEEN :DataInicio AND :DataFim ' +
  'GROUP BY o.date_order, o.cod_order, c.name, i.name, ' +
  '         oi.quantity, oi.unit_price';
end;

end.
