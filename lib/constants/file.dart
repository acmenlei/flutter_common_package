// 文件上传业务类型
enum FileUploadBizEnum {
  userAvatar(label: '用户头像', value: 'user_avatar'),
  postCover(label: '帖子封面', value: 'post_cover'),
  postPicture(label: '帖子图片', value: 'post_picture'),
  resumeFile(label: '简历文件', value: 'resume_file'),
  prizeCover(label: '奖品封面', value: 'prize_cover'),
  vipCodeApplyPicture(label: 'VIP 码申请图片', value: 'vip_code_apply_picture'),
  advertPicture(label: '广告图片', value: 'advert_picture'),
  tagsPicture(label: '标签图片', value: 'tags_picture');

  final String label;
  final String value;

  const FileUploadBizEnum({required this.label, required this.value});
}
