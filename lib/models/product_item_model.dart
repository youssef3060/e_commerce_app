class ProductItemModel {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final bool isFavorite;
  final String category;
  final double averageRate;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.description =
        '''  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 ''',
    required this.price,
    this.isFavorite = false,
    required this.category,
    this.averageRate = 4.5,
  });
}

List<ProductItemModel> dummyProduct = [
  ProductItemModel(
    id: '1',
    name: 'T-shirt',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-white-t-shirtclothingt-shirtt-shirtdressfashionclothshirt-691522330552gz5xe.png',
    price: 120.0,
    category: 'Clothing',
  ),
  ProductItemModel(
    id: '2',
    name: 'Jeans Pants',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-mens-jeansgarmentlower-bodydenimjeansnavy-blue-1421526362794kpmhb.png',
    price: 250.0,
    category: 'Clothing',
  ),
  ProductItemModel(
    id: '3',
    name: 'Leather Belt',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-genuine-crocodile-leather-beltbeltleatherbucklesgenuinecrocodile-14215262880930b76a.png',
    price: 80.0,
    category: 'Accessories',
  ),
  ProductItemModel(
    id: '4',
    name: 'Sunglasses',
    imageUrl: 'https://purepng.com/public/uploads/large/sunglasses-bbp.png',
    price: 150.0,
    category: 'Accessories',
  ),
  ProductItemModel(
    id: '5',
    name: 'Apple',
    imageUrl: 'https://purepng.com/public/uploads/large/big-red-apple-xad.png',
    price: 30.0,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '6',
    name: 'Banana',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-bananasbananabananasyellow-bananabotanically-a-berryedible-fruitherbaceousgenus-musa-1701527188501gstyd.png',
    price: 20.0,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '7',
    name: 'Orange',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-orange-orangeorangefruitbitter-orangeorangesclip-art-17015273374288pjtg.png',
    price: 25.0,
    category: 'Fruits',
  ),
  ProductItemModel(
    id: '8',
    name: 'Tomato',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-tomatotomatotomatossalad-fruitred-fruit-1701527316031ytkdc.png',
    price: 15.0,
    category: 'Vegetables',
  ),
  ProductItemModel(
    id: '9',
    name: 'Cucumber',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-cucumbercucumberfoodvegetablegreen-cucumber-17015272508067ypbj.png',
    price: 10.0,
    category: 'Vegetables',
  ),
  ProductItemModel(
    id: '10',
    name: 'Carrot',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-carrotcarrotdomestic-carrotfast-growingcarrots-1701527243173kqxmu.png',
    price: 12.0,
    category: 'Vegetables',
  ),
  ProductItemModel(
    id: '11',
    name: 'Jacket',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-jacketgarmentupper-bodyjacketlighter-1421526361897tlshz.png',
    price: 350.0,
    category: 'Clothing',
  ),
  ProductItemModel(
    id: '12',
    name: 'Strawberry',
    imageUrl:
        'https://purepng.com/public/uploads/large/purepng.com-red-strawberry-in-white-platefruitsberryberriesstrawberrystrawberriesred-981524759510v6awr.png',
    price: 40.0,
    category: 'Fruits',
  ),
];
