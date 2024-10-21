unit uRegister;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, UTiposClass, UBaseIntf;

type
  TFRegister = class(TForm)
    StatusBar: TStatusBar;
    pnlGrid: TPanel;
    dbgrdMain: TDBGrid;
    pnlData: TPanel;
    pnlButton: TPanel;
    btnPrevious: TSpeedButton;
    btnNext: TSpeedButton;
    btnNew: TSpeedButton;
    btnEdit: TSpeedButton;
    btnSave: TSpeedButton;
    btnUndo: TSpeedButton;
    btnErase: TSpeedButton;
    dsMain: TDataSource;
    btnClose: TSpeedButton;
    bevel1: TBevel;
    bevelClose: TBevel;
    lblNameForm: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure btnEraseClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
    FStatus: TStatus;
    procedure SetStatus(Value: TStatus);
    function  GetDataSetInstantiated: Boolean;

    procedure RefreshDataset;
    function  GetRecordQuantity: Integer;
    procedure SetRecordQuantity;
    procedure ConfirmSave;

    procedure CheckDatasetPosition;
    procedure OnAfterScroll(DataSet: TDataSet);
    procedure OnBeforeScroll(DataSet: TDataSet);

    procedure PreviousRecord;
    procedure NextRecord;
    procedure NewRecord;
    procedure EditRecord;
    procedure SaveRecord;
    procedure UndoRecord;
    procedure EraseRecord;

    procedure EnableOnStart;
    procedure EnableOnInsert;
    procedure EnableOnEdit;
    procedure EnableOnSave;
    procedure EnableOnUndo;
    procedure EnableOnErase;
    procedure EnableOnSearch;
  public
    { Public declarations }
  protected
    function  GetStatus: TStatus;
    procedure MapDataSetToFields(oDataSet: TDataSet); virtual; abstract;
  end;

var
  FRegister: TFRegister;

implementation

uses Mask;

{$R *.dfm}

procedure TFRegister.FormCreate(Sender: TObject);
begin
  SetStatus(stBrowse);

  EnableOnStart;
  SetRecordQuantity;
end;

procedure TFRegister.SetStatus(Value: TStatus);
begin
  FStatus := Value;
end;

procedure TFRegister.btnNewClick(Sender: TObject);
begin
  NewRecord;
end;

procedure TFRegister.btnSaveClick(Sender: TObject);
begin
  SaveRecord;
end;

procedure TFRegister.SaveRecord;
var
  stPreviousState: TStatus;
begin
  EnableOnSave;

  stPreviousState := GetStatus;
  SetStatus(stBrowse);

  if (GetDataSetInstantiated) then
  begin
    RefreshDataset;

    if (stPreviousState = stInsert) then
      dsMain.DataSet.Last;
  end;

  SetRecordQuantity;
end;

procedure TFRegister.btnUndoClick(Sender: TObject);
begin
  UndoRecord;
end;

procedure TFRegister.btnEditClick(Sender: TObject);
begin
  EditRecord;
end;

function TFRegister.GetDataSetInstantiated: Boolean;
begin
  Result := Assigned(dsMain.DataSet);
end;


procedure TFRegister.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFRegister.btnPreviousClick(Sender: TObject);
begin
  PreviousRecord;

  SetRecordQuantity;
end;

procedure TFRegister.btnEraseClick(Sender: TObject);
begin
  EraseRecord;
  SetStatus(stBrowse);
  SetRecordQuantity;
end;

procedure TFRegister.btnNextClick(Sender: TObject);
begin
  NextRecord;

  SetRecordQuantity;
end;

procedure TFRegister.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (dsMain.State in [dsInsert, dsEdit]) then
    ConfirmSave
  else if (GetRecordQuantity > 0) then
  begin
    if MessageDlg('Do you really want to close this screen?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
  end;
end;

procedure TFRegister.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_Escape) then
    Close;
end;

procedure TFRegister.RefreshDataset;
begin
  if (GetDataSetInstantiated) then
    try
      Screen.Cursor := crHourGlass;
      try
        dsMain.DataSet.Refresh;
      except
        on e: Exception do
          raise Exception.Create('There was a failure when trying to retrieve data from the table.' + sLineBreak +
                                 'Original message: ' + e.Message);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
end;

function TFRegister.GetRecordQuantity: Integer;
begin
  if (GetDataSetInstantiated) then
    Result := dsMain.DataSet.RecordCount
  else
    Result := 0;
end;

procedure TFRegister.SetRecordQuantity;
begin
  StatusBar.Panels[0].Text := 'Records found: ' + IntToStr(GetRecordQuantity);
end;

procedure TFRegister.ConfirmSave;
begin
  if dsMain.State in [dsEdit, dsInsert] then
    case MessageBox(Handle, 'Do you want to save the changes?', 'Attention', MB_ICONQUESTION + MB_YESNOCANCEL) of
      ID_YES   : btnSave.Click;
      ID_NO    : btnUndo.Click;
      ID_CANCEL: Abort;
    end;
end;

