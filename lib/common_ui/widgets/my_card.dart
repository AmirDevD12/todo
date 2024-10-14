
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';
import 'package:todo/common_ui/widgets/my_image_loader.dart';

import '../resource/my_colors.dart';
import '../resource/my_spaces.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.cardType,
      required this.name,
      required this.image,
      this.description,
      this.tag,
      this.onTap,
      this.showAvatar = true,
      this.showName = true,
      this.showPosition = true,
      this.showArrow = true,
      this.showTitle = true,
      this.tagStatus = true});

  final String? name;
  final String? description;
  final String? image;
  final Widget? tag;
  final Function()? onTap;
  final CardType cardType;
  final bool showAvatar;
  final bool showTitle;
  final bool showName;
  final bool showPosition;
  final bool showArrow;
  final bool tagStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(MySpaces.s20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C101828),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            if (cardType == CardType.council) ...{
              _councilCard()
            } else if (cardType == CardType.document) ...{
              _documentCard()
            } else if (cardType == CardType.report) ...{
              _reportCard()
            } else if (cardType == CardType.otherService) ...{
              _otherService()
            }
          ],
        ),
      ),
    );
  }

  Widget _documentCard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: MyImageLoader(
            imageUrl: image,
            typeLoader: ImageTypeLoader.asset,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: MySpaces.s16,
        ),
        if (showTitle) ...{
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showName) ...{
                  Text(
                    name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextRegularStyle.sm
                        .copyWith(color: MyColors.grey.shade900),
                  ),
                },
                const SizedBox(height: MySpaces.s4),
                Row(
                  children: [
                    if (showPosition) ...{
                      Icon(Hicons.calender_2_light_outline,
                      size: 14,
                      color: MyColors.primary.shade700),
                      const SizedBox(width: MySpaces.s4),
                         Text(
                          description ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextLightStyle.xs.copyWith(color: MyColors.grey.shade500),
                      )
                    },
                    if (tagStatus) ...{
                      const SizedBox(width: MySpaces.s6),
                      Flexible(child: tag ?? const SizedBox.shrink())
                    }
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: MySpaces.s16,
          ),
        },
        if(showArrow)...{
          Icon(Hicons.left_2_light_outline,
            color: MyColors.grey.shade400,
            size: 24,
          )
        }
      ],
    );
  }

  Widget _reportCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: MyImageLoader(
                imageUrl: image,
                typeLoader: ImageTypeLoader.asset,
                fit: BoxFit.fill,
              ),
            ),
              const Spacer(),
            if(showArrow) ...{
              Icon(
                Hicons.left_2_light_outline,
                color: MyColors.grey.shade400,
                size: 24,
              )
            },
          ],
        ),
          const SizedBox(
            height: MySpaces.s12,
          ),
        if (showTitle) ...{
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showName) ...{
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextMediumStyle.xs
                            .copyWith(color: MyColors.grey.shade900),
                      ),
                    ),
                  ],
                ),
              },
              Row(
                children: [
                  if (showPosition) ...{
                    Expanded(
                      child: Text(
                        description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextMediumStyle.xs
                            .copyWith(color: MyColors.grey.shade500),
                      ),
                    )
                  },
                ],
              )
            ],
          ),
        },
      ],
    );
  }

  Widget _otherService() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(MySpaces.s8),
              decoration: ShapeDecoration(shape:
               RoundedRectangleBorder(side: BorderSide(color: MyColors.grey.shade50,width: 1),
                  borderRadius: BorderRadius.circular(MySpaces.s12),
                ),

              ),
              child: MyImageLoader(
                imageUrl: image,
                typeLoader: ImageTypeLoader.network,
                fit: BoxFit.fill,
              ),
            ),
            if (showTitle) ...{
              Expanded(
                child: Text(
                  name ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextRegularStyle.sm
                      .copyWith(color: MyColors.grey.shade900),
                ).paddingSymmetric(horizontal: MySpaces.s12),
              )
            },
            if (showArrow) ...{ Icon(Hicons.left_2_light_outline,color: MyColors.grey.shade400,)},
          ],
        ),

      ],
    );
  }

  Widget _councilCard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showAvatar) ...{
          Container(
            width: 56,
            height: 56,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 4,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: Color(0xFFEAF5FF),
                ),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(200)),
              child: MyImageLoader(
                imageUrl: image,
                typeLoader: ImageTypeLoader.network,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: MySpaces.s16,
          ),
        },
        if (showTitle) ...{
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showName) ...{
                  Text(
                    name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextRegularStyle.sm
                        .copyWith(color: MyColors.grey.shade900),
                  ),
                },
                if (showPosition) ...{
                  Text(
                    description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextLightStyle.xs
                        .copyWith(color: MyColors.grey.shade500),
                  ),
                }
              ],
            ),
          ),
          const SizedBox(
            width: MySpaces.s16,
          ),
        },
        if (showArrow) ...{const Icon(Hicons.left_2_light_outline)}
      ],
    );
  }
}

enum CardType { council, document, message, city, report, otherService }
