inherited FDadosEmpresa: TFDadosEmpresa
  Caption = 'Dados da Empresa'
  ClientHeight = 516
  ClientWidth = 919
  OnCreate = FormCreate
  ExplicitWidth = 919
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Top = 9
    Width = 903
    ExplicitTop = 9
    ExplicitWidth = 903
    inherited pnlHeader: TPanel
      Width = 899
      ExplicitWidth = 899
      inherited imgBorderGreenCadastro: TImage
        Left = 615
        ExplicitLeft = 615
      end
      inherited spbCancelar: TSpeedButton
        Left = 621
        ExplicitLeft = 621
      end
      inherited imgBorderBlueAlterar: TImage
        Left = 756
        ExplicitLeft = 756
      end
      inherited spbSalvar: TSpeedButton
        Left = 762
        ExplicitLeft = 762
      end
      inherited Bevel2: TBevel
        Width = 899
        ExplicitWidth = 899
      end
    end
    object pnlTitle: TPanel
      Left = 0
      Top = 0
      Width = 899
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object lblTituloForm: TLabel
        Left = 0
        Top = 0
        Width = 899
        Height = 47
        Align = alClient
        Alignment = taCenter
        Caption = 'Dados da Empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6316128
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 176
        ExplicitHeight = 21
      end
      object Bevel1: TBevel
        Left = 0
        Top = 47
        Width = 899
        Height = 2
        Align = alBottom
        Shape = bsBottomLine
        ExplicitTop = 71
        ExplicitWidth = 879
      end
    end
    object pnlNomeCliente: TPanel
      Left = 0
      Top = 169
      Width = 899
      Height = 160
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      TabStop = True
      object Bevel5: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 140
        Shape = bsRightLine
      end
      object Image2: TImage
        Left = 6
        Top = 6
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000003754944415478DAB557DB4DE34014B52120FE
          0815602AD850C12615602AC02B01E20FA702B21510FE1044C254005480A9006F
          05980AD6FC21F230E778EF9586EC3831E08C14791E77EE3D73EE6326AE53D20E
          0F0FFD3CCF4F5CD76D39DF68D09140C7EF8B8B8B5BDBBA5B661C9F9BEF18B6B4
          5D1B8832003D7C42FCD66B0490E2178191BBCBCBCBE40380A3A3236F3C1E6FEA
          E4F2F2F233C64D50F758330BDAFA60A35B003838380860E8CA5C05CA0C2837B0
          1663EDE78240142E2180144636A716FF60B1553780B7B7B78D95959544EC5DC3
          46E0C2DF1906EB93C9A45350E2BA3C7DB288408441570F05961F60A7CD893E26
          8E979696B6CECFCF530AC23883E4C70C5D2F925E3107E8335EDA73F6D8018841
          5F288AA328CA6600A0E1101B239B0109E6A8CC6DA500D8B0C08253A41D161EA6
          5D800DCFF8F874CFFEFE7E1B8C1D63CC3D1ED6A834C601CEE40004B857098054
          BC2B4C360DD914C25B66103246068341ACCAA9405CE0E918DF0C291CBEBEBE66
          46B0CD0560A3FB05C24D034011B1122FC1B41B822068F2E44C6982C15A077A59
          C84EAB00C884FA5D9C927DA7D168A4662182F0364E9661FD09C32E14F5C5D829
          64222D2A063BDB0C4CB8E9BE4A16DC62628739CA53988AD4F710F4E4443D3223
          C1F6A86ED30C52360D77E5730190BED5D555D2EA61221400CA8AA382A49FFE46
          DF9FA697271E0E8729F4FC5540A3D1C8ABC44059CEAA1113008B1494F4E4B23A
          311992CCB897CBC63765E6B9A085891B89663D512C8194A09FA3BF4D85E8B644
          B9A628EB425B2A270DFA70659B3A90054F5399F5A92CF820CCF8585B5B6B3208
          D5DF04CEC0D4EAC9B8609F2E85F17BDB43A60C402EA73E23C592F3B16482061A
          5F343D71C30ED64304D99D30B107505DD9C794251367E8B30E44662DF84C1690
          EE63A590D7333E1DA13A1423FF3D56180FF805CC00DB353F2B0B18E12940F4A5
          94E616E5197EBB54CEB1946EC60F4B31DD90E84BC716809FCA02FA1314F61C4B
          3D97BA1F81F607F5BFB1475DE0D9F4963280A0393537412061752B79AC7CB9CD
          8C8159C20B0560F8FBDAF9F772654BF836406C3C96D1592780A20E705105EBFA
          536236AD98659530820C6FB5BE00C8BF67CEDAB496CCCF82BA01B0C8E9455715
          80599E53A4D7AFAF1AC7AD986881AB0C406F36638AFFE99279C62A3456D650FA
          854B4AAF635B29ADAB3120F17E689119779620990088D05627BED8787DC7301E
          A85BDE01DE7F524E12CDB1710000000049454E44AE426082}
      end
      object Label8: TLabel
        Left = 265
        Top = 47
        Width = 147
        Height = 15
        Caption = 'Natureza de Opera'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 471
        Top = 47
        Width = 196
        Height = 15
        Caption = 'Reg. Especial de Tributa'#231#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 677
        Top = 47
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
      object edtInscEstadual: TLabeledEdit
        Left = 59
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
        TabOrder = 0
      end
      object edtInscMunicipal: TLabeledEdit
        Left = 59
        Top = 65
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
        TabOrder = 1
      end
      object cbxInsentoInscEstadual: TCheckBox
        Left = 268
        Top = 22
        Width = 309
        Height = 17
        Caption = 'Empresa Isenta de Inscri'#231#227'o Estadual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = cbxInsentoInscEstadualClick
      end
      object cbxNaturezaOperacao: TComboBox
        Left = 265
        Top = 65
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
        Text = 'TRIBUTACAO NO MUNICIPIO'
        Items.Strings = (
          'TRIBUTACAO NO MUNICIPIO'
          'TRIBUTACAO FORA DO MUNICIPIO'
          'ISENCAO'
          'IMUNE'
          'EXIGIBILIDADE SUSPENSA POR DECISAO JUDICIAL'
          'EXIGIBILIDADE SUSPENSA POR PROCEDIMENTO')
      end
      object cbxRegEspecialTributacao: TComboBox
        Left = 471
        Top = 65
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
        TabOrder = 4
        Text = 'MICROEMPRESA MUNICIPAL'
        Items.Strings = (
          'MICROEMPRESA MUNICIPAL'
          'ESTIMATIVA'
          'SOCIEDADE DE PROFISSIONAIS'
          'COOPERATIVA'
          'MICRO-EMPRESARIO INDIVIDUAL (MEI)'
          'MICRO-EMPRESARIO E EMPRESA PEQUENA')
      end
      object edtDataFundacao: TDateTimePicker
        Left = 677
        Top = 65
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
        TabOrder = 5
      end
      object cbxSimplesNacional: TCheckBox
        Left = 59
        Top = 102
        Width = 318
        Height = 17
        Caption = 'Empresa optante pelo SIMPLES nacional'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object cbxImportacaoProdutos: TCheckBox
        Left = 59
        Top = 125
        Width = 342
        Height = 17
        Caption = 'Empresa realiza importa'#231#227'o de produtos?'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 49
      Width = 899
      Height = 120
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      TabStop = True
      object Bevel3: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 101
        Shape = bsRightLine
      end
      object Image1: TImage
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
      object Image3: TImage
        Left = 853
        Top = 66
        Width = 24
        Height = 24
        Cursor = crHandPoint
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000003294944415478DA9D564B4C135114BD43FF14
          DA426B29AD1AFE34455268699405461203512441C0051B16C6953B7644F14334
          06131376AE8C4437E806F09F1A135D98A0D1FE829616A222B585C2B4B440DB69
          3B50FBAA9D40FFE56C26999977CE9973DFBB7730C80367AFBC6A42D7D777BA8C
          B9AEC1323D3C37FCE21493CD1EC220A266D0992C3A831EBB4F86490893A16004
          305D8820C65F8E757FC84BA067F84D05C62C9816F07812A94C2A1108F829177B
          3C5E70D81DAB1EEFA63312DEED99193BB3945500B9E67038537575B525E98853
          092D2C2CBA0381405FE2D76089E4851CF6B366958A47A7D3F2290F90E40EE80D
          066FC01FE8D92B4209A058181C865EA56A2EC9977C9F88DEE00E07C2EA785C94
          C0F96B5AA3422157E61A4B1C04118C169C84E2222E1597D96C314DDFEA6CA204
          50348744C2278A0645593EC40EBB0DEC0E2768342DC066B3A867E6EFF3ABEB38
          3E80A28A09F4DDD43E97D7CBBB73718F1C6E7B71A0ED06A1A54E041F2D5EA8AC
          AE4D7A67DE629D981AEDB81813E8BDA1B5B79E382ECD46EC5CB141A5980BDDAD
          47A0B14A0843F7674128ADDEE73E8ED94F9F1D53A39DB298C0C0EDF7B84ADD2C
          4C45BCEA5C039F671DAA258530D8510FE2124EECFEDC4F173C7CBB04B28A9A94
          86F43A836B72A45D84A1E35FCAE3BF532A8F091389DD6B2BD11884D07FB28A22
          8E6364E22BD08AA554711361327D73B937BDA7930410F1CA1F1B1C1517C250BF
          328918616D230057270C50AF68481B2925902AA2AD6D1FF83637C0ED7281A088
          016D8DE5D0D17218B8EC7FBDE8EEA411B6B052C8B429A888B215191D1EBBDD01
          ED0A2EF4B655C6DC5F7F64801A797AF74945CEB64DD19E77397EC0F8E556B8F7
          D4047898072251695AF2A46D9ACB4133CF9960EC9206861F7C0145A332A37B94
          BFC7B3D14F1D34846CADC2B6FC0B384000C91282A44C9CD17D52AB40C8D6EC50
          E117AD1650A9D569C951BD743A3D4E12A426A9D9C5A3CAD4AE71DC9D367B446E
          301ABD7E9F3F75BBDE2B72908163B52EE004415CC83870F6C685310A66F87C7E
          994C569E7164FE5E5EC67DDB7E7BCE2333F16B982CD62040A493C5603269FF87
          FE4E74E807C3A15074B936140C3ECE7BE8A7C3417E5BFE02D0DF9E7AB476A3FA
          0000000049454E44AE426082}
      end
      object Label1: TLabel
        Left = 763
        Top = 52
        Width = 84
        Height = 15
        Caption = 'Pressione F1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object edtCNPJ: TLabeledEdit
        Left = 59
        Top = 20
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 112
        EditLabel.Height = 15
        EditLabel.Caption = 'CNPJ da Empresa:'
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
      object edtRazaoSocial: TLabeledEdit
        Left = 265
        Top = 20
        Width = 272
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
        TabOrder = 1
      end
      object edtNomeFantasia: TLabeledEdit
        Left = 543
        Top = 20
        Width = 334
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 98
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome Fantasia:'
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
      object edtCNAE: TLabeledEdit
        Left = 59
        Top = 66
        Width = 788
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 105
        EditLabel.Height = 15
        EditLabel.Caption = 'CNAE Principal:'
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
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnlEndereco: TPanel
      Left = 0
      Top = 329
      Width = 899
      Height = 104
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      TabStop = True
      object Bevel6: TBevel
        Left = 47
        Top = -278
        Width = 2
        Height = 382
        Shape = bsRightLine
      end
      object Image4: TImage
        Left = 6
        Top = 10
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
      end
    end
  end
  inherited ActionList: TActionList
    Left = 440
    Top = 456
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
