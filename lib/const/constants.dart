import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/const/resource.dart';
import 'package:fashion_app/src/categories/models/categories_model.dart';
import 'package:fashion_app/src/products/models/products_model.dart';
import 'package:flutter/material.dart';

LinearGradient kGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Kolors.kPrimaryLight,
    Kolors.kWhite,
    Kolors.kPrimary,
  ],
);

LinearGradient kPGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Kolors.kPrimaryLight,
    Kolors.kPrimaryLight.withOpacity(0.7),
    Kolors.kPrimary,
  ],
);

LinearGradient kBtnGradient = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.bottomRight,
  colors: [
    Kolors.kPrimaryLight,
    Kolors.kWhite,
  ],
);

BorderRadiusGeometry kClippingRadius = const BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
);

BorderRadiusGeometry kRadiusAll = BorderRadius.circular(12);

BorderRadiusGeometry kRadiusTop = const BorderRadius.only(
  topLeft: Radius.circular(9),
  topRight: Radius.circular(9),
);

BorderRadiusGeometry kRadiusBottom = const BorderRadius.only(
  bottomLeft: Radius.circular(12),
  bottomRight: Radius.circular(12),
);

Widget Function(BuildContext, String)? placeholder = (p0, p1) => Image.asset(
      R.ASSETS_IMAGES_PLACEHOLDER_WEBP,
      fit: BoxFit.cover,
    );

Widget Function(BuildContext, String, Object)? errorWidget =
    (p0, p1, p3) => Image.asset(
          R.ASSETS_IMAGES_PLACEHOLDER_WEBP,
          fit: BoxFit.cover,
        );

List<String> images = [
  "https://hacom.vn/media/lib/02-01-2025/acerluckyseven.jpg",
  "https://hanoicomputercdn.com/media/banner/18_Decb4cd7e94ed46a0404b5f2ebd04464603.png",
  "https://hanoicomputercdn.com/media/banner/13_Dec89c4dd52e7d96e6e95f1a8354aaa78a4.jpg",
  "https://hanoicomputercdn.com/media/banner/23_Decb20be5a3d309d95342d3db285886c030.jpg",
  "https://hanoicomputercdn.com/media/banner/02_Jan521e60d1acf44cf1ace523e4938f820f.jpg",
  "https://hanoicomputercdn.com/media/banner/29_Oct654fee694f54cd43429b114d2a69a79f.png",
  "https://hanoicomputercdn.com/media/banner/06_Dec7725dfcbccc58917bf519535ab07d3b3.jpg",
  "https://hanoicomputercdn.com/media/banner/22_Dec6b24f127afb616dc853699044842ef9e.png",
  "https://hanoicomputercdn.com/media/banner/31_Dec6734f2b81815a8fdcc4f8edcb5cc59f4.jpg",
  "https://hanoicomputercdn.com/media/banner/26_Dec8d55703eadb23fe46202d8a07e43e9a3.jpg",
];

// [{"title":"Sneakers","id":3,"imageUrl":"https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Frunning_shoe.svg?alt=media&token=0dcb0e57-315e-457c-89dc-1233f6421368"},{"title":"T-Shirts","id":5,"imageUrl":"https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjersey.svg?alt=media&token=6ca7eabd-54b3-47bb-bb8f-41c3a8920171"},{"title":"Jackets","id":4,"imageUrl":"https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjacket.svg?alt=media&token=ffdc9a1e-917f-4e8f-b58e-4df2e6e8587e"},{"title":"Dresses","id":2,"imageUrl":"https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fdress.svg?alt=media&token=cf832383-4c8a-4ee1-9676-b66c4d515a1c"},{"title":"Pants","id":1,"imageUrl":"https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjeans.svg?alt=media&token=eb62f916-a4c2-441a-a469-5684f1a62526"}]

