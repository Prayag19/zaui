import 'package:get/get.dart';
import 'package:za_ui/model/models/productDetails_models.dart';
import '../model/api/dummy_data.dart';

ProductDetailsController  productDetailsControllerIns =Get.put( ProductDetailsController());

class ProductDetailsController extends GetxController{


  ProductDetails? product;
  List<int> favProduct = [5];
  bool isLoading = false;
  List<int> bagProduct = [0];
  bool playCart = false;

  @override
  void onInit() {
    getProductDetails(0);
    super.onInit();
  }

  getFavProductList(){
    favProduct = dummyDataIns.favProduct;

  }
  toggleBag(id) async {
    if(bagProduct.contains(id))
    {
      playCart =true;
      update();
      await Future.delayed(const Duration(milliseconds: 300));
      bagProduct .remove(id);
    }
    else {
      playCart =true;
      update();
      await Future.delayed(const Duration(milliseconds: 300));
      bagProduct .add(id);
    }
    playCart =false;
    update();
  }

  toggleFavProduct(id) async {
    favProduct  = dummyDataIns.favProduct;
    if(favProduct.contains(id))
      {

        favProduct .remove(id);
        dummyDataIns.setFavProductList(favProduct );


      }
    else {
      favProduct .add(id);
      dummyDataIns.setFavProductList(favProduct );
    }

    update();

  }


  getProductDetails(id) async {
    isLoading = true;
    update();
   await Future.delayed(Duration(milliseconds: 500));
      product = ProductDetails.fromJson(dummyDataIns.productDetailsDataList[id]);
    isLoading = false;
      update();

  }






}