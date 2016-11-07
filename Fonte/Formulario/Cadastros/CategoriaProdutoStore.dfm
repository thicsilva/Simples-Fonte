inherited FCategoriaProdutoStore: TFCategoriaProdutoStore
  Caption = 'Cadastro de Categoria de Produto'
  ClientHeight = 204
  ClientWidth = 542
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 542
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Left = 9
    Width = 525
    Height = 188
    ExplicitLeft = 10
    ExplicitTop = 9
    ExplicitWidth = 525
    ExplicitHeight = 188
    inherited pnlHeader: TPanel
      Top = 136
      Width = 521
      inherited imgBorderGreenCadastro: TImage
        Left = 237
      end
      inherited spbCancelar: TSpeedButton
        Left = 243
      end
      inherited imgBorderBlueAlterar: TImage
        Left = 378
      end
      inherited spbSalvar: TSpeedButton
        Left = 384
      end
      inherited Bevel2: TBevel
        Width = 521
      end
    end
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 521
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      ExplicitTop = 8
      ExplicitWidth = 808
      object lblTituloForm: TLabel
        Left = 114
        Top = 13
        Width = 297
        Height = 21
        Caption = 'Cadastro de nova Categoria!'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6316128
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 0
        Top = 47
        Width = 521
        Height = 2
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 71
        ExplicitWidth = 879
      end
    end
    object edtNome: TLabeledEdit
      Left = 13
      Top = 84
      Width = 494
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 133
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome da Categoria *'
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
      TabOrder = 2
    end
  end
  inherited ActionList: TActionList
    Left = 152
    Top = 48
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
