import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Model class for the slider section
class SliderSectionItemModel {
  Rx<String>? id;
  SliderSectionItemModel({this.id}) {
    id = id ?? Rx("");
  }
}

/// List of slider items
RxList<SliderSectionItemModel> sliderSectionItemList =
Rx(List.generate(1, (index) => SliderSectionItemModel())) as RxList<SliderSectionItemModel>;

/// Controller class for managing the LoginScreen state
class LoginController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController otpOneController = TextEditingController();

  Rx<int> sliderIndex = 0.obs;

  @override
  void onClose() {
    mobileNumberController.dispose();
    otpOneController.dispose();
    super.onClose();
  }
}

/// Binding class for LoginScreen
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
