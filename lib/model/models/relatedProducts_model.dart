

class RelatedProducts {
  bool? isInWishList;
  int? id;
  String? brandName;
  String? productDescription;
  String? productPriceSlash;
  String? productPrice;
  String? bannerImage;

  RelatedProducts({
    this. id,
    this.  brandName,
    this.  productDescription,
    this. productPriceSlash,
    this.  productPrice,
    this.isInWishList,
    this.bannerImage
});

  RelatedProducts.fromJson(Map<String, dynamic> json ){
    isInWishList =json["in_wishList"];
    id =json["id"];
    brandName=json["brand_name"];
    productDescription=json["des"];
    productPrice =json["price"];
    productPriceSlash=json["slash_price"];
    bannerImage =json["banner"];
  }


}