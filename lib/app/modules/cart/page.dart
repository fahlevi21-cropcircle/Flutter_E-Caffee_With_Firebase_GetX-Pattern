import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CartsPage extends GetView<CartsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carts')),
      body: SafeArea(
        child: Obx(
          () => controller.loading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.carts.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = controller.carts[index].mapOrNull(
                      cart: (value) => value,
                    );
                    return Padding(
                      padding: index == 0
                          ? EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0)
                          : EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                      child: Card(
                          child: SizedBox(
                        height: 110,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox.expand(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://unsplash.com/photos/6VhPY27jdps/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY5NDY3NjA3&force=true&w=640',
                                  progressIndicatorBuilder:
                                      (context, url, progress) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item!.category!,
                                        maxLines: 1,
                                        style: Get.textTheme.labelSmall!
                                            .copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        item.name!,
                                        maxLines: 1,
                                        style: Get.textTheme.titleSmall!
                                            .copyWith(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        item.description!,
                                        maxLines: 1,
                                        style:
                                            Get.textTheme.labelMedium!.copyWith(
                                          fontWeight: FontWeight.w300,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              item.price.toString(),
                                              maxLines: 1,
                                              style: Get.textTheme.bodyText2!
                                                  .copyWith(
                                                fontWeight: FontWeight.w700,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              constraints: BoxConstraints(),
                                              icon: Icon(
                                                Icons.arrow_downward,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              item.quantity.toString(),
                                              maxLines: 1,
                                              style: Get.textTheme.bodyText2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                            ),
                                          ),
                                          Expanded(
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: () {},
                                              constraints: BoxConstraints(),
                                              icon: Icon(
                                                Icons.arrow_upward,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () =>
                                        controller.delete(item.id!),
                                    icon: Icon(Icons.delete))
                              ],
                            )),
                          ],
                        ),
                      )),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
