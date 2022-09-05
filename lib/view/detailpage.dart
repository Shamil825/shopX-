import 'package:flutter/material.dart';
import 'package:rest_api_with_getx/controller/productcontroller.dart';
import 'package:rest_api_with_getx/model/model.dart';

class DetailPAge extends StatelessWidget {
  DetailPAge({Key? key, required this.product}) : super(key: key);

  final Model product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: false,
            pinned: false,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: product.id!,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.network(
                        product.imageLink!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )),
            expandedHeight: 250,
            backgroundColor: Colors.white,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.start,
                          children: [
                            Text(product.description!, style: TextStyle(
                      
                      fontSize: 16.0,
                    ) ),
                          ],
                        ),
                      ),
                    ) ,
                    childCount: 1,
                ),
          )
        ],
      )),
    );
  }
}
