import 'package:get/get.dart';

class CommonEditorController extends GetxController {
  @override
  void onClose() {
    print("已销毁");
    super.onClose();
  }
}
