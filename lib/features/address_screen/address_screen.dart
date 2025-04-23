import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_stor/core/styling/app_styles.dart';
import 'package:shop_stor/core/widgets/spacing_widget.dart';
import 'package:shop_stor/features/address_screen/widgets/address_item_widget.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Address",
          style: AppStyles.secondaryPrimaryHeadLinesStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            const HeightSpace(20),
            Text(
              "Saved Address",
              style: AppStyles.black16w500style
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const HeightSpace(14),
            Expanded(
              child: ListView(
                children: [
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                  AddressItemWidget(
                      address: "Home",
                      addressDetails: "925 S Chugach St #APT 10, Alas..."),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
