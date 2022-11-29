import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_caffee/app/data/enums/photo_order.dart';
import 'package:my_caffee/app/data/models/photos/photo/photo.dart';
import 'package:my_caffee/app/data/providers/api.dart';
import 'package:my_caffee/app/data/providers/firebase/authentication.dart';

class MainRepository {
  MainRepository();

  final UnsplashApi api = Get.find<UnsplashApi>();
  final FirebaseAuthenticationApi firebaseApiClient =
      Get.find<FirebaseAuthenticationApi>();

  Future<Response<List<Photo>>> getAll({
    int? perPage = 15,
    int? page = 1,
    PhotoOrder? orderBy = PhotoOrder.latest,
  }) {
    return api.photos(perPage: perPage, page: page, orderBy: orderBy);
  }

  Future<void> signOut() async => firebaseApiClient.signOut();
}
