object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SPED API'
  ClientHeight = 458
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'CNPJ da SH:'
  end
  object Label2: TLabel
    Left = 128
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Token:'
  end
  object Label9: TLabel
    Left = 8
    Top = 56
    Width = 61
    Height = 13
    Caption = 'Cnpj emissor'
  end
  object Label5: TLabel
    Left = 130
    Top = 56
    Width = 44
    Height = 13
    Caption = 'id do lote'
  end
  object edtCNPJ_SH: TEdit
    Left = 8
    Top = 27
    Width = 105
    Height = 21
    TabOrder = 0
    Text = '08187168000160'
  end
  object edtToken: TEdit
    Left = 128
    Top = 27
    Width = 403
    Height = 21
    TabOrder = 1
    Text = 'uR4BwzifCN2t7Nuf7IOlo4Z0Vbnojlroa13x3dVu'
  end
  object edtEmissor: TEdit
    Left = 8
    Top = 70
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '08187168000160'
  end
  object edtID: TEdit
    Left = 128
    Top = 73
    Width = 403
    Height = 21
    TabOrder = 3
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 100
    Width = 685
    Height = 353
    ActivePage = Iniciar
    TabOrder = 4
    object Iniciar: TTabSheet
      Caption = 'Iniciar'
      object Label4: TLabel
        Left = 3
        Top = 57
        Width = 39
        Height = 13
        Caption = 'Retorno'
      end
      object Label6: TLabel
        Left = 3
        Top = 11
        Width = 73
        Height = 13
        Caption = 'Inicio apura'#231#227'o'
      end
      object Label7: TLabel
        Left = 134
        Top = 11
        Width = 83
        Height = 13
        Caption = 'final da apura'#231#227'o'
      end
      object memRetorno: TMemo
        Left = 3
        Top = 76
        Width = 671
        Height = 237
        TabOrder = 0
      end
      object Button1: TButton
        Left = 544
        Top = 3
        Width = 130
        Height = 27
        Caption = 'Iniciar apura'#231#227'o'
        TabOrder = 1
        OnClick = Button1Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 3
        Top = 30
        Width = 104
        Height = 21
        Date = 43721.000000000000000000
        Time = 0.690810300926386800
        TabOrder = 2
      end
      object DateTimePicker2: TDateTimePicker
        Left = 134
        Top = 30
        Width = 97
        Height = 21
        Date = 43721.000000000000000000
        Time = 0.691742164352035600
        TabOrder = 3
      end
    end
    object Enviar: TTabSheet
      Caption = 'Enviar'
      ImageIndex = 1
      object Label3: TLabel
        Left = 3
        Top = 3
        Width = 62
        Height = 13
        Caption = 'Tx2 de envio'
      end
      object Retorno: TLabel
        Left = 3
        Top = 169
        Width = 39
        Height = 13
        Caption = 'Retorno'
      end
      object Button2: TButton
        Left = 552
        Top = 143
        Width = 122
        Height = 26
        Caption = 'enviar'
        TabOrder = 0
        OnClick = Button2Click
      end
      object MTx2envio: TMemo
        Left = 0
        Top = 22
        Width = 674
        Height = 115
        TabOrder = 1
      end
      object memRetornoEnvio: TMemo
        Left = 0
        Top = 188
        Width = 674
        Height = 121
        TabOrder = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Gerar'
      ImageIndex = 2
      object Label8: TLabel
        Left = 3
        Top = 20
        Width = 39
        Height = 13
        Caption = 'Retorno'
      end
      object Button3: TButton
        Left = 569
        Top = 8
        Width = 96
        Height = 25
        Caption = 'gerar'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Mretornogerado: TMemo
        Left = 0
        Top = 39
        Width = 665
        Height = 267
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Consultar'
      ImageIndex = 3
      object Label10: TLabel
        Left = 3
        Top = 29
        Width = 97
        Height = 13
        Caption = 'Retorno da consulta'
      end
      object Button4: TButton
        Left = 560
        Top = 17
        Width = 106
        Height = 25
        Caption = 'consultar'
        TabOrder = 0
        OnClick = Button4Click
      end
      object memoConsulta: TMemo
        Left = 3
        Top = 48
        Width = 663
        Height = 274
        TabOrder = 1
      end
    end
  end
end
