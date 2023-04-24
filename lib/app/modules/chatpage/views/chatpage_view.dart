import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/data/api/message_services.dart';
import 'package:shamo/app/data/models/message_model.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/shared/theme.dart';
import 'package:shamo/app/widgets/chat_bubble.dart';

import '../controllers/chatpage_controller.dart';

class ChatpageView extends GetView<ChatpageController> {
  const ChatpageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: background1Color,
          centerTitle: false,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: blueColor,
                radius: 23,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(
                      'assets/img_logo.png',
                      width: 25,
                      color: Colors.white,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: background3Color,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget productPreview() {
      return Obx(
        () => Container(
          width: 225,
          height: 74,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background5Color,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: primaryColor,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  controller.product.value.galleries![0].url.toString(),
                  width: 54,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.product.value.name.toString(),
                      style: primaryTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      '\$${controller.product.value.price}',
                      style: priceTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  controller.product(UnintializedProductModel());
                },
                child: Image.asset(
                  'assets/icon_close.png',
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => controller.product.value is UnintializedProductModel
                    ? const SizedBox()
                    : productPreview(),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: background4Color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: TextFormField(
                            controller: controller.chatC,
                            style: primaryTextStyle,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Type message...',
                              hintStyle: subtitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await MessageService().addMessage(
                        user: controller.user,
                        isFromUser: true,
                        message: controller.chatC.text,
                        product: controller.product.value,
                      );

                      controller.product(UnintializedProductModel());
                      controller.chatC.value.text == '';
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Image.asset(
                        'assets/icon_submit.png',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream:
              MessageService().getMessageByUserId(userId: controller.user.id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                children: snapshot.data!
                    .map((MessageModel message) => ChatBubble(
                          isSender: message.isFromUser!,
                          text: message.message!,
                          product: message.product!,
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: background3Color,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
