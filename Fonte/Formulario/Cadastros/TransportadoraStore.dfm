inherited FTransportadoraStore: TFTransportadoraStore
  Caption = 'Cadastro de Transportadora'
  ClientHeight = 562
  ClientWidth = 914
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 914
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Left = 9
    Width = 896
    Height = 546
    ExplicitLeft = 9
    ExplicitWidth = 896
    ExplicitHeight = 546
    inherited pnlHeader: TPanel
      Top = 494
      Width = 892
      TabOrder = 5
      ExplicitTop = 494
      ExplicitWidth = 892
      inherited imgBorderGreenCadastro: TImage
        Left = 608
        ExplicitLeft = 608
      end
      inherited spbCancelar: TSpeedButton
        Left = 614
        ExplicitLeft = 614
      end
      inherited imgBorderBlueAlterar: TImage
        Left = 749
        ExplicitLeft = 749
      end
      inherited spbSalvar: TSpeedButton
        Left = 755
        ExplicitLeft = 755
      end
      inherited Bevel2: TBevel
        Width = 892
        ExplicitWidth = 892
      end
    end
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 892
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object lblTituloForm: TLabel
        Left = 268
        Top = 13
        Width = 352
        Height = 21
        Caption = 'Cadastro de nova Transportadora!'
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
        Width = 892
        Height = 2
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 71
        ExplicitWidth = 879
      end
    end
    object pnlNomeTransportadora: TPanel
      Left = 0
      Top = 49
      Width = 892
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object Label11: TLabel
        Left = 59
        Top = 53
        Width = 168
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Exibir mais campos '
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = Label11Click
      end
      object Label12: TLabel
        Left = 228
        Top = 53
        Width = 80
        Height = 16
        Caption = '(Opcional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9474192
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 47
        Top = -286
        Width = 2
        Height = 372
        Shape = bsRightLine
      end
      object Image2: TImage
        Left = 6
        Top = 6
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000001D14944415478DAE5975D4E834010C74BD3F4
          D57A02EB09C413584EA03D413101D2477B02F104AD6F0448C41BE009C413146F
          8027B0BE352501FF138B21CAC72E2E218D936C16DAC9EC6F67666707A9D7B148
          0709A069DA4492A4191EC71832468811C571BCF03C6FD32A8061181EA659D17F
          699A86005BED76BB2756102E002C6E62BAADD32310C771CEDB00A05D1DB1E802
          E21A109E30008A7BBFDF7FE6E07DB46D5BED0C001E78810726FF170072871098
          C2004890842987FA1400BE50005DD7239CF313165D78EBD4B2AC481840E721E8
          1C8004394035FF8C41F503B0B2D01090A8AA3A1A0E87EF757A499228AEEB062C
          36B92F2324628044BCA8DA3D5C3F62B5C70DC0900B4CB16F0C4052950BB88A8F
          797A8246006561E0B986FF0A505A90580B502380F97C3E26E300F0017059E081
          3778609CE90903C87A400C15AF0BECD2C751A33CF8D99C4C0141DE59B3B66712
          C3C24B0C39B74B32A6A0018D501354BC934E08286FBBDD6EF0DBBAF7D5AC7EEB
          EF41EE8B400A01F605E7018F57157C2B18F701F23A180C642C42A7C2C45C5603
          22E84F11A2B01680A3E47249E6BD3CC42F002C7E8369297AF11C440000A51480
          E7CE6F2AF9A35AE4019EAEA791E42FAB2200B36D004ADE2C0F0EF3E354A47C02
          6A380030E405477A0000000049454E44AE426082}
      end
      object edtNomeTransportadora: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 175
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome da Transportadora: *'
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
        OnKeyDown = edtNomeTransportadoraKeyDown
      end
    end
    object pnlPessoaJuridica: TPanel
      Left = 0
      Top = 121
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label8: TLabel
        Left = 677
        Top = 2
        Width = 189
        Height = 15
        Caption = 'Indicador de insc estadual:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Bevel4: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 60
        Shape = bsRightLine
      end
      object edtCNPJ: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 35
        EditLabel.Height = 15
        EditLabel.Caption = 'CNPJ:'
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
        MaxLength = 15
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object cbxIndicadorInscEstadualJuridica: TComboBox
        Left = 677
        Top = 20
        Width = 200
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
        TabOrder = 3
        Text = 'NAO CONTRIBUINTE'
        OnKeyDown = cbxIndicadorInscEstadualJuridicaKeyDown
        Items.Strings = (
          'NAO CONTRIBUINTE'
          'CONTRIBUINTE'
          'CONTRIBUINTE ISENTO')
      end
      object edtInscEstadual: TLabeledEdit
        Left = 265
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 133
        EditLabel.Height = 15
        EditLabel.Caption = 'Inscri'#231#227'o Estadual:'
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
      object edtInscMunicipal: TLabeledEdit
        Left = 471
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 140
        EditLabel.Height = 15
        EditLabel.Caption = 'Inscri'#231#227'o Municipal:'
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
    object pnlContato: TPanel
      Left = 0
      Top = 175
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      TabStop = True
      object Bevel7: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 60
        Shape = bsRightLine
      end
      object edtTelefoneComercial: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 133
        EditLabel.Height = 15
        EditLabel.Caption = 'Telefone comercial:'
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
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object edtContato: TLabeledEdit
        Left = 471
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = 'Contato:'
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
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object edtEmail: TLabeledEdit
        Left = 265
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'E-mail:'
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
      object edtCelular: TLabeledEdit
        Left = 677
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 56
        EditLabel.Height = 15
        EditLabel.Caption = 'Celular:'
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
        NumbersOnly = True
        ParentFont = False
        TabOrder = 3
        OnKeyDown = edtCelularKeyDown
      end
    end
    object pnlContatoTitle: TPanel
      Left = 0
      Top = 122
      Width = 892
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object Label1: TLabel
        Left = 59
        Top = 22
        Width = 344
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar contato para esta transportadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = Label1Click
      end
      object Label2: TLabel
        Left = 415
        Top = 22
        Width = 80
        Height = 16
        Caption = '(Opcional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9474192
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Image1: TImage
        Left = 6
        Top = 13
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF40000029E4944415478DAED975B6EDA40148619043C
          B383C20A022BA8B3829815C49100F11658419D1584BC2140CAB0829A15145610
          BA82B82B087DE59AFF6F87CA9D8EC703A5AD2A65248BB13D67CE77CE9C8B11B9
          7F3CC41BC029424110944BA5D2D57EBFF7705B11423C0C87C3E8AF00B4DB6D1F
          8A1FA1B47C7886FB05EEA37C3E3F190C06F11F03A072FC7C4C7B0F9025AEC678
          3C9E9D05A0D56AD560D905A65FE962DCBF242D4F1931D656B136C0DA77BBDD6E
          6E033202F08C8BC5E23D3608946537982F6DD62707945EE2383C4C3F1008F2FD
          F57A3D91522E9D00E06A2AF2533674193D2A4E02334E46A3513D13A0D96C7A50
          F6C960510DD37B17EDF418AE58DF87CF0121AD00B03E34587A07E108C7F0E408
          50C75ADFB40FE2233C05A0076B2278E2D905006BAB581B9C0AF04BAAF1086011
          0BCEA30B80E5C81A7AC1723E026C288FF1C076BBED02F8F6680FA8FCD52D8D57
          AB551DA9E96779818186948BB0F6D95033B23DA020187057DAE30920BAE8012F
          16FD2C5865933CC01E90015D5DC008604A45965958568565A1C1B53F5C0CC8BE
          09927161AA88A9A5D86605E2646F9281F502EF24A6D79ADC1472BE4926152065
          A33936F26C00009F01FCBD49CE19A0D3E95410C54F7A101D2CC90030798E3DE0
          12B20B2B00BB1F7E6E0F4D28B1C117FC842CA350CE404A2BC93D40F499495CCF
          6EA8BD6731938885E94F00CA627E64789AE239AE90C1A35A33EB839FB38F0832
          77B496C10C99503F92DCF74645D84898DC4D8B7105540C8BAF39D7E1B2066418
          0B124A260A44EA1EF956610D67F619A9E4150A851A529145A7728C62C388A1E8
          66B3D92C909E33DC5F2420A742FFCA518D84B1E0F4F171C468B045273B2A8353
          A8A02AAB07B1A58CFED648143296F3835797AEBDE05C10D91F242ADAB322FD54
          8048AF05FFE73FA33780738E5727F2B63BCB1ED7960000000049454E44AE4260
          82}
      end
    end
    object pnlEndereco: TPanel
      Left = 0
      Top = 225
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 9
      TabStop = True
      ExplicitTop = 274
      object Bevel6: TBevel
        Left = 47
        Top = -278
        Width = 2
        Height = 382
        Shape = bsRightLine
      end
      object edtCEP: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 15
        EditLabel.Caption = 'CEP:'
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
        MaxLength = 8
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
      end
      object edtComplemento: TLabeledEdit
        Left = 471
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 84
        EditLabel.Height = 15
        EditLabel.Caption = 'Complemento:'
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
      object edtBairro: TLabeledEdit
        Left = 677
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Bairro:'
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
      object edtEndereco: TLabeledEdit
        Left = 265
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 63
        EditLabel.Height = 15
        EditLabel.Caption = 'Endere'#231'o:'
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
      object edtCidade: TLabeledEdit
        Left = 59
        Top = 64
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'Cidade:'
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
        TabOrder = 4
        OnKeyDown = edtCidadeKeyDown
      end
    end
    object pnlEnderecoTitle: TPanel
      Left = 0
      Top = 176
      Width = 892
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      ExplicitTop = 225
      object Label13: TLabel
        Left = 59
        Top = 15
        Width = 152
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = Label13Click
      end
      object Label14: TLabel
        Left = 220
        Top = 15
        Width = 80
        Height = 16
        Caption = '(Opcional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9474192
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Image3: TImage
        Left = 6
        Top = 6
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000001C34944415478DAED97516E82401445198DC6
          3FE90AEA0E7407B53B60099028BF7507EA0EF81692D21DB083DA15D4EEC01D54
          FF0C04E87D88ADA13330438A49135E62066786F1DC3BEF0DC8B49A319FCF2768
          9EF3AF96EBBABB3AEBB03A37D9B6BD44B32A74AF369BCDBA51808B6AC6D88437
          9EA6E94ED50D6900816A5148BB510950A55A14B26E08014CD3D4FBFDFE5385EA
          8FBC1DD775830B309BCDA69D4E87327C54B2F01A0B6770D81E6A972573F74992
          589EE76D4B0172D5B4D0A24C35EC35A328DA636E568661185ABD5E6F846DF22B
          DC703077EDFBFEE117808A6A2836004179A15327AE0FB8B63016A8BAC16AAA36
          04F302553718B2FCBD22C3B9AA45A1E206550AC3A45430F846AE48A81685941B
          3C80A3762E1D4756B5A41BB4C5E4C8500840AABBDDAE793A9D0E355597BA3118
          0CF4388E7D403D140144AA8FF989F6437CEE1FABFDBED80D0258A0FC029E6A72
          0447E9F47AA1BC5C5FFFC20D94A3F17D0EA01A3E8B7BDD1040E606D6BDCB1CBD
          74F2AAA129000A6C05FB17009480C5137282AD726E02A0102FF8EC7903748403
          F8BE510064F323EF514B81E4DE5ED77D0BD002B4002D40230038EDE8B816FD03
          7278EF9C3C007A571F6AB7892300B247FF17F620ABC46961E704000000004945
          4E44AE426082}
      end
    end
    object pnlFrete: TPanel
      Left = 0
      Top = 275
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
      TabStop = True
      object Bevel3: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 50
        Shape = bsRightLine
      end
      object edtValorFrete: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 15
        EditLabel.Caption = 'CEP:'
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
        MaxLength = 8
        ParentFont = False
        TabOrder = 0
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
    end
    object pnlFreteTitle: TPanel
      Left = 0
      Top = 226
      Width = 892
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      ExplicitTop = 275
      object Label3: TLabel
        Left = 59
        Top = 15
        Width = 128
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar frete'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = Label3Click
      end
      object Label4: TLabel
        Left = 201
        Top = 15
        Width = 80
        Height = 16
        Caption = '(Opcional)'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9474192
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Image4: TImage
        Left = 6
        Top = 6
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000001EE4944415478DABD975D52C23010C7290C7D
          E608BD811CA19EC07A02E30CF02A9C406E607D63E843EB09C413A027404EA0DE
          405EE101FF3B364E26938F7E6CCD4C27A50DF9FF369BCD6E835E076D3A9D8ED1
          E5B8225C975996BDDBC606DCE24288D17038FC08826044BFCFE7F3B70B821D00
          D66F211EABCF5C10AC00B3D96C8EEEC1F4CE06C106407E87E53BD71813040B40
          E9775AFAB16FAC0EC10200EB5388DF551DAF42B406984C2671BFDFDFD6FD9F84
          A80C00A12B5899F47E635B6D6319720DDAA717003BFB06DDD220DCBA6115BE9C
          00F06D0EEB04B770D90E0088AD00B09CACBEEF4219C26F83C140AC562BBB0B28
          B4C2307CC5ED05A7D5B896EBF53A950F9C2EE08450AD569F7B372113C442B5BA
          16404B883D2C172CE9B80904C45F209EB8C6D402A0BE0E04F91D00716B005964
          E076713A9D365521D8007020ED64A6C3A4B7552158004CA76155088C7B04C0BC
          3100C405C473C3ABC3F1788CE8C603718DF0DB34027054387B88C74551503AB5
          4607251A581FF956D808504E4AE29136A971492D105EEBAD0086CA9632D71CE2
          856D220DE209E2C2276E04D0CB2B5A4A7489EB34D32084EDD8F502E89B8EC208
          BB3D91FEEEA2FD01949F535BE58BC61B426C005A594D395B54D9406C00A87E9E
          D151D2F0662F7600597A51E682BF4597FEB60190608A255FFEA7B06C3F53082B
          0E1799E2880000000049454E44AE426082}
      end
    end
  end
  inherited ActionList: TActionList
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
