// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapsModel _$MapsModelFromJson(Map<String, dynamic> json) => MapsModel(
      country: json['country'] as String?,
      detail: json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MapsModelToJson(MapsModel instance) => <String, dynamic>{
      'country': instance.country,
      'detail': instance.detail,
      'lat': instance.lat,
      'long': instance.long,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      description: json['description'] as String?,
      name: json['name'] as String?,
      photoUrl: json['photoUrl'] as String?,
      status: json['status'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'status': instance.status,
      'tags': instance.tags,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
