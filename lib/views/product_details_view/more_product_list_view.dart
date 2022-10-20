import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:za_ui/constants/app_icons.dart';
import 'package:za_ui/constants/extensions.dart';
import 'package:za_ui/views/common_widgets/product_details_title.dart';
import '../../constants/app_colors.dart';
import '../../controller/product_details_con.dart';
import '../../model/models/relatedProducts_model.dart';

class ProductListView extends StatelessWidget {
  const ProductListView(
      {Key? key, required this.brandName, required this.relateProducts})
      : super(key: key);

  final List<RelatedProducts> relateProducts;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
    init: ProductDetailsController(),
    builder: (productDetailsControllerIns) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text("MORE FROM ${brandName.toString().toUpperCase()}",
              style: TextStyle(
                  color: ckPrimaryActionColorLight,
                  fontSize: context.responsive(
                    14,
                  ),
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: getWidth(context),
          height: getWidth(context) / 1.2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: relateProducts.length,
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: getWidth(context) / 2.5,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GestureDetector(
                  onTap: (){
                    productDetailsControllerIns .getProductDetails(relateProducts[index].id);
                  },

                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: (getWidth(context) / 1.2) * 0.68 - 5,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        relateProducts[index].bannerImage!),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                              top: 5,
                              right: context.scaledResponsive(
                                    30,
                                    Size(getWidth(context) / 2.5,
                                        (getWidth(context) / 1.2)),
                                    1.6,
                                  ) /
                                  3,
                              child: InkWell(
                                child: Icon(
                                 productDetailsControllerIns.favProduct.contains(relateProducts[index].id)?ickWishList:ickWishListBorder,
                                  color:productDetailsControllerIns.favProduct.contains(relateProducts[index].id)?ckPrimaryActionColor:ckPrimaryMaterialColor.shade200 ,

                                  size: context.scaledResponsive(
                                    30,
                                    Size(getWidth(context) / 2.5,
                                        (getWidth(context) / 1.2)),
                                    1.6,
                                  ),
                                ),
                                onTap: () {

                                  productDetailsControllerIns.toggleFavProduct(relateProducts[index].id);
                                },
                              ))
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        height: (getWidth(context) / 1.2) * 0.32 - 5,
                        child: ProductDetailsTitle(
                          scaledSize: Size(
                              getWidth(context) / 2.5, (getWidth(context) / 1.2)),
                          zoomSize: 1.6,
                          productDescription:  relateProducts[index].productDescription!,
                          brandName:  relateProducts[index].brandName!,
                          productPrice:  relateProducts[index].productPrice!,
                          productPriceSlash: relateProducts[index].productPriceSlash!,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );});
  }
}
