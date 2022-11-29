import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DetailsPage extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DetailsPage')),
        body: SafeArea(child: Text('DetailsController')));
  }
}
