import 'package:car_rental/features/home/data/models/brand_model.dart';
import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class BrandRemoteDataSource{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<BrandModel>> getBrands() async{
      List<BrandModel> brands=[];

      await   _firestore.collection('brand').get() .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          brands.add(doc.data() as BrandModel);
        });
      }) ;

      return brands;
    }
  }