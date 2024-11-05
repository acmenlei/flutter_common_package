import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/post_vo_model.dart';
import 'package:get/get.dart';

class EssayDetailController {
  String id = Get.arguments?["id"] ?? '';
  Rx<PostVoModel> data = PostVoModel().obs;

  getEssayVoById() async {
    final res = await Http.client.getEssayVoById(id);
    if (res.code == 0) {
      data.value = res.data;
    }
  }
}
