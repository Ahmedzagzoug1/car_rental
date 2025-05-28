class CarModel{

  final String name;
  final double rating;
  final String availability;
  final double price;
  final String image;

  CarModel({required this.name, required this.
  rating, required this.availability, required this.price, required this.image});
  static final  cars=[
CarModel(   name: 'Tesla Model X',
    rating: 5.0,
    availability: 'Available from 2 August',
    price: 28.32,
    image: 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Tesla_Model_X_02_2013.jpg'),
    CarModel(   name: 'Tesla Model 3',
        rating: 4.0,
        availability: 'Available from 9 August',
        price: 22.32,
        image: 'https://upload.wikimedia.org/wikipedia/commons/e/e6/Tesla_Model_X_02_2013.jpg'),
  ];
}