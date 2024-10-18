unit uCadPai;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, UTiposClass, UBaseIntf;

type
  TFCadPai = class(TForm)
    StatusBar: TStatusBar;
    pnlCabecalho: TPanel;
    lblNomeForm: TLabel;
    btnFechar: TSpeedButton;
    pnlGrade: TPanel;
    dbgrdPrincipal: TDBGrid;
    pnlDados: TPanel;
    pnlBusca: TPanel;
    lblPesquisa: TLabel;
    btnRegAnterior: TSpeedButton;
    btnRegProximo: TSpeedButton;
    btnRegNovo: TSpeedButton;
    btnRegEditar: TSpeedButton;
    btnRegSalvar: TSpeedButton;
    btnRegDesfazer: TSpeedButton;
    btnRegApagar: TSpeedButton;
    bvl1: TBevel;
    btnPesquisa: TBitBtn;
    edtPesquisar: TEdit;
    dsPrincipal: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
//    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure edtPesquisarKeyPress(Sender: TObject; var Key: Char);
//    procedure btnPesquisaClick(Sender: TObject);
//    procedure btnRegAnteriorClick(Sender: TObject);
//    procedure btnRegProximoClick(Sender: TObject);
    procedure btnRegNovoClick(Sender: TObject);
    procedure btnRegEditarClick(Sender: TObject);
    procedure btnRegSalvarClick(Sender: TObject);
    procedure btnRegDesfazerClick(Sender: TObject);
//    procedure btnRegApagarClick(Sender: TObject);
//    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    FStatus: TStatus;
    //FRegistro: IBaseIntf;
    procedure SetStatus(Value: TStatus);
    procedure HabilitaCampos;
    procedure DesabilitaCampos;
    procedure LimparCampos;
    function  GetDataSetInstanciado: Boolean;

//    procedure RefreshDataset;
//    function  GetQtdeRegistros: Integer;
//    procedure SetQtdeRegistros;
//    procedure ConfirmaSalvar;
//
//    procedure AssignEventsToDataSet;
//    procedure ChecaPosicaoDataset;
//    procedure OnAfterScroll(DataSet: TDataSet);
//    procedure OnBeforeScroll(DataSet: TDataSet);
//    procedure OnBeforeDelete(DataSet: TDataSet);
//
//    procedure RegistroAnterior;
//    procedure ProximoRegistro;
//    procedure NovoRegistro;
//    procedure EditarRegistro;
//    procedure SalvarRegistro;
//    procedure CancelarAlteracao;
//    procedure ApagarRegistro;
//
//    procedure HabilitaNoInicializar;
//    procedure HabilitaNoInserir;
//    procedure HabilitaNoAlterar;
//    procedure HabilitaNoSalvar;
//    procedure HabilitaNoCancelar;
//    procedure HabilitaNoExcluir;
//    procedure HabilitaNoPesquisar;
  public
    { Public declarations }
    procedure IniciarNovoRegistro;
    procedure SalvarRegistro;
    procedure CancelarRegistro;
  protected
//    function  GetStatus: TStatus;
//    procedure CamposSomenteLeitura(bSomenteLeitura: Boolean);
//    procedure CopiarCamposObrigatorios(oObjeto: IBaseIntf);
//    function  GetRegistroCopiado: IBaseIntf;
//    procedure CopiarRegistro(oObjeto: IBaseIntf); virtual;
//
//    procedure MapDataSetToFields(oDataSet: TDataSet); virtual; abstract;
//    function  MapFieldsToObject: IBaseIntf; virtual; abstract;
//    procedure MapObjectToFields(oObject: IBaseIntf); virtual; abstract;
//    function  ValidarCampos: Boolean; virtual; abstract;
  end;

var
  FCadPai: TFCadPai;

implementation

uses Mask;

{$R *.dfm}

procedure TFCadPai.FormCreate(Sender: TObject);
begin
  SetStatus(stNavegando);

//  HabilitaNoInicializar;
end;

procedure TFCadPai.SetStatus(Value: TStatus);
begin
  FStatus := Value;

