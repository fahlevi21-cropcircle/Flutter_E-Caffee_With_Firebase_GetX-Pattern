// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Photo _$$_PhotoFromJson(Map<String, dynamic> json) => _$_Photo(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      likes: json['likes'] as int?,
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'width': instance.width,
      'height': instance.height,
      'likes': instance.likes,
      'description': instance.description,
      'user': instance.user,
      'urls': instance.urls,
      'links': instance.links,
    };
