// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      planetCode: json['planetCode'] as String?,
      planetUserId: json['planetUserId'] as String?,
      planetPostAuth: (json['planetPostAuth'] as num?)?.toInt(),
      planetExtraInfo: json['planetExtraInfo'] == null
          ? null
          : PlanetExtraInfo.fromJson(
              json['planetExtraInfo'] as Map<String, dynamic>),
      shareCode: json['shareCode'] as String?,
      paymentInfo: json['paymentInfo'],
      userName: json['userName'] as String?,
      userAvatar: json['userAvatar'] as String?,
      userThumbnailAvatar: json['userThumbnailAvatar'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      userProfile: json['userProfile'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      scene: json['scene'] as String?,
      userRole: json['userRole'] as String?,
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notInterests: (json['notInterests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      place: json['place'],
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      school: json['school'] as String?,
      major: json['major'] as String?,
      education: json['education'] as String?,
      graduationYear: (json['graduationYear'] as num?)?.toInt(),
      jobStatus: json['jobStatus'] as String?,
      company: json['company'] as String?,
      job: json['job'] as String?,
      workYear: (json['workYear'] as num?)?.toInt(),
      direction: json['direction'] as String?,
      goal: json['goal'],
      github: json['github'] as String?,
      blog: json['blog'] as String?,
      score: (json['score'] as num?)?.toInt(),
      scoreLevel: (json['scoreLevel'] as num?)?.toInt(),
      coin: (json['coin'] as num?)?.toInt(),
      followeeNum: (json['followeeNum'] as num?)?.toInt(),
      followNum: (json['followNum'] as num?)?.toInt(),
      followStatus: (json['followStatus'] as num?)?.toInt(),
      clubNum: (json['clubNum'] as num?)?.toInt(),
      vipExpireTime: (json['vipExpireTime'] as num?)?.toInt(),
      lastLoginTime: json['lastLoginTime'],
      videoCode: json['videoCode'] == null
          ? null
          : VideoCode.fromJson(json['videoCode'] as Map<String, dynamic>),
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
      githubClientId: json['githubClientId'],
      mpOpenId: json['mpOpenId'] as String?,
      vipNumber: json['vipNumber'] as String?,
      scoreRank: json['scoreRank'] as String?,
      postAllThumbNum: json['postAllThumbNum'] as String?,
      postAllViewNum: json['postAllViewNum'] as String?,
      needGuide: (json['needGuide'] as num?)?.toInt(),
      syncPopupLeftCount: (json['syncPopupLeftCount'] as num?)?.toInt(),
      oldVip: json['oldVip'] as bool?,
      productActivityInfo: json['productActivityInfo'],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'planetCode': instance.planetCode,
      'planetUserId': instance.planetUserId,
      'planetPostAuth': instance.planetPostAuth,
      'planetExtraInfo': instance.planetExtraInfo,
      'shareCode': instance.shareCode,
      'paymentInfo': instance.paymentInfo,
      'userName': instance.userName,
      'userAvatar': instance.userAvatar,
      'userThumbnailAvatar': instance.userThumbnailAvatar,
      'gender': instance.gender,
      'userProfile': instance.userProfile,
      'email': instance.email,
      'phone': instance.phone,
      'scene': instance.scene,
      'userRole': instance.userRole,
      'interests': instance.interests,
      'notInterests': instance.notInterests,
      'place': instance.place,
      'birthday': instance.birthday?.toIso8601String(),
      'school': instance.school,
      'major': instance.major,
      'education': instance.education,
      'graduationYear': instance.graduationYear,
      'jobStatus': instance.jobStatus,
      'company': instance.company,
      'job': instance.job,
      'workYear': instance.workYear,
      'direction': instance.direction,
      'goal': instance.goal,
      'github': instance.github,
      'blog': instance.blog,
      'followStatus': instance.followStatus,
      'score': instance.score,
      'scoreLevel': instance.scoreLevel,
      'coin': instance.coin,
      'followeeNum': instance.followeeNum,
      'followNum': instance.followNum,
      'clubNum': instance.clubNum,
      'vipExpireTime': instance.vipExpireTime,
      'lastLoginTime': instance.lastLoginTime,
      'videoCode': instance.videoCode,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'githubClientId': instance.githubClientId,
      'mpOpenId': instance.mpOpenId,
      'vipNumber': instance.vipNumber,
      'scoreRank': instance.scoreRank,
      'postAllThumbNum': instance.postAllThumbNum,
      'postAllViewNum': instance.postAllViewNum,
      'needGuide': instance.needGuide,
      'syncPopupLeftCount': instance.syncPopupLeftCount,
      'oldVip': instance.oldVip,
      'productActivityInfo': instance.productActivityInfo,
    };

PlanetExtraInfo _$PlanetExtraInfoFromJson(Map<String, dynamic> json) =>
    PlanetExtraInfo(
      userName: json['userName'] as String?,
      joinTime: json['joinTime'] as String?,
      expireTime: json['expireTime'] as String?,
      lastCertifyTime: (json['lastCertifyTime'] as num?)?.toInt(),
      lastGetCodeTime: (json['lastGetCodeTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PlanetExtraInfoToJson(PlanetExtraInfo instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'joinTime': instance.joinTime,
      'expireTime': instance.expireTime,
      'lastCertifyTime': instance.lastCertifyTime,
      'lastGetCodeTime': instance.lastGetCodeTime,
    };

VideoCode _$VideoCodeFromJson(Map<String, dynamic> json) => VideoCode(
      id: json['id'] as String?,
      activationCode: json['activationCode'] as String?,
      groupNumber: json['groupNumber'] as String?,
      planetCode: json['planetCode'] as String?,
      activationCodeExpireTime:
          (json['activationCodeExpireTime'] as num?)?.toInt(),
      createTime: (json['createTime'] as num?)?.toInt(),
      updateTime: (json['updateTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VideoCodeToJson(VideoCode instance) => <String, dynamic>{
      'id': instance.id,
      'activationCode': instance.activationCode,
      'groupNumber': instance.groupNumber,
      'planetCode': instance.planetCode,
      'activationCodeExpireTime': instance.activationCodeExpireTime,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };
