unit Utils;

interface

uses
  SysUtils, Windows, Forms, Classes, TlHelp32, ComObj, Variants;
  //  ZipMstr
type
  TDateTimePropFile = (tdCriacao,tdModificacao,tdAcessado);

  function GetBuildInfo(const Arquivo: string = ''): string;
  function GetDateTimeInfoFile(const DateTimePropFile: TDateTimePropFile; const FileName: String): TDateTime;
  function GetFileSize(const FileName: String): Int64;
  function MsgSimNao(const Mensagem: string): Boolean;
  procedure MsgErro(const Mensagem: string);
  procedure MsgInfo(const Mensagem: string);
  procedure MsgAlerta(const Mensagem: string);
  function iif(const Value: Boolean; const vTrue: variant; const vFalse: variant): variant;
  function ExecAndWait(const FileName, Params: string; const WindowState: Word): boolean;
  function Encrypt(const Src: String; const Key: String): String;
  function Decrypt(const Src: String; const Key: String): String;
  function IntToAlfabeto(x: Integer): String;
  function IsTextIn(Text:String;Texts:array of string):Boolean;
  function IsStringIn(S:String;Strings:array of string):Boolean;
  function ValidateObj(Obj: TObject): Pointer;
  function SoNumero(const Value: String): String;
  procedure ClearDir(DirName: string);
  function GetFileDir(DirName: string; Ext: String = ''): String;
  //  procedure Descompactar(const FileName: string; const FromExtractDir: string);
  function FinalizaPrograma(const FileName: string): Boolean;
  procedure DeleteDirectory(DirName: String);
  function SemAcento(str: String): String;
  function SemCaracteresEspeciais(str: String): String;
  function verificarDllRegistrada(ClassID: TGUID): Boolean;

  function IsNumber(sValor: String): Boolean;
  function IsInteger(const sValor: String): Boolean;
  function IsDateTime(const sDataHora: String): Boolean;

  function ValidaCNPJ(CNPJ : String) : Boolean;
  function ValidaCPF(CPF : String): Boolean;
  function DataExtenso(Data:TDateTime): String;
  function DateUS(Data:TDateTime): String;
  function CentralizaFormCaption(sTexto: string; iTamanho: Integer): string;

const
  SIMBOLOS_LOJAS_LERAM = '@#$&+-!()={}[]<>;:';

implementation

function Crypt(Action, Src, Key : String) : String;
var
  KeyLen    : Integer;
  KeyPos    : Integer;
  offset    : Integer;
  dest      : string;
  SrcPos    : Integer;
  SrcAsc    : Integer;
  TmpSrcAsc : Integer;
  Range     : Integer;
begin
  dest:='';
  KeyLen:=Length(Key);
  KeyPos:=0;
  //SrcPos:=0;
  //SrcAsc:=0;
  Range:=256;
  if Action = UpperCase('E') then
  begin
    Randomize;
    offset:=Random(Range);
    dest:=format('%1.2x',[offset]);
    for SrcPos := 1 to Length(Src) do
    begin
      SrcAsc:=(Ord(Src[SrcPos]) + offset) MOD 255;

      if KeyPos < KeyLen then
        KeyPos:= KeyPos + 1 else KeyPos:=1;

      SrcAsc:= SrcAsc xor Ord(Key[KeyPos]);
      dest:=dest + format('%1.2x',[SrcAsc]);
      offset:=SrcAsc;
    end;
  end;

  if Action = UpperCase('D') then
  begin
    offset:=StrToInt('$'+ copy(src,1,2));
    SrcPos:=3;
    repeat
      SrcAsc:=StrToInt('$'+ copy(src,SrcPos,2));

      if KeyPos < KeyLen Then
        KeyPos := KeyPos + 1 else KeyPos := 1;

      TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      if TmpSrcAsc <= offset then
        TmpSrcAsc := 255 + TmpSrcAsc - offset
      else
        TmpSrcAsc := TmpSrcAsc - offset;

      dest := dest + chr(TmpSrcAsc);
      offset:=srcAsc;
      SrcPos:=SrcPos + 2;
    until SrcPos >= Length(Src);
  end;
  Crypt:=dest;
end;

function GetBuildInfo(const Arquivo: string):string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
  V1, V2, V3, V4: Word;
  Prog : string;
