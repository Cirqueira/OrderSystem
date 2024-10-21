unit uPedidoSP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uPedido, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFPedidoSP = class(TFPedido)
    cbPedidos: TComboBox;
    lblSelecaoCodigoPedido: TLabel;
    btnPesquisa: TBitBtn;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function  GetQtdeRegistros: Integer;
    procedure SetQtdeRegistros;
    procedure CarregarPedidosID;
    procedure ObterPedidos(codPedido: Integer);
    procedure ObterPedidoItens(codPedido: Integer);
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  FPedidoSP: TFPedidoSP;

implementation

{$R *.dfm}

uses uDataModule;

procedure TFPedidoSP.btnPesquisaClick(Sender: TObject);
var
  codPedido: Integer;
begin
  if cbPedidos.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, selecione um pedido.');
    Exit;
  end;

  codPedido := StrToInt(cbPedidos.Items[cbPedidos.ItemIndex]);

  ObterPedidos(codPedido);
end;

procedure TFPedidoSP.CarregarPedidosID;
begin
  cbPedidos.Clear;

  DM.qConsultas.Close;
  DM.qConsultas.SQL.Text := 'SELECT cod_order FROM tab_orders';
  DM.qConsultas.Open();

  while not DM.qConsultas.Eof do
  begin
    cbPedidos.Items.Add(DM.qConsultas.FieldByName('cod_order').AsString);
    DM.qConsultas.Next;
  end;

   DM.qConsultas.Close;
end;

class procedure TFPedidoSP.Execute;
var
  oForm: TFPedidoSP;
begin
  try
    try
      oForm := TFPedidoSP.Create(nil);
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

procedure TFPedidoSP.FormCreate(Sender: TObject);
begin
  CarregarPedidosID;
end;

function TFPedidoSP.GetQtdeRegistros: Integer;
begin
  if Assigned(DM.dsPedidoSP.DataSet) then
    Result := DM.dsPedidoSP.DataSet.RecordCount
  else
    Result := 0;
end;

procedure TFPedidoSP.ObterPedidos(codPedido: Integer);
begin
  DM.qPedidoSP.Close;
  DM.qPedidoSP.SQL.Clear;
  DM.qPedidoSP.SQL.Add('EXEC sp_Order :cod_order');
  DM.qPedidoSP.ParamByName('cod_order').AsInteger := codPedido;

  try
    DM.qPedidoSP.Open;

    if DM.qPedidoSP.RecordCount > 0 then
    begin
      DM.dsPedidoSP.DataSet := DM.qPedidoSP;
      dbgrdPrincipal.DataSource := DM.dsPedidoSP;
      dbgrdPrincipal.Refresh;

      ObterPedidoItens(codPedido);
      SetQtdeRegistros;
    end
    else
    begin
      ShowMessage('Nenhum pedido encontrado para o c�digo: ' + IntToStr(codPedido));
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao executar a stored procedure: ' + E.Message);
    end;
end;

procedure TFPedidoSP.SetQtdeRegistros;
begin
  StatusBar.Panels[0].Text := 'Pedidos encontrados: ' + IntToStr(GetQtdeRegistros);
end;

procedure TFPedidoSP.ObterPedidoItens(codPedido: Integer);
begin
  DM.qItemSP.Close;
  DM.qItemSP.SQL.Clear;
  DM.qItemSP.SQL.Add('EXEC sp_OrderDetails :cod_order');
  DM.qItemSP.ParamByName('cod_order').AsInteger := codPedido;

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
      ShowMessage('Erro ao executar a stored procedure: ' + E.Message);
    end;
end;

// Removido pelo uso incorreto na linha: DM.qPedidoSP.NextRecordSet;
{procedure TFPedidoSP.ObterPedidos(codPedido: Integer);
begin
  DM.qPedidoSP.Close;
  DM.qItemSP.Close;

  DM.qPedidoSP.SQL.Clear;
  DM.qPedidoSP.SQL.Add('EXEC sp_OrderDetails :cod_order');
  DM.qPedidoSP.ParamByName('cod_order').AsInteger := codPedido;

  try
    DM.qPedidoSP.Open;

    if DM.qPedidoSP.RecordCount > 0 then
    begin
      DM.dsPedidoSP.DataSet := DM.qPedidoSP;
      dbgrdPrincipal.Refresh;

      if DM.qPedidoSP.NextRecordSet then
      begin
        DM.dsItemSP.DataSet := DM.qPedidoSP;
        dbgrdItens.Refresh;
      end;

    end
    else
    begin
      ShowMessage('Nenhum pedido encontrado para o c�digo: ' + IntToStr(codPedido));
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao executar a stored procedure: ' + E.Message);
  end;
end;}

end.