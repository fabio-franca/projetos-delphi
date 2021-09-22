unit Unit_pesquisa_turmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TForm_pesquisa_turmas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cb_campo: TComboBox;
    edt_texto: TEdit;
    grid_pesquisa_turma: TDBGrid;
    btn_pesquisar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    btn_cancelar: TBitBtn;
    ADOQuery_pesquisa_turma: TADOQuery;
    ds_pesquisa_turma: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    //Armazena a chave primária do registro selecionado
    chave: string;
  end;

var
  Form_pesquisa_turmas: TForm_pesquisa_turmas;

implementation

uses Unit_logon;

{$R *.dfm}

procedure TForm_pesquisa_turmas.FormShow(Sender: TObject);
begin
  chave:= '';
  cb_campo.ItemIndex:= -1;
  edt_texto.Clear;
  ADOQuery_pesquisa_turma.Close;
end;

procedure TForm_pesquisa_turmas.btn_pesquisarClick(Sender: TObject);
var condicao,sql: string;
begin
  condicao:= '';
  if cb_campo.ItemIndex = 0 then
    condicao:= ' WHERE TURMAS.COD_TURMA LIKE '+
                QuotedStr(edt_texto.Text)
  else if cb_campo.ItemIndex = 1 then
    condicao:= ' WHERE CURSOS.NOME LIKE '+
                QuotedStr(edt_texto.Text)
  else if cb_campo.ItemIndex = 2 then
    condicao:= ' WHERE INSTRUTORES.NOME LIKE '+
                QuotedStr(edt_texto.Text);

  if(condicao='') or (edt_texto.Text='') then
    Showmessage('Pesquisa inválida!')
  else
    begin
      sql := ' SELECT TURMAS.COD_TURMA, '+
             '        CURSOS.NOME AS CURSO, '+
             '        INSTRUTORES.NOME AS INSTRUTOR '+
             ' FROM TURMAS '+
             ' INNER JOIN CURSOS '+
             ' ON TURMAS.COD_CURSO = CURSOS.COD_CURSO '+
             ' INNER JOIN INSTRUTORES '+
             ' ON TURMAS.COD_INSTRUTOR = INSTRUTORES.COD_INSTRUTOR';

      ADOQuery_pesquisa_turma.Close;
      ADOQuery_pesquisa_turma.SQL.Text:= sql + condicao;
      ADOQuery_pesquisa_turma.Open;
    end;
end;

procedure TForm_pesquisa_turmas.btn_limparClick(Sender: TObject);
begin
  chave:= '';
  cb_campo.ItemIndex:= -1;
  edt_texto.Clear;
  ADOQuery_pesquisa_turma.Close;
end;

procedure TForm_pesquisa_turmas.btn_selecionarClick(Sender: TObject);
begin
  if ADOQuery_pesquisa_turma.Active = false then
    Showmessage('Impossível Selecionar')
  else
    begin
      chave:= ADOQuery_pesquisa_turma.fieldbyname('COD_TURMA').AsString;
      ADOQuery_pesquisa_turma.Close;
      Close;
    end
end;

procedure TForm_pesquisa_turmas.btn_cancelarClick(Sender: TObject);
begin
  chave:= '';
  ADOQuery_pesquisa_turma.Close;
  Close;
end;

end.
