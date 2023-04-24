import 'package:flutter/material.dart';
import 'package:shamo/app/data/models/item_history_model.dart';
import 'package:shamo/app/shared/theme.dart';

class ItemHistoryCard extends StatelessWidget {
  final ItemHistory item;
  const ItemHistoryCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: background4Color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product!.name.toString(),
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${item.product!.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            '${item.quantity} Items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
