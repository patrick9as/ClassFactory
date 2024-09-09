object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'frmMenu'
  ClientHeight = 586
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
    586)
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
  object pnlTables: TPanel
    Left = 8
    Top = 39
    Width = 838
    Height = 539
    Anchors = [akLeft, akTop, akRight, akBottom]
    Enabled = False
    TabOrder = 1
    DesignSize = (
      838
      539)
    object lblTablesCount: TLabel
      Left = 512
      Top = 15
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '0 tables'
    end
    object Label1: TLabel
      Left = 610
      Top = 15
      Width = 4
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '/'
    end
    object ScrollBox: TScrollBox
      Left = 0
      Top = 41
      Width = 838
      Height = 488
      Anchors = [akLeft, akTop, akRight, akBottom]
      DoubleBuffered = False
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 0
      OnMouseWheel = ScrollBoxMouseWheel
      object FlowPanel: TFlowPanel
        Left = 0
        Top = 0
        Width = 834
        Height = 82
        Align = alTop
        AutoSize = True
        TabOrder = 0
        ExplicitLeft = -2
        ExplicitTop = 16
      end
    end
    object btnPreviousPage: TButton
      Left = 732
      Top = 10
      Width = 30
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '<'
      TabOrder = 1
      OnClick = btnPreviousPageClick
    end
    object btnNextPage: TButton
      Left = 768
      Top = 10
      Width = 30
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '>'
      TabOrder = 2
      OnClick = btnNextPageClick
    end
    object edtPageNumber: TEdit
      Left = 556
      Top = 12
      Width = 48
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      NumbersOnly = True
      TabOrder = 3
      Text = '1'
    end
    object edtPagesCount: TEdit
      Left = 624
      Top = 12
      Width = 46
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 4
      Text = '1'
    end
    object btnFirstPage: TButton
      Left = 696
      Top = 10
      Width = 30
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '<<'
      TabOrder = 5
      OnClick = btnFirstPageClick
    end
    object btnLastPage: TButton
      Left = 800
      Top = 10
      Width = 30
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '>>'
      TabOrder = 6
      OnClick = btnLastPageClick
    end
  end
  object ProgressBar: TProgressBar
    Left = 564
    Top = 16
    Width = 282
    Height = 17
    Anchors = [akTop, akRight]
    TabOrder = 2
  end
end
