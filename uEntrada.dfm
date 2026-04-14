object frmEntrada: TfrmEntrada
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Entrada de Ve'#237'culo'
  ClientHeight = 420
  ClientWidth = 420
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 420
    Height = 50
    Align = alTop
    Color = clGreen
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 12
      Width = 250
      Height = 25
      Caption = 'Registrar Entrada'
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
    Height = 310
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object lblPlaca: TLabel
      Left = 16
      Top = 12
      Width = 37
      Height = 15
      Caption = 'Placa: *'
    end
    object edtPlaca: TEdit
      Left = 16
      Top = 30
      Width = 180
      Height = 25
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      OnExit = edtPlacaExit
    end
    object lblModelo: TLabel
      Left = 216
      Top = 12
      Width = 46
      Height = 15
      Caption = 'Modelo:'
    end
    object edtModelo: TEdit
      Left = 216
      Top = 30
      Width = 185
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lblCor: TLabel
      Left = 16
      Top = 68
      Width = 23
      Height = 15
      Caption = 'Cor:'
    end
    object edtCor: TEdit
      Left = 16
      Top = 86
      Width = 180
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lblTipo: TLabel
      Left = 216
      Top = 68
      Width = 29
      Height = 15
      Caption = 'Tipo:'
    end
    object cmbTipo: TComboBox
      Left = 216
      Top = 86
      Width = 185
      Height = 23
      Style = csDropDownList
      TabOrder = 3
    end
    object lblVaga: TLabel
      Left = 16
      Top = 124
      Width = 31
      Height = 15
      Caption = 'Vaga:'
    end
    object edtVaga: TEdit
      Left = 16
      Top = 142
      Width = 120
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
    end
    object lblObs: TLabel
      Left = 16
      Top = 180
      Width = 72
      Height = 15
      Caption = 'Observa'#231#227'o:'
    end
    object mmoObs: TMemo
      Left = 16
      Top = 198
      Width = 385
      Height = 95
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 360
    Width = 420
    Height = 60
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object btnConfirmar: TBitBtn
      Left = 120
      Top = 10
      Width = 130
      Height = 40
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 260
      Top = 10
      Width = 130
      Height = 40
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