//  case FStatus of
//    stInserindo  : CamposSomenteLeitura(False);
//    stEditando   : CamposSomenteLeitura(False);
//    stSalvando   : CamposSomenteLeitura(True);
//    stCancelando : CamposSomenteLeitura(True);
//    stApagando   : CamposSomenteLeitura(True);
//    stNavegando  : CamposSomenteLeitura(True);
//  end;
end;

procedure TFCadPai.HabilitaCampos;
var
  I: Integer;
begin
  for I := 0 to pnlDados.ControlCount - 1 do
  begin
    if pnlDados.Controls[I] is TWinControl then
      (pnlDados.Controls[I] as TWinControl).Enabled := True;
  end;
end;

procedure TFCadPai.DesabilitaCampos;
var
  I: Integer;
begin
  for I := 0 to pnlDados.ControlCount - 1 do
  begin
    if pnlDados.Controls[I] is TWinControl then
      (pnlDados.Controls[I] as TWinControl).Enabled := False;
  end;
end;

procedure TFCadPai.LimparCampos;
var
  I: Integer;
begin
  for I := 0 to pnlDados.ControlCount - 1 do
  begin
    if pnlDados.Controls[I] is TEdit then
      (pnlDados.Controls[I] as TEdit).Clear;
  end;
end;

procedure TFCadPai.btnRegNovoClick(Sender: TObject);
begin
//  NovoRegistro;
  IniciarNovoRegistro;
end;

procedure TFCadPai.IniciarNovoRegistro;
begin
  LimparCampos;
  HabilitaCampos;
  SetStatus(stInserindo);
end;

procedure TFCadPai.btnRegSalvarClick(Sender: TObject);
begin
  SalvarRegistro;
end;

procedure TFCadPai.SalvarRegistro;
begin
  if GetDataSetInstanciado then
  begin
    dsPrincipal.DataSet.Post;
  end;
  SetStatus(stNavegando);
  DesabilitaCampos;
end;

procedure TFCadPai.btnRegDesfazerClick(Sender: TObject);
begin
  CancelarRegistro;
end;

procedure TFCadPai.CancelarRegistro;
begin
  if GetDataSetInstanciado then
  begin
    dsPrincipal.DataSet.Cancel;
  end;
  SetStatus(stNavegando);
  DesabilitaCampos;
end;

procedure TFCadPai.btnRegEditarClick(Sender: TObject);
begin
  if GetDataSetInstanciado then
  begin
    dsPrincipal.DataSet.Edit;
    HabilitaCampos;
    SetStatus(stEditando);
  end;
end;

procedure TFCadPai.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (dsPrincipal.DataSet.State in [dsEdit, dsInsert]) then
    dsPrincipal.DataSet.Cancel;
end;

function TFCadPai.GetDataSetInstanciado: Boolean;
begin
  Result := Assigned(dsPrincipal.DataSet);
end;


