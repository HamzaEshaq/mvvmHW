class Product{
  late int id;
  late double price;
  late String title, description, category, thumbnail;

  Product.fromAPI(Map<String, dynamic> item){
    id = item['id'];
    price = item['price'];
    title = item['title'];
    description = item ['description'];
    category = item ['category'];
    thumbnail = item ['thumbnail'];
  }
}