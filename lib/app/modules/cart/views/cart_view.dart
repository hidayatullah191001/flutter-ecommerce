import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/modules/cart/controllers/cart_controller.dart';
import 'package:shamo/app/routes/app_pages.dart';
import 'package:shamo/app/shared/theme.dart';
import 'package:shamo/app/widgets/cart_card.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: background1Color,
          centerTitle: true,
          title: Text(
            'Your Cart',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          elevation: 0,
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_cart_info.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite shoes',
              style: subtitleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 44,
              child: TextButton(
                onPressed: () => Get.offAndToNamed(Routes.MAIN),
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
                  'Explore Store',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Obx(
        () => ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: controller.carts.value
              .map(
                (cart) => CartCard(
                  cart: cart,
                ),
              )
              .toList(),
        ),
      );
    }

    Widget customBottomNav() {
      return SizedBox(
        height: 130,
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Obx(
                    () => Text(
                      '\$${controller.totalPrice()}',
                      style: priceTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              thickness: 0.4,
              color: subtitleColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                onPressed: () => Get.toNamed(Routes.CHECKOUT),
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue to Checkout',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryTextColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    print('data carts = ${controller.carts.value}');

    return Obx(
      () => Scaffold(
        backgroundColor: background3Color,
        appBar: header(),
        body: controller.carts.value.isEmpty ? emptyCart() : content(),
        bottomNavigationBar: controller.carts.value.isEmpty
            ? const SizedBox()
            : customBottomNav(),
      ),
    );
  }
}
