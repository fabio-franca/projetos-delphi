unit Unit_relatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons;

type
  TForm_relatorios = class(TForm)
    btn_rel_curso: TBitBtn;
    btn_rel_turmas: TBitBtn;
    btn_rel_alunos: TBitBtn;
    btn_rel_faltas: TBitBtn;
    btn_rel_aulas: TBitBtn;
    btn_fechar: TBitBtn;
    ADOQuery_rel_cursos: TADOQuery;
    rel_cursos: TRvProject;
    ds_rel_cursos: TRvDataSetConnection;
    procedure btn_rel_cursoClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_rel_turmasClick(Sender: TObject);
    procedure btn_rel_alunosClick(Sender: TObject);
    procedure btn_rel_faltasClick(Sender: TObject);
    procedure btn_rel_aulasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_relatorios: TForm_relatorios;

implementation

uses Unit_logon, Unit_rel_turmas, Unit_rel_alunos, Unit_rel_faltas,
  Unit_rel_aulas;

{$R *.dfm}

procedure TForm_relatorios.btn_rel_cursoClick(Sender: TObject);
begin
  ADOQuery_rel_cursos.Open;
  rel_cursos.ProjectFile := GetCurrentDir + '\rel_cursos.rav';
  rel_cursos.Execute;
  ADOQuery_rel_cursos.Close;
end;

procedure TForm_relatorios.btn_fecharClick(Sender: TObject);
begin
 Close;
end;

procedure TForm_relatorios.btn_rel_turmasClick(Sender: TObject);
begin
  form_rel_turmas.showmodal;
end;

procedure TForm_relatorios.btn_rel_alunosClick(Sender: TObject);
begin
  Form_rel_alunos.showmodal;
end;

procedure TForm_relatorios.btn_rel_faltasClick(Sender: TObject);
begin
  Form_rel_faltas.showmodal;
end;

procedure TForm_relatorios.btn_rel_aulasClick(Sender: TObject);
begin
  Form_rel_aulas.showmodal;
end;

end.
