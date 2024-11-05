import 'package:get/get.dart';

class CommentButtonController{
  var commentNum = 0.obs;

  // void toggleComment() {
  //   isComment.value = !isComment.value;
  // }

  void incrementCommentCount() {
    commentNum.value++;
  }

  void decrementCommentCount() {
    commentNum.value--;
  }

  void onPress(commentId, targetType) {
    print("弹出评论框");
  }
}
