import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/modules/home/controller.dart';
import 'package:my_caffee/app/modules/home/widgets/image_square_item.dart';
import 'package:my_caffee/app/modules/home/widgets/photo_item.dart';
import 'package:my_caffee/core/theme/app_theme.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.darkMode
            ? appDarkThemeData.backgroundColor.withOpacity(0.98)
            : appThemeData.backgroundColor.withOpacity(0.98),
        appBar: AppBar(
          title: Text('Main'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              /* color: controller.darkMode
                  ? appDarkThemeData.backgroundColor.withOpacity(0.98)
                  : appThemeData.backgroundColor.withOpacity(0.98), */
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: ListTile(
                    title: Text(
                      'Dark Mode',
                    ),
                    leading: Switch(
                      value: controller.darkMode,
                      onChanged: (value) => controller.swichTheme(value),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text(
                      'Sign Out',
                    ),
                    onTap: () async => await controller.signOut(),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Obx(
            () {
              if (controller.fetchingPhotos && controller.photos.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.initialFetch &&
                  controller.error.isNotEmpty) {
                return Center(
                  child: Column(
                    children: [
                      Text(controller.error),
                      ElevatedButton(
                          onPressed: () => controller.getPhotos(),
                          child: Text('Retry'))
                    ],
                  ),
                );
              } else if (controller.photos.isNotEmpty) {
                return MasonryGridView.count(
                  controller: controller.photoScrollController,
                  itemCount: controller.photos.length +
                      (!controller.initialFetch && controller.fetchingPhotos
                          ? 1
                          : 0),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => index ==
                          controller.photos.length
                      ? SizedBox(
                          height: 64,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(
                                child: controller.fetchingPhotos
                                    ? CircularProgressIndicator()
                                    : Text('No more data or error has occured'),
                              ))
                            ],
                          ),
                        )
                      : Padding(
                          padding: index % 2 != 0
                              ? EdgeInsets.fromLTRB(2.0, 4.0, 4.0, 2.0)
                              : EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 2.0),
                          child:
                              ImageSquareItem(photo: controller.photos[index]),
                        ),
                );
                /* return Scrollbar(
                child: ListView.separated(
                  controller: controller.photoScrollController,
                  itemCount: controller.photos.length +
                      (!controller.initialFetch && controller.fetchingPhotos
                          ? 1
                          : 0),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: index == 0
                        ? EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 8.0)
                        : EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                    child: index == controller.photos.length
                        ? SizedBox(
                            height: 64,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: controller.fetchingPhotos
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'No more data or error has occured'),
                                ))
                              ],
                            ),
                          )
                        : PhotoItem(photo: controller.photos[index]),
                  ),
                ),
              ); */
              }
              return Center(
                child: Column(
                  children: [
                    Text('No data available'),
                    ElevatedButton(
                      onPressed: () => controller.getPhotos(),
                      child: Text('Retry'),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
