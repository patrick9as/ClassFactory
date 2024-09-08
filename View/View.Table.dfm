object ViewTable: TViewTable
  Left = 0
  Top = 0
  Caption = 'ViewTable'
  ClientHeight = 543
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    635
    543)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 53
    Width = 37
    Height = 13
    Caption = 'Schema'
  end
  object Label2: TLabel
    Left = 135
    Top = 53
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label3: TLabel
    Left = 262
    Top = 53
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 104
    Width = 619
    Height = 169
    Anchors = [akLeft, akTop, akRight]
    DataSource = dtsFields
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ID'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Size'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FieldType'
        Width = 171
        Visible = True
      end>
  end
  object edtSchemaName: TEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtSchemaName'
  end
  object edtID: TEdit
    Left = 135
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtID'
  end
  object edtName: TEdit
    Left = 262
    Top = 72
    Width = 365
    Height = 21
    TabOrder = 3
    Text = 'edtName'
  end
  object btnGenerateModel: TButton
    Left = 520
    Top = 8
    Width = 107
    Height = 25
    Caption = 'btnGenerateModel'
    TabOrder = 4
    OnClick = btnGenerateModelClick
  end
  object memModel: TMemo
    Left = 8
    Top = 279
    Width = 619
    Height = 256
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object dtsFields: TDataSource
    DataSet = cdsFields
    Left = 312
    Top = 152
  end
  object cdsFields: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 160
    object cdsFieldsID: TStringField
      FieldName = 'ID'
      Size = 150
    end
    object cdsFieldsName: TStringField
      FieldName = 'Name'
      Size = 150
    end
    object cdsFieldsSize: TIntegerField
      FieldName = 'Size'
    end
    object cdsFieldsFieldType: TStringField
      FieldName = 'FieldType'
    end
  end
end
