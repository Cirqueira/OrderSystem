unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDM = class(TDataModule)
    fdConnection: TFDConnection;
    qProduct: TFDQuery;
    dsProduct: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qProductcod_product: TIntegerField;
    qProductname: TStringField;
    qProductdescription: TStringField;
    qProductprice: TBCDField;
    qSearch: TFDQuery;
    dsSearch: TDataSource;
    fdqOrder: TFDQuery;
    fdqOrdercod_order: TIntegerField;
    fdqOrderdate_order: TDateField;
    fdqOrdercod_client: TIntegerField;
    fdqOrdername_client: TStringField;
    dsOrder: TDataSource;
    fdqItem: TFDQuery;
    fdqItemproduct: TStringField;
    fdqItemquantity: TIntegerField;
    fdqItemunit_price: TBCDField;
    fdqItemtotal_value_item: TFMTBCDField;
    fdqItemtotal_value_order: TFMTBCDField;
    dsItemOrder: TDataSource;
    qOrderSP: TFDQuery;
    qItemSP: TFDQuery;
    dsOrderSP: TDataSource;
    dsItemSP: TDataSource;
    qItemSPcod_item_order: TIntegerField;
    qItemSPcod_product: TIntegerField;
    qItemSPname_product: TStringField;
    qItemSPdescription: TStringField;
    qItemSPquantity: TIntegerField;
    qItemSPunit_price: TBCDField;
    qItemSPtotal_item: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
