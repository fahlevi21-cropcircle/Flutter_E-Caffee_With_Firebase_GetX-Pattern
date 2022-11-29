import 'package:freezed_annotation/freezed_annotation.dart';

import 'profile_image/profileimage.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? username,
    String? name,
    String? bio,
    String? location,
    @JsonKey(name: 'profile_image') ProfileImage? profileImage,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