List<Categories> categories = [
  Categories(
      title: "Pants",
      id: 1,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjeans.svg?alt=media&token=eb62f916-a4c2-441a-a469-5684f1a62526"),
  Categories(
      title: "T-Shirts",
      id: 5,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjersey.svg?alt=media&token=6ca7eabd-54b3-47bb-bb8f-41c3a8920171"),
  Categories(
      title: "Sneakers",
      id: 3,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Frunning_shoe.svg?alt=media&token=0dcb0e57-315e-457c-89dc-1233f6421368"),
  Categories(
      title: "Dresses",
      id: 2,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fdress.svg?alt=media&token=cf832383-4c8a-4ee1-9676-b66c4d515a1c"),
  Categories(
      title: "Jackets",
      id: 4,
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjacket.svg?alt=media&token=ffdc9a1e-917f-4e8f-b58e-4df2e6e8587e")
];

// var products = [
//   {
//     "id": 3,
//     "title": "Converse Chuck Taylor All Star",
//     "price": 60.0,
//     "description":
//         "The classic Chuck Taylor All Star sneaker from Converse, featuring a timeless design and comfortable fit.",
//     "is_featured": true,
//     "clothesType": "kids",
//     "ratings": 4.333333333333333,
//     "colors": ["black", "white", "red"],
//     "imageUrls": [
//       "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
//       "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
//     ],
//     "sizes": ["7", "8", "9", "10", "11"],
//     "created_at": "2024-06-06T07:57:45Z",
//     "category": 3,
//     "brand": 1
//   },
//   {
//     "id": 1,
//     "title": "LV Trainers",
//     "price": 798.88,
//     "description":
//         "LV Trainers blend sleek style with athletic functionality, featuring bold logos, premium materials, and comfortable designs that elevate your everyday look with a touch of luxury.",
//     "is_featured": true,
//     "clothesType": "women",
//     "ratings": 4.5,
//     "colors": ["white", "black", "red"],
//     "imageUrls": [
//       "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
//       "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
//     ],
//     "sizes": ["7", "8", "9", "10", "11"],
//     "created_at": "2024-06-06T07:49:15Z",
//     "category": 3,
//     "brand": 1
//   },
//   {
//     "id": 2,
//     "title": "Adidas Ultraboost",
//     "price": 180.0,
//     "description":
//         "xperience the comfort and energy return of the Ultraboost, designed for running and everyday wear.",
//     "is_featured": true,
//     "clothesType": "unisex",
//     "ratings": 5.0,
//     "colors": ["navy", "grey", "blue"],
//     "imageUrls": [
//       "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
//       "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
//     ],
//     "sizes": ["7", "8", "9", "10", "11"],
//     "created_at": "2024-06-06T07:55:20Z",
//     "category": 3,
//     "brand": 1
//   }
// ];

// List<Products> products = [
//   Products(

//         id: 6,
//         title: "Laptop Acer Gaming Aspire 7 A715-76G-59MW (NH.QMYSV.001) (Geforce RTX2050 4G/i5 12450H/8GB RAM/512GB SSD/15.6 inch FHD//Win11/Đen/Vỏ nhôm)",
//         price: 2200.0,
//         description:
//         "Thông số sản phẩm\r\n\r\nCPU: Intel Core i5 12450H\r\nRAM: 8GB (1x 8GB) DDR4-3200MHz (2 khe) (Tối đa 32GB)\r\nỔ cứng: 512GB SSD M.2 2280 PCIe NVMe\r\nVGA: NVIDIA GeForce RTX 2050 4GB\r\nMàn hình: 15.6 inch FHD IPS (1920 x 1080) Slim Benzel 144Hz; ComfyView IPS LED\r\nMàu: Đen\r\nChất liệu: Nhôm\r\nOS: Windows 11 Home",
//         isFeatured: false,
//         productType: "Văn phòng",
//         rating: 4.0,
//         imageUrls: "https://hanoicomputercdn.com/media/product/74893_laptop_acer_gaming_aspire_7_a715_76_57cy__9_.jpg",
//         createdAt: DateTime.parse("2024-12-22T17:12:22Z"),
//         category: 2,
//         brand: 7
//   ),
//   Products(
//       id: 1,
//       title: "LV Trainers",
//       price: 798.88,
//       description:
//           "LV Trainers blend sleek style with athletic functionality, featuring bold logos, premium materials, and comfortable designs that elevate your everyday look with a touch of luxury.",
//       isFeatured: true,
//       productType: "women",
//       rating: 4.5,

//       imageUrls: [
//         "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
//         "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
//       ],
//       createdAt: DateTime.parse("2024-06-06T07:49:15Z"),
//       category: 3,
//       brand: 1),
//   Products(
//       id: 2,
//       title: "Adidas Ultraboost",
//       price: 180.0,
//       description:
//           "Experience the comfort and energy return of the Ultraboost, designed for running and everyday wear.",
//       isFeatured: true,
//       productType: "unisex",
//       rating: 5.0,
//       colors: ["navy", "grey", "blue"],
//       imageUrls: [
//         "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp",
//         "https://media.cnn.com/api/v1/images/stellar/prod/220210051008-04-lv-virgil-abloh.jpg?q=w_2000,c_fill/f_webp"
//       ],
//       sizes: ["7", "8", "9", "10", "11"],
//       createdAt: DateTime.parse("2024-06-06T07:55:20Z"),
//       category: 3,
//       brand: 1)
// ];

String avatar =
    'https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Favatar.png?alt=media&token=7da81de9-a163-4296-86ac-3194c490ce15';
