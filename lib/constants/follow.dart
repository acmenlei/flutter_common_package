// 关注类型
enum FollowTypeEnum {
  followSuccess(label: '关注成功', value: 1),

  followFaild(label: '关注失败', value: -1),

  followCancel(label: '取消关注', value: 0);

  final String label;
  final int value;

  const FollowTypeEnum({required this.label, required this.value});
}
