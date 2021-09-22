unit Unit_alunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, ADODB;

type
  TForm_alunos = class(TForm)
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
    Label4: TLabel;
    Label5: TLabel;
    edt_cod: TEdit;
    edt_nome: TEdit;
    edt_idade: TEdit;
    edt_telefone: TEdit;
    edt_sexo: TEdit;
    ADOQuery_aux: TADOQuery;
    btn_localizar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
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
  Form_alunos: TForm_alunos;

implementation

uses Unit_logon, Unit_pesquisa, Unit_pergunta;

{$R *.dfm}

{ TForm_alunos }

procedure TForm_alunos.bloqueia_campos;
var i: integer;
begin
  for i:= 1 to Form_alunos.ComponentCount -1 do
  begin
    if Form_alunos.Components[i] is TEdit then
    begin
      (Form_alunos.Components[i] as TEdit).Enabled:= False;
      (Form_alunos.Components[i] as TEdit).Color:= clInfoBk;
    end;
  end;
end;

procedure TForm_alunos.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:= True;
  btn_salvar.Enabled:= False;
  btn_alterar.Enabled:= True;
  btn_cancelar.Enabled:= False;
  btn_excluir.Enabled:= True;

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

procedure TForm_alunos.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:= False;
  btn_salvar.Enabled:= True;
  btn_alterar.Enabled:= False;
  btn_cancelar.Enabled:= True;
  btn_excluir.Enabled:= False;

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

procedure TForm_alunos.libera_campos;
var i: integer;
begin
  for i:= 1 to Form_alunos.ComponentCount -1 do
  begin
    if Form_alunos.Components[i] is TEdit then
    begin
      if(Form_alunos.Components[i] as TEdit).Name <> 'edt_cod' then
      begin
      (Form_alunos.Components[i] as TEdit).Enabled:= True;
      (Form_alunos.Components[i] as TEdit).Color:= clWindow;
      end;
    end;
  end;
end;

procedure TForm_alunos.limpar_campos;
var i: integer;
begin
  for i:= 1 to Form_alunos.ComponentCount -1 do
  begin
    if Form_alunos.Components[i] is TEdit then
    begin
      (Form_alunos.Components[i] as TEdit).Clear;
    end;
  end;
end;

procedure TForm_alunos.FormShow(Sender: TObject);
begin
  pk:= '';
  operacao:= '';
  limpar_campos;
  bloqueia_campos;
  desabilita_salvar(sender);
end;

procedure TForm_alunos.btn_novoClick(Sender: TObject);
begin
  libera_campos;
  limpar_campos;
  pk:= '';
  habilita_salvar(sender);
end;

