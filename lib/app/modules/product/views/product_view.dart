import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/controllers/wishlist_controller.dart';
import 'package:shamo/app/modules/cart/controllers/cart_controller.dart';
import 'package:shamo/app/routes/app_pages.dart';
import 'package:shamo/app/shared/theme.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);

  final wishlistController = Get.put(WishlistController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: background3Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success_info.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.CART),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: primaryColor),
                    child: Text(
                      'View My Cart',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Obx(
        () => Container(
          width: controller.currentIndex.value == index ? 16 : 4,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: controller.currentIndex.value == index
                ? primaryColor
                : const Color(0xffC4C4C4),
          ),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: background1Color,
        ),
        child: Column(
          children: [
            // Header
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.product.value.name.toString(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          controller.product.value.category!.name.toString(),
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistController.setProduct(controller.product.value);
                      if (wishlistController
                          .isWishlist(controller.product.value)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              'Has been added to WishList',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              'Has been removed from WishList',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Obx(
                      () => wishlistController
                              .isWishlist(controller.product.value)
                          ? Image.asset(
                              'assets/icon_wishlist_full.png',
                              width: 46,
                            )
                          : Image.asset(
                              'assets/icon_wishlist.png',
                              width: 46,
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // Price
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: background2Color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${controller.product.value.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            // Description

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${controller.product.value.description}',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // Note Familiar Shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar shoes',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.familiarShoes.map((image) {
                        controller.indexFamiliar++;
                        return Container(
                          margin: EdgeInsets.only(
                              left: controller.indexFamiliar == 0
                                  ? defaultMargin
                                  : 0),
                          child: familiarShoesCard(image),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // Buttons

            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.CHATPAGE,
                        arguments: controller.product.value),
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/button_chat.png'),
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartController.addCart(controller.product.value);
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.chevron_left_outlined),
                ),
                IconButton(
                  onPressed: () => Get.toNamed(Routes.CART),
                  icon: Icon(
                    Icons.shopping_bag,
                    color: background1Color,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: controller.product.value.galleries!
                .map((image) => Image.network(
                      image.url!,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) => controller.currentIndex(index),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.images.map(
              (e) {
                controller.index++;
                return indicator(controller.index);
              },
            ).toList(),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: background6Color,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