//procedure TFCadPai.btnFecharClick(Sender: TObject);
//begin
//  Close;
//end;
//
//procedure TFCadPai.btnPesquisaClick(Sender: TObject);
//begin
//  if (GetDataSetInstanciado) then
//  begin
//    if (dsPrincipal.DataSet.RecordCount > 0) then
//      dbgrdPrincipal.SetFocus
//    else
//      edtPesquisar.SetFocus;
//  end;
//
//  HabilitaNoPesquisar;
//  ChecaPosicaoDataset;
//
//  AssignEventsToDataSet;
//
//  SetQtdeRegistros;
//  SetStatus(stNavegando);
//end;
//
//procedure TFCadPai.btnRegAnteriorClick(Sender: TObject);
//begin
//  RegistroAnterior;
//
//  SetQtdeRegistros;
//end;
//
//procedure TFCadPai.btnRegApagarClick(Sender: TObject);
//begin
//  ApagarRegistro;
//  SetStatus(stNavegando);
//end;
//
//procedure TFCadPai.btnRegDesfazerClick(Sender: TObject);
//begin
//  CancelarAlteracao;
//  SetStatus(stNavegando);
//end;
//
//procedure TFCadPai.btnRegEditarClick(Sender: TObject);
//begin
//  EditarRegistro;
//end;
//
//
//
//procedure TFCadPai.btnRegProximoClick(Sender: TObject);
//begin
//  ProximoRegistro;
//
//  SetQtdeRegistros;
//end;
//
//procedure TFCadPai.btnRegSalvarClick(Sender: TObject);
//begin
//  SalvarRegistro;
//end;
//
//procedure TFCadPai.edtPesquisarKeyPress(Sender: TObject; var Key: Char);
//begin
//  if (key = #13) then
//  begin
//    key := #0;
//    btnPesquisa.Click;
//  end;
//end;
//
//procedure TFCadPai.FormClose(Sender: TObject; var Action: TCloseAction);
//begin
//  if (dsPrincipal.State in [dsInsert, dsEdit]) then
//    ConfirmaSalvar
//  else if (GetQtdeRegistros > 0) then
//  begin
//    if MessageDlg('Deseja realmente fechar esta tela ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
//      Abort;
//  end;
//end;
//
//procedure TFCadPai.FormKeyDown(Sender: TObject; var Key: Word;
//  Shift: TShiftState);
//begin
//  if (key = vk_Escape) then
//    Close;
//end;
//
//function TFCadPai.GetDataSetInstanciado: Boolean;
//begin
//  Result := (dsPrincipal.DataSet <> nil);
//end;
//
//procedure TFCadPai.RefreshDataset;
//begin
//  if (GetDataSetInstanciado) then
//    try
//      Screen.Cursor := crHourGlass;
//      try
//        dsPrincipal.DataSet.Refresh;
//      except
//        on e: Exception do
//          raise Exception.Create('Houve uma falha ao tentar recuperar os dados da tabela.' + sLineBreak +
//                                 'Mensagem original: ' + e.Message);
//      end;
//    finally
//      Screen.Cursor := crDefault;
//    end;
//end;
//
//function TFCadPai.GetQtdeRegistros: Integer;
//begin
//  if (GetDataSetInstanciado) then
//    Result := dsPrincipal.DataSet.RecordCount
//  else
//    Result := 0;
//end;
//
//procedure TFCadPai.SetQtdeRegistros;
//begin
//  StatusBar.Panels[0].Text := 'Registros encontrados: ' + IntToStr(GetQtdeRegistros);
//end;
//
//procedure TFCadPai.ConfirmaSalvar;
//begin
//  if dsPrincipal.State in [dsEdit, dsInsert] then
//    case MessageBox(Handle, 'Deseja salvar as altera��es ?', 'Aten��o', MB_ICONQUESTION + MB_YESNOCANCEL) of
//      ID_YES   : btnRegSalvar.Click;
//      ID_NO    : btnRegDesfazer.Click;
//      ID_CANCEL: Abort;
//    end;
//end;
//
//procedure TFCadPai.AssignEventsToDataSet;
//begin
//  if (GetDataSetInstanciado) then
//    with (dsPrincipal.DataSet) do
//    begin
//      BeforeScroll := OnBeforeScroll;
//      AfterScroll  := OnAfterScroll;
//      BeforeDelete := OnBeforeDelete;
//    end;
//end;
//
//procedure TFCadPai.ChecaPosicaoDataset;
//begin
//  if (GetDataSetInstanciado) and (dsPrincipal.DataSet.RecNo > 0) then
//  begin
//    if (dsPrincipal.DataSet.RecNo = 1) then
//    begin
//      btnRegAnterior.Enabled := False;
//      btnRegProximo.Enabled  := False;
//    end
//    else if (dsPrincipal.DataSet.RecNo = dsPrincipal.DataSet.RecordCount) then
//    begin
//      btnRegAnterior.Enabled := True;
//      btnRegProximo.Enabled  := False;
//    end
//    else
//    begin
//      btnRegAnterior.Enabled := (dsPrincipal.DataSet.RecordCount > 0);
//      btnRegProximo.Enabled  := btnRegAnterior.Enabled;
//    end;
//  end
//  else
//  begin
//      btnRegAnterior.Enabled := False;
//      btnRegProximo.Enabled  := False;
//  end;
//end;
//
//procedure TFCadPai.OnAfterScroll(DataSet: TDataSet);
//begin
//  ChecaPosicaoDataset;
//  MapDataSetToFields(dsPrincipal.DataSet);
//end;
//
//procedure TFCadPai.OnBeforeScroll(DataSet: TDataSet);
//begin
//  ConfirmaSalvar;
//end;
//
//procedure TFCadPai.OnBeforeDelete(DataSet: TDataSet);
//begin
//  Abort;
//end;
//
//procedure TFCadPai.RegistroAnterior;
//begin
//  dsPrincipal.DataSet.Prior;
//  btnRegAnterior.Enabled := (dsPrincipal.DataSet.RecNo > 1);
//  btnRegProximo.Enabled  := True;
//end;
//
//procedure TFCadPai.ProximoRegistro;
//begin
//  dsPrincipal.DataSet.Next;
//  btnRegProximo.Enabled  := (dsPrincipal.DataSet.RecNo < dsPrincipal.DataSet.RecordCount);
//  btnRegAnterior.Enabled := True;
//end;
//
//procedure TFCadPai.NovoRegistro;
//begin
//  HabilitaNoInserir;
//  LimparCampos;
//  SetStatus(stInserindo);
//end;
//
//procedure TFCadPai.EditarRegistro;
//begin
//  HabilitaNoAlterar;
//  SetStatus(stEditando);
//end;
//
//procedure TFCadPai.SalvarRegistro;
//var
//  stStatusAnterior: TStatus;
//begin
//  HabilitaNoSalvar;
//
//  stStatusAnterior := GetStatus;
//  SetStatus(stNavegando);
//
//  if (GetDataSetInstanciado) then
//  begin
//    RefreshDataset;
//
//    if (stStatusAnterior = stInserindo) then
//      dsPrincipal.DataSet.Last;
//  end;
//
//  SetQtdeRegistros;
//end;
//
//procedure TFCadPai.CancelarAlteracao;
//begin
//  HabilitaNoCancelar;
//end;
//
//procedure TFCadPai.ApagarRegistro;
//var
//  iRecNo: Integer;
//begin
//  if (GetDataSetInstanciado) then
//  begin
//    iRecNo := dsPrincipal.DataSet.RecNo;
//
//    RefreshDataset;
//
//    if (iRecNo > dsPrincipal.DataSet.RecordCount) then
//      dsPrincipal.DataSet.RecNo := dsPrincipal.DataSet.RecordCount
//    else
//      dsPrincipal.DataSet.RecNo := iRecNo;
//  end;
//
//  HabilitaNoExcluir;
//end;
//
//procedure TFCadPai.HabilitaNoInicializar;
//begin
//  // Desabilita Botoes
//  btnRegAnterior.Enabled := False;
//  btnRegProximo.Enabled  := True;
//  btnRegEditar.Enabled   := True;
//  btnRegSalvar.Enabled   := False;
//  btnRegDesfazer.Enabled := False;
//  btnRegApagar.Enabled   := True;
//
//  edtPesquisar.Enabled := True;
//end;
//
//procedure TFCadPai.HabilitaNoInserir;
//begin
//  // Desabilita Botoes
//  btnRegAnterior.Enabled := False;
//  btnRegProximo.Enabled  := False;
//  btnRegNovo.Enabled     := False;
//  btnRegEditar.Enabled   := False;
//  btnRegApagar.Enabled   := False;
//  btnPesquisa.Enabled    := False;
//  edtPesquisar.Enabled    := False;
//
//  // Habilita Botoes
//  btnRegSalvar.Enabled   := True;
//  btnRegDesfazer.Enabled := True;
//end;
//
//procedure TFCadPai.HabilitaNoAlterar;
//begin
//  // Desabilita Botoes
//  btnPesquisa.Enabled    := False;
//   btnRegAnterior.Enabled := False;
//  btnRegProximo.Enabled  := False;
//  btnRegNovo.Enabled     := False;
//  btnRegEditar.Enabled   := False;
//  edtPesquisar.Enabled   := False;
//
//  // Habilita Botoes
//  btnRegSalvar.Enabled   := True;
//  btnRegDesfazer.Enabled := True;
//  btnRegApagar.Enabled   := True;
//end;
//
//procedure TFCadPai.HabilitaNoSalvar;
//begin
//  // Desabilita Botoes
//  btnRegSalvar.Enabled   := False;
//  btnRegDesfazer.Enabled := False;
//
//  // Habilitar Botoes
//  ChecaPosicaoDataset;
//
//  btnRegNovo.Enabled     := True;
//  btnRegEditar.Enabled   := True;
//  btnRegApagar.Enabled   := True;
//  btnPesquisa.Enabled    := True;
//  edtPesquisar.Enabled   := True;
//end;
//
//procedure TFCadPai.HabilitaNoCancelar;
//begin
//  if (GetDataSetInstanciado) then
//  begin
//    // Desabilita Botoes
//    btnRegSalvar.Enabled   := False;
//    btnRegDesfazer.Enabled := False;
//    btnRegApagar.Enabled   := False;
//
//    // Habilita Botoes
//    ChecaPosicaoDataset;
//
//    btnRegNovo.Enabled     := True;
//    btnRegEditar.Enabled   := True;
//    btnRegApagar.Enabled   := True;
//    btnPesquisa.Enabled    := True;
//    edtPesquisar.Enabled   := True;
//  end
//  else
//  begin
//    // Desabilita Botoes
//    btnRegAnterior.Enabled := False;
//    btnRegProximo.Enabled  := False;
//    btnRegEditar.Enabled   := False;
//    btnRegSalvar.Enabled   := False;
//    btnRegDesfazer.Enabled := False;
//    btnRegApagar.Enabled   := False;
//
//    // Habilita Botoes
//    btnRegNovo.Enabled     := True;
//    btnPesquisa.Enabled    := True;
//    edtPesquisar.Enabled   := True;
//  end;
//end;
//
//procedure TFCadPai.HabilitaNoExcluir;
//begin
//  ChecaPosicaoDataset;
//  HabilitaNoPesquisar;
//end;
//
//procedure TFCadPai.HabilitaNoPesquisar;
//begin
//  btnRegAnterior.Enabled := True;
//  btnRegProximo.Enabled  := True;
//  edtPesquisar.Enabled   := True;
//
//  if (GetQtdeRegistros = 0) then
//  begin
//    btnRegSalvar.Enabled   := False;
//    btnRegDesfazer.Enabled := False;
//    btnRegApagar.Enabled   := False;
//  end
//  else
//  begin
//    btnRegNovo.Enabled   := True;
//    btnRegEditar.Enabled := True;
//    btnRegApagar.Enabled := True;
//  end;
//end;
//
//function TFCadPai.GetStatus: TStatus;
//begin
//  Result := FStatus;
//end;
//
//
//
//procedure TFCadPai.LimparCampos;
//var
//  i: integer;
//begin
//  for i := 0 to ComponentCount - 1 do
//  begin
//    if (Components[i] is TEdit) then
//      (Components[i] as TEdit).Clear
//    else if (Components[i] is TComboBox) then
//      (Components[i] as TComboBox).ItemIndex := -1
//    else if (Components[i] is TMaskEdit) then
//      (Components[i] as TMaskEdit).Clear;
//  end;
//end;
//
//procedure TFCadPai.CamposSomenteLeitura(bSomenteLeitura: Boolean);
//var
//  i: integer;
//begin
//  for i := 0 to ComponentCount - 1 do
//  begin
//    if (Components[i] is TEdit) then
//    begin
//      if ((Components[i] as TEdit).Tag = 0) then
//        (Components[i] as TEdit).ReadOnly := bSomenteLeitura
//      else
//        (Components[i] as TEdit).ReadOnly := True;
//    end
//    else if (Components[i] is TMaskEdit) then
//    begin
//      if ((Components[i] as TMaskEdit).Tag = 0) then
//        (Components[i] as TMaskEdit).ReadOnly := bSomenteLeitura
//      else
//        (Components[i] as TMaskEdit).ReadOnly := True;
//    end
//    else if (Components[i] is TComboBox) then
//      (Components[i] as TComboBox).Enabled := not(bSomenteLeitura);
//  end;
//
//  edtPesquisar.ReadOnly := False;
//end;
//
//procedure TFCadPai.CopiarCamposObrigatorios(oObjeto: IBaseIntf);
//begin
//  FRegistro := oObjeto;
//end;
//
//function TFCadPai.GetRegistroCopiado: IBaseIntf;
//begin
//  Result := FRegistro;
//end;
//
//procedure TFCadPai.CopiarRegistro(oObjeto: IBaseIntf);
//begin
//  FRegistro := oObjeto;
//end;

end.