procedure TForm_alunos.btn_salvarClick(Sender: TObject);
var deu_erro: boolean;
begin
  if(edt_nome.Text='')or(edt_idade.Text='')or(edt_telefone.Text='')or(edt_sexo.Text='') then
    begin
      Showmessage('Preencha todos os campos!');
    end
  else
    begin
      if operacao = 'novo' then
        ADOQuery_aux.SQL.Text:= ' INSERT INTO ALUNOS '+
                                ' (NOME, IDADE, TELEFONE, SEXO) VALUES'+
                                ' ('+ QuotedStr(edt_nome.Text)+
                                ' ,'+ edt_idade.Text +
                                ' ,'+ QuotedStr(edt_telefone.Text)+
                                ' ,'+ QuotedStr(edt_sexo.Text)+')'

      else if operacao = 'alterar' then
        ADOQuery_aux.SQL.Text:= ' UPDATE ALUNOS '+
                                ' SET NOME = '+ QuotedStr(edt_nome.Text)+
                                ', IDADE = '+ edt_idade.Text+
                                ', TELEFONE = '+ QuotedStr(edt_telefone.Text)+
                                ', SEXO = '+ QuotedStr(edt_sexo.Text)+
                                ' WHERE COD_ALUNO = '+ pk;

      Form_logon.ConexaoBD.BeginTrans;
      try
        adoquery_aux.ExecSQL;
        deu_erro:= false;   // Atribui falso e executa o comando SQL
      except
        on E: Exception do
        begin
          deu_erro:= true;  // Atribui verdadeiro e executa o tratamento de erro
          if Form_logon.ErroBD(E.Message,'PK__ALUNOS__7FE0AB670CBAE877')='Sim' then
            Showmessage('Aluno já cadastrado!')
          else if Form_logon.ErroBD(E.Message,'FK_MATRICULA_ALUNO')='Sim' then
            Showmessage('Existem matrículas cadastradas para este aluno!')
          else
            Showmessage('Ocorreu o seguinte erro: '+ E.Message);
        end;
    end;

    if deu_erro = true then  //Verifica o deu_erro verdadeiro e faz o rollback
      begin
        Form_logon.ConexaoBD.RollbackTrans;
      end
    else  //Senão realiza o Commit
      begin
        Form_logon.ConexaoBD.CommitTrans;
        if operacao = 'novo' then
          begin
            adoquery_aux.SQL.Text:= ' SELECT COD_ALUNO FROM ALUNOS '+
                                    ' WHERE NOME = '+ QuotedStr(edt_nome.Text)+
                                    ' AND IDADE = '+ edt_idade.Text+
                                    ' AND TELEFONE = '+ QuotedStr(edt_telefone.Text)+
                                    ' AND SEXO = '+ QuotedStr(edt_sexo.Text);
            adoquery_aux.Open;
            pk := adoquery_aux.fieldbyname('COD_ALUNO').AsString;
            adoquery_aux.Close;
            Showmessage('Aluno salvo com sucesso!')
          end
        else 
          begin
            Showmessage('Aluno alterado com sucesso!')
          end;
        desabilita_salvar(sender);
        bloqueia_campos;
        limpar_campos;
        edt_cod.Text:= pk;
        edt_cod.Clear;
      end;
    end;
end;

procedure TForm_alunos.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then
    Showmessage('Impossível alterar!')
  else
    libera_campos;
    habilita_salvar(sender);
end;


procedure TForm_alunos.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpar_campos;

  desabilita_salvar(sender);
  bloqueia_campos;
end;

procedure TForm_alunos.btn_excluirClick(Sender: TObject);
var
  deu_erro: boolean;

begin
     if pk = '' then
       Showmessage('Impossível excluir!')
     else
       begin
        adoquery_aux.SQL.Text:= ' DELETE FROM ALUNOS '+
                                ' WHERE COD_ALUNO = '+ pk;

        Form_logon.ConexaoBD.BeginTrans;
        try
         adoquery_aux.ExecSQL;
         deu_erro:= false;
        except
        on E: Exception do
         begin
          deu_erro:= true;
         if Form_logon.ErroBD(E.Message,'FK_MATRICULAS_ALUNOS') = 'Sim' then
          Showmessage('Existem matrículas cadastradas para este aluno!')
         else
          Showmessage('Ocorreu o seguinte erro: ' + E.Message);
        end;
       end;

     if deu_erro = true then
        begin
          Form_logon.ConexaoBD.RollbackTrans;
        end
      else
        begin
          Form_logon.ConexaoBD.CommitTrans;
          Showmessage('Aluno excluído com sucesso!');
          pk:= '';
          desabilita_salvar(sender);
          limpar_campos;
          bloqueia_campos;
        end;
    end;
end;

procedure TForm_alunos.btn_localizarClick(Sender: TObject);
begin
  limpar_campos;
  bloqueia_campos;
  desabilita_salvar(sender);

  Form_pesquisa.sql_pesquisa:= ' SELECT * FROM ALUNOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
    begin
      pk:= Form_pesquisa.chave;
      adoquery_aux.SQL.Text:= ' SELECT * FROM ALUNOS '+
                              ' WHERE COD_ALUNO = '+ pk;
      adoquery_aux.Open;
      edt_cod.Text:= adoquery_aux.fieldbyname('COD_ALUNO').AsString;
      edt_nome.Text:= adoquery_aux.fieldbyname('NOME').AsString;
      edt_idade.Text:= adoquery_aux.fieldbyname('IDADE').AsString;
      edt_telefone.Text:= adoquery_aux.fieldbyname('TELEFONE').AsString;
      edt_sexo.Text:= adoquery_aux.fieldbyname('SEXO').AsString;
    end;
end;

procedure TForm_alunos.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

end.
