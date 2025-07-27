
class HostModel{
  String name;
  String starHost;
  String joinTime;
  int trips;
  String imageUrl;
  String  responseTime;
  double rate;

  HostModel(
  {required this.name,required this.starHost,required this.joinTime, required this.trips,
    required this.imageUrl,
  required this.rate
    ,required this.responseTime});
  static  List<HostModel> fakeHosts = [
    HostModel(
      name: 'Alice Johnson',
      starHost: 'Yes',
      joinTime: 'Joined 2 years ago',
      trips: 125,
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      rate: 4.9,
      responseTime: '1 hour',
    ),
    HostModel(
      name: 'Bob Williams',
      starHost: 'No',
      joinTime: 'Joined 1 year ago',
      trips: 45,
      imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
      rate: 4.5,
      responseTime: '2 hours',
    ),
    HostModel(
      name: 'Charlie Davis',
      starHost: 'Yes',
      joinTime: 'Joined 3 years ago',
      trips: 200,
      imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      rate: 5.0,
      responseTime: '30 minutes',
    ),
    HostModel(
      name: 'Diana Prince',
      starHost: 'Yes',
      joinTime: 'Joined 6 months ago',
      trips: 30,
      imageUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
      rate: 4.8,
      responseTime: '45 minutes',
    ),
    HostModel(
      name: 'Eve Adams',
      starHost: 'No',
      joinTime: 'Joined 9 months ago',
      trips: 60,
      imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
      rate: 4.2,
      responseTime: '5 hours',
    ),
  ];

}