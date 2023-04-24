import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/data/models/item_history_model.dart';
import 'package:shamo/app/shared/theme.dart';
import 'package:shamo/app/widgets/checkout_card.dart';
import 'package:shamo/app/widgets/item_history_card.dart';

import '../controllers/detail_histories_controller.dart';

class DetailHistoriesView extends GetView<DetailHistoriesController> {
  const DetailHistoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background3Color,
        appBar: AppBar(
          backgroundColor: background1Color,
          title: Text(
            'Detail Your Orders',
            style: primaryTextStyle,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          padding: EdgeInsets.only(top: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Detail Orders',
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: background5Color,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alamat',
                                style: secondaryTextStyle,
                              ),
                              Text(
                                'Status',
                                style: secondaryTextStyle,
                              ),
                              Text(
                                'Payment',
                                style: secondaryTextStyle,
                              ),
                              Text(
                                'Shipping Price',
                                style: secondaryTextStyle,
                              ),
                              Text(
                                'Total Price',
                                style: secondaryTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.history.value.address.toString(),
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  controller.history.value.status.toString(),
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  controller.history.value.payment.toString(),
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  controller.history.value.shippingPrice
                                      .toString(),
                                  style: primaryTextStyle,
                                ),
                                Text(
                                  controller.history.value.totalPrice
                                      .toString(),
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Text(
                'Product Items',
                style: primaryTextStyle.copyWith(fontSize: 16),
              ),
              Column(
                children: controller.history.value.items!
                    .map(
                      (item) => ItemHistoryCard(
                        item: item,
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ));
  }
}
