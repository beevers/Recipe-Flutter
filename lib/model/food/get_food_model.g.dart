// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      sorting: json['sorting'] as String?,
      filterMapping: json['filterMapping'] as Map<String, dynamic>?,
      filterOptions: json['filterOptions'] as List<dynamic>?,
      activeFilterOptions: json['activeFilterOptions'] as List<dynamic>?,
      query: json['query'] as String?,
      totalResults: json['totalResults'] as int?,
      limit: json['limit'] as int?,
      offset: json['offset'] as int?,
      searchResults: (json['searchResults'] as List<dynamic>?)
          ?.map((e) => FoodModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..expires = json['expires'] as int?;

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'sorting': instance.sorting,
      'filterMapping': instance.filterMapping,
      'filterOptions': instance.filterOptions,
      'activeFilterOptions': instance.activeFilterOptions,
      'query': instance.query,
      'totalResults': instance.totalResults,
      'limit': instance.limit,
      'offset': instance.offset,
      'searchResults': instance.searchResults,
      'expires': instance.expires,
    };

FoodModelData _$FoodModelDataFromJson(Map<String, dynamic> json) =>
    FoodModelData(
      name: json['name'] as String?,
      type: json['type'] as String?,
      totalResults: json['totalResults'] as int?,
      totalResultsVariants: json['totalResultsVariants'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => FoodModelDataResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodModelDataToJson(FoodModelData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'totalResults': instance.totalResults,
      'totalResultsVariants': instance.totalResultsVariants,
      'results': instance.results,
    };

FoodModelDataResult _$FoodModelDataResultFromJson(Map<String, dynamic> json) =>
    FoodModelDataResult(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      type: json['type'] as String?,
      relevance: json['relevance'] as num,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$FoodModelDataResultToJson(
        FoodModelDataResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'link': instance.link,
      'type': instance.type,
      'relevance': instance.relevance,
      'content': instance.content,
    };
