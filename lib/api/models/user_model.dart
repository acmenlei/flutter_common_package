import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "planetCode")
  String? planetCode;
  @JsonKey(name: "planetUserId")
  String? planetUserId;
  @JsonKey(name: "planetPostAuth")
  int? planetPostAuth;
  @JsonKey(name: "planetExtraInfo")
  PlanetExtraInfo? planetExtraInfo;
  @JsonKey(name: "shareCode")
  String? shareCode;
  @JsonKey(name: "paymentInfo")
  dynamic paymentInfo;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "userAvatar")
  String? userAvatar;
  @JsonKey(name: "userThumbnailAvatar")
  String? userThumbnailAvatar;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "userProfile")
  String? userProfile;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "scene")
  String? scene;
  @JsonKey(name: "userRole")
  String? userRole;
  @JsonKey(name: "interests")
  List<String>? interests;
  @JsonKey(name: "notInterests")
  List<String>? notInterests;
  @JsonKey(name: "place")
  dynamic place;
  @JsonKey(name: "birthday")
  DateTime? birthday;
  @JsonKey(name: "school")
  String? school;
  @JsonKey(name: "major")
  String? major;
  @JsonKey(name: "education")
  String? education;
  @JsonKey(name: "graduationYear")
  int? graduationYear;
  @JsonKey(name: "jobStatus")
  String? jobStatus;
  @JsonKey(name: "company")
  String? company;
  @JsonKey(name: "job")
  String? job;
  @JsonKey(name: "workYear")
  int? workYear;
  @JsonKey(name: "direction")
  String? direction;
  @JsonKey(name: "goal")
  dynamic goal;
  @JsonKey(name: "github")
  String? github;
  @JsonKey(name: "blog")
  String? blog;
  @JsonKey(name: "followStatus")
  int? followStatus;
  @JsonKey(name: "score")
  int? score;
  @JsonKey(name: "scoreLevel")
  int? scoreLevel;
  @JsonKey(name: "coin")
  int? coin;
  @JsonKey(name: "followeeNum")
  int? followeeNum;
  @JsonKey(name: "followNum")
  int? followNum;
  @JsonKey(name: "clubNum")
  int? clubNum;
  @JsonKey(name: "vipExpireTime")
  int? vipExpireTime;
  @JsonKey(name: "lastLoginTime")
  dynamic lastLoginTime;
  @JsonKey(name: "videoCode")
  VideoCode? videoCode;
  @JsonKey(name: "createTime")
  int? createTime;
  @JsonKey(name: "updateTime")
  int? updateTime;
  @JsonKey(name: "githubClientId")
  dynamic githubClientId;
  @JsonKey(name: "mpOpenId")
  String? mpOpenId;
  @JsonKey(name: "vipNumber")
  String? vipNumber;
  @JsonKey(name: "scoreRank")
  String? scoreRank;
  @JsonKey(name: "postAllThumbNum")
  String? postAllThumbNum;
  @JsonKey(name: "postAllViewNum")
  String? postAllViewNum;
  @JsonKey(name: "needGuide")
  int? needGuide;
  @JsonKey(name: "syncPopupLeftCount")
  int? syncPopupLeftCount;
  @JsonKey(name: "oldVip")
  bool? oldVip;
  @JsonKey(name: "productActivityInfo")
  dynamic productActivityInfo;

  UserModel({
    this.id,
    this.planetCode,
    this.planetUserId,
    this.planetPostAuth,
    this.planetExtraInfo,
    this.shareCode,
    this.paymentInfo,
    this.userName,
    this.userAvatar,
    this.userThumbnailAvatar,
    this.gender,
    this.userProfile,
    this.email,
    this.phone,
    this.scene,
    this.userRole,
    this.interests,
    this.notInterests,
    this.place,
    this.birthday,
    this.school,
    this.major,
    this.education,
    this.graduationYear,
    this.jobStatus,
    this.company,
    this.job,
    this.workYear,
    this.direction,
    this.goal,
    this.github,
    this.blog,
    this.score,
    this.scoreLevel,
    this.coin,
    this.followeeNum,
    this.followNum,
    this.followStatus,
    this.clubNum,
    this.vipExpireTime,
    this.lastLoginTime,
    this.videoCode,
    this.createTime,
    this.updateTime,
    this.githubClientId,
    this.mpOpenId,
    this.vipNumber,
    this.scoreRank,
    this.postAllThumbNum,
    this.postAllViewNum,
    this.needGuide,
    this.syncPopupLeftCount,
    this.oldVip,
    this.productActivityInfo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class PlanetExtraInfo {
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "joinTime")
  String? joinTime;
  @JsonKey(name: "expireTime")
  String? expireTime;
  @JsonKey(name: "lastCertifyTime")
  int? lastCertifyTime;
  @JsonKey(name: "lastGetCodeTime")
  int? lastGetCodeTime;

  PlanetExtraInfo({
    required this.userName,
    required this.joinTime,
    required this.expireTime,
    required this.lastCertifyTime,
    required this.lastGetCodeTime,
  });

  factory PlanetExtraInfo.fromJson(Map<String, dynamic> json) =>
      _$PlanetExtraInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PlanetExtraInfoToJson(this);
}

@JsonSerializable()
class VideoCode {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "activationCode")
  String? activationCode;
  @JsonKey(name: "groupNumber")
  String? groupNumber;
  @JsonKey(name: "planetCode")
  String? planetCode;
  @JsonKey(name: "activationCodeExpireTime")
  int? activationCodeExpireTime;
  @JsonKey(name: "createTime")
  int? createTime;
  @JsonKey(name: "updateTime")
  int? updateTime;

  VideoCode({
    required this.id,
    required this.activationCode,
    required this.groupNumber,
    required this.planetCode,
    required this.activationCodeExpireTime,
    required this.createTime,
    required this.updateTime,
  });

  factory VideoCode.fromJson(Map<String, dynamic> json) =>
      _$VideoCodeFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCodeToJson(this);
}
