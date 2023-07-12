import 'package:betweener/core/network/api_setting/api_link_controller.dart';
import 'package:betweener/core/network/models/link_model.dart';
import 'package:flutter/cupertino.dart';
import '../network/models/api_response.dart';

class LinkProviderController extends ChangeNotifier {
  final ApiLinkController _apiController = ApiLinkController();

  List<Links> linkF = <Links>[];



  void read() async {
    linkF = await _apiController.getUserLink();
    notifyListeners();
  }

  Future<ApiResponse> addLink({required Links links}) async {
    ApiResponse apiResponse = await _apiController.addNewLink(links: links);
    if (apiResponse.success) {
      linkF.add(links);
      notifyListeners();
    }
    return apiResponse;
  }

  Future<ApiResponse> deletedImage(int index) async {
    ApiResponse apiResponse =
        await _apiController.deleteLink(id: linkF[index].id!);
    if (apiResponse.success) {
      linkF.removeAt(index);
      notifyListeners();
    }
    return apiResponse;
  }
}