begin
  if Arquivo = EmptyStr then
    Prog := Application.Exename
  else
    Prog := Arquivo;
  VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
  if Assigned(VerInfo) then
  begin
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    with VerValue^ do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;
    FreeMem(VerInfo, VerInfoSize);
    result := IntToStr (v1) + '.' +
      IntToStr (v2) + '.' +
      IntToStr (v3) + '.' +
      IntToStr (v4);
  end
  else
  begin
    result := EmptyStr;
  end;
end;

function GetDateTimeInfoFile(const DateTimePropFile: TDateTimePropFile; const FileName: String): TDateTime;
var
  SearchFile: TSearchRec;
  lpSystemTime: TSystemTime;
  lpLocalTime: TFileTime;
begin
  {$WARN SYMBOL_PLATFORM OFF}
  FindFirst(FileName,faAnyFile,SearchFile);
  try
    Case DateTimePropFile of
      tdCriacao:  FileTimeToLocalFileTime(SearchFile.FindData.ftCreationTime,lpLocalTime);
      tdModificacao: FileTimeToLocalFileTime(SearchFile.FindData.ftLastWriteTime,lpLocalTime);
      tdAcessado : FileTimeToLocalFileTime(SearchFile.FindData.ftLastAccessTime,lpLocalTime);

      {
      tdCriacao:  FileTimeToSystemTime(SearchFile.FindData.ftCreationTime,lpSystemTime);
      tdModificacao: FileTimeToSystemTime(SearchFile.FindData.ftLastWriteTime,lpSystemTime);
      tdAcessado : FileTimeToSystemTime(SearchFile.FindData.ftLastAccessTime,lpSystemTime);
      }
    end;
    FileTimeToSystemTime(lpLocalTime,lpSystemTime);
    Result := SystemTimeToDateTime(lpSystemTime);
  finally
    SysUtils.FindClose(SearchFile);
  end;
  {$WARN SYMBOL_PLATFORM ON}
end;

function GetFileSize(const FileName: String): Int64;
var
  SearchFile: TSearchRec;
begin
  FindFirst(FileName,faAnyFile,SearchFile);
  try
    Result := SearchFile.Size;
  finally
    SysUtils.FindClose(SearchFile);
  end;
end;

function MsgSimNao(const Mensagem: string): Boolean;
begin
  Result := Application.MessageBox(PChar(Mensagem),'Confirmação',MB_ICONQUESTION + MB_YESNO) = ID_YES;
end;

procedure MsgErro(const Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem),'Erro',MB_ICONERROR);
end;

procedure MsgInfo(const Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem),'Informação',MB_ICONINFORMATION);
end;

procedure MsgAlerta(const Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem),'Alerta',MB_ICONWARNING);
end;

function iif(const Value: Boolean; const vTrue: variant; const vFalse: variant): variant;
begin
  if Value then
    Result := vTrue
  else
    Result := vFalse;
end;

function ExecAndWait(const FileName, Params: string;
  const WindowState: Word): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do begin
  cb := SizeOf(SUInfo);
  dwFlags := STARTF_USESHOWWINDOW;
  wShowWindow := WindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false,
  CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
  PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then begin
  WaitForSingleObject(ProcInfo.hProcess, INFINITE);
  { Libera os Handles }
  CloseHandle(ProcInfo.hProcess);
  CloseHandle(ProcInfo.hThread);
  end;
end;

function Encrypt(const Src: String; const Key: String): String;
begin
  if Trim(Src) = '' then
    Result := ''
  else
    Result := Crypt('E',Src,Key);
end;

function Decrypt(const Src: String; const Key: String): String;
begin
  if Trim(Src) = '' then
    Result := ''
  else
    Result := Crypt('D',Src,Key);
end;

function IntToAlfabeto(x: Integer): String;
begin
  if x = 1  then
    result := '*'
  else if x < 10 then
    result := chr(48 + x)
  else if x <= 35 then
    result := chr(65 + x - 10)
  else if x <= 53 then
    result := SIMBOLOS_LOJAS_LERAM[x-35]
  else
    raise Exception.Create(Format('O filial_id %d não pode ser convertido para um "lojas_leram" válido', [x]));
end;

function IsTextIn(Text:String;Texts:array of string):Boolean;
var
  i : Integer;
begin
  for i := 0 to length(Texts)-1 do
  begin
    if CompareText(Text,Texts[i])= 0 then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function IsStringIn(S:String;Strings:array of string):Boolean;
var
  i : Integer;
begin
  for i := 0 to length(Strings)-1 do
  begin
    if CompareStr(S,Strings[i])= 0 then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function ValidateObj(Obj: TObject): Pointer;
  type  PPVmt = ^PVmt;
  PVmt = ^TVmt;
  TVmt = record
    SelfPtr : TClass;
    Other   : array[0..17] of pointer;
  end;
  var  Vmt: PVmt;
