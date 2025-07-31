// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_usage_settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAppUsageSettingsCollection on Isar {
  IsarCollection<AppUsageSettings> get appUsageSettings => this.collection();
}

const AppUsageSettingsSchema = CollectionSchema(
  name: r'AppUsageSettings',
  id: -8602467396819519046,
  properties: {
    r'isMonitored': PropertySchema(
      id: 0,
      name: r'isMonitored',
      type: IsarType.bool,
    ),
    r'packageName': PropertySchema(
      id: 1,
      name: r'packageName',
      type: IsarType.string,
    ),
    r'usageLimitInMinutes': PropertySchema(
      id: 2,
      name: r'usageLimitInMinutes',
      type: IsarType.long,
    )
  },
  estimateSize: _appUsageSettingsEstimateSize,
  serialize: _appUsageSettingsSerialize,
  deserialize: _appUsageSettingsDeserialize,
  deserializeProp: _appUsageSettingsDeserializeProp,
  idName: r'id',
  indexes: {
    r'packageName': IndexSchema(
      id: -3211024755902609907,
      name: r'packageName',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'packageName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _appUsageSettingsGetId,
  getLinks: _appUsageSettingsGetLinks,
  attach: _appUsageSettingsAttach,
  version: '3.1.8',
);

int _appUsageSettingsEstimateSize(
  AppUsageSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.packageName.length * 3;
  return bytesCount;
}

void _appUsageSettingsSerialize(
  AppUsageSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isMonitored);
  writer.writeString(offsets[1], object.packageName);
  writer.writeLong(offsets[2], object.usageLimitInMinutes);
}

AppUsageSettings _appUsageSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AppUsageSettings(
    isMonitored: reader.readBoolOrNull(offsets[0]) ?? false,
    packageName: reader.readString(offsets[1]),
    usageLimitInMinutes: reader.readLongOrNull(offsets[2]) ?? 30,
  );
  object.id = id;
  return object;
}

P _appUsageSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 30) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _appUsageSettingsGetId(AppUsageSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _appUsageSettingsGetLinks(AppUsageSettings object) {
  return [];
}

void _appUsageSettingsAttach(
    IsarCollection<dynamic> col, Id id, AppUsageSettings object) {
  object.id = id;
}

extension AppUsageSettingsByIndex on IsarCollection<AppUsageSettings> {
  Future<AppUsageSettings?> getByPackageName(String packageName) {
    return getByIndex(r'packageName', [packageName]);
  }

  AppUsageSettings? getByPackageNameSync(String packageName) {
    return getByIndexSync(r'packageName', [packageName]);
  }

  Future<bool> deleteByPackageName(String packageName) {
    return deleteByIndex(r'packageName', [packageName]);
  }

  bool deleteByPackageNameSync(String packageName) {
    return deleteByIndexSync(r'packageName', [packageName]);
  }

  Future<List<AppUsageSettings?>> getAllByPackageName(
      List<String> packageNameValues) {
    final values = packageNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'packageName', values);
  }

  List<AppUsageSettings?> getAllByPackageNameSync(
      List<String> packageNameValues) {
    final values = packageNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'packageName', values);
  }

  Future<int> deleteAllByPackageName(List<String> packageNameValues) {
    final values = packageNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'packageName', values);
  }

  int deleteAllByPackageNameSync(List<String> packageNameValues) {
    final values = packageNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'packageName', values);
  }

  Future<Id> putByPackageName(AppUsageSettings object) {
    return putByIndex(r'packageName', object);
  }

  Id putByPackageNameSync(AppUsageSettings object, {bool saveLinks = true}) {
    return putByIndexSync(r'packageName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPackageName(List<AppUsageSettings> objects) {
    return putAllByIndex(r'packageName', objects);
  }

  List<Id> putAllByPackageNameSync(List<AppUsageSettings> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'packageName', objects, saveLinks: saveLinks);
  }
}

extension AppUsageSettingsQueryWhereSort
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QWhere> {
  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AppUsageSettingsQueryWhere
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QWhereClause> {
  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause>
      packageNameEqualTo(String packageName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'packageName',
        value: [packageName],
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterWhereClause>
      packageNameNotEqualTo(String packageName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packageName',
              lower: [],
              upper: [packageName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packageName',
              lower: [packageName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packageName',
              lower: [packageName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'packageName',
              lower: [],
              upper: [packageName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AppUsageSettingsQueryFilter
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QFilterCondition> {
  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      isMonitoredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMonitored',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packageName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packageName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packageName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      packageNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packageName',
        value: '',
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      usageLimitInMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageLimitInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      usageLimitInMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageLimitInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      usageLimitInMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageLimitInMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterFilterCondition>
      usageLimitInMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageLimitInMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AppUsageSettingsQueryObject
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QFilterCondition> {}

extension AppUsageSettingsQueryLinks
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QFilterCondition> {}

extension AppUsageSettingsQuerySortBy
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QSortBy> {
  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      sortByIsMonitored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMonitored', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      sortByIsMonitoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMonitored', Sort.desc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      sortByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      sortByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      sortByUsageLimitInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInMinutes', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      sortByUsageLimitInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInMinutes', Sort.desc);
    });
  }
}

extension AppUsageSettingsQuerySortThenBy
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QSortThenBy> {
  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByIsMonitored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMonitored', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByIsMonitoredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMonitored', Sort.desc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByPackageName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByPackageNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packageName', Sort.desc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByUsageLimitInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInMinutes', Sort.asc);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QAfterSortBy>
      thenByUsageLimitInMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageLimitInMinutes', Sort.desc);
    });
  }
}

extension AppUsageSettingsQueryWhereDistinct
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QDistinct> {
  QueryBuilder<AppUsageSettings, AppUsageSettings, QDistinct>
      distinctByIsMonitored() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMonitored');
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QDistinct>
      distinctByPackageName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packageName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AppUsageSettings, AppUsageSettings, QDistinct>
      distinctByUsageLimitInMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageLimitInMinutes');
    });
  }
}

extension AppUsageSettingsQueryProperty
    on QueryBuilder<AppUsageSettings, AppUsageSettings, QQueryProperty> {
  QueryBuilder<AppUsageSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AppUsageSettings, bool, QQueryOperations> isMonitoredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMonitored');
    });
  }

  QueryBuilder<AppUsageSettings, String, QQueryOperations>
      packageNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packageName');
    });
  }

  QueryBuilder<AppUsageSettings, int, QQueryOperations>
      usageLimitInMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageLimitInMinutes');
    });
  }
}
