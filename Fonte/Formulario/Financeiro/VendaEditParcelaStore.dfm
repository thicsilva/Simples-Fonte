inherited FVendaEditParcelaStore: TFVendaEditParcelaStore
  Caption = 'Editar Parcelas'
  ClientHeight = 193
  ExplicitHeight = 193
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 177
    ExplicitHeight = 177
    inherited pnlHeader: TPanel
      Top = 125
      ExplicitTop = 125
    end
    object pnlVenda: TPanel
      Left = 0
      Top = 49
      Width = 808
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object lblDataVenda: TLabel
        Left = 15
        Top = 11
        Width = 77
        Height = 15
        Caption = 'Vencimento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object edtDataVencimento: TDateTimePicker
        Left = 15
        Top = 29
        Width = 131
        Height = 24
        Date = 0.442820416668837400
        Time = 0.442820416668837400
        DoubleBuffered = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
      end
      object edtObs: TLabeledEdit
        Left = 152
        Top = 29
        Width = 457
        Height = 24
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        EditLabel.Width = 77
        EditLabel.Height = 15
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'Observa'#231#227'o:'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Courier New'
        EditLabel.Font.Style = []
        EditLabel.ParentBiDiMode = False
        EditLabel.ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
      end
      object edtValor: TLabeledEdit
        Left = 615
        Top = 29
        Width = 178
        Height = 24
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        EditLabel.Width = 70
        EditLabel.Height = 15
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'Valor (R$)'
        EditLabel.Font.Charset = ANSI_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Courier New'
        EditLabel.Font.Style = []
        EditLabel.ParentBiDiMode = False
        EditLabel.ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
    end
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 808
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object lblTituloForm: TLabel
        Left = 0
        Top = 0
        Width = 808
        Height = 47
        Align = alClient
        Alignment = taCenter
        Caption = 'Alterando parcela 1/2'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6316128
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 231
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
  end
  inherited ActionList: TActionList
    Left = 696
    Top = 16
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
