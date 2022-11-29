// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Photos _$$_PhotosFromJson(Map<String, dynamic> json) => _$_Photos(
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PhotosToJson(_$_Photos instance) => <String, dynamic>{
      'photos': instance.photos,
    };
