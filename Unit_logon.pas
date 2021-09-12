unit Unit_logon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_logon = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
    ConexaoBD: TADOConnection;
    ADOQuery_aux: TADOQuery;
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    usuario_logado, senha_usuario : string;
    function autenticacao: boolean;
    function validacao(usuario, senha : string) : boolean;
  end;

var
  Form_logon: TForm_logon;

implementation

{$R *.dfm}

function TForm_logon.autenticacao: boolean;
begin
  ConexaoBD.ConnectionString:= ' Provider=SQLOLEDB.1; '+
                               ' Initial Catalog=Academico; '+
                               ' Data Source=FabioFranca    ';
  try
    ConexaoBD.Open('admin_academico','sysacademico');
    result:= true;
  except
    Showmessage('Não foi possível se conectar ao servidor!');
    result:= false;
  end;
end;

procedure TForm_logon.btn_fecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

function TForm_logon.validacao(usuario, senha: string): boolean;
begin
   ADOQuery_aux.SQL.Text:= ' SELECT SENHA FROM USUARIOS '+
                           ' WHERE USUARIO = ' + QuotedStr(usuario);
   ADOQuery_aux.Open;

   if ADOQuery_aux.IsEmpty then
    begin
      Showmessage('Usuário não cadastrado!');
      Result:= false;
    end
   else
    begin
      senha_usuario:= ADOQuery_aux.fieldbyname('SENHA').AsString;
      if senha_usuario <> senha then
        begin
          Showmessage('Senha não confere!');
          Result:= false;
        end
      else
        begin
          usuario_logado:= usuario;
          Result:= true;
        end;
    end;

    ADOQuery_aux.Close;
end;

end.
