import 'dart:io';
import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/components/common_editor/controller.dart';
import 'package:codefather_app/constants/colors.dart';
import 'package:codefather_app/constants/file.dart';
import 'package:codefather_app/utils/index.dart';
import 'package:codefather_app/utils/log.dart';
import 'package:codefather_app/utils/permission.dart';
import 'package:codefather_app/utils/toast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:path_provider/path_provider.dart';

/// 通用的编辑器
class CommonEditor extends StatefulWidget {
  // 请求提交
  final Future<dynamic> Function(Map<String, dynamic> body) onSubmit;
  final int maxLength;
  final int maxLines;
  final String placeHolder;
  const CommonEditor({
    super.key,
    required this.onSubmit,
    this.maxLength = 1000,
    this.maxLines = 6,
    this.placeHolder = '请输入内容',
  });

  @override
  _CommonEditorState createState() => _CommonEditorState();
}

class _CommonEditorState extends State<CommonEditor>
    with TickerProviderStateMixin {
  final FocusNode inputNode = FocusNode();
  int _charCount = 0;
  List<Asset> images = <Asset>[];
  List<String> renderImages = <String>[];
  TextEditingController textEditingController = TextEditingController();
  CommonEditorController commonEditorController =
      Get.put(CommonEditorController());
  final PermissionManager _permissionManager = PermissionManager();
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    // _charCount = widget.charCount;
    inputNode.requestFocus();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    // 启动动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    inputNode.dispose();
    super.dispose();
  }

  // 关闭编辑器
  Future<void> _dismiss() async {
    // 先让视图向下滑动或实现渐隐效果
    await _controller.reverse();
    // 收回键盘
    FocusScope.of(context).unfocus();
    // 延迟一段时间确保键盘已经收回
    await Future.delayed(const Duration(milliseconds: 100));
    // 收回视图
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: _dismiss,
      child: Container(
        margin: EdgeInsets.only(bottom: keyboardHeight),
        child: SlideTransition(
          position: _offsetAnimation,
          child: GestureDetector(
            onTap: () {}, // 阻止模态框内部点击事件向上传递
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Container(
                color: Get.theme.colorScheme.onPrimary,
                padding: const EdgeInsets.only(left: 14.0, right: 14, top: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInput(context),
                    _buildSelector(),
                    const SizedBox(height: 2,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 输入框区域
  _buildInput(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: tertiaryColor.withOpacity(.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            controller: textEditingController,
            maxLength: widget.maxLength,
            focusNode: inputNode,
            minLines: 1,
            cursorHeight: 16,
            maxLines: widget.maxLength, // 最大行数
            onChanged: (text) => setState(() => _charCount = text.length),
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.placeHolder,
              counterText: '', // 隐藏默认字符计数器
              border: InputBorder.none,
            ),
          ),
          _buildImageGrid()
        ],
      ),
    );
  }

  // 显示图片
  Widget _buildImageGrid() {
    if (renderImages.isEmpty) {
      return const SizedBox();
    }
    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: renderImages.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  renderImages[index],
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    renderImages.removeAt(index);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // 操作选择器
  _buildSelector() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.image),
          onPressed: () {
            _permissionManager.checkPermission(
              context,
              callback: _buildLoadAssets,
            );
          },
        ),
        const Spacer(),
        Text(
          '$_charCount/${widget.maxLength}',
          style: const TextStyle(color: tertiaryColor),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 55,
          height: 32,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(0),
              backgroundColor: getPrimaryColor(), // 文字颜色
            ),
            onPressed: () async {
              String content = textEditingController.text;
              if (content.isEmpty) {
                showToast('内容不能为空');
                return;
              }
              // print(renderImages);
              // print(content);
              // todo 发送到后端【待完善】
              final res = await widget.onSubmit({
                "content": content,
                "pictureList": renderImages,
              });
              if (res.code == 0) {
                showToast('已发布');
                _dismiss();
              }
            },
            child: const Text('发送', style: TextStyle(fontSize: 13)),
          ),
        ),
      ],
    );
  }

  // 加载 & 选择图片资源
  Future<void> _buildLoadAssets() async {
    List<Asset> resultList = <Asset>[];

    const AlbumSetting albumSetting = AlbumSetting(
      fetchResults: {
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumFavorites,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.album,
          subtype: PHAssetCollectionSubtype.albumRegular,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumSelfPortraits,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumPanoramas,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumVideos,
        ),
      },
    );
    const SelectionSetting selectionSetting = SelectionSetting(
      min: 1,
      max: 9,
      unselectOnReachingMax: true,
    );
    const DismissSetting dismissSetting = DismissSetting(
      enabled: true,
      allowSwipe: true,
    );
    const ThemeSetting themeSetting = ThemeSetting(
      selectionFillColor: Colors.white,
      selectionStrokeColor: Colors.black,
      previewSubtitleAttributes: TitleAttribute(fontSize: 12.0),
      previewTitleAttributes: TitleAttribute(
        foregroundColor: Colors.transparent,
      ),
      albumTitleAttributes: TitleAttribute(
        foregroundColor: Colors.transparent,
      ),
    );
    const ListSetting listSetting = ListSetting(
      spacing: 5.0,
      cellsPerRow: 4,
    );
    const CupertinoSettings iosSettings = CupertinoSettings(
      fetch: FetchSetting(album: albumSetting),
      theme: themeSetting,
      selection: selectionSetting,
      dismiss: dismissSetting,
      list: listSetting,
    );

    try {
      // 唤起相册选择图片
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,
        iosOptions: IOSOptions(
          doneButton:
              UIBarButtonItem(title: '确认', tintColor: getPrimaryColor()),
          cancelButton:
              const UIBarButtonItem(title: '取消', tintColor: tertiaryColor),
          // albumButtonColor: ThemeUtils.getIconColor(context),
          settings: iosSettings,
        ),
        androidOptions: AndroidOptions(
          maxImages: 9,
          actionBarColor: getPrimaryColor(),
          actionBarTitleColor: Colors.white,
          statusBarColor: getPrimaryColor(),
          actionBarTitle: "选择图片",
          allViewTitle: "全部图片",
          useDetailsView: false,
          selectCircleStrokeColor: getPrimaryColor(),
          // exceptMimeType: {MimeType.PNG, MimeType.JPEG, MimeType.WEBP}, 排除可以选择的照片
        ),
      );
    } on Exception catch (e) {
      LogUtil.e("相册 error =$e");
    }
    // 如果为空则不做处理
    if (resultList.isEmpty) {
      return;
    }

    List<File> files = [];

    for (var asset in resultList) {
      // 将 Asset 转换为文件路径
      final byteData = await asset.getByteData();
      // 将文件写入临时目录
      final file =
          File('${(await getTemporaryDirectory()).path}/${asset.name}');
      // 将数据写入文件
      await file.writeAsBytes(byteData.buffer.asUint8List());
      files.add(file);
    }

    try {
      final res = await Http.client.uploadFileBatch(
        files,
        FileUploadBizEnum.postPicture.value,
        true,
      );
      if (res.code == 0) {
        showToast("上传成功");
        setState(() {
          images.clear();
          images = resultList;
          renderImages = res.data ?? [];
        });
      }
    } catch (e) {
      LogUtil.e(e);
    }
  }
}

// void showCommentEditModal(
//     BuildContext context,
//     TextEditingController controller,
//     int charCount,
//     Future<void> Function(String, List<String>) onSend) {
//   showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.transparent, // 设置透明背景色
//     builder: (context) {
//       return GestureDetector(
//         onTap: () {}, // 点击背景不做任何操作
//         child: const CommonEditor(),
//       );
//     },
//   );
// }
