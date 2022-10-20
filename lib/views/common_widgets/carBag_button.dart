
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:za_ui/constants/extensions.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../controller/product_details_con.dart';

class CartBagButton extends StatelessWidget {
  const CartBagButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.responsive(
          20,
        ),
      ),
      child: SizedBox(
        width: context.responsive(
          50,
        ),
        height: context.responsive(
          25,
        ),
        child: Stack(
          children: [
            Center(
              child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: context.responsive(
                      20,
                    ),
                    height: context.responsive(
                      20,
                    ),
                    child: Icon(
                      ickCartBag,
                      color: ckPrimaryActionColorLight,
                      size: context.responsive(
                        25,
                      ),
                    ),
                  )),
            ),
            Positioned(
                top: context.responsive(
                  10,
                ),
                right: 0,
                child: AnimatedContainer(
                  width: context.responsive(
                    productDetailsControllerIns.playCart == true
                        ? 5
                        : 20,
                  ),
                  height: context.responsive(
                    productDetailsControllerIns.playCart == true
                        ? 5
                        : 20,
                  ),
                  decoration: BoxDecoration(
                      color: ckPrimaryActionColor,
                      borderRadius: BorderRadius.circular(
                        context.responsive(
                          15,
                        ),
                      )),
                  duration: Duration(milliseconds: 500),
                  child: Center(
                    child: Text(
                      productDetailsControllerIns
                          .bagProduct.length
                          .toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.responsive(
                          10,
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}