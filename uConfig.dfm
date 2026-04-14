object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 380
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
    Color = clPurple
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 200
      Height = 25
      Caption = 'Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCampos: TPanel
    Left = 0
    Top = 50
    Width = 420
    Height = 260
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblNomeEstacionamento: TLabel
      Left = 16
      Top = 12
      Width = 150
      Height = 15
      Caption = 'Nome do Estacionamento:'
    end
    object edtNomeEstacionamento: TEdit
      Left = 16
      Top = 30
      Width = 385
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object lblTotalVagas: TLabel
      Left = 16
      Top = 68
      Width = 84
      Height = 15
      Caption = 'Total de Vagas:'
    end
    object edtTotalVagas: TEdit
      Left = 16
      Top = 86
      Width = 100
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lblValorHora: TLabel
      Left = 16
      Top = 124
      Width = 101
      Height = 15
      Caption = 'Valor por Hora (R$):'
    end
    object edtValorHora: TEdit
      Left = 16
      Top = 142
      Width = 120
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lblValorFracao: TLabel
      Left = 216
      Top = 124
      Width = 141
      Height = 15
      Caption = 'Valor Fra'#231#227'o 15min (R$):'
    end
    object edtValorFracao: TEdit
      Left = 216
      Top = 142
      Width = 120
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object lblInfoFracao: TLabel
      Left = 216
      Top = 170
      Width = 180
      Height = 13
      Caption = 'Cobrado a cada 15 min excedentes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -10
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTolerancia: TLabel
      Left = 16
      Top = 196
      Width = 130
      Height = 15
      Caption = 'Toler'#226'ncia (minutos):'
    end
    object edtTolerancia: TEdit
      Left = 16
      Top = 214
      Width = 100
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object lblInfoTolerancia: TLabel
      Left = 130
      Top = 220
      Width = 210
      Height = 13
      Caption = 'Tempo sem cobran'#231'a ap'#243's a entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -10
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 310
    Width = 420
    Height = 70
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object btnSalvar: TBitBtn
      Left = 120
      Top = 14
      Width = 130
      Height = 42
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
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
