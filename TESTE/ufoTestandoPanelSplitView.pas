unit ufoTestandoPanelSplitView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, PanelSplitView,
  Vcl.StdCtrls;

type
  TForm7 = class(TForm)
    btn1: TButton;
    cbAnimation: TCheckBox;
    cbCloseStyle: TCheckBox;
    pnlspltvw1: TPanelSplitView;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.btn1Click(Sender: TObject);
begin
  pnlspltvw1.UseAnimation := cbAnimation.Checked;
  if cbCloseStyle.Checked then
    pnlspltvw1.CloseStyle := svCompact
  else
    pnlspltvw1.CloseStyle := svColapse;

  pnlspltvw1.MoveSplitView;
end;

end.
