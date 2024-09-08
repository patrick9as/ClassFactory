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
  OnResize = FormResize
  DesignSize = (
    854
    491)
  PixelsPerInch = 96
  TextHeight = 13
  object btnTables: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'btnTables'
    TabOrder = 0
    OnClick = btnTablesClick
  end
  object ScrollBox: TScrollBox
    Left = 8
    Top = 47
    Width = 838
    Height = 436
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = False
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 1
    OnMouseWheel = ScrollBoxMouseWheel
    object FlowPanel: TFlowPanel
      Left = 0
      Top = 0
      Width = 834
      Height = 224
      Align = alTop
      AutoSize = True
      TabOrder = 0
      ExplicitWidth = 493
    end
  end
end
