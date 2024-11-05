// 点赞类型
enum ThumbTypeEnum {
  success(label: '点赞成功', value: 1),
  cancel(label: '取消点赞', value: 0);

  final String label;
  final int value;

  const ThumbTypeEnum({required this.label, required this.value});
}

// 点赞目标类型
enum ThumbTargetTypeEnum {
  post(label: '文章', value: 0),
  comment(label: '评论', value: 1),
  reply(label: '回复', value: 2),
  note(label: '笔记', value: 4),
  qa(label: '问答', value: 6),
  essay(label: '交流', value: 9);

  final String label;
  final int value;

  const ThumbTargetTypeEnum({required this.value, required this.label});
}
