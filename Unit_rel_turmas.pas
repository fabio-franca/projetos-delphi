unit Unit_rel_turmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, Buttons, StdCtrls;

type
  TForm_rel_turmas = class(TForm)
    Label1: TLabel;
    edt_curso: TEdit;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
    btn_cursos: TSpeedButton;
    ADOQuery_rel_turmas: TADOQuery;
    ADOQuery_aux: TADOQuery;
    rel_turmas: TRvProject;
    ds_rel_turmas: TRvDataSetConnection;
    procedure FormShow(Sender: TObject);
    procedure btn_cursosClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_curso: string;
  end;

var
  Form_rel_turmas: TForm_rel_turmas;

implementation

uses Unit_logon, Unit_pesquisa;

{$R *.dfm}

procedure TForm_rel_turmas.FormShow(Sender: TObject);
begin
  cod_curso := '';
  edt_curso.Clear;
end;

procedure TForm_rel_turmas.btn_cursosClick(Sender: TObject);
begin
  edt_curso.Clear;
  cod_curso := '';
  Form_pesquisa.sql_pesquisa := ' SELECT * FROM CURSOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
    begin
      cod_curso := Form_pesquisa.chave;
      ADOQuery_aux.SQL.Text := ' SELECT NOME FROM CURSOS '+
                               ' WHERE COD_CURSO = '+ QuotedStr(cod_curso);

      ADOQuery_aux.Open;
      edt_curso.Text := ADOQuery_aux.fieldbyname('NOME').AsString;
    end
end;

procedure TForm_rel_turmas.btn_okClick(Sender: TObject);
var sql: string;
begin
  if cod_curso = '' then
    Showmessage('Selecione um curso!')
  else
    begin
      sql := ' SELECT CURSOS.NOME AS CURSO, '+
             '        TURMAS.COD_TURMA AS TURMA, '+
             '        INSTRUTORES.NOME AS INSTRUTOR '+
             ' FROM TURMAS '+
             ' INNER JOIN CURSOS '+
             '    ON TURMAS.COD_CURSO = CURSOS.COD_CURSO '+
             ' INNER JOIN INSTRUTORES '+
             '    ON TURMAS.COD_INSTRUTOR = INSTRUTORES.COD_INSTRUTOR '+
             ' WHERE TURMAS.COD_CURSO = '+ QuotedStr(cod_curso)+
             ' ORDER BY TURMAS.COD_TURMA ';

      ADOQuery_rel_turmas.SQL.Text := sql;
      ADOquery_rel_turmas.Open;
      rel_turmas.ProjectFile := GetCurrentDir + '\rel_turmas.rav';
      rel_turmas.Execute;
      ADOQuery_rel_turmas.Close;
    end
end;

procedure TForm_rel_turmas.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

end.
