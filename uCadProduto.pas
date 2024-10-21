unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask,
  Vcl.DBCtrls, uCadPai;

type
  TFCadProduto = class(TFCadPai)
    lblCodigoProduto: TLabel;
    lblNomeProduto: TLabel;
    lblPrecoVenda: TLabel;
    lblDescricaoProduto: TLabel;
    edtCodigoProduto: TDBEdit;
    edtNomeProduto: TDBEdit;
    edtDescricaoProduto: TDBEdit;
    edtPrecoVenda: TDBEdit;
    procedure btnRegApagarClick(Sender: TObject);
    procedure btnRegDesfazerClick(Sender: TObject);
    procedure btnRegSalvarClick(Sender: TObject);
    procedure btnRegNovoClick(Sender: TObject);
    procedure edtNomeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDescricaoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure btnRegEditarClick(Sender: TObject);
  private
    { Private declarations }
    function GerarNovoCodigo: string;
  public
    { Public declarations }
    class procedure Execute;
  protected
    function ValidarCampos: Boolean;
  end;

var
  FCadProduto: TFCadProduto;

implementation

{$R *.dfm}

uses uDataModule, UtilMensagens;

class procedure TFCadProduto.Execute;
var
  oForm: TFCadProduto;
begin
  try
    try
      oForm := TFCadProduto.Create(nil);
      oForm.edtCodigoProduto.ReadOnly     := True;
      oForm.edtNomeProduto.ReadOnly       := True;
      oForm.edtDescricaoProduto.ReadOnly  := True;
      oForm.edtPrecoVenda.ReadOnly        := True;
      oForm.ShowModal;

    except
      on e: exception do
        raise exception('Houve uma falha no formul�rio.' + sLineBreak +
                        'Mensagem original: ' + e.Message);
    end;
  finally
    if (Assigned(oForm)) then
      FreeAndNil(oForm);
  end;
end;

function TFCadProduto.ValidarCampos: Boolean;
var
  slErros: TStringList;
begin
  slErros := TStringList.Create;

  if (edtNomeProduto.text = EmptyStr) then
    slErros.Add('  - O nome do produto precisa ser preenchido.');

  if (edtDescricaoProduto.text = EmptyStr) then
    slErros.Add('  - A descri��o do produto precisa ser preenchida.');

  if (edtPrecoVenda.Text = '0') or (edtPrecoVenda.Text = EmptyStr) then
    slErros.Add('  - O pre�o de venda precisa ser preenchido.');

  if (slErros.Count > 0) then
  begin
    msgAlerta('Por favor, verifique o (s) seguinte (s) alerta (s):' + sLineBreak +
              slErros.Text);

    Result := False;
  end
  else
    Result := True;

  FreeAndNil(slErros);
end;

procedure TFCadProduto.btnRegApagarClick(Sender: TObject);
begin
  if (MsgSimNao('Deseja realmente excluir este registro?')) then
  begin
    try
      if not dsPrincipal.DataSet.IsEmpty then
      begin
        dsPrincipal.DataSet.Delete;

        msgInformacao('Produto exclu�do com sucesso.');

        dsPrincipal.DataSet.Refresh;
      end
      else
      begin
        msgAlerta('Nenhum registro selecionado para exclus�o.');
      end;

      inherited;
    except
      on E: Exception do
      begin
        raise Exception.Create('Houve uma falha ao excluir o registro.' + sLineBreak +
                               'Mensagem original: ' + E.Message);
      end;
    end;
  end;
end;

procedure TFCadProduto.btnRegDesfazerClick(Sender: TObject);
begin
  try
    if dsPrincipal.DataSet.State in [dsEdit, dsInsert] then
    begin
      dsPrincipal.DataSet.Cancel;

      msgInformacao('Altera��es desfeitas com sucesso.');

      edtNomeProduto.ReadOnly       := True;
      edtDescricaoProduto.ReadOnly  := True;
      edtPrecoVenda.ReadOnly        := True;
    end;

    inherited;
  except
    on E: Exception do
    begin
      raise Exception.Create('Houve uma falha ao desfazer as altera��es.' + sLineBreak +
                             'Mensagem original: ' + E.Message);
    end;
  end;
end;

procedure TFCadProduto.btnRegEditarClick(Sender: TObject);
begin
  inherited;

  edtNomeProduto.ReadOnly       := False;
  edtDescricaoProduto.ReadOnly  := False;
  edtPrecoVenda.ReadOnly        := False;

  edtNomeProduto.SetFocus;

  if dsPrincipal.DataSet.State = dsBrowse then
  begin
    dsPrincipal.DataSet.Edit;
  end;
end;

procedure TFCadProduto.btnRegNovoClick(Sender: TObject);
begin
  edtNomeProduto.ReadOnly       := False;
  edtDescricaoProduto.ReadOnly  := False;
  edtPrecoVenda.ReadOnly        := False;

  edtCodigoProduto.Text    := '';
  edtNomeProduto.Text      := '';
  edtDescricaoProduto.Text := '';
  edtPrecoVenda.Text       := '';

  edtNomeProduto.SetFocus;

  inherited;

  if dsPrincipal.DataSet <> nil then
  begin
    dsPrincipal.DataSet.Append;
  end;
  edtCodigoProduto.Text := GerarNovoCodigo();
end;

procedure TFCadProduto.btnRegSalvarClick(Sender: TObject);
begin
  if ValidarCampos then
  begin
    try
      if dsPrincipal.DataSet.State in [dsEdit, dsInsert] then
      begin
        dsPrincipal.DataSet.Post;

        msgInformacao('Produto salvo com sucesso.');

        edtNomeProduto.ReadOnly       := True;
        edtDescricaoProduto.ReadOnly  := True;
        edtPrecoVenda.ReadOnly        := True;
      end;

      inherited;
    except
      on E: Exception do
      begin
        raise Exception.Create('Houve uma falha ao salvar o registro.' + sLineBreak +
                               'Mensagem original: ' + E.Message);
      end;
    end;
  end;
end;

function TFCadProduto.GerarNovoCodigo: string;
var
  codNovo: Integer;
begin
  DM.qConsultas.SQL.Text := 'SELECT MAX(cod_product) AS CodMax FROM tab_item';
  DM.qConsultas.Open;

  if not DM.qConsultas.FieldByName('CodMax').IsNull then
    codNovo := DM.qConsultas.FieldByName('CodMax').AsInteger + 1
  else
    codNovo := 1;

  Result := IntToStr(codNovo);
end;

procedure TFCadProduto.edtDescricaoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin
    SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TFCadProduto.edtNomeProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    SelectNext(Sender as TWinControl, True, True);
  end;
  
end;

procedure TFCadProduto.edtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key In ['0'..'9', ',']) then
  begin
    if (key = #13) then
    begin
      Key := #0;
      btnRegSalvarClick(Sender);
    end;  
  end;  
end;

end.
