unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, StdCtrls, jpeg, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Edtpalavrachave: TEdit;
    Edtfalapersonagem: TEdit;
    BtnOk: TButton;
    Edtpalavra: TEdit;
    EdtResposta: TEdit;
    BtnSair: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
Var
voz: OLEVariant;
begin
 voz := CreateOLEObject ('SAPI.SpVoice');
      Edtfalapersonagem.Text := 'Olá Crianças';
      voz.speak(Edtfalapersonagem.Text,0);
      Edtfalapersonagem.Text := 'Estão prontas para jogar ?';
      voz.speak(Edtfalapersonagem.Text,0);
      Edtfalapersonagem.Text := 'Então Vamo lá!';
      voz.speak(Edtfalapersonagem.Text,0);

end;

procedure TForm1.BtnOkClick(Sender: TObject);
var
voz : OLEVariant;
a : Integer;
begin
 a := 0;
 voz := CreateOLEObject ('SAPI.SpVoice');
 if Edtpalavrachave.Text = Edtpalavra.Text then
 begin
    EdtResposta.Text := 'Você Acertou! A Palavra é:  ' + Edtpalavra.Text;
    voz.speak(EdtResposta.Text,0);
    a := a + 100;
    Label2.Caption := IntToStr(a);
 end
      else 
      begin
      EdtResposta.Text := 'Você Errou! Tente Outra Vez!';
      voz.speak(EdtResposta.Text,0);
      end;

end;

procedure TForm1.BtnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
