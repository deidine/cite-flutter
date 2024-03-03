import 'package:cached_network_image/cached_network_image.dart';
import 'package:cite3/app/core/themes/font_themes.dart';
import 'package:cite3/app/core/values/colors.dart';
import 'package:cite3/app/data/model/venue/venue_response.dart';
import 'package:cite3/app/data/provider/api_provider.dart';
import 'package:cite3/app/helper/formatted_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/all_payment_controller.dart';

class ContentOfFilteredVenue extends GetView<AllpaymentOwnerController> {
  const ContentOfFilteredVenue({
    Key? key,
  }) : super(key: key);

  static final containerHeight = Get.height * 0.47;
  static final maxWidth = Get.width * 0.6;
  static final maxHeight = Get.height * 0.35;
  static final maxImageWidht = Get.height * 0.3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.paymentsobs.length,
          itemBuilder: (context, index) => ConstrainedBox(
            constraints:
                BoxConstraints.expand(height: maxHeight, width: maxWidth),
            child: GestureDetector(
              onTap: () => controller.toBookingFieldPage(
                controller.paymentsobs[index].pymId as VenueResponse,
              ),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Expanded(
                              child: CachedNetworkImage(
                                width: maxImageWidht,
                                imageUrl:
                                    "${ApiProvider.imgPaym}${controller.paymentsobs[index].pymId}/",
                                fit: BoxFit.cover,
                              ),
                            )),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '⭐ ${controller.paymentsobs[index].bankApp}',
                              style: smallText.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     controller.paymentsobs[index].pymtTime,
                    //     style: mediumText,
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    //   child: Row(
                    //     children: [
                    //       const Icon(
                    //         Icons.pin_drop_sharp,
                    //         color: blue,
                    //         size: 20,
                    //       ),
                    //       const SizedBox(width: 5),
                    //       Text(
                    //         controller.paymentsobs[index].solde,
                    //         style: textfieldText.copyWith(
                    //           fontWeight: FontWeight.w100,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8.0),
                    //   child: Row(
                    //     children: [
                    //       const Icon(
                    //         Icons.attach_money,
                    //         color: blue,
                    //         size: 20,
                    //       ),
                    //       const SizedBox(width: 5),
                    //       Text(
                    //         'Rp. ${getFormattedPrice(controller.paymentsobs[index].phone)}',
                    //         style: textfieldText.copyWith(
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
