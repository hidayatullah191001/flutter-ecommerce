import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/data/api/message_services.dart';
import 'package:shamo/app/data/models/message_model.dart';
import 'package:shamo/app/shared/theme.dart';
import 'package:shamo/app/widgets/chat_tile.dart';

import 'controllers/chat.controller.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ChatController());
  Widget header() {
    return AppBar(
      backgroundColor: background1Color,
      centerTitle: true,
      title: Text(
        'Message Support',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: background3Color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_message_info.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss no message yet?',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'You have never done a transaction',
              style: subtitleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 44,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
                child: Text(
                  'Expplore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget content() {
    return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessageByUserId(
          userId: controller.user.id!,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data!.length == 0) {
              return emptyChat();
            }
            return Expanded(
              child: Container(
                width: double.infinity,
                color: background3Color,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  children: [
                    ChatTile(
                        message: snapshot.data![snapshot.data!.length - 1]),
                  ],
                ),
              ),
            );
          } else {
            return emptyChat();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
