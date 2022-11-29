import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:my_caffee/app/data/enums/photo_order.dart';
import 'package:my_caffee/app/data/models/photos/photo/photo.dart';
import 'package:my_caffee/core/extensions/photo_order_ext.dart';

const baseUrl = 'https://api.unsplash.com';
const accessKey = 'bLy10vjzmCIAS9bmDRgEZ1aFR5lnYNbOtidHyYBsmJI';

class UnsplashApi extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (data) {
      var list = data as List<dynamic>;
      return list.map((e) => Photo.fromJson(e)).toList();
    };
    httpClient.baseUrl = baseUrl;

    httpClient.addRequestModifier((Request request) {
      request.headers["Accept-Version"] = "v1";
      request.headers["Authorization"] = 'Client-ID $accessKey';
      return request;
    });
  }

// Get request
  Future<Response<List<Photo>>> photos({
    int? perPage = 15,
    int? page = 1,
    PhotoOrder? orderBy = PhotoOrder.latest,
  }) =>
      get(
        '/photos',
        query: {
          "per_page": perPage.toString(),
          "page": page.toString(),
          "order_by": orderBy!.description
        },
      );
}
