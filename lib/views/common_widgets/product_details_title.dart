import 'package:flutter/cupertino.dart';
import 'package:za_ui/constants/extensions.dart';

import '../../constants/app_colors.dart';

class ProductDetailsTitle extends StatelessWidget {
  const ProductDetailsTitle({
    Key? key,
    required this.scaledSize,
    required this.productPriceSlash,
    required this.productPrice,
    required this.productDescription,
    required this.brandName,
    required this.zoomSize,
  }) : super(key: key);
  final scaledSize;
  final zoomSize;
  final  String brandName;
  final   String productDescription;
  final  String productPriceSlash;
  final  String productPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.scaledResponsive(
            10,
              scaledSize,zoomSize,
          ),
        ),
        Text(brandName. capitalize(),style: TextStyle( color: ckPrimaryMaterialColor,
            fontWeight: FontWeight.w600,
            fontSize: context.scaledResponsive(
              20,     scaledSize, zoomSize,))),
        SizedBox(
          height: context.scaledResponsive(
            10,     scaledSize,  zoomSize,
          ),
        ),
        Text(productDescription,style: TextStyle(color: ckPrimaryMaterialColor.shade600,
          fontWeight: FontWeight.w600,
          fontSize: context.scaledResponsive(
            14,     scaledSize, zoomSize,),),),
        SizedBox(
          height: context.scaledResponsive(
            10,     scaledSize, zoomSize,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("KD $productPrice",style: TextStyle( color: ckPrimaryMaterialColor,
                fontWeight: FontWeight.w600,
                fontSize: context.scaledResponsive(
                  18,     scaledSize,zoomSize,))),
            SizedBox(
              width: context.scaledResponsive(
                  10,     scaledSize,zoomSize,axis: Axis.horizontal
              ),),

            Text(productPriceSlash , style: TextStyle(decoration: TextDecoration.lineThrough, color: ckPrimaryMaterialColor.shade200,
                fontSize: context.scaledResponsive(
                  18,     scaledSize,zoomSize,),
                fontWeight: FontWeight.w600
            ),)
          ],
        ),
        SizedBox(
          height: context.responsive(
            10,
          ),
        ),
      ],


    );
  }
}