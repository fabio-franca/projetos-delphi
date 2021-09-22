object Form_pesquisa: TForm_pesquisa
  Left = 489
  Top = 268
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form_pesquisa'
  ClientHeight = 271
  ClientWidth = 478
  Color = clTeal
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 232
    Height = 18
    Caption = 'Digite o nome ou parte dele'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object edt_nome: TEdit
    Left = 32
    Top = 40
    Width = 233
    Height = 25
    TabOrder = 0
  end
  object grid_pesquisa: TDBGrid
    Left = 32
    Top = 88
    Width = 417
    Height = 120
    DataSource = ds_pesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
  end
  object btn_pesquisar: TBitBtn
    Left = 264
    Top = 40
    Width = 89
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btn_pesquisarClick
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
  end
  object btn_limpar: TBitBtn
    Left = 360
    Top = 40
    Width = 89
    Height = 25
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = btn_limparClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
      305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
      B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
      B0557777FF577777F7F500000E055550805577777F7555575755500000555555
      05555777775555557F5555000555555505555577755555557555}
    NumGlyphs = 2
  end
  object btn_selecionar: TBitBtn
    Left = 104
    Top = 224
    Width = 113
    Height = 33
    Caption = 'Selecionar'
    TabOrder = 4
    OnClick = btn_selecionarClick
    Glyph.Data = {
      16020000424D160200000000000076000000280000001A0000001A0000000100
      040000000000A001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888800000088888888888888888888888888000000888888888777
      7777777888888800000088888888877777777777788888000000888888800000
      0000000778888800000088888880FFFFFFFFFF0778888800000088888880FFFF
      FFFFFF077788880000008888880FFFFFFFFFFF07778888000000888880FFFFFF
      FFFFFFF077888800000088880FFFFFFFFFFFFFF077888800000088880FFFFFFF
      FFFFFFF077888800000088880FF0FFFFFFFFFFF077888800000088880FF0FFFF
      FFFFFFF077888800000088880FF0FF0FF0FF0FF077888800000088880000FF0F
      F0FF0FF077888800000088888880FF0FF0FF0FF088888800000088888880FF0F
      F0FF0FF088888800000088888880FF000800800888888800000088888880FF08
      8888888888888800000088888880FF088888888888888800000088888880FF08
      8888888888888800000088888880FF0888888888888888000000888888880088
      8888888888888800000088888888888888888888888888000000888888888888
      8888888888888800000088888888888888888888888888000000}
  end
  object btn_cancelar: TBitBtn
    Left = 232
    Top = 224
    Width = 113
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btn_cancelarClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888877777
      8877777700007770888777778887777700007911088877910888777700007911
      0088879100888777000079111008891110087777000079911108911111007777
      0000779111101111110777770000777911111111077777770000777991111111
      8777777700007777991111108877777700007777791111108887777700007777
      7911111088877777000077777911111108887777000077779111991100888777
      0000777911108991100888770000777911187799110088870000777111187779
      1110888700007771110777779111087700007779997777777991777700007777
      77777777779977770000}
  end
  object ADOQuery_pesquisa: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Top = 232
  end
  object ds_pesquisa: TDataSource
    DataSet = ADOQuery_pesquisa
    Left = 40
    Top = 232
  end
end