import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:za_ui/constants/app_colors.dart';
import 'package:za_ui/constants/app_icons.dart';
import 'package:za_ui/constants/extensions.dart';
import 'package:za_ui/controller/product_details_con.dart';
import 'package:za_ui/model/models/productDetails_models.dart';
import 'package:za_ui/views/common_widgets/dropdown_list.dart';
import '../common_widgets/carBag_button.dart';
import '../common_widgets/expanded_tile.dart';
import '../common_widgets/long_button.dart';
import '../common_widgets/product_details_slider.dart';
import '../common_widgets/product_details_title.dart';
import 'more_product_list_view.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late ProductDetails product;
  late String selectedColor;
  int indexColor = 0;
  List<String> sliderImage = [];

  getImages(sColor) {
    if (product.imageColorMap!.keys.toList().contains(sColor)) {
      indexColor = product.imageColorMap!.keys.toList().indexOf(sColor);
      sliderImage = [];
      sliderImage = product.imageColorMap!.values.toList()[indexColor];
      setState(() {});
    } else {
      indexColor = 0;
      sliderImage = [];
      sliderImage = product.imageColorMap!.values.toList()[indexColor];
      setState(() {});
    }
  }

  List<String>  checkIndex(indexColor) {
    if (product.imageColorMap!.keys.toList().length>indexColor) {
      sliderImage = product.imageColorMap!.values.toList()[ indexColor];
    } else {
      indexColor = 0;
      sliderImage = [];
      sliderImage = product.imageColorMap!.values.toList()[indexColor];
    }
    return  sliderImage ;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        init: ProductDetailsController(),
        builder: (productDetailsControllerIns) {
          if (productDetailsControllerIns.product == null) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          product = productDetailsControllerIns.product!;
          selectedColor = product.colorOptions!.first;
          sliderImage = [];
          sliderImage =checkIndex(indexColor);



          return Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(context),
              body: productDetailsControllerIns.isLoading == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                      children: [
                        ProductDetailsSlider(
                          images: sliderImage,
                        ),
                        ProductDetailsTitle(
                          scaledSize:
                              Size(getWidth(context), getHeight(context)),
                          zoomSize: 1,
                          productDescription:
                              product.productDescription.toString(),
                          brandName: product.brandName.toString(),
                          productPrice: product.productPrice.toString(),
                          productPriceSlash:
                              product.productPriceSlash.toString(),
                        ),
                        buildColorSizeRow(context),
                        SizedBox(
                          height: context.responsive(
                            30,
                          ),
                        ),
                        buildFavShareRow(context, productDetailsControllerIns),
                        ExpandTile(
                          extName: 'DESCRIPTION',
                          extItems: product.productLongDes.toString(),
                        ),
                        ExpandTile(
                          extName: 'COMPOSITION AND CARE',
                          extItems: product.productCare.toString(),
                        ),
                        SizedBox(
                          height: context.responsive(
                            30,
                          ),
                        ),
                        Center(
                          child: Text(
                            "BLOCK${product.blockNo} ID: ${product.blockID}",
                            style: TextStyle(
                                color: ckPrimaryMaterialColor.shade200,
                                fontSize: context.responsive(
                                  14,
                                ),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: context.responsive(
                            30,
                          ),
                        ),
                        ProductListView(
                          relateProducts: product.relatedProducts!,
                          brandName: product.brandName!,
                        ),
                        SizedBox(
                          height: context.responsive(
                            30,
                          ),
                        ),
                        buildAddRemoveBagButton(
                            productDetailsControllerIns, context),
                        SizedBox(
                          height: context.responsive(
                            15,
                          ),
                        ),
                      ],
                    )));
        });
  }

  Center buildAddRemoveBagButton(
      ProductDetailsController productDetailsControllerIns,
      BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (productDetailsControllerIns.playCart != true) {
            productDetailsControllerIns.toggleBag(product.id);
          }
        },
        child: AnimatedContainer(
          width: productDetailsControllerIns.playCart == true
              ? 50
              : getWidth(context) * 0.9,
          height: context.responsive(
            50,
          ),
          decoration: BoxDecoration(
            color: ckPrimaryActionColor,
            borderRadius: BorderRadius.circular(5),
          ),
          duration: Duration(milliseconds: 650),
          child: Center(
            child: productDetailsControllerIns.playCart == true
                ? CircularProgressIndicator()
                : Text(
                    productDetailsControllerIns.bagProduct.contains(product.id)
                        ? "Remove from Bag"
                        : "Add to Bag",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: context.responsive(
                          18,
                        )),
                  ),
          ),
        ),
      ),
    );
  }

  Row buildFavShareRow(BuildContext context,
      ProductDetailsController productDetailsControllerIns) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          width: getWidth(context) * 0.5,
          child: LongAppButton(
            bLabel: 'WISHLIST',
            icData: productDetailsControllerIns.favProduct.contains(product.id)
                ? ickWishList
                : ickWishListBorder,
            icColor: productDetailsControllerIns.favProduct.contains(product.id)
                ? ckPrimaryActionColor
                : ckPrimaryMaterialColor.shade200,
            onPress: () {
              productDetailsControllerIns.toggleFavProduct(product.id);
            },
          ),
        ),
        Container(
          width: getWidth(context) * 0.5,
          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
          child: LongAppButton(
            bLabel: 'SHARE',
            icData: ickDetailsShare,
            onPress: () {},
          ),
        )
      ],
    );
  }

  Row buildColorSizeRow(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: getWidth(context) / 2,
            child: DropDownList(
              bLabel: 'Select Color',
              items: product.colorOptions!,
              sendOptionUp: (sColor) {
                getImages(sColor);
              },
            )),
        SizedBox(
            width: getWidth(context) / 2,
            child: DropDownList(
              bLabel: 'Select Size',
              items: product.sizeOptions!,
              sendOptionUp: (sSize) {},
            )),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: context.responsive(
        55,
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: ckPrimaryActionColorLight),
      leading: IconButton(
        icon: Padding(
          padding: EdgeInsets.only(
            left: context.responsive(
              10,
            ),
          ),
          child: Icon(
            ickGoBack,
            color: ckPrimaryActionColorLight,
            size: context.responsive(
              25,
            ),
          ),
        ),
        onPressed: () {},
      ),
      actions: [CartBagButton()],
    );
  }
}
