object Form_lanca_presenca: TForm_lanca_presenca
  Left = 447
  Top = 267
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de Presen'#231'a'
  ClientHeight = 259
  ClientWidth = 491
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
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
  object Label2: TLabel
    Left = 256
    Top = 24
    Width = 85
    Height = 16
    Caption = 'Data da Aula'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object btn_turmas: TSpeedButton
    Left = 208
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
    OnClick = btn_turmasClick
  end
  object edt_turma: TEdit
    Left = 24
    Top = 48
    Width = 185
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object cb_aulas: TComboBox
    Left = 256
    Top = 48
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnEnter = cb_aulasEnter
  end
  object btn_listar_alunos: TBitBtn
    Left = 392
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Listar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_listar_alunosClick
  end
  object btn_lancar: TBitBtn
    Left = 136
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn_lancarClick
  end
  object btn_fechar: TBitBtn
    Left = 272
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btn_fecharClick
  end
  object ck_lista_alunos: TCheckListBox
    Left = 24
    Top = 96
    Width = 441
    Height = 97
    ItemHeight = 13
    TabOrder = 5
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 8
    Top = 224
  end
end
