inherited FItemStore: TFItemStore
  Caption = 'Compra Itens'
  ClientHeight = 227
  ExplicitHeight = 227
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Height = 209
    ExplicitHeight = 209
    object imgSearchProdutoServico: TImage [0]
      Left = 261
      Top = 77
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
      OnClick = imgSearchProdutoServicoClick
    end
    object Label6: TLabel [1]
      Left = 173
      Top = 63
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
    object Label13: TLabel [2]
      Left = 507
      Top = 125
      Width = 63
      Height = 15
      Caption = 'SubTotal:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      StyleElements = []
    end
    inherited pnlHeader: TPanel
      Top = 157
      ExplicitTop = 157
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
        AutoSize = False
        Caption = 'Adicionando novo Item!'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6316128
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 246
        ExplicitTop = 20
        ExplicitWidth = 275
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
    object edtProdutoServico: TLabeledEdit
      Left = 14
      Top = 77
      Width = 243
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 112
      EditLabel.Height = 15
      EditLabel.Caption = 'Produto/Servi'#231'o:'
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
      TabOrder = 2
      OnKeyDown = edtProdutoServicoKeyDown
    end
    object edtDetalhe: TLabeledEdit
      Left = 291
      Top = 77
      Width = 503
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 63
      EditLabel.Height = 15
      EditLabel.Caption = 'Detalhes:'
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
    object edtQuantidade: TLabeledEdit
      Left = 14
      Top = 122
      Width = 99
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 77
      EditLabel.Height = 15
      EditLabel.Caption = 'Quantidade:'
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
      Text = '1,00'
      OnChange = edtQuantidadeChange
      OnEnter = ConvertCurrencyString
      OnExit = StringFormatCurrency2
      OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
    end
    object edtCusto: TLabeledEdit
      Left = 119
      Top = 122
      Width = 138
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 42
      EditLabel.Height = 15
      EditLabel.Caption = 'Custo:'
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
      OnChange = edtCustoChange
      OnEnter = ConvertCurrencyString
      OnExit = StringFormatCurrency2
      OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
    end
    object Panel3: TPanel
      Left = 589
      Top = 121
      Width = 205
      Height = 26
      BevelOuter = bvNone
      TabOrder = 6
      object lblSubTotal: TLabel
        Left = 0
        Top = 0
        Width = 205
        Height = 26
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = 'R$ 0,00'
        Font.Charset = ANSI_CHARSET
        Font.Color = 6316128
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = -8
        ExplicitTop = 4
      end
    end
  end
  inherited ActionList: TActionList
    Left = 744
    Top = 48
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
