import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shamo/app/data/api/transaction_services.dart';
import 'package:shamo/app/routes/app_pages.dart';
import 'package:shamo/app/shared/theme.dart';

import '../controllers/histories_controller.dart';

class HistoriesView extends GetView<HistoriesController> {
  const HistoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background3Color,
      appBar: AppBar(
        backgroundColor: background1Color,
        title: Text(
          'Your Orders',
          style: primaryTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: TransactionServices().histories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      color: primaryTextColor, strokeWidth: 2.0),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sedang mengambil data...',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                print(snapshot.data);
                return InkWell(
                  onTap: () => Get.toNamed(
                    Routes.DETAIL_HISTORIES,
                    arguments: snapshot.data?[index],
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: background5Color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data![index].status.toString(),
                        style: primaryTextStyle,
                      ),
                      subtitle: Text(
                        snapshot.data![index].createdAt.toString(),
                        style: primaryTextStyle.copyWith(
                          color: subtitleColor,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Text(
                        '\$${snapshot.data![index].totalPrice}',
                        style: priceTextStyle.copyWith(),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
