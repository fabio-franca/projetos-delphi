unit Unit_usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TForm_usuarios = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_usuario: TEdit;
    edt_nome: TEdit;
    edt_senha: TEdit;
    ADOQuery_aux: TADOQuery;
    procedure btn_novoClick(Sender: TObject);
    //procedure btn_novoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao, pk: string;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpar_campos;
  end;

var
  Form_usuarios: TForm_usuarios;

implementation

uses Unit_logon;

{$R *.dfm}

{ TForm_usuarios }

procedure TForm_usuarios.bloqueia_campos;
var i : integer;
begin
  for i := 1 to form_usuarios.ComponentCount -1 do
  begin
    if form_usuarios.Components[i] is TEdit then
    begin
      (form_usuarios.Components[i] as TEdit).Enabled:= False;
      (form_usuarios.Components[i] as TEdit).Color:= clInfoBk;
    end;
  end;
end;

procedure TForm_usuarios.libera_campos;
var i : integer;
  begin
    for i:= 1 to form_usuarios.ComponentCount -1 do
    begin
     if form_usuarios.Components[i] is TEdit then
      begin
        (form_usuarios.Components[i] as TEdit).Enabled:= True;
        (form_usuarios.Components[i] as TEdit).Color:= clWindow;
      end;
  end;
end;

procedure TForm_usuarios.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=True;
  btn_salvar.Enabled:=False;
  btn_alterar.Enabled:=True;
  btn_cancelar.Enabled:=False;
  btn_excluir.Enabled:=True;

  if Sender = btn_novo then
    operacao:= 'novo'
  else if Sender = btn_salvar then
    operacao:= 'salvar'
  else if Sender = btn_alterar then
    operacao:= 'alterar'
  else if Sender = btn_cancelar then
    operacao:= 'cancelar'
  else if Sender = btn_excluir then
    operacao:= 'excluir';
end;

procedure TForm_usuarios.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=False;
  btn_salvar.Enabled:=True;
  btn_alterar.Enabled:=False;
  btn_cancelar.Enabled:=True;
  btn_excluir.Enabled:=False;

  if Sender = btn_novo then
    operacao:= 'novo'
  else if Sender = btn_salvar then
    operacao:= 'salvar'
  else if Sender = btn_alterar then
    operacao:= 'alterar'
  else if Sender = btn_cancelar then
    operacao:= 'cancelar'
  else if Sender = btn_excluir then
    operacao:= 'excluir';
end;

procedure TForm_usuarios.limpar_campos;
var i : integer;
begin
  for i:= 1 to form_usuarios.ControlCount -1 do
  begin
    if form_usuarios.Components[i] is TEdit then
    begin
      (form_usuarios.Components[i] as TEdit).Clear;
    end;
end;
end;
procedure TForm_usuarios.btn_novoClick(Sender: TObject);
begin
  libera_campos; //Libera os campos
  limpar_campos; //Limpa os campos
  pk:= '';  //Limpa a chave
  habilita_salvar(sender); //Habilita salvar ou cancelar
end;

end.