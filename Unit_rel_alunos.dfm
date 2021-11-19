object Form_rel_alunos: TForm_rel_alunos
  Left = 478
  Top = 248
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o de Alunos por Turma'
  ClientHeight = 137
  ClientWidth = 362
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 40
    Height = 16
    Caption = 'Turma'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object btn_turma: TSpeedButton
    Left = 312
    Top = 48
    Width = 23
    Height = 22
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777000000070000000007777777000000070FFFFFFF07777700000000070F7
      7777F07777000000000070F77777F07770007000000070F77780008700077000
      000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
      08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
      EFEFFF0770777000000077780000000708777000000077770077777807777000
      0000777770077700777770000000777777800087777770000000777777777777
      777770000000}
    OnClick = btn_turmaClick
  end
  object edt_turma: TEdit
    Left = 40
    Top = 48
    Width = 273
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_ok: TBitBtn
    Left = 80
    Top = 88
    Width = 89
    Height = 33
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_okClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888777777
      777777770000774448877777777777770000772244887777777777770000A222
      22488777777777770000A22222248877777777770000A2222222488777777777
      0000A22222222488777777770000A22222222248877777770000A22248A22224
      887777770000A222488A2222488777770000A2224887A2224488777700007A22
      48877A222488777700007A22477777A222488777000077777777777A22244877
      0000777777777777A222488700007777777777777A2224870000777777777777
      77A224480000777777777777777A224800007777777777777777A24800007777
      7777777777777A270000}
  end
  object btn_fechar: TBitBtn
    Left = 184
    Top = 88
    Width = 89
    Height = 33
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_fecharClick
    Glyph.Data = {
      BE060000424DBE06000000000000360400002800000024000000120000000100
      0800000000008802000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303F8F80303030303030303030303030303030303FF03030303030303030303
      0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
      03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
      030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
      FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
      030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
      F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
      010101F8030303030303030303F8FF030303030303FFF8030303030303030303
      030101010101F80303030303030303030303F8FF0303030303F8030303030303
      0303030303F901010101F8030303030303030303030303F8FF030303F8030303
      0303030303030303F90101010101F8030303030303030303030303F803030303
      F8FF030303030303030303F9010101F8010101F803030303030303030303F803
      03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
      03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
      03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
      0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
      030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
      03030303030303030303030303030303030303030303030303F8F8F803030303
      0303030303030303030303030303030303030303030303030303030303030303
      0303}
    NumGlyphs = 2
  end
  object ADOQuery_rel_alunos: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TURMAS.COD_TURMA AS TURMA,'
      '               ALUNOS.COD_ALUNO, ALUNOS.NOME, ALUNOS.IDADE,'
      '               ALUNOS.TELEFONE, ALUNOS.SEXO'
      'FROM TURMAS'
      'INNER JOIN MATRICULAS'
      '   ON TURMAS.COD_TURMA = MATRICULAS.COD_TURMA'
      'INNER JOIN ALUNOS'
      '   ON MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO')
    Left = 8
    Top = 72
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 328
    Top = 104
  end
  object rel_alunos: TRvProject
    Left = 8
    Top = 104
  end
  object Rds_rel_alunos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery_rel_alunos
    Left = 40
    Top = 104
  end
end
