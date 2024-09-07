object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'frmMenu'
  ClientHeight = 491
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    854
    491)
  PixelsPerInch = 96
  TextHeight = 13
  object btnTables: TButton
    Left = 0
    Top = 0
    Width = 75
    Height = 25
    Caption = 'btnTables'
    TabOrder = 0
    OnClick = btnTablesClick
  end
  object ScrollBox: TScrollBox
    Left = 0
    Top = 31
    Width = 497
    Height = 242
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = False
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 1
    OnMouseWheel = ScrollBoxMouseWheel
    ExplicitWidth = 513
    ExplicitHeight = 266
    object FlowPanel: TFlowPanel
      Left = 0
      Top = 0
      Width = 493
      Height = 224
      Align = alTop
      AutoSize = True
      TabOrder = 0
      ExplicitWidth = 615
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 303
    Width = 497
    Height = 164
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    OnMouseWheel = ScrollBoxMouseWheel
    ExplicitWidth = 513
    ExplicitHeight = 188
    object pnlFields: TFlowPanel
      Left = 0
      Top = 0
      Width = 476
      Height = 171
      Align = alTop
      AutoSize = True
      TabOrder = 0
      ExplicitWidth = 615
    end
  end
  object memo: TMemo
    Left = 519
    Top = 31
    Width = 335
    Height = 460
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'memo')
    TabOrder = 3
  end
end
