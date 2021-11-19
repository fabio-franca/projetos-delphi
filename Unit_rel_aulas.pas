unit Unit_rel_aulas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons;

type
  TForm_rel_aulas = class(TForm)
    Label1: TLabel;
    edt_instrutor: TEdit;
    btn_instrutor: TSpeedButton;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
    ADOQuery_rel_aulas: TADOQuery;
    ADOQuery_aux: TADOQuery;
    rel_aulas: TRvProject;
    ds_rel_aulas: TRvDataSetConnection;
    procedure FormShow(Sender: TObject);
    procedure btn_instrutorClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_instrutor: string;
  end;

var
  Form_rel_aulas: TForm_rel_aulas;

implementation

uses Unit_logon, Unit_pesquisa;

{$R *.dfm}

procedure TForm_rel_aulas.FormShow(Sender: TObject);
begin
  cod_instrutor := '';
  edt_instrutor.Clear;
end;

procedure TForm_rel_aulas.btn_instrutorClick(Sender: TObject);
begin
  edt_instrutor.Clear;
  cod_instrutor := '';
  Form_pesquisa.sql_pesquisa := ' SELECT * FROM INSTRUTORES ';
  Form_pesquisa.showmodal;
  if Form_pesquisa.chave <> '' then
    begin
      cod_instrutor := Form_pesquisa.chave;
      ADOQuery_aux.SQL.Text := ' SELECT NOME FROM INSTRUTORES '+
                               ' WHERE COD_INSTRUTOR = ' + cod_instrutor;

      ADOQuery_aux.Open;
      edt_instrutor.Text := ADOQuery_aux.fieldbyname('NOME').AsString;
    end
end;

procedure TForm_rel_aulas.btn_okClick(Sender: TObject);
var sql: string;
begin
  if cod_instrutor = '' then
    Showmessage('Selecione um instrutor!')
  else
    begin
      sql := ' SELECT INSTRUTORES.COD_INSTRUTOR, INSTRUTORES.NOME, '+
             '        TURMAS.COD_TURMA, '+
             '    COUNT(AULAS.DATA) AS AULAS '+
             ' FROM INSTRUTORES '+
             ' INNER JOIN TURMAS '+
             '     ON INSTRUTORES.COD_INSTRUTOR = TURMAS.COD_INSTRUTOR '+
             ' INNER JOIN AULAS '+
             '     ON TURMAS.COD_TURMA = AULAS.COD_TURMA '+
             ' WHERE INSTRUTORES.COD_INSTRUTOR = '+ cod_instrutor+
             ' GROUP BY INSTRUTORES.COD_INSTRUTOR, '+
             '          INSTRUTORES.NOME, TURMAS.COD_TURMA '+
             ' ORDER BY TURMAS.COD_TURMA ';

      ADOQuery_rel_aulas.SQL.Text := sql;
      ADOQuery_rel_aulas.Open;
      rel_aulas.ProjectFile := GetCurrentDir + '\rel_aulas.rav';
      rel_aulas.Execute;
      ADOQuery_rel_aulas.Close;
    end
end;

procedure TForm_rel_aulas.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

end.
