// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_drink_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinksModel _$DrinksModelFromJson(Map<String, dynamic> json) => DrinksModel(
      recommendedWines: (json['recommendedWines'] as List<dynamic>?)
          ?.map((e) => DrinksModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinksModelToJson(DrinksModel instance) =>
    <String, dynamic>{
      'recommendedWines': instance.recommendedWines,
    };

DrinksModelData _$DrinksModelDataFromJson(Map<String, dynamic> json) =>
    DrinksModelData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      imageUrl: json['imageUrl'] as String?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      ratingCount: (json['ratingCount'] as num?)?.toDouble(),
      score: (json['score'] as num?)?.toDouble(),
      link: json['link'] as String?,
    );

Map<String, dynamic> _$DrinksModelDataToJson(DrinksModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'averageRating': instance.averageRating,
      'ratingCount': instance.ratingCount,
      'score': instance.score,
      'link': instance.link,
    };