begin
  Result := Obj;
  if Assigned(Result) then
    try
      Vmt := PVmt(Obj.ClassType);
      Dec(Vmt);
      if Obj.ClassType <> Vmt.SelfPtr then
        Result := nil;
    except
      Result := nil;
    end;
end;


function SoNumero(const Value: String): String;
var
  iX: Integer;
begin
  Result := '';
  For iX := 1 to Length(Value) do
    if Value[iX] in ['0'..'9'] then
      Result := Result + Value[iX];
end;

function GetFileDir(DirName: string; Ext: String): String;
var
  oSr    : TSearchRec;
  iResult: Integer;
  oList: TStringList;
begin
  if DirName = '' then
    Exit;

  if Ext = '' then
    Ext := '*.*';
  oList := TStringList.Create;

  if DirName[Length(DirName)] <> '\' then
    DirName := DirName + '\';
  {$WARNINGS OFF}
  iResult := FindFirst(DirName + Ext, faArchive, oSR);
  {$WARNINGS ON}
  while iResult = 0 do
  begin
    oList.Add(DirName+oSr.Name);

    iResult := FindNext(oSR);
  end;
  SysUtils.FindClose(oSR);

  Result := oList.Text;
  oList.Free;
end;

procedure ClearDir(DirName: string);
var
  iX: Integer;
  oList: TStringList;
begin
  if DirName = '' then
    Exit;

  oList := TStringList.Create;
  oList.Text := GetFileDir(DirName);

  for iX := 0 to oList.Count -1 do
    DeleteFile(PChar(oList[iX]));
end;

{
procedure Descompactar(const FileName: string; const FromExtractDir: string);
var
  Zip: TZipMaster;
begin
  try
    Zip              := TZipMaster.Create(nil);
    Zip.ZipFilename  := FileName;
    Zip.Dll_Load     := true;
    Zip.FSpecArgs.Add('*.*');
    Zip.ExtrBaseDir  := FromExtractDir;
    Zip.ExtrOptions  := Zip.ExtrOptions + [ExtrOverwrite];
    if Zip.Count > 0 then
      Zip.Extract;
  finally
    FreeAndNil(Zip);
  end;
end;
}
function GetProgramasExecucao: String;
const
  PROCESS_TERMINATE = $0001;
var
  //Handle para um conjunto de informações sobre os processos da memória
  hdSnapshot      : THandle;
  //Informações sobre um determinado processo em memória
  fProcessEntry32 : TProcessEntry32;
  //Controle de looping
  bContinueLoop   : BOOL;

  oList: TStringList;
begin
  oList := TStringList.Create;
  oList.Clear;

  //Cria um Handle para as informações dos processos em memória
  hdSnapshot:= CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);

  //Define o tamanho da estrutura tProcessEntry32
  fProcessEntry32.dwSize:=SizeOf(fProcessEntry32);

  //Captura o primeiro processo na fila da memória
  bContinueLoop:= Process32First(hdSnapshot, fProcessEntry32);

  //Enquanto não se acabarem os processos em memória
  while not(Integer(bContinueLoop) = 0) do
  begin

    oList.Add(LowerCase(fProcessEntry32.szExeFile));

    //Captura o próximo processo em memória
    bContinueLoop:= Process32Next(hdSnapshot, fProcessEntry32);
  end;

  //Fecha o Handle da memória
  CloseHandle(hdSnapshot);

  Result := oList.Text;
  oList.Free;
end;

function ProgramaEmExecucao(const FileName: string): Boolean;
var
  sBuffer: String;
begin
  sBuffer := GetProgramasExecucao;

  Result := Pos(LowerCase(FileName),sBuffer) > 0;
end;

function FinalizaPrograma(const FileName: string): Boolean;
var
  iCount: Integer;
begin
  iCount := 0;
  //Usa o comando do próprio Windows (TaskKill) para finalizar o programa
  while (ProgramaEmExecucao(FileName)) and (iCount <= 3) do
  begin
    WinExec(PAnsiChar('taskkill -f -im "' + FileName + '"'), SW_HIDE);
    inc(iCount);
    Sleep(500);
  end;

  Result := not ProgramaEmExecucao(FileName);
end;

procedure DeleteDirectory(DirName: String);
var
  oSR: TSearchRec;
  iX: Integer;
  oList: TStringList;
