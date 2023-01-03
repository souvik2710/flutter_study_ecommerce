import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'banners_model.dart';


final apiProvider = Provider<ApiProvider>((ref){
  return ApiProvider(ref:ref);
});
class ApiProvider{
  Ref ref;
  ApiProvider({required this.ref});

  Future<List<BannersModel>> fetchAllbannerPhotos() async {
    // final nn = ref!.read(flavorProvider)!.baseUrl;
    debugPrint("check2222");
    final thisUrl = "https://run.mocky.io/v3/ea911316-6642-4f47-8f68-5ff7637f5b73";
    final response =
    await http.get(Uri.parse(thisUrl),);
    debugPrint('%%%%%%%%%%%%%%$response%%%%%');
    final responseString = jsonDecode(response.body);
    debugPrint('########$responseString########');
    debugPrint('${response.statusCode}');
    if (response.statusCode == 200) {
      debugPrint('%%%%%%%%%%${response.statusCode}%%%%%%%%%%');
      List<BannersModel> listPhotoModel = List<BannersModel>.from(responseString.map((model)=>BannersModel.fromJson(model)));
      return listPhotoModel;
    } else {
      throw Exception('failed to load photos ');
    }
  }

}
