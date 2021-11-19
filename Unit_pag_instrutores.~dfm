object Form_pag_instrutores: TForm_pag_instrutores
  Left = 463
  Top = 284
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pagamento de Instrutores'
  ClientHeight = 142
  ClientWidth = 489
  Color = clTeal
  Font.Charset = ANSI_CHARSET
  Font.Color = clWhite
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 58
    Height = 16
    Caption = 'Instrutor'
  end
  object Label2: TLabel
    Left = 304
    Top = 24
    Width = 57
    Height = 16
    Caption = 'M'#234's/Ano'
  end
  object btn_instrutor: TSpeedButton
    Left = 256
    Top = 48
    Width = 23
    Height = 25
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
    OnClick = btn_instrutorClick
  end
  object edt_instrutor: TEdit
    Left = 32
    Top = 48
    Width = 225
    Height = 24
    Color = clInfoBk
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cb_mes_ano: TComboBox
    Left = 304
    Top = 48
    Width = 145
    Height = 24
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
    OnEnter = cb_mes_anoEnter
  end
  object btn_gerar: TBitBtn
    Left = 104
    Top = 104
    Width = 153
    Height = 25
    Caption = 'Gerar demonstrativo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btn_gerarClick
  end
  object btn_cancelar: TBitBtn
    Left = 272
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object ADOQuery_demonstrativo: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    Top = 112
    object ADOQuery_demonstrativoCOD_INSTRUTOR: TAutoIncField
      FieldName = 'COD_INSTRUTOR'
      ReadOnly = True
    end
    object ADOQuery_demonstrativoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object ADOQuery_demonstrativoCOD_TURMA: TStringField
      FieldName = 'COD_TURMA'
      Size = 9
    end
    object ADOQuery_demonstrativoDATA: TDateTimeField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ADOQuery_demonstrativoVALOR_AULA: TBCDField
      FieldName = 'VALOR_AULA'
      DisplayFormat = 'R$ ,0.00'
      Precision = 19
    end
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 456
    Top = 112
  end
  object rel_demonstrativo: TRvProject
    Left = 32
    Top = 112
  end
  object ds_demonstrativo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery_demonstrativo
    Left = 64
    Top = 112
  end
end
