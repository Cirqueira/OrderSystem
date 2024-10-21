unit UtilMensagens;

interface

uses Forms, Dialogs, Windows;

procedure msgInformacao(const sMensagem: String; const sTitulo: String = 'Informação...');
procedure msgAlerta(const sMensagem: String; const sTitulo: String = 'Atenção...');
procedure msgErro(const sMensagem: String; const sTitulo: String = 'Erro...');
function  msgSimNao(const sMensagem: String; const sTitulo: String = 'Confirmação...'): Boolean;
function  msgSimNaoCancelar(const sMensagem: String; const sTitulo: String = 'Confirmação...'): Integer;

procedure msgInformation(const sMessage: String; const sTitle: String = 'Information...');
procedure msgAlert(const sMessage: String; const sTitle: String = 'Atention...');
procedure msgError(const sMessage: String; const sTitle: String = 'Error...');
function  msgYesNo(const sMessage: String; const sTitle: String = 'Confirmation...'): Boolean;
function  msgYesNoCancel(const sMessage: String; const sTitle: String = 'Confirmation...'): Integer;


implementation

// Portugues
procedure msgAlerta(const sMensagem, sTitulo: String);
begin
  Application.MessageBox(PWideChar(sMensagem), PWideChar(sTitulo), MB_ICONWARNING);
end;

procedure msgErro(const sMensagem, sTitulo: String);
begin
  Application.MessageBox(PWideChar(sMensagem), PWideChar(sTitulo), MB_ICONERROR);
end;

procedure msgInformacao(const sMensagem, sTitulo: String);
begin
  Application.MessageBox(PWideChar(sMensagem), PWideChar(sTitulo), MB_ICONINFORMATION);
end;

function msgSimNao(const sMensagem, sTitulo: String): Boolean;
begin
  Result := (Application.MessageBox(PWideChar(sMensagem), PWideChar(sTitulo), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES);
end;

function msgSimNaoCancelar(const sMensagem, sTitulo: String): Integer;
begin
  Result := Application.MessageBox(PWideChar(sMensagem), PWideChar(sTitulo), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1);
end;


// English
procedure msgAlert(const sMessage, sTitle: String);
begin
  Application.MessageBox(PWideChar(sMessage), PWideChar(sTitle), MB_ICONWARNING);
end;

procedure msgError(const sMessage, sTitle: String);
begin
  Application.MessageBox(PWideChar(sMessage), PWideChar(sTitle), MB_ICONERROR);
end;

procedure msgInformation(const sMessage, sTitle: String);
begin
  Application.MessageBox(PWideChar(sMessage), PWideChar(sTitle), MB_ICONINFORMATION);
end;

function msgYesNo(const sMessage, sTitle: String): Boolean;
begin
  Result := (Application.MessageBox(PWideChar(sMessage), PWideChar(sTitle), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = ID_YES);
end;

function msgYesNoCancel(const sMessage, sTitle: String): Integer;
begin
  Result := Application.MessageBox(PWideChar(sMessage), PWideChar(sTitle), MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1);
end;

end.
