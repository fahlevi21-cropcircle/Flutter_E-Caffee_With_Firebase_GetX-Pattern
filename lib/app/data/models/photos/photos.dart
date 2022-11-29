import 'package:freezed_annotation/freezed_annotation.dart';

import 'photo/photo.dart';

part 'photos.freezed.dart';
part 'photos.g.dart';

@freezed
class Photos with _$Photos {
  factory Photos({
    List<Photo>? photos,
  }) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
