import 'dart:io';

import 'package:codefather_app/api/models/comment_model.dart';
import 'package:codefather_app/api/models/comment_vo_model.dart';
import 'package:codefather_app/api/models/list_model.dart';
import 'package:codefather_app/api/models/post_vo_model.dart';
import 'package:codefather_app/api/models/qa_list_model.dart';
import 'package:codefather_app/api/models/qa_vo_model.dart';
import 'package:codefather_app/api/models/response_bool_model.dart';
import 'package:codefather_app/api/models/response_num_model.dart';
import 'package:codefather_app/api/models/response_string_list_model.dart';
import 'package:codefather_app/api/models/response_string_model.dart';
import 'package:codefather_app/api/models/user_list_model.dart';
import 'package:codefather_app/api/models/user_vo_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.codefather.cn/api')
// @RestApi(baseUrl: 'http://192.168.2.77:8104/api')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // 发布交流，返回的是成功后的 ID
  @POST('/essay/add')
  Future<ResponseStringModel> addEssayUsingPOST(
      @Body() Map<String, dynamic> params);
  // 删除交流，返回是否操作成功
  @POST('/essay/delete')
  Future<ResponseBoolModel> deleteEssayUsingPOST(
      @Body() Map<String, dynamic> params);
  // 编辑交流，返回是否操作成功
  @POST('/essay/edit')
  Future<ResponseBoolModel> editEssayUsingPOST(
      @Body() Map<String, dynamic> params);
  // 更新交流，返回是否操作成功
  @POST('/essay/update')
  Future<ResponseBoolModel> updateEssayUsingPOST(
      @Body() Map<String, dynamic> params);
  // 根据 ID 获取交流详情
  @GET('/essay/get/vo')
  Future<PostVoModelRecord> getEssayVoById(@Query("id") String id);
  // 获取交流列表
  @POST('/essay/list/page/vo')
  Future<PostModelList> listEssayVOByPageUsingPOST(
      @Body() Map<String, dynamic> body);
  // 首页数据
  @POST('/post/list/page/vo')
  Future<PostModelList> getPosts(@Body() Map<String, dynamic> body);
  // 获取用户个人的帖子数据
  @POST('/post/my/list/page/vo')
  Future<PostModelList> listMyPostVOByPageUsingPOST(
      @Body() Map<String, dynamic> body);
  // 关注数据
  @POST('/post/list/follow/post/page')
  Future<PostModelList> getFollowPosts(@Body() Map<String, dynamic> body);
  // 获取单条帖子
  @GET('/post/get/vo')
  Future<PostVoModelRecord> getPostVoById(@Query("id") String id);
  // 发布帖子，返回的是成功后的 ID
  @POST('/post/add')
  Future<ResponseStringModel> addPostUsingPOST(
      @Body() Map<String, dynamic> params);
  // 批量新增帖子，返回的是是否成功
  @POST('/post/add/batch')
  Future<ResponseBoolModel> addPostBatchUsingPOST(
      @Body() Map<String, dynamic> params);
  // 删除帖子，返回是否操作成功
  @POST('/post/delete')
  Future<ResponseBoolModel> deletePostUsingPOST(
      @Body() Map<String, dynamic> params);
  // 编辑帖子，返回是否操作成功
  @POST('/post/edit')
  Future<ResponseBoolModel> editPostUsingPOST(
      @Body() Map<String, dynamic> params);
  // 更新帖子，返回是否操作成功
  @POST('/post/update')
  Future<ResponseBoolModel> updatePostUsingPOST(
      @Body() Map<String, dynamic> params);

  @POST("/follow/")
  Future<ResponseNumModel> doFollowUsingPOST(@Body() Map<String, dynamic> body);

  // 我关注的列表
  @POST('/follow/follow/list/page')
  Future<UserModelList> listFollowPageUsingPOST(
      @Body() Map<String, dynamic> body);

  // 我的粉丝
  @POST('/follow/followed/list/page')
  Future<UserModelList> listFollowedPageUsingPOST(
      @Body() Map<String, dynamic> body);

  // 微信授权登录
  @GET('/user/login/wx_open/app')
  Future<UserVoModelRecord> loginByWxOpen(@Query("code") String code);
  // 获取登录信息
  @GET('/user/get/login')
  Future<UserVoModelRecord> getLoginUserUsingGET();
  // 获取用户信息
  @GET('/user/get/vo')
  Future<UserVoModelRecord> getUserVoById(@Query("id") String id);

  @POST("/user/login/sms/code/send")
  Future<ResponseBoolModel> sendLoginSmsCodeUsingPOST(
      @Body() Map<String, dynamic> body);

  @GET("/user/sms/captcha")
  Future<ResponseStringModel> getSmsCaptchaUsingGET();

  @POST('/user/login/phone')
  Future<UserVoModelRecord> doLogin(@Body() Map<String, dynamic> params);

  @POST('/thumb/')
  Future<ResponseNumModel> doThumbUsingPOST(
      @Body() Map<String, dynamic> params);

  @POST('/favour/')
  Future<ResponseNumModel> doFavourUsingPOST(
      @Body() Map<String, dynamic> params);

  // 评论列表
  @POST('/comment/list/page/vo')
  Future<CommentListModel> listCommentPageUsingPOST(
      @Body() Map<String, dynamic> params);

  // 用户个人主页评论
  @POST('/comment/user/list/page/vo')
  Future<CommentListModel> listUserCommentPageUsingPOST(
      @Body() Map<String, dynamic> params);

  // 采纳回答
  @POST('/comment/accept/answer')
  Future<ResponseBoolModel> acceptAnswerUsingPOST(
      @Body() Map<String, dynamic> params);

  // 根据ID获取评论
  @POST('/comment/get/vo')
  Future<CommentVoModel> getCommentVOByIdUsingGET(
      @Body() Map<String, dynamic> params);

  // 发布评论
  @POST('/comment/add')
  Future<CommentVoModel> addCommentUsingPOST(
      @Body() Map<String, dynamic> params);

  // 删除评论
  @POST('/comment/delete')
  Future<ResponseBoolModel> deleteCommentUsingPOST(
      @Body() Map<String, dynamic> params);
  // 编辑评论
  @POST('/comment/edit')
  Future<ResponseBoolModel> editCommentUsingPOST(
      @Body() Map<String, dynamic> params);

  // 更新评论优先级
  @POST('/comment/update/priority')
  Future<ResponseBoolModel> updateCommentPriorityUsingPOST(
      @Body() Map<String, dynamic> params);

  // 问答
  @POST('/qa/list/page/vo')
  Future<QaModelList> listQaPageUsingPOST(@Body() Map<String, dynamic> params);

  // 获取单条问答
  @GET('/qa/get/vo')
  Future<QaVoModelRecord> getQaVoById(@Query("id") String id);

  /* 上传多个文件 */
  @POST('/file/upload/batch')
  @MultiPart()
  Future<ResponseStringListModel> uploadFileBatch(
    @Part(name: "files") List<File> files,
    @Part(name: "biz") String biz,
    @Part(name: "compress") bool compress,
  );

/* 上传多个文件【压缩版】 */
  @POST('/file/upload/thumbnail')
  @MultiPart()
  Future<ResponseStringListModel> uploadThumbnailFileUsingPOST(
    @Part(name: "files") List<File> files,
    @Part(name: "biz") String biz,
    @Part(name: "compress") bool compress,
  );

/* 上传单个文件 */
  @POST('/file/upload')
  @MultiPart()
  Future<ResponseStringModel> uploadFileUsingPOST(
    @Part(name: "file") File file,
    @Part(name: "biz") String biz,
    @Part(name: "compress") bool compress,
  );
}
