import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/modules/dashboard/widgets/open_container_wrapper_widget.dart';
import 'package:my_caffee/routes/pages.dart';

import 'controller.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.inbox)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: ListTile(title: Text('Settings')),
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: Text('Sign Out'),
                    onTap: () => controller.signOut(),
                  ),
                ),
              ],
            )
          ],
        ),
        body: SafeArea(
          child: Obx(
            () => controller.loadingProduct
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 9 / 16),
                    itemBuilder: (context, index) => Container(
                      height: 250,
                      padding: index % 2 == 0
                          ? EdgeInsets.fromLTRB(4.0, 8.0, 2.0, 8.0)
                          : EdgeInsets.fromLTRB(2.0, 8.0, 4.0, 8.0),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FutureBuilder(
                                future: controller.imagePath
                                    .child(controller.products[index].image!)
                                    .getDownloadURL(),
                                builder: (context, snapshot) =>
                                    snapshot.data == null
                                        ? SizedBox.shrink()
                                        : CachedNetworkImage(
                                            imageUrl: snapshot.data!.toString(),
                                          ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  controller.products[index].name!,
                                  maxLines: 2,
                                  style: Get.textTheme.titleMedium!.copyWith(
                                      overflow: TextOverflow.ellipsis),
                                ),
                                subtitle: Text(
                                  controller.products[index].description!,
                                  maxLines: 2,
                                  style: Get.textTheme.bodyText2!.copyWith(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                        controller.formatPrice(
                                            controller.products[index].price!),
                                        maxLines: 1,
                                        style: Get.textTheme.titleSmall!
                                            .copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      controller.selectedProduct =
                                          controller.products[index];
                                      controller.addToCart();
                                    },
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Get.theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.CARTS),
          child: Icon(Icons.shopping_cart_outlined),
        )
        /* floatingActionButton: OpenContainerWrapper(
          closedChild: FloatingActionButton(
        onPressed: () {
          log('open transition');
        },
        child: Icon(Icons.add),
      )), */
        );
  }
}
