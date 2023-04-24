import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/message_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/routes/app_pages.dart';
import 'package:shamo/app/shared/theme.dart';

class ChatTile extends StatelessWidget {
  final MessageModel message;

  const ChatTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.CHATPAGE,
        arguments: UnintializedProductModel(),
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: blueColor,
                  radius: 30,
                  child: Image.asset(
                    'assets/img_logo.png',
                    width: 35,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shoe Store',
                        style: primaryTextStyle.copyWith(fontSize: 15),
                      ),
                      Text(
                        message.message!,
                        style: secondaryTextStyle.copyWith(fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Now',
                  style: secondaryTextStyle.copyWith(fontSize: 10),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            ),
          ],
        ),
      ),
    );
  }
}
