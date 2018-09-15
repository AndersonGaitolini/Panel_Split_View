unit PanelSplitView;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms,
  Vcl.Graphics;

type
    TSVCloseStyle = (svColapse, svCompact);
    TSVPlacement = (svLeft, svRight);
    TSVViewState = (Colapsado, Expandido);

type
  TPanelSplitView = class(TPanel)
  private
    procedure setWidthCompact(const Value: Integer);
  Protected
       fSplitViewState     : TSVViewState; // Estado do SplitView
       fSaveWidthSplitView : Integer;      // Tamanho do painel antes de estar colapsado
       fImageVisibleWidth  : Integer;      // Tamanho das impagens visiveis quando o closeStyle = Compact
       fUseAnimation       : Boolean;      // Anima o recolhimento/Expansão ou não
       fPlacement          : TSVPlacement; // Local do Split View
       fCloseStyle         : TSVCloseStyle; // Modo de Fechamento (Compact ou Colapse)
       fWidthCompact       : Integer;

       procedure SetCloseStyle (CloseStyle : TSVCloseStyle);
       procedure SetPlacement (aPlacement : TSVPlacement);
       procedure SetAnimation (Animation : Boolean);
       procedure SetViewState (aViewState : TSVViewState);
       procedure Colapse;
       procedure Expand;

    Published
       property SplitViewState     : TSVViewState  read fSplitViewState     write SetViewState;
       property SaveWidthSplitView : Integer       read fSaveWidthSplitView write fSaveWidthSplitView;
       property ImageVisibleWidth  : Integer       read fImageVisibleWidth  write fImageVisibleWidth;
       property UseAnimation       : Boolean       read fUseAnimation       write SetAnimation;
       property Placement          : TSVPlacement  read fPlacement          write SetPlacement;
       property CloseStyle         : TSVCloseStyle read fCloseStyle         write SetCloseStyle;
       property WidthCompact       : Integer       read fWidthCompact       write setWidthCompact;
//       constructor  Create (aPanel : TPanel); overload;
//       destructor Destroy; override;
    Public
       procedure  MoveSplitView;
       constructor Create(AOwner: TComponent); override;
    end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TPanelSplitView]);
end;

procedure TPanelSplitView.SetCloseStyle (CloseStyle : TSVCloseStyle);
begin
     if CloseStyle = svCompact Then
        ImageVisibleWidth := fWidthCompact
     else
        ImageVisibleWidth := 0;
End;

procedure TPanelSplitView.SetPlacement (aPlacement : TSVPlacement);
begin
     fPlacement := aPlacement;
     if aPlacement = svLeft then
        Align := alLeft
     else
        Align := alRight;
end;

procedure TPanelSplitView.SetAnimation (Animation : Boolean);
begin
     fUseAnimation := Animation;
end;

procedure TPanelSplitView.SetViewState (aViewState : TSVViewState);
begin
     fSplitViewState := aViewState;
end;

procedure TPanelSplitView.setWidthCompact(const Value: Integer);
var ValueLimit : integer;
begin
  ValueLimit := Trunc(Width);
  if Value >  ValueLimit  then
    fWidthCompact := ValueLimit
  else
   fWidthCompact := Value;
end;

procedure TPanelSplitView.Colapse;
Var
     Cont : Integer;
Begin
     SaveWidthSplitView := Width;
     if UseAnimation then
     begin
        for Cont := 1 to Width - ImageVisibleWidth do
        begin
            Width := Width - 1;
            Application.ProcessMessages;
        end;
     end
     else
     begin
        Width := ImageVisibleWidth;
     end;
     SplitViewState := Colapsado;
End;



constructor TPanelSplitView.Create(AOwner: TComponent);
begin
  inherited;

  Align := alLeft;
  Color := cl3DDkShadow;
  fWidthCompact := 50;
  SetViewState (Expandido);
  SetAnimation(True);
  SetCloseStyle(svColapse);
end;

procedure TPanelSplitView.Expand;
Var
     Cont : Integer;
Begin
     if UseAnimation then
     begin
        for Cont := 1 to SaveWidthSplitView - ImageVisibleWidth do begin
            Width := Width + 1;
            Application.ProcessMessages;
        end;
     end
     eLse
     begin
        SetPlacement(fPlacement);
        Width := SaveWidthSplitView;
     End;
     SplitViewState := Expandido;
End;


procedure TPanelSplitView.MoveSplitView;
begin
     if SplitViewState = Expandido then
        Colapse
     else
        Expand;
end;

end.
