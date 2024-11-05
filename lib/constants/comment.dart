// 评论类型
enum CommentTypeEnum {
  post(label: '帖子', value: 0),
  course(label: '课程详情', value: 1),
  live(label: '直播', value: 2),
  note(label: '笔记', value: 4),
  qa(label: '提问', value: 6),
  essay(label: '交流圈子', value: 9);

  final String label;
  final int value;

  const CommentTypeEnum({required this.label, required this.value});
}
