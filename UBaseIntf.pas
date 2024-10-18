unit UBaseIntf;

interface

uses Classes;

type
  IBaseIntf = interface(IInterface)
    ['{8054BA86-05B4-4253-8EC1-818330E589BE}']
    function Implements(const IID: TGUID): Boolean;
    function GetClass:TClass;
    function GetTypeName:String;
    function BaseClone: IBaseIntf;
    procedure Validate;
    function HasPrimaryKey: Boolean;
    function GetAsXML(RefBase: IBaseIntf = nil):String;
    procedure LoadFromXML(XML:String);
    function GetIsPersistent: Boolean;
    procedure SetIsPersistent(const Value: Boolean);
    procedure FreeReferences;
    property IsPersistent: Boolean read GetIsPersistent;
  end;

implementation

end.

