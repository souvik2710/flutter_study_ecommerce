import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'api_provider_file.dart';
import 'banners_model.dart';


final viewModelHomeProvider=ChangeNotifierProvider<ViewModelHome>((ref) {
  return ViewModelHome(ref:ref);
});
class ViewModelHome extends ChangeNotifier {
  Ref ref;
  ApiProvider?repo;

  ViewModelHome( {required this.ref})
  {
    repo = ref.read(apiProvider);
  }
  bool isloading = false;
  List<BannersModel> listBannerModel=[];

  Future<void> vmFetchAllbannerPhotos() async {
    try {
      isloading = true;
      notifyListeners();
      listBannerModel = await repo!.fetchAllbannerPhotos();
    }catch(e)
    {
      debugPrint("-----$e---------");
    }
    finally{
      isloading=false;
      notifyListeners();
    }
  }
}