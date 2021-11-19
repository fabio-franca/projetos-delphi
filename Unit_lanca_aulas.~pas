unit Unit_lanca_aulas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Buttons, StdCtrls, ComCtrls;

type
  TForm_lanca_aulas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_turma: TEdit;
    dt_aula: TDateTimePicker;
    btn_lancar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_turma: TSpeedButton;
    ADOQuery_aux: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btn_turmaClick(Sender: TObject);
    procedure btn_lancarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lanca_aulas: TForm_lanca_aulas;

implementation

uses Unit_logon, Unit_pesquisa_turmas;

{$R *.dfm}

procedure TForm_lanca_aulas.FormShow(Sender: TObject);
begin
  edt_turma.Clear;
  dt_aula.Date := Date;
end;

procedure TForm_lanca_aulas.btn_turmaClick(Sender: TObject);
begin
  edt_turma.Clear;
  Form_pesquisa_turmas.ShowModal;

  if Form_pesquisa_turmas.chave <> '' then
    edt_turma.Text := Form_pesquisa_turmas.chave;
end;

procedure TForm_lanca_aulas.btn_lancarClick(Sender: TObject);
var data_aula: string;
    deu_erro: boolean;
begin
  if edt_turma.Text = '' then
    Showmessage('Informe a turma!')
  else if dt_aula.Date > date then
    Showmessage('Não é permitido lançar aulas antecipadamente!')
  else
    begin
      data_aula := FormatDateTime('mm/dd/yyyy',dt_aula.Date);

      ADOQuery_aux.SQL.Text := 'INSERT INTO AULAS VALUES '+
                               '('+ QuotedStr(edt_turma.Text)+
                               ','+ QuotedStr(data_aula)+
                               ','+ QuotedStr('N')+')';

      Form_logon.ConexaoBD.BeginTrans;
      try
        ADOQuery_aux.ExecSQL;
        deu_erro:= false;
      except
        on E: Exception do
        begin
          deu_erro := true;
          if Form_logon.ErroBD(E.message,'PK_Aulas') = 'Sim' then
            Showmessage('Aula já lançada!')
          else
            Showmessage('Ocorreu o seguinte erro: '+ E.Message);
        end;
    end;

    if deu_erro = true then
      Form_logon.ConexaoBD.RollbackTrans
    else
      begin
        Form_logon.ConexaoBD.CommitTrans;
        Showmessage('Aula lançada com sucesso!');
        edt_turma.Clear;
        dt_aula.Date := Date;
      end;
    end;
end;

procedure TForm_lanca_aulas.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

end.
