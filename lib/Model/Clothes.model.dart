class ClothingItem {
  final String name;
  final double price;
  final String details;
  final String image;

  ClothingItem({
    required this.image,
    required this.name,
    required this.price,
    required this.details,
  });
}

final List<ClothingItem> items = [
  ClothingItem(
      name: 'Casual Blazer',
      price: 19.99,
      details: 'A comfortable cotton t-shirt available in various sizes.',
      image:
          'https://images.bewakoof.com/uploads/grid/app/casual-outfits-for-men-bewakoof-blog-9-1615892381.jpg'),
  ClothingItem(
      name: 'Denim Black Jeans',
      price: 39.99,
      details: 'Stylish denim jeans.',
      image:
          'https://5.imimg.com/data5/LS/IO/EM/SELLER-86680741/mens-denim-black-faded-jeans.jpg'),
  ClothingItem(
      name: 'Black Leather Jacket',
      price: 79.99,
      details: 'A warm and cozy jacket for winter.',
      image:
          'https://assets.ajio.com/medias/sys_master/root/20240502/gFYn/66336b1216fd2c6e6ae2057c/-473Wx593H-466453554-black-MODEL.jpg'),
]; //for all item tab
final List<ClothingItem> dresses = [
  ClothingItem(
      name: 'Georgette Embroidered',
      price:59.99,
      details: 'A comfortable Party wear Dress For Ladies available in various sizes.',
      image:
          'https://5.imimg.com/data5/ANDROID/Default/2021/2/TB/IJ/PZ/29603120/product-jpeg-500x500.jpg'),
  ClothingItem(
      name: 'Indo Western Dress',
      price: 41.99,
      details: ' Digital printed heavy gown with mirror work in beautiful color.',
      image:
          'https://i.pinimg.com/736x/50/1c/7f/501c7f6a458922d63f5279447d4943ea.jpg'),
  ClothingItem(
      name: 'Party Wear Gown',
      price: 62.99,
      details: 'Onion Pink Party Wear Gown For Women',
      image:
          'https://suvidhafashion.com/cdn/shop/files/1090_1_3a1bfc13-533a-4751-a0d3-d872ef9de9f5.jpg?v=1685168428&width=600'),
];//for Dresses tab
final List<ClothingItem> accessories = [
  ClothingItem(
      name: "GOLDEN HOUR Men's Watch",
      price:40.99,
      details: 'GOLDEN HOUR Fashion Business Mens Watches with Stainless Steel Waterproof Chronograph Quartz Watch for Men.',
      image:
          'https://m.media-amazon.com/images/I/717ekHOBJ5L._AC_UY350_.jpg'),
  ClothingItem(
      name: 'Aviator Black Rayban Sunglasses',
      price: 19.99,
      details: 'unisex sunglass uv-ultra voilet glass good quality vision glass.',
      image:
          'https://5.imimg.com/data5/ANDROID/Default/2022/7/LW/UW/FE/19051907/product-jpeg-500x500.jpg'),
  ClothingItem(
      name: 'Leather Green Wallet',
      price: 15.99,
      details: 'Teakwood Men Genuine Leather Bi Fold Wallet (Green)',
      image:
          'https://teakwoodleathers.com/cdn/shop/products/7_397b8a40-01c7-4ecd-8a95-a183fece0361_1080x.jpg?v=1610621687'),
];//for Dresses tab
