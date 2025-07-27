import 'dart:math';

class CarModel{
  String name;
  double price;
  double rate;
  int trips;
  List<String> imagesUrl;
  CarModel({required this.name,required this.price,
    required this.rate,required this.trips,required this.imagesUrl});
  // fake data
  static List<CarModel> generateFakeCarData({int count = 5}) {
    final List<CarModel> cars = [];
    final Random random = Random();

    final List<String> carNames = [
      'Toyota Camry', 'Honda Civic', 'Ford Mustang', 'Tesla Model 3',
      'BMW 3 Series', 'Mercedes-Benz C-Class', 'Audi A4', 'Hyundai Elantra',
      'Nissan Altima', 'Chevrolet Malibu', 'Volkswagen Jetta', 'Subaru Outback'
    ];

    final List<List<String>> sampleImageUrls = [
      [
        'https://www.bmw.com/content/dam/bmw/common/all-models/m-series/m4-coupe/2023/images/M4_Coupe_M_Motorsport_Anniversary_Emblem_01.jpg',
        'https://www.mercedes-benz.co.uk/content/dam/mb-site/vehicles/2023/c-class/saloon/w206/ext/c-class-saloon-w206-ext-01-mercedes-benz-uk.jpg',
        'https://st.depositphotos.com/1001099/3358/i/450/depositphotos_33589999-stock-photo-red-sports-car.jpg',
        'https://hips.hearstapps.com/hmg-prod/images/2024-kia-ev9-gt-line-awd-114-1698254427.jpg?crop=0.803xw:0.602xh;0.0927xw,0.398xh&resize=1200:*',
        'https://assets.audi.com/etc/designs/audi/nz/nz-audi-com/model-pages/a4/desktop/a4-gallery-01.jpg',
        'https://www.tesla.com/sites/default/files/images/model-3/design/Model_3_homepage_design_desktop_large.jpg',
        'https://www.ford.com/is/image/content/dam/vdm_ford/live/en_us/ford/nameplate/mustang/2024/cutaways/24_MUS_GT_Prem_Cpe_45939_MD_C.tif?croptool=1&width=900',
        'https://img.wheelz.me/wp-content/uploads/2023/08/2024-Porsche-911-S-T-1-1280x720.jpg',
      ],

    ];

    for (int i = 0; i < count; i++) {
      cars.add(
        CarModel(
          name: carNames[random.nextInt(carNames.length)],
          price: (random.nextDouble() * 100 + 30).roundToDouble(), // Price between 30 and 130
          rate: (random.nextDouble() * 2 + 3).roundToDouble(), // Rate between 3.0 and 5.0
          trips: random.nextInt(200) + 10, // Trips between 10 and 210
          imagesUrl: sampleImageUrls[random.nextInt(sampleImageUrls.length)],
        ),
      );
    }
    return cars;
  }
}