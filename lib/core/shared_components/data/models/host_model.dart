class HostModel {
 final String name;
 final  String starHost;
 final String joinTime;
 final int trips;
 final String imageUrl;
 final String responseTime;
 final double rate;
 HostModel({required this.name,required this.starHost,required this.joinTime,
   required this.trips,required this.imageUrl, required this.responseTime,required  this.rate, });
 factory HostModel.fromJson(Map<String, dynamic> json) {
  return HostModel(
   name: json['name'] as String,
   starHost: json['star_host'] as String,
   joinTime: json['join_time'] as String,
   trips: json['trips'] as int,
   imageUrl: json['image_url'] as String,
   responseTime: json['response_time'] as String,
   rate: (json['rate'] as num).toDouble(),
  );
 }
 Map<String, dynamic> toJson() {
  return {
   'name': name,
   'star_host': starHost,
   'join_time': joinTime,
   'trips': trips,
   'image_url': imageUrl,
   'response_time': responseTime,
   'rate': rate,
  };
 }
}