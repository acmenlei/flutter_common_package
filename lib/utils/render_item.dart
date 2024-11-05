// 渲染卡片
import 'package:flutter/material.dart';
import 'package:codefather_app/api/models/post_model.dart';
import 'package:codefather_app/components/essay_card/index.dart';
import 'package:codefather_app/components/post_card/index.dart';
import 'package:codefather_app/constants/post.dart';

// 渲染不同的卡片
Widget renderItem(PostModel data) {
  if (data.category == PostCategoryEnum.essay.label) {
    return EssayCard(data: data);
  }
  return PostCard(data: data);
}
