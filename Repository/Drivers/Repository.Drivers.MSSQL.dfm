object MSSQLDriver: TMSSQLDriver
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 229
  Width = 405
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=GCOM'
      'User_Name=sa'
      'Password=@Gsoft12010590'
      'Server=.'
      'DriverID=MSSQL')
    Connected = True
    Left = 120
    Top = 96
  end
  object qryTables: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  t.object_id AS ID,'
      '  t.name AS Name,'
      '  s.name AS SchemaName'
      'FROM sys.tables t'
      'INNER JOIN sys.schemas s ON s.schema_id = t.schema_id')
    Left = 264
    Top = 96
    object qryTablesID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qryTablesName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Required = True
      Size = 128
    end
    object qryTablesSchemaName: TWideStringField
      FieldName = 'SchemaName'
      Origin = 'SchemaName'
      Required = True
      Size = 128
    end
  end
  object qryFieldsByTable: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      '  ORDINAL_POSITION as ID,'
      '  COLUMN_NAME as Name,'
      '  DATA_TYPE as FieldType,'
      '  CHARACTER_MAXIMUM_LENGTH as Size'
      'FROM INFORMATION_SCHEMA.COLUMNS'
      'WHERE TABLE_NAME = :TableName'
      '  AND TABLE_SCHEMA = :SchemaName')
    Left = 264
    Top = 160
    ParamData = <
      item
        Name = 'TABLENAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SCHEMANAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryFieldsByTableID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object qryFieldsByTableName: TWideStringField
      FieldName = 'Name'
      Origin = 'Name'
      Size = 128
    end
    object qryFieldsByTableFieldType: TWideStringField
      FieldName = 'FieldType'
      Origin = 'FieldType'
      ReadOnly = True
      Size = 128
    end
    object qryFieldsByTableSize: TIntegerField
      FieldName = 'Size'
      Origin = 'Size'
      ReadOnly = True
    end
  end
end
