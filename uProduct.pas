unit uProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls, uRegister;

type
  TFProduct = class(TFRegister)
    lblProductId: TLabel;
    lblName: TLabel;
    lblPrice: TLabel;
    lblProductDescription: TLabel;
    edtProductId: TDBEdit;
    edtProductName: TDBEdit;
    edtProductDescription: TDBEdit;
    edtPrice: TDBEdit;
    procedure btnEraseClick(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure edtProductNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtProductDescriptionKeyPress(Sender: TObject; var Key: Char);
    procedure edtPriceKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    function GenerateNewID: string;
  public
    { Public declarations }
    class procedure Execute;
  protected
    function ValidateFields: Boolean;
  end;

var
  FProduct: TFProduct;

implementation

{$R *.dfm}

uses uDataModule, UtilMensagens;

class procedure TFProduct.Execute;
var
  oForm: TFProduct;
begin
  try
    try
      oForm := TFProduct.Create(nil);
      oForm.edtProductId.ReadOnly     := True;
      oForm.edtProductName.ReadOnly       := True;
      oForm.edtProductDescription.ReadOnly  := True;
      oForm.edtPrice.ReadOnly        := True;
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

function TFProduct.ValidateFields: Boolean;
var
  slErros: TStringList;
begin
  slErros := TStringList.Create;

  if (edtProductName.text = EmptyStr) then
    slErros.Add('  - The product name needs to be filled in.');

  if (edtProductDescription.text = EmptyStr) then
    slErros.Add('  - The product description needs to be completed.');

  if (edtPrice.Text = '0') or (edtPrice.Text = EmptyStr) then
    slErros.Add('  - The sales price needs to be filled in.');

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

procedure TFProduct.btnEraseClick(Sender: TObject);
begin
  if (msgYesNo('Do you really want to delete this record?')) then
  begin
    try
      if not dsMain.DataSet.IsEmpty then
      begin
        dsMain.DataSet.Delete;

        msgInformation('Product successfully deleted.');

        dsMain.DataSet.Refresh;
      end
      else
      begin
        msgAlert('No records selected for deletion.');
      end;

      inherited;
    except
      on E: Exception do
      begin
        raise Exception.Create('There was a failure to delete the record.' + sLineBreak +
                               'Original message: ' + E.Message);
      end;
    end;
  end;
end;

procedure TFProduct.btnUndoClick(Sender: TObject);
begin
  try
    if dsMain.DataSet.State in [dsEdit, dsInsert] then
    begin
      dsMain.DataSet.Cancel;

      msgInformation('Changes undone successfully.');

      edtProductName.ReadOnly       := True;
      edtProductDescription.ReadOnly  := True;
      edtPrice.ReadOnly        := True;
    end;

    inherited;
  except
    on E: Exception do
    begin
      raise Exception.Create('There was a failure to undo the changes.' + sLineBreak +
                             'Original message: ' + E.Message);
    end;
  end;
end;

procedure TFProduct.btnEditClick(Sender: TObject);
begin
  inherited;

  edtProductName.ReadOnly       := False;
  edtProductDescription.ReadOnly  := False;
  edtPrice.ReadOnly        := False;

  edtProductName.SetFocus;

  if dsMain.DataSet.State = dsBrowse then
  begin
    dsMain.DataSet.Edit;
  end;
end;

procedure TFProduct.btnNewClick(Sender: TObject);
begin
  edtProductName.ReadOnly         := False;
  edtProductDescription.ReadOnly  := False;
  edtPrice.ReadOnly               := False;

  edtProductId.Text          := '';
  edtProductName.Text        := '';
  edtProductDescription.Text := '';
  edtPrice.Text              := '';

  edtProductName.SetFocus;

  inherited;

  if dsMain.DataSet <> nil then
  begin
    dsMain.DataSet.Append;
  end;
  edtProductId.Text := GenerateNewID();
end;

procedure TFProduct.btnSaveClick(Sender: TObject);
begin
  if ValidateFields then
  begin
    try
      if dsMain.DataSet.State in [dsEdit, dsInsert] then
      begin
        dsMain.DataSet.Post;

        msgInformation('Product saved successfully.');

        edtProductName.ReadOnly       := True;
        edtProductDescription.ReadOnly  := True;
        edtPrice.ReadOnly        := True;
      end;

      inherited;
    except
      on E: Exception do
      begin
        raise Exception.Create('There was a failure to save the record.' + sLineBreak +
                               'Original message: ' + E.Message);
      end;
    end;
  end;
end;

function TFProduct.GenerateNewID: string;
var
  newId: Integer;
begin
  DM.qSearch.SQL.Text := 'SELECT MAX(cod_product) AS MaxID FROM tab_item';
  DM.qSearch.Open;

  if not DM.qSearch.FieldByName('MaxID').IsNull then
    newId := DM.qSearch.FieldByName('MaxID').AsInteger + 1
  else
    newId := 1;

  Result := IntToStr(newId);
end;

procedure TFProduct.edtProductDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin
    SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFProduct.edtProductNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    SelectNext(Sender as TWinControl, True, True);
  end;
  
end;

procedure TFProduct.edtPriceKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key In ['0'..'9', ',']) then
  begin
    if (key = #13) then
    begin
      Key := #0;
      btnSaveClick(Sender);
    end;  
  end;  
end;

end.
