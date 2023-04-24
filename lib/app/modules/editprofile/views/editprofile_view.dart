import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/shared/theme.dart';

import '../controllers/editprofile_controller.dart';

class EditprofileView extends GetView<EditprofileController> {
  const EditprofileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: background1Color,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Edit Profile',
            style: primaryTextStyle,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              controller: controller.nameC,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Full Name...',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              controller: controller.usernameC,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Username...',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              controller: controller.emailC,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Email...',
                hintStyle: primaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    // Widget content() {
    //   return Container(
    //     width: double.infinity,
    //     padding: EdgeInsets.symmetric(horizontal: defaultMargin),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           width: 100,
    //           height: 100,
    //           margin: EdgeInsets.only(top: defaultMargin),
    //           decoration: const BoxDecoration(
    //             shape: BoxShape.circle,
    //             image: DecorationImage(
    //                 image: AssetImage('assets/img_user.png'),
    //                 fit: BoxFit.cover),
    //           ),
    //         ),
    //         nameInput(),
    //         usernameInput(),
    //         emailInput(),
    //       ],
    //     ),
    //   );
    // }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: defaultMargin),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  controller.user.profilePhotoUrl.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          nameInput(),
          usernameInput(),
          emailInput(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: background3Color,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
