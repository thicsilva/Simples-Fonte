inherited FFornecedorStore: TFFornecedorStore
  Caption = 'Cadastros de Fornecedores'
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
      TabOrder = 1
      object lblTituloForm: TLabel
        Left = 288
        Top = 13
        Width = 308
        Height = 21
        Caption = 'Cadastro de novo Fornecedor!'
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
    object pnlNomeFornecedor: TPanel
      Left = 0
      Top = 49
      Width = 892
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
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
      object edtNomeFornecedor: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 147
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome do Fornecedor: *'
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
        OnKeyDown = edtNomeFornecedorKeyDown
      end
    end
    object pnlPessoaFisica: TPanel
      Tag = 1
      Left = 0
      Top = 121
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      TabStop = True
      object Label3: TLabel
        Left = 59
        Top = 2
        Width = 84
        Height = 15
        Caption = 'Tipo pessoa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 471
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
      object Label5: TLabel
        Left = 59
        Top = 46
        Width = 84
        Height = 15
        Caption = 'Anivers'#225'rio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 102
        Shape = bsRightLine
      end
      object edtCPF: TLabeledEdit
        Left = 265
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 15
        EditLabel.Caption = 'CPF:'
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
        MaxLength = 11
        NumbersOnly = True
        ParentFont = False
        TabOrder = 1
      end
      object cbxTipoPessoaFisica: TComboBox
        Left = 59
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
        TabOrder = 0
        Text = 'FISICA'
        OnChange = cbxTipoPessoaFisicaChange
        Items.Strings = (
          'FISICA'
          'JURIDICA')
      end
      object cbxIndicadorInscEstadual: TComboBox
        Left = 471
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
        TabOrder = 2
        Text = 'NAO CONTRIBUINTE'
        Items.Strings = (
          'NAO CONTRIBUINTE'
          'CONTRIBUINTE'
          'CONTRIBUINTE ISENTO')
      end
      object edtRG: TLabeledEdit
        Left = 677
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 21
        EditLabel.Height = 15
        EditLabel.Caption = 'RG:'
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
      end
      object edtIdentificadorEstrangeiroFisica: TLabeledEdit
        Left = 265
        Top = 64
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 182
        EditLabel.Height = 15
        EditLabel.Caption = 'Indentificador strangeiro:'
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
        MaxLength = 16
        ParentFont = False
        TabOrder = 5
        OnKeyDown = edtIdentificadorEstrangeiroFisicaKeyDown
      end
      object edtDataNascimento: TDateTimePicker
        Left = 59
        Top = 64
        Width = 200
        Height = 24
        Date = 42647.442820416670000000
        Time = 42647.442820416670000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
    object pnlPessoaJuridica: TPanel
      Left = 0
      Top = 122
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 4
      object Label7: TLabel
        Left = 59
        Top = 2
        Width = 84
        Height = 15
        Caption = 'Tipo pessoa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
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
      object Label9: TLabel
        Left = 471
        Top = 46
        Width = 119
        Height = 15
        Caption = 'Data de Funda'#231#227'o:'
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
        Height = 105
        Shape = bsRightLine
      end
      object edtCNPJ: TLabeledEdit
        Left = 265
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
        TabOrder = 1
      end
      object cbxTipoPessoaJuridica: TComboBox
        Left = 59
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
        ItemIndex = 1
        ParentFont = False
        TabOrder = 0
        Text = 'JURID'#205'CA'
        OnChange = cbxTipoPessoaJuridicaChange
        Items.Strings = (
          'F'#205'SICA'
          'JURID'#205'CA')
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
        Items.Strings = (
          'NAO CONTRIBUINTE'
          'CONTRIBUINTE'
          'CONTRIBUINTE ISENTO')
      end
      object edtRazaoSocial: TLabeledEdit
        Left = 471
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 91
        EditLabel.Height = 15
        EditLabel.Caption = 'Raz'#227'o Social:'
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
      object edtInscEstadual: TLabeledEdit
        Left = 59
        Top = 64
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
        TabOrder = 4
      end
      object edtInscMunicipal: TLabeledEdit
        Left = 265
        Top = 64
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
        TabOrder = 5
      end
      object edtDataFundacao: TDateTimePicker
        Left = 471
        Top = 64
        Width = 200
        Height = 24
        Date = 42647.442820416670000000
        Time = 42647.442820416670000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object edtIdentificadorEstrangeiroJuridica: TLabeledEdit
        Left = 677
        Top = 64
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 182
        EditLabel.Height = 15
        EditLabel.Caption = 'Indentificador strangeiro:'
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
        TabOrder = 7
        OnKeyDown = edtIdentificadorEstrangeiroJuridicaKeyDown
      end
    end
    object pnlContato: TPanel
      Left = 0
      Top = 176
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      TabStop = True
      object Bevel7: TBevel
        Left = 47
        Top = -278
        Width = 2
        Height = 382
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
        Left = 677
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
        TabOrder = 3
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
      object edtTelefoneResidencial: TLabeledEdit
        Left = 471
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 147
        EditLabel.Height = 15
        EditLabel.Caption = 'Telefone residencial:'
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
        MaxLength = 16
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object edtCelular: TLabeledEdit
        Left = 59
        Top = 64
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
        TabOrder = 4
        OnKeyDown = edtCelularKeyDown
      end
    end
    object pnlContatoTitle: TPanel
      Left = 0
      Top = 123
      Width = 892
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      object Label1: TLabel
        Left = 59
        Top = 22
        Width = 312
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar contato para este fornecedor'
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
        Left = 381
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
      Top = 226
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      TabStop = True
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
        Left = 677
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
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Left = 59
        Top = 64
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
        TabOrder = 4
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
      object edtNumero: TLabeledEdit
        Left = 471
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 15
        EditLabel.Caption = 'N'#250'mero:'
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
        MaxLength = 10
        NumbersOnly = True
        ParentFont = False
        TabOrder = 2
      end
      object edtCidade: TLabeledEdit
        Left = 265
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
        TabOrder = 5
        OnKeyDown = edtCidadeKeyDown
      end
    end
    object pnlEnderecoTitle: TPanel
      Left = 0
      Top = 177
      Width = 892
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
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
    object pnlObsTitle: TPanel
      Left = 0
      Top = 227
      Width = 892
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 9
      object Label6: TLabel
        Left = 59
        Top = 15
        Width = 176
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar Observa'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = Label6Click
      end
      object Label10: TLabel
        Left = 243
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
    end
    object pnlObs: TPanel
      Left = 0
      Top = 276
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 10
      TabStop = True
      object Bevel8: TBevel
        Left = 47
        Top = -278
        Width = 2
        Height = 382
        Shape = bsRightLine
      end
      object Label15: TLabel
        Left = 59
        Top = 2
        Width = 77
        Height = 15
        Caption = 'Observa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object mmObs: TMemo
        Left = 59
        Top = 20
        Width = 818
        Height = 77
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  inherited ActionList: TActionList
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
