import 'package:freezed_annotation/freezed_annotation.dart';

part 'profileimage.freezed.dart';
part 'profileimage.g.dart';

@freezed
class ProfileImage with _$ProfileImage {
  factory ProfileImage({
    String? small,
    String? medium,
    String? large,
  }) = _ProfileImage;

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);
}
