unit Unit_permissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_permissoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cb_funcoes: TComboBox;
    btn_inserir: TBitBtn;
    grid_permissoes: TDBGrid;
    btn_retirar: TBitBtn;
    btn_fechar: TBitBtn;
    ADOQuery_permissoes: TADOQuery;
    ADOQuery_aux: TADOQuery;
    ds_permissoes: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure cb_funcoesEnter(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_retirarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario: string;
  end;

var
  Form_permissoes: TForm_permissoes;

implementation

uses Unit_logon;

{$R *.dfm}

procedure TForm_permissoes.FormShow(Sender: TObject);
begin
  ADOQuery_permissoes.SQL.Text:= ' SELECT FUNCOES.NOME '+
                                 ' FROM FUNCOES INNER JOIN PERMISSOES ON '+
                                 ' FUNCOES.COD_FUNCAO = PERMISSOES.COD_FUNCAO '+
                                 ' WHERE PERMISSOES.USUARIO = '+ QuotedStr(usuario)+
                                 ' ORDER BY FUNCOES.NOME';
  ADOQuery_permissoes.Open;
end;

procedure TForm_permissoes.cb_funcoesEnter(Sender: TObject);
begin
  cb_funcoes.Clear;
  ADOQuery_aux.SQL.Text:= ' SELECT NOME FROM FUNCOES '+
                          ' WHERE COD_FUNCAO NOT IN '+
                          ' (SELECT COD_FUNCAO FROM PERMISSOES '+
                          ' WHERE USUARIO = '+ QuotedStr(usuario)+')'+
                          ' ORDER BY NOME';
  ADOQuery_aux.Open;
  While not ADOQuery_aux.Eof do
  begin
    cb_funcoes.Items.Add(ADOQuery_aux.fieldbyname('NOME').AsString);
    ADOQuery_aux.Next;
  end;
  ADOQuery_aux.Close;
end;

procedure TForm_permissoes.btn_inserirClick(Sender: TObject);
var cod_funcao: string;
begin
  ADOQuery_aux.SQL.Text:= ' SELECT COD_FUNCAO FROM FUNCOES '+
                          ' WHERE NOME = '+ QuotedStr(cb_funcoes.Text);
  ADOQuery_aux.Open;
  cod_funcao:= ADOQuery_aux.fieldbyname('COD_FUNCAO').AsString;
  ADOQuery_aux.Close;

  ADOQuery_aux.SQL.Text:= ' INSERT INTO PERMISSOES VALUES '+
                          ' (' + QuotedStr(cod_funcao)+
                          ',' + QuotedStr(usuario)+ ')';
  Form_logon.ConexaoBD.BeginTrans;
  ADOQuery_aux.ExecSQL;
  Form_logon.ConexaoBD.CommitTrans;

  ADOQuery_permissoes.Close;
  ADOQuery_permissoes.Open;
  cb_funcoes.Clear;
end;

procedure TForm_permissoes.btn_retirarClick(Sender: TObject);
var cod_funcao,nome: string;
begin
   nome:= ADOQuery_permissoes.fieldbyname('NOME').AsString;
   ADOQuery_aux.SQL.Text:= ' SELECT COD_FUNCAO FROM FUNCOES '+
                            ' WHERE NOME = '+ QuotedStr(nome);
   ADOQuery_aux.Open;
   cod_funcao:= ADOQuery_aux.fieldbyname('COD_FUNCAO').AsString;
   ADOQuery_aux.Close;

   ADOQuery_aux.SQL.Text:= ' DELETE FROM PERMISSOES '+
                           ' WHERE COD_FUNCAO ='+ QuotedStr(cod_funcao)+
                           ' AND USUARIO ='+ QuotedStr(usuario);
   Form_logon.ConexaoBD.BeginTrans;
   ADOQuery_aux.ExecSQL;
   Form_logon.ConexaoBD.CommitTrans;

   ADOQuery_permissoes.Close;
   ADOQuery_permissoes.Open;
end;

procedure TForm_permissoes.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

end.
