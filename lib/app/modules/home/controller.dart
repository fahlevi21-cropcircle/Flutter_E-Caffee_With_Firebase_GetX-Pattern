import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/data/enums/photo_order.dart';
import 'package:my_caffee/app/data/models/photos/photo/photo.dart';
import 'package:my_caffee/app/modules/home/repository.dart';
import 'package:my_caffee/core/theme/app_theme.dart';
import 'package:my_caffee/routes/pages.dart';

class HomeController extends GetxController {
  final MainRepository repository;
  HomeController(this.repository);

  final _photos = <Photo>[].obs;
  set photos(value) => _photos.value = value;
  get photos => _photos;

  final _fetchingPhotos = true.obs;
  set fetchingPhotos(value) => _fetchingPhotos.value = value;
  get fetchingPhotos => _fetchingPhotos.value;

  final _darkMode = Get.isDarkMode.obs;
  set darkMode(value) => _darkMode.value = value;
  get darkMode => _darkMode.value;

  final _perPage = 15.obs;
  set perPage(value) => _perPage.value = value;
  get perPage => _perPage.value;

  final _page = 1.obs;
  set page(value) => _page.value = value;
  get page => _page.value;

  final _lastPage = false.obs;
  set lastPage(value) => _lastPage.value = value;
  get lastPage => _lastPage.value;

  final _error = ''.obs;
  set error(value) => _error.value = value;
  get error => _error.value;

  final _initialFetch = true.obs;
  set initialFetch(value) => _initialFetch.value = value;
  get initialFetch => _initialFetch.value;

  late ScrollController _photoScrollController;
  get photoScrollController => _photoScrollController;

  @override
  void onInit() {
    ever(_darkMode, _changeTheme);
    getPhotos();

    _photoScrollController = ScrollController();
    photoScrollController.addListener(() => nextPage());

    super.onInit();
  }

  @override
  void onClose() {
    _photoScrollController.dispose();
    super.onClose();
  }

  swichTheme(bool _) => darkMode = _;

  _changeTheme(bool _) {
    Get.changeTheme(_ ? appDarkThemeData : appThemeData);
  }

  getPhotos() async {
    fetchingPhotos = true;

    if (!initialFetch) {
      log('next page');
      await Future.delayed(Duration(seconds: 2));
    }
    var response = await repository.getAll(
        perPage: perPage, page: page, orderBy: PhotoOrder.popular);

    try {
      if (response.body != null && response.body!.isNotEmpty) {
        photos.addAll(response.body);
        initialFetch = photos.length < perPage;
        lastPage = response.body!.length < perPage;
        page++;
        error = '';
        fetchingPhotos = false;
      } else {
        error = 'No response from the server';
        fetchingPhotos = false;
      }

      Get.log(
          'limit remaining : ${response.headers!["x-ratelimit-remaining"]}');
    } catch (e) {
      Get.log(e.toString(), isError: true);
      error = e.toString();
      fetchingPhotos = false;
    }
  }

  nextPage() {
    if (photoScrollController.position.pixels >
            0.98 * photoScrollController.position.maxScrollExtent &&
        !fetchingPhotos &&
        error.isEmpty &&
        !lastPage) {
      getPhotos();
    }
  }

  signOut() async {
    Get.defaultDialog(
      middleText: 'Logging out..',
    );
    await repository.signOut().then((_) {
      Get.offAndToNamed(Routes.AUTH);
    });
  }
}
