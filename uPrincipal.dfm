object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Estacionamento'
  ClientHeight = 560
  ClientWidth = 820
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 80
    Align = alTop
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 20
      Top = 10
      Width = 350
      Height = 30
      Caption = 'Sistema de Estacionamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVagasInfo: TLabel
      Left = 20
      Top = 48
      Width = 200
      Height = 20
      Caption = 'Vagas: 0 / 50 (Livres: 50)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 80
    Width = 820
    Height = 65
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnEntrada: TBitBtn
      Left = 16
      Top = 10
      Width = 130
      Height = 45
      Caption = 'Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnEntradaClick
    end
    object btnSaida: TBitBtn
      Left = 156
      Top = 10
      Width = 130
      Height = 45
      Caption = 'Sa'#237'da'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSaidaClick
    end
    object btnRelatorio: TBitBtn
      Left = 296
      Top = 10
      Width = 130
      Height = 45
      Caption = 'Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnRelatorioClick
    end
    object btnConfig: TBitBtn
      Left = 436
      Top = 10
      Width = 130
      Height = 45
      Caption = 'Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnConfigClick
    end
    object btnAtualizar: TBitBtn
      Left = 576
      Top = 10
      Width = 100
      Height = 45
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnAtualizarClick
    end
    object lblBusca: TLabel
      Left = 690
      Top = 2
      Width = 36
      Height = 15
      Caption = 'Busca:'
    end
    object edtBusca: TEdit
      Left = 690
      Top = 18
      Width = 90
      Height = 23
      TabOrder = 5
      OnKeyPress = edtBuscaKeyPress
    end
    object btnBuscar: TBitBtn
      Left = 783
      Top = 15
      Width = 30
      Height = 28
      Caption = #55357#56589
      TabOrder = 6
      OnClick = btnBuscarClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 145
    Width = 820
    Height = 390
    Align = alClient
    TabOrder = 2
    object dbgVeiculos: TDBGrid
      Left = 1
      Top = 1
      Width = 818
      Height = 388
      Align = alClient
      DataSource = dsVeiculos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 535
    Width = 820
    Height = 25
    Panels = <
      item
        Width = 300
      end
      item
        Width = 250
      end>
  end
  object dsVeiculos: TDataSource
    Left = 400
    Top = 400
  end
  object tmrAtualizar: TTimer
    Interval = 30000
    OnTimer = tmrAtualizarTimer
    Left = 480
    Top = 400
  end
end
