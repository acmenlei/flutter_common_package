// 用户角色
enum UserRoleEnum {
  vip(label: '会员', value: 'vip'),
  admin(label: '管理员', value: 'admin'),
  user(label: '普通用户', value: 'user'),
  ban(label: '封禁', value: 'ban'),
  guest(label: '导师', value: 'guest');

  final String label;
  final String value;

  const UserRoleEnum({required this.label, required this.value});
}
