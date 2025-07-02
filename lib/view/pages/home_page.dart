import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/home_carousel_item_model.dart';
import 'package:e_commerce_app/models/product_item_model.dart';
import 'package:e_commerce_app/view/widgets/prodact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                          ),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'youssef',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  'let\'s go shopping',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.blueGrey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                FlutterCarousel.builder(
                  itemCount: dummyHomeCarouselItems.length,
                  itemBuilder:
                      (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                      ) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 16),
                        child: CachedNetworkImage(
                          imageUrl: dummyHomeCarouselItems[itemIndex].imgUrl,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              CircularProgressIndicator.adaptive(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                  options: FlutterCarouselOptions(
                    height: 200.0,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(
                      slideIndicatorOptions: SlideIndicatorOptions(
                        currentIndicatorColor: Colors.black,
                        indicatorBackgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Arrival',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: dummyProduct.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, Index) {
                    return ProductItem(productItem: dummyProduct[Index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
