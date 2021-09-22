object Form_pergunta: TForm_pergunta
  Left = 481
  Top = 321
  Width = 449
  Height = 186
  Caption = 'Form_pergunta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 348
    Height = 23
    Caption = 'Deseja realmente excluir o registro?'
    Font.Charset = ANSI_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object btn_sim: TBitBtn
    Left = 88
    Top = 72
    Width = 97
    Height = 33
    Caption = 'Sim'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn_simClick
  end
  object btn_nao: TBitBtn
    Left = 232
    Top = 72
    Width = 97
    Height = 33
    Caption = 'N'#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btn_naoClick
  end
end
