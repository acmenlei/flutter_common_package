// 收藏类型
enum FavourTypeEnum {
  success(label: '收藏成功', value: 1),
  cancel(label: '取消收藏', value: 0);

  final String label;
  final int value;

  const FavourTypeEnum({required this.label, required this.value});
}

// 收藏目标类型
enum FavourTargetTypeEnum {
  post(label: '文章', value: 0),
  live(label: '直播', value: 1),
  qa(label: '问答', value: 2),
  essay(label: '交流', value: 4),
  note(label: '笔记', value: 6);

  final String label;
  final int value;

  const FavourTargetTypeEnum({required this.value, required this.label});
}
