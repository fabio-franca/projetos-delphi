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
    btn_localizar: TBitBtn;
    btn_permissoes: TBitBtn;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
    procedure btn_permissoesClick(Sender: TObject);
    //procedure btn_fecharClick(Sender: TObject);
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

uses Unit_logon, Unit_pesquisa, Unit_permissoes;

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

procedure TForm_usuarios.btn_salvarClick(Sender: TObject);
  var
    deu_erro: boolean;
    senha: string;
begin
  if(edt_usuario.Text='')or(edt_nome.Text='')or(edt_senha.Text='')then
    begin
      Showmessage('Preencha todos os campos!');
    end
  else
    begin
      senha:= Form_logon.criptografa(edt_senha.Text);

      if operacao = 'novo' then
        adoquery_aux.SQL.Text:=' INSERT INTO USUARIOS VALUES '+
                               ' ('+ QuotedStr(edt_usuario.Text)+
                               ','+ QuotedStr(edt_nome.Text)+
                               ','+ QuotedStr(senha)+ ')'

      else if operacao = 'alterar' then
        adoquery_aux.SQL.Text:=' UPDATE USUARIOS '+
                               ' SET USUARIO ='+ QuotedStr(edt_usuario.Text)+
                               ', NOME ='+ QuotedStr(edt_nome.Text)+
                               ', SENHA ='+ QuotedStr(senha)+
                               ' WHERE USUARIO = '+ QuotedStr(pk);

      Form_logon.ConexaoBD.BeginTrans;
      try
        ADOQuery_aux.ExecSQL;
        deu_erro:= false;
      except
        on E: Exception do
        begin
          deu_erro:= true;
          if Form_logon.ErroBD(E.Message,'PK__USUARIOS__9AFF8FC721B6055D')= 'Sim' then
            Showmessage('Usuário já cadastrado!')
          else if Form_logon.ErroBD(E.Message,'FK_PERMISSOES_USUARIO')='Sim' then
            Showmessage('Existem permissões cadastradas para este usuário!')
          else
            Showmessage('Ocorreu o seguinte erro: '+ E.Message);
        end;
    end;

  if deu_erro = true then
    begin
      Form_logon.ConexaoBD.RollbackTrans;
    end
  else
    begin
      Form_logon.ConexaoBD.CommitTrans;
      pk:= edt_usuario.Text;
      desabilita_salvar(sender);
      bloqueia_campos;
    end;
  end;
end;
procedure TForm_usuarios.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then
    Showmessage('Impossível alterar!')
  else
    begin
      libera_campos;
      habilita_salvar(sender);
    end
end;

procedure TForm_usuarios.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpar_campos;
  desabilita_salvar(sender);
  bloqueia_campos;
end;

procedure TForm_usuarios.btn_excluirClick(Sender: TObject);
var deu_erro: boolean;
begin
  if pk = '' then
    Showmessage('Impossível Excluir!')
  else
    begin
      ADOQuery_aux.SQL.Text:= ' DELETE FROM USUARIOS ' +
                              ' WHERE USUARIO = ' + QuotedStr(pk);
      Form_logon.ConexaoBD.BeginTrans;

      try
        ADOQuery_aux.ExecSQL;
        deu_erro:= false;
      except
        on E: Exception do
        begin
          deu_erro:= true;
          if Form_logon.ErroBD(E.Message,'FK_PERMISSOES_USUARIO') = 'Sim' then
            Showmessage('Existem permissões cadastradas para este usuário!')
          else
            Showmessage('Ocorreu o seguinte erro: ' + E.Message)
        end;
    end;

    if deu_erro = true then
      begin
        Form_logon.ConexaoBD.RollbackTrans;
      end
    else
      begin
        Form_logon.ConexaoBD.CommitTrans;
        pk := '';
        desabilita_salvar(sender);
        limpar_campos;
        bloqueia_campos;
      end;
  end;
end;

procedure TForm_usuarios.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_usuarios.FormShow(Sender: TObject);
begin
  pk:= '';
  operacao:= '';
  limpar_campos;
  bloqueia_campos;
  desabilita_salvar(sender);
end;

procedure TForm_usuarios.btn_localizarClick(Sender: TObject);
var senha: string;
begin
  limpar_campos;
  bloqueia_campos;
  desabilita_salvar(sender);

  Form_pesquisa.sql_pesquisa:= ' SELECT USUARIO, NOME FROM USUARIOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
    begin
      pk:= Form_pesquisa.chave;
      ADOQuery_aux.SQL.Text:= ' SELECT * FROM USUARIOS '+
                              ' WHERE USUARIO = '+ QuotedStr(pk);
      ADOQuery_aux.Open;
      edt_usuario.Text:= ADOQuery_aux.fieldbyname('USUARIO').AsString;
      edt_nome.Text:= ADOQuery_aux.fieldbyname('NOME').AsString;
      senha:= ADOQuery_aux.fieldbyname('SENHA').AsString;
      edt_senha.Text:= Form_logon.descriptografa(senha);
    end;
end;

procedure TForm_usuarios.btn_permissoesClick(Sender: TObject);
begin
  if pk = '' then
    Showmessage('Usuário inválido!')
  else
    begin
      bloqueia_campos;
      desabilita_salvar(sender);
      Form_permissoes.usuario:= pk;
      Form_permissoes.ShowModal;
    end;
end;

end.
