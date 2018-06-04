unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, Fmx.Bind.GenData,
  Data.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, FMX.ScrollBox, FMX.Memo,
  FMX.Objects, System.Actions, FMX.ActnList, Fmx.Bind.Navigator, FMX.Gestures,
  Data.Bind.DBScope, Data.DB, Datasnap.DBClient;

type
  TFormMain = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    ToolBar1: TToolBar;
    lblMainTab: TLabel;
    ToolBar2: TToolBar;
    Label1: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    ListView1: TListView;
    BindingsList1: TBindingsList;
    Image1: TImage;
    lblTitle: TLabel;
    lblName: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    Button3: TButton;
    Button4: TButton;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    GestureManager1: TGestureManager;
    BindSourceDB1: TBindSourceDB;
    lblCM: TLabel;
    ClientDataSet1: TClientDataSet;
    LinkListControlToField1: TLinkListControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

end.
