// 评论类型
enum CommentTypeEnum {
  post(label: '帖子', value: 0, route: 'post', origin: 'postVO'),
  course(label: '课程详情', value: 1, route: 'course', origin: 'courseArticleVO'),
  live(label: '直播', value: 2, route: 'live', origin: 'liveVO'),
  note(label: '笔记', value: 4, route: 'note', origin: 'noteVO'),
  qa(label: '提问', value: 6, route: 'qa', origin: 'qaVO'),
  essay(label: '交流圈子', value: 9, route: 'essay', origin: 'postVO');

  final String label;
  final String route;
  final String origin;
  final int value;

  const CommentTypeEnum({
    required this.label,
    required this.value,
    required this.route,
    required this.origin,
  });
}

// 评论内容类型
enum CommentContentTypeEnum {
  richText(label: '富文本', value: 0),
  md(label: 'markdown', value: 1),
  custom(label: '自定义格式', value: 2);

  final String label;
  final int value;

  const CommentContentTypeEnum({required this.label, required this.value});
}
