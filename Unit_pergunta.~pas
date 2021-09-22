unit Unit_pergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_pergunta = class(TForm)
    Label1: TLabel;
    btn_sim: TBitBtn;
    btn_nao: TBitBtn;
    procedure btn_simClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    pergunta: string;
    procedure habilita_excluir(Sender: TObject);
  end;

var
  Form_pergunta: TForm_pergunta;

implementation

{$R *.dfm}

procedure TForm_pergunta.btn_simClick(Sender: TObject);
begin
  habilita_excluir(sender);
  Form_pergunta.Close;
end;

procedure TForm_pergunta.btn_naoClick(Sender: TObject);
begin
   habilita_excluir(sender);
  Form_pergunta.Close;
end;

procedure TForm_pergunta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Form_pergunta.Close;
end;

procedure TForm_pergunta.habilita_excluir(Sender: TObject);
begin
  if Sender = btn_sim then
    pergunta:= 'Sim'
  else if Sender = btn_nao then
    pergunta:= 'Não';
end;

end.
