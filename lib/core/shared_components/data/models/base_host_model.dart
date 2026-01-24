class BaseHostModel {
 final String name;
 final  String starHost;
 final String joinTime;
 final int trips;
 final String imageUrl;
 final String responseTime;
 final double rate;
 BaseHostModel({required this.name,required this.starHost,required this.joinTime,
   required this.trips,required this.imageUrl, required this.responseTime,required  this.rate, });
 factory BaseHostModel.fromJson(Map<String, dynamic> json) {
  return BaseHostModel(
   name: json['name'] as String,
   starHost: json['starHost'] as String,
   joinTime: json['joinTime'] as String,
   trips: json['trips'] as int,
   imageUrl: json['imageUrl'] as String,
   responseTime: json['responseTime'] as String,
   rate: (json['rate'] as num).toDouble(),
  );
 }
 Map<String, dynamic> toJson() {
  return {
   'name': name,
   'starHost': starHost,
   'joinTime': joinTime,
   'trips': trips,
   'imageUrl': imageUrl,
   'responseTime': responseTime,
   'rate': rate,
  };
 }
}