begin
  if DirName = '' then
    Exit;

  if DirName[Length(DirName)] <> '\' then
    DirName := DirName + '\';

  ClearDir(DirName);
  oList := TStringList.Create;

  {$WARNINGS OFF}
  iX := FindFirst(DirName + '*', faDirectory, oSR);
  {$WARNINGS ON}
  while iX = 0 do
  begin
    if (oSR.Name <> '.') and (oSR.Name <> '..') then
      oList.Add(DirName+oSr.Name + '\');

    iX := FindNext(oSR);
  end;
  SysUtils.FindClose(oSR);

  for iX := 0 to oList.Count -1 do
    DeleteDirectory(oList[iX]);

  RemoveDir(DirName);

  oList.Free;
end;

function SemAcento( str: String ): String;
var
  i: Integer;
begin
  if Trim(str) = '' then
    Exit;

  for i := 1 to Length ( str ) do
    case str[i] of
      'á': str[i] := 'a'; 'é': str[i] := 'e'; 'í': str[i] := 'i'; 'ó': str[i] := 'o';
      'ú': str[i] := 'u'; 'à': str[i] := 'a'; 'è': str[i] := 'e'; 'ì': str[i] := 'i';
      'ò': str[i] := 'o'; 'ù': str[i] := 'u'; 'â': str[i] := 'a'; 'ê': str[i] := 'e';
      'î': str[i] := 'i'; 'ô': str[i] := 'o'; 'û': str[i] := 'u'; 'ä': str[i] := 'a';
      'ë': str[i] := 'e'; 'ï': str[i] := 'i'; 'ö': str[i] := 'o'; 'ü': str[i] := 'u';
      'ã': str[i] := 'a'; 'õ': str[i] := 'o'; 'ñ': str[i] := 'n'; 'ç': str[i] := 'c';
      'Á': str[i] := 'A'; 'É': str[i] := 'E'; 'Í': str[i] := 'I'; 'Ó': str[i] := 'O';
      'Ú': str[i] := 'U'; 'À': str[i] := 'A'; 'È': str[i] := 'E'; 'Ì': str[i] := 'I';
      'Ò': str[i] := 'O'; 'Ù': str[i] := 'U'; 'Â': str[i] := 'A'; 'Ê': str[i] := 'E';
      'Î': str[i] := 'I'; 'Ô': str[i] := 'O'; 'Û': str[i] := 'U'; 'Ä': str[i] := 'A';
      'Ë': str[i] := 'E'; 'Ï': str[i] := 'I'; 'Ö': str[i] := 'O'; 'Ü': str[i] := 'U';
      'Ã': str[i] := 'A'; 'Õ': str[i] := 'O'; 'Ñ': str[i] := 'N'; 'Ç': str[i] := 'C';
    end;
  Result := str;
end;

function SemCaracteresEspeciais(str: String): String;
const
  Caracteres = '´`^*!#$%&*~,.;:';
var
  i: Integer;
begin
  if Trim(str) = '' then
    Exit;

  Result := '';
  for i := 1 to Length ( str ) do
    if Pos(str[i],Caracteres) = 0 then
      Result := Result + str[i];
end;

function verificarDllRegistrada(ClassID: TGUID): Boolean;
var
  Retorno  : boolean;
  ObjDll     : Variant;
begin
  Retorno := false;
  try
    try
      ObjDll  := CreateComObject(ClassID);

      Retorno := true;
    except
      Retorno := false;
      raise;
    end;
  finally
    ObjDll := Unassigned;
    Result := Retorno;
  end;
end;

function IsNumber(sValor: String): Boolean;
var
  i: integer;
begin
  if (sValor = EmptyStr) then
  begin
    Result := False;
    Exit;
  end
  else
    Result := True;

  sValor := StringReplace(sValor, '.', '', [rfReplaceAll, rfIgnoreCase]);

  for i := 0 to Length(sValor) do
    if not(sValor[i] in ['0'..'9', ',']) then
    begin
      Result := False;
      Break;
    end;
end;

function IsInteger(const sValor: String): Boolean;
var
  i: integer;
begin
  if (sValor = EmptyStr) then
  begin
    Result := False;
    Exit;
  end
  else
    Result := True;

  for i := 1 to Length(sValor) do
    if not(sValor[i] in ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
end;

function IsDateTime(const sDataHora: String): Boolean;
begin
  try
    StrToDateTime(sDataHora);
    Result := True;
  except
    Result := False;
  end;
end;

function ValidaCNPJ(CNPJ :String) : Boolean;
var
  dig13, dig14: string;
  sm, i, r, peso: integer;
begin
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14)) then
  begin
    Result := False;
    exit;
  end;

  try
    sm := 0;
    peso := 2;

    for i := 12 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;

      if (peso = 10) then
        peso := 2;
    end;

    r := sm mod 11;

    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11-r):1, dig13);


    sm := 0;
    peso := 2;

    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;

      if (peso = 10) then
        peso := 2;
    end;

    r := sm mod 11;

    if ((r = 0) or (r = 1)) then
      dig14 := '0'
    else
      str((11-r):1, dig14);

    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14])) then
      Result := True
    else
      Result := false;

  except
    Result := False
  end;
