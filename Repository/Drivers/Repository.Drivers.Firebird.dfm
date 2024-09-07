object FirebirdDriver: TFirebirdDriver
  OldCreateOrder = False
  Height = 190
  Width = 313
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'IBAdvanced=D:\GSOFT\Projetos_Patrick\ClassFactory\Win32\Debug\fb' +
        'client.dll'
      'Database=P:\FIREBIRD\GPDV\GPDV.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=servidor'
      'DriverID=FB')
    Connected = True
    Left = 88
    Top = 56
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '      '
      
        '      '#39'tab'#39' || TRIM(RDB$RELATION_NAME) || TRIM(R.RDB$FIELD_NAME)' +
        ' ||'
      '    CASE F.RDB$FIELD_TYPE'
      '        WHEN 7 THEN '#39'.AsInteger'#39
      '        WHEN 8 THEN '#39'.AsInteger'#39
      '        WHEN 10 THEN '#39'.AsFloat'#39
      '        WHEN 12 THEN '#39'.AsDateTime'#39
      '        WHEN 13 THEN '#39'.AsDateTime'#39
      '        WHEN 14 THEN '#39'.AsString'#39
      '        WHEN 16 THEN '#39'.AsInteger'#39
      '        WHEN 23 THEN '#39'.AsBoolean'#39
      '        WHEN 27 THEN '#39'.AsFloat'#39
      '        WHEN 35 THEN '#39'.AsDateTime'#39
      '        WHEN 37 THEN '#39'.AsString'#39
      '        ELSE '#39'UNKNOWN'#39
      '    END || '
      '    '#39' := T(AEntidade).'#39' || TRIM(R.RDB$FIELD_NAME) || '#39';'#39
      '    AS FIELD_TYPE_NAME'
      '    '
      'FROM'
      '    RDB$RELATION_FIELDS R'
      'JOIN'
      '    RDB$FIELDS F ON R.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME'
      'WHERE '
      '    R.RDB$RELATION_NAME = '#39'VENDA'#39
      'ORDER BY rdb$field_id')
    Left = 208
    Top = 56
  end
end
