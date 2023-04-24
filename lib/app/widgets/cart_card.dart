import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/data/models/cart_model.dart';
import 'package:shamo/app/modules/cart/controllers/cart_controller.dart';
import 'package:shamo/app/shared/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard({Key? key, required this.cart}) : super(key: key);

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        cart.product!.galleries![0].url.toString()),
                  ),
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
                      cart.product!.name.toString(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$${cart.product!.price}',
                      style: priceTextStyle,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      cartController.addQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/icon_add.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Obx(
                    () => Text(
                      cart.quantity.value.toString(),
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  InkWell(
                    onTap: () {
                      cartController.reduceQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/icon_min.png',
                      width: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              cartController.removeCart(cart.id!);
            },
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: alertColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
