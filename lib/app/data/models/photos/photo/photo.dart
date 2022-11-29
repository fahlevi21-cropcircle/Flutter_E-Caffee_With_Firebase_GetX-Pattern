import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_caffee/app/data/models/photos/links/links.dart';
import 'package:my_caffee/app/data/models/photos/urls/urls.dart';
import 'package:my_caffee/app/data/models/photos/user/user.dart';
part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  const factory Photo({
    String? id,
    @JsonKey(name: 'created_at') String? createdAt,
    int? width,
    int? height,
    // String? color;
    // String? blurHash;
    int? likes,
    String? description,
    User? user,
    // List<CurrentUserCollections>? currentUserCollections;
    Urls? urls,
    Links? links,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
