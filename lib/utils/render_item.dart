// 渲染卡片
import 'package:codefather_app/api/models/search/common_model.dart';
import 'package:codefather_app/components/note_card/index.dart';
import 'package:flutter/material.dart';
import 'package:codefather_app/components/essay_card/index.dart';
import 'package:codefather_app/components/post_card/index.dart';
import 'package:codefather_app/constants/post.dart';

// 渲染不同的卡片
Widget renderItem(CommonModel data) {
  if (data.category == PostCategoryEnum.essay.label) {
    return EssayCard(data: data);
  }
  if (data.category == PostCategoryEnum.note.label) {
    return NoteCard(data: data);
  }
  // print(data.category);
  return PostCard(data: data);
}
