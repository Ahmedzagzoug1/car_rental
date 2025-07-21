
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
}