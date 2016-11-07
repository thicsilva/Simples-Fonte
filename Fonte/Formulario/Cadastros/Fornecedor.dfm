inherited FFornecedor: TFFornecedor
  Caption = 'Cadastros de Fornecedor'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    inherited pnlHeader: TPanel
      inherited edtPesquisa: TSearchBox
        OnChange = edtPesquisaChange
      end
    end
    inherited pnlGridTitle: TPanel
      object Label1: TLabel
        Left = 30
        Top = 8
        Width = 70
        Height = 15
        Caption = 'Fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label2: TLabel
        Left = 231
        Top = 8
        Width = 56
        Height = 15
        Caption = 'CPF/CNPJ'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
      object Label3: TLabel
        Left = 381
        Top = 8
        Width = 49
        Height = 15
        Caption = 'Contato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        StyleElements = []
      end
    end
    inherited Grid: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MARK'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF_CNPJ'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTATO'
          Width = 130
          Visible = True
        end>
    end
  end
  inherited fdmt_Modelo: TFDMemTable
    object fdmt_ModeloFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Size = 100
    end
    object fdmt_ModeloCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 19
    end
    object fdmt_ModeloCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 16
    end
  end
  inherited ImageList: TImageList
    Bitmap = {
      494C01010200A4000C0110001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000020101200B0704400B07
      04400B0704400B0704400B0704400B0704400B0704400B0704400B0704400B07
      04400B0704400B070440020101200000000000000000020101200B0704400B07
      04400B0704400B0704400B0704400B0704400B0704400B0704400B0704400B07
      04400B0704400B07044002010120000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002010120A97A56E5E1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFA97A56E50201012002010120A97A56E5E1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFA97A56E5020101200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF1BB92FFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF1BB92FFFDF2EAFFFAE4D4FFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF1BB92FFFDF2EAFFFAE8DAFFFEFBF8FFFAE4D4FFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFFCEDE2FFF9E4D3FFF0B78BFFF3C4A0FFFEFBF8FFFAE4D4FFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF2C099FFF0B78BFFF0B78BFFF0B78BFFF3C4A0FFFEFBF8FFFAE4D4FFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF3C4A0FFFEFBF8FFFAE4
      D4FFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF3C4A0FFFEFB
      F8FFF6D2B6FFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF2C0
      99FFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400B070440E1A77AFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B78BFFF0B7
      8BFFF0B78BFFF0B78BFFE1A77AFF0B0704400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002010120AB7B56E8E1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFA87A56E40201012002010120AB7B56E8E1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A77AFFE1A7
      7AFFE1A77AFFE1A77AFFA87A56E4020101200000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000020101200B07043F0B07
      043F0B07043F0B07043F0B07043F0B07043F0B07043F0B07043F0B07043F0B07
      043F0B07043F0B07043F020101200000000000000000020101200B07043F0B07
      043F0B07043F0B07043F0B07043F0B07043F0B07043F0B07043F0B07043F0B07
      043F0B07043F0B07043F02010120000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  inherited ActionList: TActionList
    inherited ActionCadastrar: TAction
      OnExecute = ActionCadastrarExecute
    end
    inherited ActionAlrerar: TAction
      OnExecute = ActionAlrerarExecute
    end
    inherited ActionExcluir: TAction
      OnExecute = ActionExcluirExecute
    end
  end
end
