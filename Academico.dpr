program Academico;

uses
  Forms,
  Unit_logon in 'Unit_logon.pas' {Form_logon},
  Unit_menu in 'Unit_menu.pas' {Form_menu},
  Unit_splash in 'Unit_splash.pas' {Form_splash},
  Unit_usuarios in 'Unit_usuarios.pas' {Form_usuarios},
  Unit_pesquisa in 'Unit_pesquisa.pas' {Form_pesquisa},
  Unit_permissoes in 'Unit_permissoes.pas' {Form_permissoes},
  Unit_cursos in 'Unit_cursos.pas' {Form_cursos},
  Unit_instrutores in 'Unit_instrutores.pas' {Form_instrutores},
  Unit_turmas in 'Unit_turmas.pas' {Form_turmas},
  Unit_pesquisa_turmas in 'Unit_pesquisa_turmas.pas' {Form_pesquisa_turmas},
  Unit_alunos in 'Unit_alunos.pas' {Form_alunos},
  Unit_pergunta in 'Unit_pergunta.pas' {Form_pergunta};

{$R *.res}

begin
  Application.Initialize;
  //Criar Splash
  Form_splash:= TForm_splash.Create(application);
  Form_splash.Show;
  Form_splash.Update;

  Application.CreateForm(TForm_logon, Form_logon);
  Application.CreateForm(TForm_menu, Form_menu);
  Application.CreateForm(TForm_usuarios, Form_usuarios);
  Application.CreateForm(TForm_pesquisa, Form_pesquisa);
  Application.CreateForm(TForm_permissoes, Form_permissoes);
  Application.CreateForm(TForm_cursos, Form_cursos);
  Application.CreateForm(TForm_instrutores, Form_instrutores);
  Application.CreateForm(TForm_turmas, Form_turmas);
  Application.CreateForm(TForm_pesquisa_turmas, Form_pesquisa_turmas);
  Application.CreateForm(TForm_alunos, Form_alunos);
  Application.CreateForm(TForm_pergunta, Form_pergunta);
  //Application.CreateForm(TForm_splash, Form_splash);

  if Form_logon.autenticacao = false then
     Application.Terminate;

  //Esconder e destruir splash
  Form_splash.Hide;
  Form_splash.Destroy;

  Application.Run;
end.
