final  dummyDataIns = DummyData();


class DummyData {

  DummyData ._privateConstructor();
  static final DummyData  _instance = DummyData ._privateConstructor();
  factory DummyData () {
    return _instance;
  }

  List productDetailsDataList = [
{
"in_wishList": false,
"id": 0,
"brand_name": "zara",
"des": "Long Dress for Women",
"price": "65.00",
"slash_price": "85.00",
"long_des": "This is were Long Description will be there",
"product_care": "Hand Washing",
"block_id": "0324",
"block_no": "49",
"colors": [ "blue","red", "green"],
"sizes": ["S", "L", "M"],
"related_products": [
{
"in_wishList": false,
"id": 1,
"brand_name": "zara",
"des": "Blue and White Double Layer",
"price": "11.00",
"slash_price": "20.00",
"banner":"assets/images/9.jpg"
},
{
"in_wishList": true,
"id": 2,
"brand_name": "zara",
"des": "Dress with belt",
"price": "34.00",
"slash_price": "44.00",
"banner":"assets/images/10.jpg"
},
{
"in_wishList": true,
"id": 3,
"brand_name": "zara",
"des": "HandBag",
"price": "8.00",
"slash_price": "11.00",
"banner": "assets/images/11.jpg"
},
],
"image_colorMap": {
"blue": [
"assets/images/1.jpeg",
"assets/images/2.jpg",
"assets/images/3.jpg",
],
"red": [
"assets/images/4.jpg",
"assets/images/5.jpg",
"assets/images/6.jpg",
],
"green": [
"assets/images/7.jpg",
"assets/images/8.jpg",
]
}
},
{
"in_wishList": false,
"id": 1,
"brand_name": "zara",
"des": "Blue and White Double Layer",
"price": "11.00",
"slash_price": "20.00",
"long_des": "This is were Long Description will be there",
"product_care": "Hand Washing",
"block_id": "0344",
"block_no": "49",
"colors": ["blue"],
"sizes": ["S", "L", "M"],
"related_products": [
{
"in_wishList": false,
"id": 0,
"brand_name": "zara",
"des": "Long Dress for Women",
"price": "65.00",
"slash_price": "85.00",
"banner":"assets/images/1.jpeg"
},
{
"in_wishList": true,
"id": 2,
"brand_name": "zara",
"des": "Dress with belt",
"price": "34.00",
"slash_price": "44.00",
"banner":"assets/images/10.jpg"
},
{
"in_wishList": true,
"id": 3,
"brand_name": "zara",
"des": "HandBag",
"price": "8.00",
"slash_price": "11.00",
"banner": "assets/images/11.jpg"
},
],
"image_colorMap": {
"blue": [
"assets/images/9.jpg",
]
}
},
{

"in_wishList": true,
"id": 2,
"brand_name": "zara",
"des": "Dress with belt",
"price": "34.00",
"slash_price": "44.00",
"long_des": "This is were Long Description will be there",
"product_care": "Hand Washing",
"block_id": "0344",
"block_no": "49",
"colors": ["pink"],
"sizes": ["S", "L", "M"],
"related_products": [
{
"in_wishList": false,
"id": 0,
"brand_name": "zara",
"des": "Long Dress for Women",
"price": "65.00",
"slash_price": "85.00",
"banner":"assets/images/1.jpeg"
},
{
"in_wishList": false,
"id": 1,
"brand_name": "zara",
"des": "Blue and White Double Layer",
"price": "11.00",
"slash_price": "20.00",
"banner":"assets/images/9.jpg"
},
{
"in_wishList": true,
"id": 3,
"brand_name": "zara",
"des": "HandBag",
"price": "8.00",
"slash_price": "11.00",
"banner": "assets/images/11.jpg"
},
],
"image_colorMap": {
"pink": [
"assets/images/10.jpg",
],

}
},
{
"in_wishList": true,
"id": 3,
"brand_name": "zara",
"des": "HandBag",
"price": "8.00",
"slash_price": "11.00",

"long_des": "This is were Long Description will be there",
"product_care": "Hand Washing",
"block_id": "0344",
"block_no": "49",
"colors": ["beige"],
"sizes": ["U"],
"related_products": [
{
"in_wishList": false,
"id": 0,
"brand_name": "zara",
"des": "Long Dress for Women",
"price": "65.00",
"slash_price": "85.00",
"banner":"assets/images/1.jpeg"
},
{
"in_wishList": true,
"id": 2,
"brand_name": "zara",
"des": "Dress with belt",
"price": "34.00",
"slash_price": "44.00",
"banner":"assets/images/10.jpg"
},
{
"in_wishList": false,
"id": 1,
"brand_name": "zara",
"des": "Blue and White Double Layer",
"price": "11.00",
"slash_price": "20.00",
"banner": "assets/images/9.jpg"
},
],
"image_colorMap": {
"beige": [
"assets/images/11.jpg",

],

}
},
];


List<int> favProduct =[2,3];

setFavProductList(favlist){
    favProduct =favlist;
  }

}

