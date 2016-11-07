inherited FSistema: TFSistema
  Caption = 'Configura'#231#245'es do Sistema'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    object pgcSistema: TPageControl
      Left = 0
      Top = 0
      Width = 808
      Height = 445
      ActivePage = tbNFE
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbNFE: TTabSheet
        Caption = 'Configurar NFE'
        object rgpFormaEmissao: TRadioGroup
          Left = 0
          Top = 0
          Width = 137
          Height = 145
          Caption = 'Forma de Emiss'#227'o:'
          ItemIndex = 0
          Items.Strings = (
            'NORMAL'
            'DPEC'
            'CONTINGENCIA'
            'SCAN'
            'FSDA')
          TabOrder = 0
        end
        object gpbArquivos: TGroupBox
          Left = 143
          Top = 0
          Width = 298
          Height = 145
          Caption = 'Arquivos:'
          TabOrder = 1
          object imgSearchCliente: TImage
            Left = 261
            Top = 96
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
            OnClick = imgSearchClienteClick
          end
          object Label2: TLabel
            Left = 173
            Top = 82
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
          object cbxSalvarAquivos: TCheckBox
            Left = 20
            Top = 34
            Width = 255
            Height = 25
            Caption = 'Salvar Arquivos de Envio e Resposta?'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object edtArquivos: TLabeledEdit
            Left = 14
            Top = 96
            Width = 243
            Height = 24
            CharCase = ecUpperCase
            EditLabel.Width = 98
            EditLabel.Height = 15
            EditLabel.Caption = 'Path Arquivos:'
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
          end
        end
        object gpbCertificado: TGroupBox
          Left = 0
          Top = 144
          Width = 441
          Height = 129
          Caption = 'Certificado:'
          TabOrder = 2
          object Image1: TImage
            Left = 261
            Top = 42
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
            OnClick = Image1Click
          end
          object Label1: TLabel
            Left = 173
            Top = 28
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
          object edtLocalCertificado: TLabeledEdit
            Left = 14
            Top = 42
            Width = 243
            Height = 24
            CharCase = ecUpperCase
            EditLabel.Width = 119
            EditLabel.Height = 15
            EditLabel.Caption = 'Path Certificado:'
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
          end
          object edtSenhaCertificado: TLabeledEdit
            Left = 291
            Top = 42
            Width = 137
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
            TabOrder = 1
          end
          object edtNumeroSerie: TLabeledEdit
            Left = 14
            Top = 88
            Width = 414
            Height = 24
            CharCase = ecUpperCase
            EditLabel.Width = 112
            EditLabel.Height = 15
            EditLabel.Caption = 'N'#250'mero de S'#233'rie:'
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
        object gpbWebService: TGroupBox
          Left = 447
          Top = 0
          Width = 354
          Height = 273
          Caption = 'WebService:'
          TabOrder = 3
          object edtUF: TLabeledEdit
            Left = 24
            Top = 44
            Width = 35
            Height = 24
            CharCase = ecUpperCase
            EditLabel.Width = 14
            EditLabel.Height = 15
            EditLabel.Caption = 'UF'
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
          object rgpAmbienteDestino: TRadioGroup
            Left = 88
            Top = 20
            Width = 258
            Height = 61
            Caption = 'Ambiente de Destino:'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'PRODUCAO'
              'HOMOLOGACAO')
            TabOrder = 1
          end
          object gpbConexao: TGroupBox
            Left = 9
            Top = 88
            Width = 337
            Height = 177
            Caption = 'Conex'#227'o:'
            TabOrder = 2
            object edtHost: TLabeledEdit
              Left = 14
              Top = 38
              Width = 307
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 35
              EditLabel.Height = 15
              EditLabel.Caption = 'Host:'
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
            object edtPorta: TLabeledEdit
              Left = 14
              Top = 87
              Width = 307
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 42
              EditLabel.Height = 15
              EditLabel.Caption = 'Porta:'
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
            object edtUsuario: TLabeledEdit
              Left = 14
              Top = 135
              Width = 154
              Height = 24
              CharCase = ecUpperCase
              EditLabel.Width = 56
              EditLabel.Height = 15
              EditLabel.Caption = 'Usu'#225'rio:'
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
            object edtSenhaConexao: TLabeledEdit
              Left = 174
              Top = 135
              Width = 147
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
              TabOrder = 3
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 688
    Top = 384
    inherited ActionSalvar: TAction
      OnExecute = ActionSalvarExecute
    end
  end
  object OpenDialog: TOpenDialog
    Left = 688
    Top = 440
  end
end
