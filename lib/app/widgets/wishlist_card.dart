import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/app/controllers/wishlist_controller.dart';
import 'package:shamo/app/data/models/product_model.dart';
import 'package:shamo/app/shared/theme.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  const WishlistCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WishlistController());
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: background4Color,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries![0].url.toString(),
              width: 60,
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
                  product.name.toString(),
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => controller.setProduct(product),
            child: Image.asset(
              'assets/icon_wishlist_full.png',
              width: 34,
            ),
          ),
        ],
      ),
    );
  }
}