end;

Function ValidaCPF(CPF :string): Boolean;
var
  dig10, dig11: string;
  s, i, r, peso: integer;
begin 
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11)) then
  begin
    Result := False;
    exit;
  end;

  try
    s := 0;
    peso := 10;

    for i := 1 to 9 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;

    r := 11 - (s mod 11);

    if ((r = 10) or (r = 11)) then
      dig10 := '0'
    else
      str(r:1, dig10);


    s := 0;
    peso := 11;

    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;

    r := 11 - (s mod 11);

    if ((r = 10) or (r = 11)) then
      dig11 := '0'
    else
      str(r:1, dig11);

    if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
      Result := True
    else
      Result := False;

  except
    Result := False
  end;
end;

function DataExtenso(Data:TDateTime): String;
var
  iDia : Integer;
  sDiaSemana : array [1..7] of String;
  sMes : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
  sDiaSemana [1]:= 'Domingo';
  sDiaSemana [2]:= 'Segunda-feira';
  sDiaSemana [3]:= 'Terça-feira';
  sDiaSemana [4]:= 'Quarta-feira';
  sDiaSemana [5]:= 'Quinta-feira';
  sDiaSemana [6]:= 'Sexta-feira';
  sDiaSemana [7]:= 'Sábado';

  sMes [1]:=  'Janeiro';
  sMes [2]:=  'Fevereiro';
  sMes [3]:=  'Março';
  sMes [4]:=  'Abril';
  sMes [5]:=  'Maio';
  sMes [6]:=  'Junho';
  sMes [7]:=  'Julho';
  sMes [8]:=  'Agosto';
  sMes [9]:=  'Setembro';
  sMes [10]:= 'Outubro';
  sMes [11]:= 'Novembro';
  sMes [12]:= 'Dezembro';

  DecodeDate (Data, Ano, Mes, Dia);

  iDia := DayOfWeek(Data);

  Result := sDiaSemana [iDia] + ', ' + inttostr (Dia) + ' de ' + sMes [Mes]+ ' de ' + inttostr (Ano);
end;

function DateUS(Data:TDateTime): String;
var
  iDay : Integer;
  sWeekDay : array [1..7] of String;
  sMonth : array [1..12] of String;
  Day, Month, Year : Word;
begin
  sWeekDay [1]:= 'Sunday';
  sWeekDay [2]:= 'Monday';
  sWeekDay [3]:= 'Tuesday';
  sWeekDay [4]:= 'Wednesday';
  sWeekDay [5]:= 'Thursday';
  sWeekDay [6]:= 'Friday';
  sWeekDay [7]:= 'Saturday';

  sMonth [1]:=  'January';
  sMonth [2]:=  'February';
  sMonth [3]:=  'March';
  sMonth [4]:=  'April';
  sMonth [5]:=  'May';
  sMonth [6]:=  'June';
  sMonth [7]:=  'July';
  sMonth [8]:=  'August';
  sMonth [9]:=  'September';
  sMonth [10]:= 'October';
  sMonth [11]:= 'November';
  sMonth [12]:= ' December';

  DecodeDate (Data, Year, Month, Day);

  iDay := DayOfWeek(Data);

  Result := inttostr (Day) + 'th ' + sMonth [Month]+ ', ' + inttostr (Year);
end;

function CentralizaFormCaption(sTexto: string; iTamanho: Integer): string;
var
  iContador : Integer;
  iPosicao  : Integer;
begin
  Result   := sTexto;
  iPosicao := Trunc((iTamanho - Length(Result)) / 2);

  for iContador := 1 to iPosicao do
    Result := ' ' + Result;

  iPosicao := (iTamanho - Length(Result));

  for iContador := 1 to iPosicao do
    Result := Result + ' ';
end;

end.
