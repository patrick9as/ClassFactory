unit Utils;

interface

uses
  Data.DB;

type
  TUtils = class
  private
  public
    class function DBFieldTypeToDelphiType(AFieldType: TFieldType): string;
  end;

implementation

{ TUtils }

class function TUtils.DBFieldTypeToDelphiType(AFieldType: TFieldType): string;
begin
  case AFieldType of
    ftUnknown:         Result := 'string';
    ftString:          Result := 'string';
    ftSmallint:        Result := 'Integer';
    ftInteger:         Result := 'Integer';
    ftWord:            Result := 'Integer';
    ftBoolean:         Result := 'Boolean';
    ftFloat:           Result := 'Double';
    ftCurrency:        Result := 'Currency';
    ftBCD:             Result := 'Currency';
    ftDate:            Result := 'TDate';
    ftTime:            Result := 'TTime';
    ftDateTime:        Result := 'TDateTime';
    ftBytes:           Result := 'TBytes';
    ftVarBytes:        Result := 'TBytes';
    ftAutoInc:         Result := 'Integer';
    ftBlob:            Result := 'TStream';
    ftMemo:            Result := 'string';
    ftGraphic:         Result := 'TGraphic';
    ftFmtMemo:         Result := 'string';
    ftParadoxOle:      Result := 'TStream';
    ftDBaseOle:        Result := 'TStream';
    ftTypedBinary:     Result := 'TBytes';
    ftCursor:          Result := 'TCursor';
    ftFixedChar:       Result := 'string';
    ftWideString:      Result := 'string';
    ftLargeint:        Result := 'Int64';
    ftADT:             Result := 'TADT';
    ftArray:           Result := 'TArray';
    ftReference:       Result := 'TReference';
    ftDataSet:         Result := 'TDataSet';
    ftOraBlob:         Result := 'TStream';
    ftOraClob:         Result := 'string';
    ftVariant:         Result := 'Variant';
    ftInterface:       Result := 'IInterface';
    ftIDispatch:       Result := 'IDispatch';
    ftGuid:            Result := 'TGUID';
    ftTimeStamp:       Result := 'TSQLTimeStamp';
    ftFMTBcd:          Result := 'TBcd';
    ftFixedWideChar:   Result := 'string';
    ftWideMemo:        Result := 'string';
    ftOraTimeStamp:    Result := 'TSQLTimeStamp';
    ftOraInterval:     Result := 'TTimeStampInterval';
    ftLongWord:        Result := 'LongWord';
    ftShortint:        Result := 'ShortInt';
    ftByte:            Result := 'Byte';
    ftExtended:        Result := 'Extended';
    ftConnection:      Result := 'TCustomConnection';
    ftParams:          Result := 'TParams';
    ftStream:          Result := 'TStream';
    ftTimeStampOffset: Result := 'TSQLTimeStampOffset';
    ftObject:          Result := 'TObject';
    ftSingle:          Result := 'Single';
  else
    // Caso não esteja mapeado, retornar string vazio ou lançar exceção se preferir
    Result := 'Unknown';
  end;
end;

end.
