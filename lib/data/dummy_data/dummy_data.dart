import 'package:tasty_dinery/features/client/shop/models/banner_model.dart';
import 'package:tasty_dinery/features/client/shop/models/category_model.dart';
import 'package:tasty_dinery/features/client/shop/models/product_model.dart';
import 'package:tasty_dinery/routes/routes.dart';
import 'package:tasty_dinery/utils/constants/image_strings.dart';

class CcDummyData {
  // banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: CcImages.promoBanner3,
        targetScreen: CcRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: CcImages.promoBanner3,
        targetScreen: CcRoutes.favorites,
        active: true),
    BannerModel(
        imageUrl: CcImages.promoBanner3,
        targetScreen: CcRoutes.search,
        active: true),
  ];

  // user

  // cart

  // order

  // products
  static final List<ProductModel> products = [
    ProductModel(
      id: '3',
      title: 'Vegetable Rice With Chicken Stew',
      stock: 20,
      price: 12000,
      isFeatured: true,
      thumbnail: CcImages.productImage3,
      description:
          'Indian flavored Rice that will mesmerize your brain with a touch of its taste',
      brand: '#rice #chicken',
      images: [
        CcImages.productImage0003,
        CcImages.productImage003,
        CcImages.productImage03,
      ],
      salePrice: 12000,
      categoryid: '3',
      productType: 'single',
    ),
    ProductModel(
      id: '4',
      title: 'Githeri (Kande)',
      stock: 10,
      price: 2000,
      isFeatured: true,
      thumbnail: CcImages.productImage4,
      description:
          'Get a tast of the Swahili local food with its taste not only being cooked using coconut cream and sugar but also other sauce',
      brand: '#maize, #beans',
      images: [
        CcImages.productImage04,
        CcImages.productImage04,
      ],
      salePrice: 2000,
      categoryid: '3',
      productType: 'single',
    ),
    ProductModel(
      id: '5',
      title: 'Biryani',
      stock: 5,
      price: 10000,
      isFeatured: true,
      thumbnail: CcImages.productImage5,
      description:
          'Indian flavored Rice that will mesmerize your brain with a touch of its taste',
      brand: '#rice #chicken ',
      images: [
        CcImages.productImage05,
        CcImages.productImage05,
      ],
      salePrice: 10000,
      categoryid: '3',
      productType: 'single',
    ),
    ProductModel(
      id: '7',
      title: 'Samosas',
      stock: 30,
      price: 500,
      isFeatured: true,
      thumbnail: CcImages.productImage7,
      description: 'Bites for appetizer and tea break',
      brand: '#flour #potatos #beef',
      images: [
        CcImages.productImage7,
        CcImages.productImage7,
      ],
      salePrice: 10000,
      categoryid: '1',
      productType: 'single',
    ),
    // ProductModel(
    //   id: '13',
    //   title: 'Soup',
    //   stock: 10,
    //   price: 2500,
    //   isFeatured: true,
    //   thumbnail: CcImages.productImage13,
    //   description:
    //       'a soup made from beef, simmered in water, usually with various other ingredients. The classic beef soup consists of a clear beef broth, often with pieces of beef and/or vegetables',
    //   brand: '#soup #beef ',
    //   images: [
    //     CcImages.productImage13,
    //     CcImages.productImage13,
    //   ],
    //   salePrice: 2500,
    //   categoryid: '1',
    //   productType: 'single',
    // ),
  ];

  // categories
  static final List<CategoryModel> categories = [
    //--------------------------------------------------------------------------
    // parent categories
    CategoryModel(
      id: '3',
      name: 'Meal',
      image: CcImages.riceIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Beverage',
      image: CcImages.beverageIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '1',
      name: 'Breakfast',
      image: CcImages.teaIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Juice',
      image: CcImages.smoothiesIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Milk',
      image: CcImages.milkIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Fruits',
      image: CcImages.fruitsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Chips',
      image: CcImages.friesIcon,
      isFeatured: true,
    ),
    //--------------------------------------------------------------------------

    // sub categories

    //------------meal subcategories--------------------------------------------
    CategoryModel(
      id: '8',
      name: 'Ugali',
      image: CcImages.riceIcon,
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      name: 'Rice',
      image: CcImages.riceIcon,
      parentId: '3',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      name: 'Plantains',
      image: CcImages.riceIcon,
      parentId: '3',
      isFeatured: false,
    ),

    //--------------------------------------------------------------------------

    //------------beverage subcategories----------------------------------------
    CategoryModel(
      id: '11',
      name: 'Pepsi',
      image: CcImages.beverageIcon,
      parentId: '7',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      name: 'CocaCola',
      image: CcImages.beverageIcon,
      parentId: '7',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      name: 'TakeAway',
      image: CcImages.beverageIcon,
      parentId: '7',
      isFeatured: false,
    ),
    //--------------------------------------------------------------------------

    //------------breakfast subcategories---------------------------------------
    CategoryModel(
      id: '14',
      name: 'Tea',
      image: CcImages.teaIcon,
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '15',
      name: 'Soup',
      image: CcImages.teaIcon,
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '16',
      name: 'Bites',
      image: CcImages.teaIcon,
      parentId: '1',
      isFeatured: false,
    ),

    //--------------------------------------------------------------------------

    //------------juice subcategories-------------------------------------------

    CategoryModel(
      id: '17',
      name: 'Smoothie',
      image: CcImages.smoothiesIcon,
      parentId: '6',
      isFeatured: false,
    ),
    CategoryModel(
      id: '18',
      name: 'Mix',
      image: CcImages.smoothiesIcon,
      parentId: '6',
      isFeatured: false,
    ),

    //--------------------------------------------------------------------------

    //------------milk subcategories--------------------------------------------
    CategoryModel(
      id: '19',
      name: 'Fresh',
      image: CcImages.milkIcon,
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '20',
      name: 'Mtindi',
      image: CcImages.milkIcon,
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '21',
      name: 'Yogurt',
      image: CcImages.milkIcon,
      parentId: '5',
      isFeatured: false,
    ),

    //--------------------------------------------------------------------------

    //------------fruits subcategories------------------------------------------
    CategoryModel(
      id: '22',
      name: 'Mix',
      image: CcImages.fruitsIcon,
      parentId: '2',
      isFeatured: false,
    ),

    //--------------------------------------------------------------------------

    //------------chips subcategories-------------------------------------------
    CategoryModel(
      id: '23',
      name: 'French Fries',
      image: CcImages.friesIcon,
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '24',
      name: 'Beef Skewers',
      image: CcImages.friesIcon,
      parentId: '4',
      isFeatured: false,
    ),
    CategoryModel(
      id: '25',
      name: 'Chicken Skewers',
      image: CcImages.friesIcon,
      parentId: '4',
      isFeatured: false,
    ),
  ];
}
