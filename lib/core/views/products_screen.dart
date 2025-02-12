import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:mvvm/core/models/product.dart';
import 'package:mvvm/core/viewmodels/products_vm.dart';
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductVM productVM = ProductVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: FutureBuilder<List<Product>>(
          future: productVM.getProductFromServer(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Image.network(snapshot.data![index].thumbnail),
                          ListTile(
                            trailing: Text('${snapshot.data![index].price}'),
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].category),

                          )
                        ],
                      ),
                    );
                  },
                );
              }
              else{
                return Center(child: Text('No Products avilable'),);
              }
            }
            else{
              return Center(child: Text('Please wait'),);
            }
            },
      ),
    );
  }
}
