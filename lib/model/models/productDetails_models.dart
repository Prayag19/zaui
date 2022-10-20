import 'package:za_ui/model/models/relatedProducts_model.dart';

class ProductDetails {
  int? id;
  String? brandName;
  String? productDescription;
  String? productPriceSlash;
  String? productPrice;
  String? productLongDes;
  String? productCare;
  String? blockNo;
  String? blockID;
  List<String>? colorOptions;
  List<String>? sizeOptions;
  List<RelatedProducts>? relatedProducts;
  Map<String, List<String>>? imageColorMap;
  bool? isInWishList;

  ProductDetails({
    this.id,
    this.brandName,
    this.productDescription,
    this.productPriceSlash,
    this.productPrice,
    this.productLongDes,
    this.productCare,
    this.blockNo,
    this.blockID,
    this.colorOptions,
    this.sizeOptions,
    this.relatedProducts,
    this.imageColorMap,
    this.isInWishList,
  });

  ProductDetails.fromJson(Map<String, dynamic> json) {
    isInWishList = json["in_wishList"];
    id = json["id"];
    brandName = json["brand_name"];
    productDescription = json["des"];
    productPrice = json["price"];
    productPriceSlash = json["slash_price"];
    productLongDes = json["long_des"];
    productCare = json["product_care"];
    blockID = json["block_id"];
    blockNo = json["block_no"];
    colorOptions = json["colors"];
    sizeOptions = json["sizes"];
    relatedProducts =  getRelatedpoductList(json["related_products"]);

    imageColorMap = json["image_colorMap"];
  }

  List<RelatedProducts> getRelatedpoductList (List list){
    List<RelatedProducts> related =[];
    list.forEach((element) {
      related.add(RelatedProducts.fromJson(element));

    });
  //  print(related);
    return related;

  }
}
