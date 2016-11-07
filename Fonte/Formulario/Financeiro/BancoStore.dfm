inherited FBancoStore: TFBancoStore
  Caption = 'Cadastros de Bancos'
  ClientHeight = 241
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 241
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 225
    ExplicitHeight = 225
    object Label4: TLabel [0]
      Left = 22
      Top = 57
      Width = 42
      Height = 15
      Caption = 'Banco:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel [1]
      Left = 534
      Top = 57
      Width = 77
      Height = 15
      Caption = 'Tipo Conta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [2]
      Left = 278
      Top = 105
      Width = 98
      Height = 15
      Caption = 'Data do Saldo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlHeader: TPanel
      Top = 173
      ExplicitTop = 173
    end
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 808
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object lblTituloForm: TLabel
        Left = 0
        Top = 0
        Width = 808
        Height = 47
        Align = alClient
        Alignment = taCenter
        Caption = 'Cadastrando novo Banco!'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6316128
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 253
        ExplicitHeight = 21
      end
      object Bevel1: TBevel
        Left = 0
        Top = 47
        Width = 808
        Height = 2
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 71
        ExplicitWidth = 879
      end
    end
    object cbxBanco: TComboBox
      Left = 22
      Top = 75
      Width = 250
      Height = 24
      Style = csDropDownList
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = 'CAIXA DA EMPRESA'
      Items.Strings = (
        'CAIXA DA EMPRESA'
        'BANCO DO BRASIL'
        'BRADESCO'
        'CAIXA ECONOMICA'
        'ITAU'
        'SANTANDER')
    end
    object edtDescricao: TLabeledEdit
      Left = 278
      Top = 75
      Width = 250
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 70
      EditLabel.Height = 15
      EditLabel.Caption = 'Descri'#231#227'o:'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Courier New'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object cbxTipoConta: TComboBox
      Left = 534
      Top = 75
      Width = 250
      Height = 24
      Style = csDropDownList
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 4
      Text = 'PESSOA FISICA'
      Items.Strings = (
        'PESSOA FISICA'
        'PESSOA JURIDICA')
    end
    object edtSaldoInicial: TLabeledEdit
      Left = 22
      Top = 123
      Width = 250
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 98
      EditLabel.Height = 15
      EditLabel.Caption = 'Saldo Inicial:'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -12
      EditLabel.Font.Name = 'Courier New'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = '0,00'
      OnEnter = ConvertCurrencyString
      OnExit = StringFormatCurrency2
      OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
    end
    object cbxContaPadrao: TCheckBox
      Left = 534
      Top = 127
      Width = 123
      Height = 17
      Cursor = crHandPoint
      Caption = 'Conta padr'#227'o ?'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object edtDataSaldo: TDateTimePicker
      Left = 278
      Top = 123
      Width = 250
      Height = 24
      Date = 42647.442820416670000000
      Time = 42647.442820416670000000
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  inherited ActionList: TActionList
    Left = 456
    Top = 176
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
