import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class BaseView<T> extends GetView<T> {
  const BaseView({super.key});


  Widget onBuild(BuildContext context);

  AppBar? onAppBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: onBuild(context),
    );
  }

  void showToast(String msg) {
    GetSnackBar(message: msg);
  }


}
