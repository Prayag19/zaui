import 'package:flutter/material.dart';
import 'package:za_ui/constants/extensions.dart';

class ProductDetailsSlider extends StatefulWidget {
    ProductDetailsSlider({
    Key? key,
    required this.images
  }) : super(key: key);

 List<String> images;

  @override
  State<ProductDetailsSlider> createState() => _ProductDetailsSliderState();
}

PageController _pageController = PageController();
int currIndex = 0;

class _ProductDetailsSliderState extends State<ProductDetailsSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getWidth(context),
      height: getHeight(context) * 0.75,
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                currIndex = value;
                setState(() {});
              },
              itemCount: widget.images.length,
              itemBuilder: (_, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.images[index]),
                          fit: BoxFit.cover)),
                );
              }),
          Positioned(
              bottom: 20,
              child: SizedBox(
                width: getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.images.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: AnimatedContainer(
                          width: currIndex == index
                              ? context.responsive(12)
                              : context.responsive(8),
                          height: context.responsive(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(context.responsive(10)),
                            color: currIndex == index
                                ? Colors.orange.shade200
                                : Colors.black38,
                          ),
                          duration: const Duration(milliseconds: 100),
                        ),
                      ),
                    );
                  }),
                ),
              ))
        ],
      ),
    );
  }
}
