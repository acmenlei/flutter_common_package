import 'package:get/get.dart';

final sortFields = ['createTime', 'thumbNum'];

class CommentListController/*  extends GetxController */ {
  var selectedSegment = 0.obs;
  RxInt targetType = 0.obs;
  RxString targetId = ''.obs;
  RxString sortField = "createTime".obs;

  onPressed(index) {
    selectedSegment.value = index;
    sortField.value = sortFields[index];
  }

  // addSelectedSegmentListener() {
  //   ever(selectedSegment, (value) {
  //     sortField.value = sortFields[value];
  //     print(sortField.value);
  //   });
  // }
}
