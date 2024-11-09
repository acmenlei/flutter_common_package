import 'package:codefather_app/api/http.dart';
import 'package:codefather_app/api/models/user/user_model.dart';
import 'package:codefather_app/components/infinity_scroll/index.dart';
import 'package:codefather_app/components/qa_card/index.dart';
import 'package:codefather_app/components/segmented/index.dart';
import 'package:flutter/material.dart';

/// 问答页面
class UserQaView extends StatefulWidget {
  final UserModel? user;
  const UserQaView({super.key, this.user});

  @override
  State<UserQaView> createState() => _UserQaViewState();
}

class _UserQaViewState extends State<UserQaView>
    with AutomaticKeepAliveClientMixin {
  int queryType = 0;
  @override
  void initState() {
    queryType = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 8),
          child: Row(
            children: [
              const Spacer(),
              Segmented(
                items: const ['我的提问', '我的回答'],
                tabWidth: 80,
                initialIndex: queryType,
                onChange: (selectIndex) => setState(() {
                  queryType = selectIndex;
                }),
              )
            ],
          ),
        ),
        Expanded(
          child: InfinityScroll(
            needStartRefresh: false,
            fetcher: Http.client.listQaPageUsingPOST,
            searchParams: {
              "current": 1,
              "pageSize": 10,
              "sortField": "createTime",
              "sortOrder": "descend",
              "hiddenContent": true,
              "queryType": queryType,
              "userId": widget.user?.id
            },
            itemRender: (body) => QaCard(data: body),
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
