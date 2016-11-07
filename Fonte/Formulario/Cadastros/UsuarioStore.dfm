inherited FUsuarioStore: TFUsuarioStore
  Caption = 'Cadastros de Usu'#225'rios'
  ClientHeight = 572
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 572
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 553
    ExplicitHeight = 553
    inherited pnlHeader: TPanel
      Top = 501
      ExplicitTop = 501
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
        Left = 274
        Top = 13
        Width = 275
        Height = 21
        Caption = 'Cadastro de novo Usu'#225'rio!'
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
        Width = 808
        Height = 2
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 71
        ExplicitWidth = 879
      end
    end
    object pnlNomeCliente: TPanel
      Left = 0
      Top = 49
      Width = 808
      Height = 57
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      TabStop = True
      object edtNomeUsuario: TLabeledEdit
        Left = 9
        Top = 20
        Width = 250
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 126
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome do Usu'#225'rio: *'
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
        TabOrder = 0
      end
      object edtEmail: TLabeledEdit
        Left = 265
        Top = 20
        Width = 250
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 224
        EditLabel.Height = 15
        EditLabel.Caption = 'Email(ser'#225' utilizado como login)'
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
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Left = 521
        Top = 20
        Width = 135
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 42
        EditLabel.Height = 15
        EditLabel.Caption = 'Senha:'
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
        PasswordChar = '*'
        TabOrder = 2
      end
      object edtConfirmaSenha: TLabeledEdit
        Left = 662
        Top = 20
        Width = 135
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 105
        EditLabel.Height = 15
        EditLabel.Caption = 'Comfirma Senha:'
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
        PasswordChar = '*'
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 106
      Width = 808
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 3
      object Label1: TLabel
        Left = 9
        Top = 2
        Width = 296
        Height = 16
        Caption = 'SELECIONE O PERFIL DE ACESSO DESEJADO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 0
        Top = 21
        Width = 808
        Height = 2
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 71
        ExplicitWidth = 879
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 129
      Width = 808
      Height = 366
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object Bevel4: TBevel
        Left = 9
        Top = 87
        Width = 179
        Height = 2
        Shape = bsBottomLine
      end
      object Bevel5: TBevel
        Left = 9
        Top = 132
        Width = 179
        Height = 2
        Shape = bsBottomLine
      end
      object Bevel6: TBevel
        Left = 9
        Top = 177
        Width = 179
        Height = 2
        Shape = bsBottomLine
      end
      object Bevel7: TBevel
        Left = 9
        Top = 222
        Width = 179
        Height = 2
        Shape = bsBottomLine
      end
      object Bevel8: TBevel
        Left = 9
        Top = 267
        Width = 179
        Height = 2
        Shape = bsBottomLine
      end
      object Bevel9: TBevel
        Left = 9
        Top = 313
        Width = 179
        Height = 2
        Shape = bsBottomLine
      end
      object pnlGridTitle: TPanel
        Left = 184
        Top = 6
        Width = 613
        Height = 37
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = 16578803
        ParentBackground = False
        TabOrder = 0
        StyleElements = []
        object Label2: TLabel
          Left = 17
          Top = 6
          Width = 48
          Height = 19
          Caption = 'Vendas'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 97
          Top = 6
          Width = 66
          Height = 19
          Caption = 'Cadastros'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 198
          Top = 6
          Width = 67
          Height = 19
          Caption = 'NFE/NFCe'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 296
          Top = 6
          Width = 59
          Height = 19
          Caption = 'Compras'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 400
          Top = 6
          Width = 71
          Height = 19
          Caption = 'Financeiro'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 512
          Top = 6
          Width = 69
          Height = 19
          Caption = 'Relat'#243'rios'
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel3: TPanel
        Left = 184
        Top = 42
        Width = 613
        Height = 47
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        StyleElements = []
        object Label8: TLabel
          Left = 33
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 123
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 224
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 322
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 426
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 538
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel4: TPanel
        Left = 184
        Top = 87
        Width = 613
        Height = 47
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        StyleElements = []
        object Label14: TLabel
          Left = 33
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 123
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 224
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 322
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 426
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 538
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel5: TPanel
        Left = 184
        Top = 132
        Width = 613
        Height = 47
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        StyleElements = []
        object Label20: TLabel
          Left = 33
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 123
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 224
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 322
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 426
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 538
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel6: TPanel
        Left = 184
        Top = 177
        Width = 613
        Height = 47
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        StyleElements = []
        object Label26: TLabel
          Left = 33
          Top = 8
          Width = 16
          Height = 26
          Caption = #9681
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 123
          Top = 8
          Width = 16
          Height = 26
          Caption = #9681
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 224
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 322
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 426
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 538
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object rbtnAdministrador: TRadioButton
        Left = 9
        Top = 57
        Width = 120
        Height = 17
        Cursor = crHandPoint
        Caption = 'Administrador'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        TabStop = True
      end
      object rbtnComprador: TRadioButton
        Left = 9
        Top = 102
        Width = 120
        Height = 17
        Cursor = crHandPoint
        Caption = 'Comprador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
      end
      object rbtnVendedorSenior: TRadioButton
        Left = 9
        Top = 147
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Vendedor S'#234'nior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
      end
      object rbtnVendedorJunior: TRadioButton
        Left = 9
        Top = 192
        Width = 136
        Height = 17
        Cursor = crHandPoint
        Caption = 'Vendedor J'#250'nior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object rbtnFinanceiroSenior: TRadioButton
        Left = 9
        Top = 237
        Width = 145
        Height = 17
        Cursor = crHandPoint
        Caption = 'Financeiro S'#234'nior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
      end
      object rbtnFinanceiroJunior: TRadioButton
        Left = 9
        Top = 283
        Width = 136
        Height = 17
        Cursor = crHandPoint
        Caption = 'Financeiro J'#250'nior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
      end
      object Panel7: TPanel
        Left = 184
        Top = 222
        Width = 613
        Height = 47
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 12
        StyleElements = []
        object Label32: TLabel
          Left = 33
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 123
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 224
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 322
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 426
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 538
          Top = 8
          Width = 16
          Height = 26
          Caption = #9681
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Panel8: TPanel
        Left = 184
        Top = 267
        Width = 613
        Height = 47
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
        StyleElements = []
        object Label38: TLabel
          Left = 33
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 123
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 224
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 322
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 426
          Top = 8
          Width = 15
          Height = 26
          Caption = #10004
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 538
          Top = 8
          Width = 15
          Height = 26
          Caption = #10008
          Font.Charset = ANSI_CHARSET
          Font.Color = 5059330
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object cbxrRecebeEmail: TCheckBox
        Left = 47
        Top = 328
        Width = 720
        Height = 17
        Caption = 
          'Desejo que este usu'#225'rio receba notifica'#231#245'es sobre as atividades ' +
          'no Simple por email.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
    end
  end
  inherited ActionList: TActionList
    Left = 760
    Top = 400
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
