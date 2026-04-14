object frmSaida: TfrmSaida
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sa'#237'da de Ve'#237'culo'
  ClientHeight = 440
  ClientWidth = 420
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 50
    Align = alTop
    Color = clMaroon
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 250
      Height = 25
      Caption = 'Registrar Sa'#237'da'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 50
    Width = 420
    Height = 250
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblPlaca: TLabel
      Left = 16
      Top = 16
      Width = 37
      Height = 15
      Caption = 'Placa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblPlacaValor: TLabel
      Left = 140
      Top = 16
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblModelo: TLabel
      Left = 16
      Top = 44
      Width = 46
      Height = 15
      Caption = 'Modelo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblModeloValor: TLabel
      Left = 140
      Top = 44
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCor: TLabel
      Left = 16
      Top = 72
      Width = 23
      Height = 15
      Caption = 'Cor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCorValor: TLabel
      Left = 140
      Top = 72
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTipo: TLabel
      Left = 16
      Top = 100
      Width = 29
      Height = 15
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTipoValor: TLabel
      Left = 140
      Top = 100
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblVaga: TLabel
      Left = 16
      Top = 128
      Width = 31
      Height = 15
      Caption = 'Vaga:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblVagaValor: TLabel
      Left = 140
      Top = 128
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEntrada: TLabel
      Left = 16
      Top = 160
      Width = 49
      Height = 15
      Caption = 'Entrada:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblEntradaValor: TLabel
      Left = 140
      Top = 160
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSaida: TLabel
      Left = 16
      Top = 188
      Width = 35
      Height = 15
      Caption = 'Sa'#237'da:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblSaidaValor: TLabel
      Left = 140
      Top = 188
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblPermanencia: TLabel
      Left = 16
      Top = 216
      Width = 80
      Height = 15
      Caption = 'Perman'#234'ncia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblPermanenciaValor: TLabel
      Left = 140
      Top = 216
      Width = 4
      Height = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlValor: TPanel
    Left = 0
    Top = 300
    Width = 420
    Height = 70
    Align = alBottom
    Color = clCream
    ParentBackground = False
    TabOrder = 2
    object lblValorTotal: TLabel
      Left = 16
      Top = 22
      Width = 85
      Height = 20
      Caption = 'VALOR TOTAL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblValorTotalValor: TLabel
      Left = 200
      Top = 16
      Width = 80
      Height = 30
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -22
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 370
    Width = 420
    Height = 70
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object btnConfirmarSaida: TBitBtn
      Left = 100
      Top = 14
      Width = 150
      Height = 42
      Caption = 'Confirmar Sa'#237'da'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarSaidaClick
    end
    object btnCancelar: TBitBtn
      Left = 260
      Top = 14
      Width = 130
      Height = 42
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
