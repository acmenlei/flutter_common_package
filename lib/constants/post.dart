/// todo 帖子类型枚举 待完善
enum PostCategoryEnum {
  post(label: '帖子', value: 0),

  essay(label: '交流', value: 1),

  course(label: '课程', value: 2),

  qa(label: '问答', value: 3),

  live(label: '直播', value: 3),

  project(label: '项目', value: 3),

  note(label: '笔记', value: 9);

  final String label;
  final int value;

  const PostCategoryEnum({required this.label, required this.value});
}
