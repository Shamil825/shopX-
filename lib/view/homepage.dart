import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_with_getx/controller/productcontroller.dart';
import 'package:rest_api_with_getx/view/detailpage.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ))
      ]),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(children: [
              Expanded(
                child: Text(
                  "ShopX",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
                ),
              ),
              IconButton(
                onPressed: () {
                  log("${productController.productList.length - 1}");
                },
                icon: const Icon(Icons.view_list_rounded),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
            ]),
          ),
          Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                itemCount: productController.productList.length,
                crossAxisCount:3,
                
                itemBuilder: (BuildContext context, int index) =>GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPAge(
                                    product:
                                        productController.productList[index])),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          child: Container(
                              height: 250,
                              width: 180,
                              child: Column(
                                children: [
                                  Hero(
                                    tag: productController
                                        .productList[index].id!,
                                    child: Image.network(
                                        productController
                                            .productList[index].imageLink!,
                                        fit: BoxFit.cover),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 120,
                                      width: 170,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              productController
                                                  .productList[index].name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(1, 2),
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
              ),),
          )
        ],
      ),
    );
  }

  Widget Tile(int intex) {
    return Container(
      color: Colors.yellow,
      height: 20,
      width: 20,
    );
  }
}
