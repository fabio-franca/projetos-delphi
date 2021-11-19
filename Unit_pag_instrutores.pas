unit Unit_pag_instrutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, RpCon, RpConDS, RpDefine, RpRave;

type
  TForm_pag_instrutores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_instrutor: TEdit;
    cb_mes_ano: TComboBox;
    btn_gerar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_instrutor: TSpeedButton;
    ADOQuery_demonstrativo: TADOQuery;
    ADOQuery_aux: TADOQuery;
    rel_demonstrativo: TRvProject;
    ds_demonstrativo: TRvDataSetConnection;
    ADOQuery_demonstrativoCOD_INSTRUTOR: TAutoIncField;
    ADOQuery_demonstrativoNOME: TStringField;
    ADOQuery_demonstrativoCOD_TURMA: TStringField;
    ADOQuery_demonstrativoDATA: TDateTimeField;
    ADOQuery_demonstrativoVALOR_AULA: TBCDField;
    procedure FormShow(Sender: TObject);
    procedure btn_instrutorClick(Sender: TObject);
    procedure cb_mes_anoEnter(Sender: TObject);
    procedure btn_gerarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_instrutor: string;
  end;

var
  Form_pag_instrutores: TForm_pag_instrutores;

implementation

uses Unit_logon, Unit_pesquisa;

{$R *.dfm}

procedure TForm_pag_instrutores.FormShow(Sender: TObject);
begin
  edt_instrutor.Clear;
  cod_instrutor := '';
  cb_mes_ano.Clear;
end;

procedure TForm_pag_instrutores.btn_instrutorClick(Sender: TObject);
begin
  edt_instrutor.Clear;
  cb_mes_ano.Clear;
  cod_instrutor := '';
  Form_pesquisa.sql_pesquisa:= ' SELECT * FROM INSTRUTORES ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
    begin
      cod_instrutor:= Form_pesquisa.chave;
      ADOQuery_aux.SQL.Text:= ' SELECT NOME FROM INSTRUTORES'+
                              ' WHERE COD_INSTRUTOR = ' + cod_instrutor;

      ADOQuery_aux.Open;
      edt_instrutor.Text:= ADOQuery_aux.fieldbyname('NOME').AsString;
    end;
end;

procedure TForm_pag_instrutores.cb_mes_anoEnter(Sender: TObject);
var mes, ano : string;
begin
  cb_mes_ano.Clear;
  if cod_instrutor = '' then
    Showmessage('Selecione um instrutor')
  else
    begin
      ADOQuery_aux.SQL.Text := 'SELECT DISTINCT '+
                               '    MONTH(AULAS.DATA) AS MES, '+
                               '    YEAR(AULAS.DATA) AS ANO '+
                               'FROM AULAS '+
                               'INNER JOIN TURMAS'+
                               '  ON AULAS.COD_TURMA = TURMAS.COD_TURMA '+
                               'WHERE TURMAS.COD_INSTRUTOR = ' + cod_instrutor+
                               '  AND AULAS.PAGA = ' + QuotedStr('N')+
                               'ORDER BY YEAR(AULAS.DATA), MONTH(AULAS.DATA)';

      ADOQuery_aux.Open;
      if ADOQuery_aux.IsEmpty then
        Showmessage('Não existem aulas a serem pagas para este instrutor!')
      else
        begin
          while not ADOQuery_aux.Eof do
            begin
              mes := ADOQuery_aux.fieldbyname('MES').AsString;
              mes := stringofchar('0',2-length(mes)) + mes;
              ano := ADOQuery_aux.fieldbyname('ANO').AsString;
              cb_mes_ano.Items.Add(mes+'/'+ano);
              ADOQuery_aux.Next;
            end;
        end;
        ADOQuery_aux.Close;
    end
end;

procedure TForm_pag_instrutores.btn_gerarClick(Sender: TObject);
var mes,ano, sql: string;
begin
  if(cod_instrutor='') or (cb_mes_ano.Text='') then
    Showmessage('Informações inválidas')
  else
    begin
      mes := copy(cb_mes_ano.Text,1,2);
      ano := copy(cb_mes_ano.Text,4,4);

      sql := 'SELECT INSTRUTORES.COD_INSTRUTOR, INSTRUTORES.NOME,'+
             'AULAS.COD_TURMA, AULAS.DATA, TURMAS.VALOR_AULA '+
             'FROM AULAS '+
             ' INNER JOIN TURMAS ON '+
             'AULAS.COD_TURMA = TURMAS.COD_TURMA '+
             ' INNER JOIN INSTRUTORES ON '+
             'TURMAS.COD_INSTRUTOR = INSTRUTORES.COD_INSTRUTOR '+
             'WHERE TURMAS.COD_INSTRUTOR = '+ cod_instrutor +
             'AND MONTH(DATA) = ' + mes +
             'AND YEAR(DATA) = ' + ano +
             'AND AULAS.PAGA = ' + QuotedStr('N')+
             'ORDER BY TURMAS.COD_TURMA, AULAS.DATA ';

      ADOQuery_demonstrativo.SQL.Text := sql;
      ADOQuery_demonstrativo.Open;

      rel_demonstrativo.ProjectFile := GetCurrentDir + '\demonstrativo.rav';
      rel_demonstrativo.Execute;

      ADOQuery_demonstrativo.Close;

      //Pergunta se deseja quitar as aulas do demonstrativo
      if Application.MessageBox('Deseja quitar estas aulas?',
                                'Quitar aulas?',
                                mb_yesno+mb_iconquestion) = idyes then
      begin
        sql :=  'UPDATE AULAS SET AULAS.PAGA ='+ QuotedStr('S')+
                'FROM AULAS '+
                'INNER JOIN TURMAS ON'+
                ' AULAS.COD_TURMA = TURMAS.COD_TURMA '+
                ' WHERE TURMAS.COD_INSTRUTOR = '+ cod_instrutor;

        Form_logon.ConexaoBD.BeginTrans;
        ADOQuery_aux.SQL.Text := sql;
        ADOQuery_aux.ExecSQL;
        Form_logon.ConexaoBD.CommitTrans;
          Showmessage('Aulas quitadas com sucesso!');
        cb_mes_ano.Clear;
        edt_instrutor.Clear;
        cod_instrutor := '';
      end;

    end;
end;

procedure TForm_pag_instrutores.btn_cancelarClick(Sender: TObject);
begin
 Close;
end;

end.
