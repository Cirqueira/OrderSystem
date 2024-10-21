unit UtilMensagens;

interface

uses Forms, Dialogs, Windows;

procedure msgInformacao(const sMensagem: String; const sTitulo: String = 'Informação...');
procedure msgAlerta(const sMensagem: String; const sTitulo: String = 'Atenção...');
procedure msgErro(const sMensagem: String; const sTitulo: String = 'Erro...');
function  msgSimNao(const sMensagem: String; const sTitulo: String = 'Confirmação...'): Boolean;
function  msgSimNaoCancelar(const sMensagem: String; const sTitulo: String = 'Confirmação...'): Integer;


implementation

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

end.