procedure TFRegister.CheckDatasetPosition;
begin
  if (GetDataSetInstantiated) and (dsMain.DataSet.RecNo > 0) then
  begin
    if (dsMain.DataSet.RecNo = 1) then
    begin
      btnPrevious.Enabled := False;
      btnNext.Enabled  := False;
    end
    else if (dsMain.DataSet.RecNo = dsMain.DataSet.RecordCount) then
    begin
      btnPrevious.Enabled := True;
      btnNext.Enabled  := False;
    end
    else
    begin
      btnPrevious.Enabled := (dsMain.DataSet.RecordCount > 0);
      btnNext.Enabled  := btnPrevious.Enabled;
    end;
  end
  else
  begin
      btnPrevious.Enabled := False;
      btnNext.Enabled  := False;
  end;
end;

procedure TFRegister.OnAfterScroll(DataSet: TDataSet);
begin
  CheckDatasetPosition;
  MapDataSetToFields(dsMain.DataSet);
end;

procedure TFRegister.OnBeforeScroll(DataSet: TDataSet);
begin
  ConfirmSave;
end;

procedure TFRegister.PreviousRecord;
begin
  dsMain.DataSet.Prior;
  btnPrevious.Enabled := (dsMain.DataSet.RecNo > 1);
  btnNext.Enabled  := True;
end;

procedure TFRegister.NextRecord;
begin
  dsMain.DataSet.Next;
  btnNext.Enabled  := (dsMain.DataSet.RecNo < dsMain.DataSet.RecordCount);
  btnPrevious.Enabled := True;
end;

procedure TFRegister.NewRecord;
begin
  EnableOnInsert;
  SetStatus(stInsert);
end;

procedure TFRegister.EditRecord;
begin
if GetDataSetInstantiated then
  begin
    dsMain.DataSet.Edit;

    EnableOnEdit;
    SetStatus(stEdit);
  end;
end;

procedure TFRegister.UndoRecord;
begin
  EnableOnUndo;
  SetRecordQuantity;
end;

procedure TFRegister.EraseRecord;
var
  iRecNo: Integer;
begin
  if (GetDataSetInstantiated) then
  begin
    iRecNo := dsMain.DataSet.RecNo;

    RefreshDataset;

    if (iRecNo > dsMain.DataSet.RecordCount) then
      dsMain.DataSet.RecNo := dsMain.DataSet.RecordCount
    else
      dsMain.DataSet.RecNo := iRecNo;
  end;

  EnableOnErase;
end;

procedure TFRegister.EnableOnStart;
begin
  btnPrevious.Enabled := False;
  btnNext.Enabled  := True;
  btnNew.Enabled  := True;
  btnEdit.Enabled   := True;
  btnSave.Enabled   := False;
  btnUndo.Enabled := False;
  btnErase.Enabled   := True;
end;

procedure TFRegister.EnableOnInsert;
begin
  btnPrevious.Enabled := False;
  btnNext.Enabled  := False;
  btnNew.Enabled     := False;
  btnEdit.Enabled   := False;
  btnErase.Enabled   := False;

  btnSave.Enabled   := True;
  btnUndo.Enabled := True;
end;

procedure TFRegister.EnableOnEdit;
begin
  btnPrevious.Enabled := False;
  btnNext.Enabled  := False;
  btnNew.Enabled     := False;
  btnEdit.Enabled   := False;
  btnErase.Enabled   := False;

  btnSave.Enabled   := True;
  btnUndo.Enabled := True;
end;

procedure TFRegister.EnableOnSave;
begin
  btnSave.Enabled   := False;
  btnUndo.Enabled := False;

  CheckDatasetPosition;

  btnNew.Enabled     := True;
  btnEdit.Enabled   := True;
  btnErase.Enabled   := True;
end;

procedure TFRegister.EnableOnUndo;
begin
  if (GetDataSetInstantiated) then
  begin
    btnSave.Enabled   := False;
    btnUndo.Enabled := False;
    btnErase.Enabled   := False;

    CheckDatasetPosition;

    btnNew.Enabled     := True;
    btnEdit.Enabled   := True;
    btnErase.Enabled   := True;
  end
  else
  begin
    btnPrevious.Enabled := False;
    btnNext.Enabled  := False;
    btnEdit.Enabled   := False;
    btnSave.Enabled   := False;
    btnUndo.Enabled := False;
    btnErase.Enabled   := False;

    btnNew.Enabled     := True;
  end;
end;

procedure TFRegister.EnableOnErase;
begin
  CheckDatasetPosition;
  EnableOnSearch;
end;

procedure TFRegister.EnableOnSearch;
begin
  btnPrevious.Enabled := True;
  btnNext.Enabled  := True;

  if (GetRecordQuantity = 0) then
  begin
    btnSave.Enabled   := False;
    btnUndo.Enabled := False;
    btnErase.Enabled   := False;
  end
  else
  begin
    btnNew.Enabled   := True;
    btnEdit.Enabled := True;
    btnErase.Enabled := True;
  end;
end;

function TFRegister.GetStatus: TStatus;
begin
  Result := FStatus;
end;

end.
