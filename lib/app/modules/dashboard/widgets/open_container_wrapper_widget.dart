import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_caffee/app/modules/dashboard/controller.dart';
import 'package:my_caffee/app/modules/dashboard/widgets/product_form_widget.dart';

class OpenContainerWrapper extends StatelessWidget {
  OpenContainerWrapper({super.key, required this.closedChild});

  final Widget closedChild;
  final DashboardController controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 600),
      openBuilder: (context, action) => ProductForm(),
      openColor: Get.theme.cardColor,
      openElevation: 0,
      closedShape: CircleBorder(),
      closedElevation: 6,
      closedColor: Get.theme.colorScheme.secondary,
      closedBuilder: (context, openContainer) => Tooltip(
        message: 'Add product',
        child: InkWell(
          customBorder: CircleBorder(),
          onTap: () {
            openContainer();
          },
          child: SizedBox(
            height: 56,
            width: 56,
            child: Center(
              child: controller.submittingData
                  ? CircularProgressIndicator()
                  : Icon(
                      Icons.add,
                      color: Get.theme.colorScheme.onSecondary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
