object frmRelatorio: TfrmRelatorio
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Movimenta'#231#245'es'
  ClientHeight = 520
  ClientWidth = 850
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
    Width = 850
    Height = 50
    Align = alTop
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 300
      Height = 25
      Caption = 'Relat'#243'rio de Movimenta'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlFiltros: TPanel
    Left = 0
    Top = 50
    Width = 850
    Height = 50
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblDataInicio: TLabel
      Left = 16
      Top = 16
      Width = 38
      Height = 15
      Caption = 'In'#237'cio:'
    end
    object dtpInicio: TDateTimePicker
      Left = 60
      Top = 13
      Width = 130
      Height = 23
      Date = 45000.000000000000000000
      Time = 0.500000000000000000
      TabOrder = 0
    end
    object lblDataFim: TLabel
      Left = 210
      Top = 16
      Width = 25
      Height = 15
      Caption = 'Fim:'
    end
    object dtpFim: TDateTimePicker
      Left = 242
      Top = 13
      Width = 130
      Height = 23
      Date = 45030.000000000000000000
      Time = 0.500000000000000000
      TabOrder = 1
    end
    object lblFiltroStatus: TLabel
      Left = 395
      Top = 16
      Width = 40
      Height = 15
      Caption = 'Status:'
    end
    object cmbStatus: TComboBox
      Left = 440
      Top = 13
      Width = 130
      Height = 23
      Style = csDropDownList
      TabOrder = 2
    end
    object btnFiltrar: TBitBtn
      Left = 590
      Top = 8
      Width = 100
      Height = 34
      Caption = 'Filtrar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnFiltrarClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 100
    Width = 850
    Height = 300
    Align = alClient
    TabOrder = 2
    object dbgRelatorio: TDBGrid
      Left = 1
      Top = 1
      Width = 848
      Height = 298
      Align = alClient
      DataSource = dsRelatorio
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clTeal
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  object pnlResumo: TPanel
    Left = 0
    Top = 400
    Width = 850
    Height = 70
    Align = alBottom
    Color = clCream
    ParentBackground = False
    TabOrder = 3
    object lblTotalVeiculos: TLabel
      Left = 16
      Top = 10
      Width = 120
      Height = 17
      Caption = 'Total de ve'#237'culos: 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTotalArrecadado: TLabel
      Left = 16
      Top = 35
      Width = 170
      Height = 17
      Caption = 'Total arrecadado: R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTicketMedio: TLabel
      Left = 350
      Top = 35
      Width = 140
      Height = 17
      Caption = 'Ticket m'#233'dio: R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btnFechar: TBitBtn
    Left = 0
    Top = 470
    Width = 850
    Height = 50
    Align = alBottom
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnFecharClick
  end
  object dsRelatorio: TDataSource
    Left = 700
    Top = 250
  end
end
