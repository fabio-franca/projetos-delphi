unit Unit_menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm_menu = class(TForm)
    btn_cadcursos: TBitBtn;
    btn_fechar: TBitBtn;
    btn_cadinstrutores: TBitBtn;
    btn_cadturmas: TBitBtn;
    btn_cadalunos: TBitBtn;
    btn_matriculas: TBitBtn;
    btn_aulas: TBitBtn;
    btn_frequencias: TBitBtn;
    btn_paginstrutores: TBitBtn;
    btn_relatorios: TBitBtn;
    btn_controle: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_menu: TForm_menu;

implementation

{$R *.dfm}

end.
