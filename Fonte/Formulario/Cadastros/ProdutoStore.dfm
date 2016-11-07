inherited FProdutoStore: TFProdutoStore
  Caption = 'Cadastro de Produto'
  ClientHeight = 562
  ClientWidth = 919
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 919
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Width = 896
    Height = 546
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
        Left = 299
        Top = 13
        Width = 275
        Height = 21
        Caption = 'Cadastro de novo Produto!'
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
    object pnlProduto: TPanel
      Left = 0
      Top = 49
      Width = 892
      Height = 192
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      TabStop = True
      object Bevel5: TBevel
        Left = 47
        Top = 6
        Width = 2
        Height = 200
        Shape = bsRightLine
      end
      object Image2: TImage
        Left = 6
        Top = 6
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000000E04944415478DAED964D0E8230104687BFA4
          0B4DBC812C8945E4087832F564C20D8CD084A5DE0013174DA0AD0C09A6F502B8
          985975A6AFD3B7FC3C58B83C122081F9902669F196E18D31B98920DAF6D03FA5
          64DD9AA983FD4007FA2584B8CD3CCE90B1F9BAADAB244962DC83F7D873CE73A5
          546733AE00CF0C287D04DF2FC6E9090C5C40EB1202FFEA3A9BAA1175F1E5B190
          B1F846DCBD74979DA73D634D3DDF9760BCD26648800448800448800448800448
          E0CF04AC501A42180F303C3040AED8903BDF07A6FB0DA5C8D87CD336258652DC
          33098CBD1D4A67C61158AA4880043E09766E4EA6CB337D0000000049454E44AE
          426082}
      end
      object imgSearchCategoria: TImage
        Left = 857
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
        OnClick = imgSearchCategoriaClick
      end
      object Label6: TLabel
        Left = 770
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
      object edtNomeProduto: TLabeledEdit
        Left = 59
        Top = 20
        Width = 260
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 126
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome do Produto: *'
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
      object edtCodigoProduto: TLabeledEdit
        Left = 59
        Top = 66
        Width = 270
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 126
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo do Produto:'
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
      object edtCodigoBarras: TLabeledEdit
        Left = 335
        Top = 66
        Width = 270
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 161
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo de barras (EAN):'
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
      object edtCategoriaProduto: TLabeledEdit
        Left = 611
        Top = 66
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 147
        EditLabel.Height = 15
        EditLabel.Caption = 'Categoria do Produto:'
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
        OnKeyDown = edtCategoriaProdutoKeyDown
      end
      object edtValorVenda: TLabeledEdit
        Left = 59
        Top = 112
        Width = 200
        Height = 24
        BiDiMode = bdLeftToRight
        CharCase = ecUpperCase
        EditLabel.Width = 105
        EditLabel.Height = 15
        EditLabel.BiDiMode = bdLeftToRight
        EditLabel.Caption = 'Valor de Venda:'
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
        TabOrder = 4
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
      object edtValorCusto: TLabeledEdit
        Left = 265
        Top = 112
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 105
        EditLabel.Height = 15
        EditLabel.Caption = 'Valor de Custo:'
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
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
      object edtDisponivelEstoque: TLabeledEdit
        Left = 59
        Top = 159
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 154
        EditLabel.Height = 15
        EditLabel.Caption = 'Dispon'#237'vel em estoque:'
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
        TabOrder = 6
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
      object edtMinimoEstoque: TLabeledEdit
        Left = 265
        Top = 159
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 126
        EditLabel.Height = 15
        EditLabel.Caption = 'M'#237'nimo em estoque:'
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
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
      object edtMaximoEstoque: TLabeledEdit
        Left = 471
        Top = 159
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 126
        EditLabel.Height = 15
        EditLabel.Caption = 'M'#225'ximo em estoque:'
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
        TabOrder = 8
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency2
        OnKeyDown = edtMaximoEstoqueKeyDown
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
    end
    object pnlDadosFiscaisTitle: TPanel
      Left = 0
      Top = 241
      Width = 892
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label1: TLabel
        Left = 59
        Top = 22
        Width = 304
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar dados usados na Nota Fiscal'
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
        Left = 373
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
          00200806000000737A7AF4000000E94944415478DAED97CD0DC2300C85EDE4D2
          03888ED023A201BA01DD00466103CA068C0213D06E80DA04750CB8D3188A3870
          2852E9AF04F1C997E47D7AB69E64845789C92C00840D7451045B798E83BCC577
          00425A6146EB56B539EE90705F080048BE5489DF268070A721108606C0009406
          783E005C5493A3A8F0BF6F005CD7F53043BB923CA78B52EA540BA0E9320006C0
          00D40A22A9621463E10367C772720D07914C65E8389E3DB06E5E29F99F08A2DC
          0196B151DE276912E50E0CAD6C5E464C737DADED40EF3BD0FB087A07303BD0FB
          080CC07F0110C092E9768F53CD1EC729C0E18303DD9FE7772001A9304E369DB4
          0000000049454E44AE426082}
      end
    end
    object pnlDadosFiscais: TPanel
      Left = 0
      Top = 294
      Width = 892
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      TabStop = True
      object Bevel3: TBevel
        Left = 47
        Top = 0
        Width = 2
        Height = 100
        Shape = bsRightLine
      end
      object imgSearchMedida: TImage
        Left = 305
        Top = 20
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
        OnClick = imgSearchMedidaClick
      end
      object imgSearchNCM: TImage
        Left = 581
        Top = 20
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
        OnClick = imgSearchNCMClick
      end
      object imgSearchCEST: TImage
        Left = 857
        Top = 20
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
        OnClick = imgSearchCESTClick
      end
      object Label7: TLabel
        Left = 218
        Top = 6
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
      object Label8: TLabel
        Left = 494
        Top = 6
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
      object Label9: TLabel
        Left = 770
        Top = 6
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
      object edtPesoLiquido: TLabeledEdit
        Left = 59
        Top = 66
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 91
        EditLabel.Height = 15
        EditLabel.Caption = 'Peso Liqu'#237'do:'
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
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency3
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
      object edtPesoBruto: TLabeledEdit
        Left = 265
        Top = 66
        Width = 200
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 77
        EditLabel.Height = 15
        EditLabel.Caption = 'Peso Bruto:'
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
        OnEnter = ConvertCurrencyString
        OnExit = StringFormatCurrency3
        OnKeyDown = edtPesoBrutoKeyDown
        OnKeyPress = SomenteNumerosVirgulaPontoKeyPress
      end
      object edtUnidadeMedida: TLabeledEdit
        Left = 59
        Top = 20
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 126
        EditLabel.Height = 15
        EditLabel.Caption = 'Unidade de Medida:'
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
        TabOrder = 0
        OnKeyDown = edtUnidadeMedidaKeyDown
      end
      object edtNCM: TLabeledEdit
        Left = 335
        Top = 20
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 15
        EditLabel.Caption = 'NCM:'
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
        TabOrder = 1
        OnKeyDown = edtNCMKeyDown
      end
      object edtCEST: TLabeledEdit
        Left = 611
        Top = 20
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 35
        EditLabel.Height = 15
        EditLabel.Caption = 'CEST:'
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
        OnKeyDown = edtCESTKeyDown
      end
    end
    object pnlFornecedorTitle: TPanel
      Left = 0
      Top = 295
      Width = 892
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object Label3: TLabel
        Left = 59
        Top = 22
        Width = 168
        Height = 16
        Cursor = crHandPoint
        Caption = #9660' Informar fornecedor'
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
        Left = 235
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
      object Image9: TImage
        Left = 6
        Top = 13
        Width = 32
        Height = 32
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
          00200806000000737A7AF4000002584944415478DAD597D16DC230108609085E
          A11300130013344CD074820609106FA51B7483D257406A980036204C403A41E9
          04855710D0FF47761582131C291461091CEC8BEFF3DDF97C18A92B37E366016C
          DB2E64B3D9CA7EBF2F1886F13D180CBC7F01E8743AA5DD6EF786474B8E01C203
          40EDE200AD56AB8A6E8A1D1754F30071D1BDC4B186360077BEDD6EE761CA7D10
          CBCD6653761C67992840BBDD76D03DE9C802E21D56E8260A00F32FB0FBA22680
          764CC4B1C05E5796ADDFEF6BAD7D3B0070810B17DC6B8A7F02A09A34400F00CF
          3AB21709C2382EE05104C05DD2004C2E154DF1E45D0000A65E079FFC19D1153E
          3600268902B0210E2688838733622328B775D78C0B6003E0234A0617557D381C
          BA1701608B8A0504DF0CC167C6592F3640B3D934D3E9F43489DDDF16006B01F8
          BF0B333321CD553298AB5166BD5E7713BF8E650032C7ABB2A2CC7E4C58712C11
          0940A5E8A86896C9647A58F88BBB64C5E33F11186B60CC11569A0B48E681227E
          F7F07B140B40149C63BC6C8AA1051629F304D0055446995C2EB7E024E60E5512
          E6E9228B2701CF74415E007AA892EA2AB71821CA59F7C954CACCF60A253D01B0
          80024B58E8606679F4E4AE598C1086EFF92094A5DA094030DBF9CCFB771DCBBB
          9EFE96178FB0C88F78C7C5583D98B8E4782880EA88C9F22A10788FA21FF38B41
          87B9922F2664409E24AD60801E0184159E58D0C1820D9F1546DCB904A2427425
          61B9C34D18513F1CDD15470051550F5D011F4E44E0D1AFEC4B3248C5F30A7226
          FF2D8525AB60BA56B9C04CA9DB9281288E9A1522E3F11A1601A8FCFF0017B8A1
          2EB846BB3AC02F783A98309E670C4B0000000049454E44AE426082}
      end
    end
    object pnlFornecedor: TPanel
      Left = 0
      Top = 348
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
        Height = 170
        Shape = bsRightLine
      end
      object Label15: TLabel
        Tag = 92
        Left = 18
        Top = 20
        Width = 8
        Height = 19
        Cursor = crHandPoint
        Caption = '1'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label17: TLabel
        Tag = 92
        Left = 18
        Top = 64
        Width = 8
        Height = 19
        Cursor = crHandPoint
        Caption = '2'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object imgSearchFornecedor1: TImage
        Left = 305
        Top = 20
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
        OnClick = imgSearchFornecedor1Click
      end
      object imgSearchFornecedor2: TImage
        Left = 305
        Top = 64
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
        OnClick = imgSearchFornecedor2Click
      end
      object imgSearchFornecedor3: TImage
        Left = 305
        Top = 108
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
        OnClick = imgSearchFornecedor3Click
      end
      object Label5: TLabel
        Tag = 92
        Left = 18
        Top = 108
        Width = 8
        Height = 19
        Cursor = crHandPoint
        Caption = '3'
        Font.Charset = ANSI_CHARSET
        Font.Color = 16031488
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label10: TLabel
        Left = 218
        Top = 6
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
      object Label11: TLabel
        Left = 218
        Top = 50
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
      object Label12: TLabel
        Left = 218
        Top = 94
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
      object edtNomeFornecedor2: TLabeledEdit
        Left = 59
        Top = 64
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 77
        EditLabel.Height = 15
        EditLabel.Caption = 'Fornecedor:'
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
        TabOrder = 1
        OnKeyDown = edtNomeFornecedor2KeyDown
      end
      object edtNomeFornecedor1: TLabeledEdit
        Left = 59
        Top = 20
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 77
        EditLabel.Height = 15
        EditLabel.Caption = 'Fornecedor:'
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
        TabOrder = 0
        OnKeyDown = edtNomeFornecedor1KeyDown
      end
      object edtNomeFornecedor3: TLabeledEdit
        Left = 59
        Top = 108
        Width = 243
        Height = 24
        CharCase = ecUpperCase
        EditLabel.Width = 77
        EditLabel.Height = 15
        EditLabel.Caption = 'Fornecedor:'
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
        OnKeyDown = edtNomeFornecedor3KeyDown
      end
    end
  end
  inherited ActionList: TActionList
    Left = 520
    Top = 512
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
end
