import 'dart:convert';
import 'package:betweener/core/helper/api_helper.dart';
import 'package:betweener/core/network/models/link_model.dart';
import 'package:http/http.dart' as http;

import '../models/api_response.dart';
import 'api_setting.dart';

class ApiLinkController with ApiHelper {
  Future<List<Links>> getUserLink() async {
    Uri uri = Uri.parse(ApiSetting.link);
    var response = await http.get(
      uri,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var dataJsonObj = json['links'] as List;
      return dataJsonObj.map((dataJson) => Links.fromJson(dataJson)).toList();
    }
    return [];
  }

  Future<ApiResponse> addNewLink(
      {required Links links}) async {
    Uri uri = Uri.parse(ApiSetting.link);
    var response = await http.post(uri, body: {
      'title': links.title,
      'link': links.link,
      'isActive': links.isActive
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      var json = jsonDecode(response.body);

      return ApiResponse(json['message'], json['errors']);
    }
    return errorResponse;
  }

  Future<ApiResponse> updateLink({required int id}) async {
    Uri uri = Uri.parse(ApiSetting.link.replaceFirst('{id}', id.toString()));
    var response = await http.put(
      uri,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse> deleteLink({required int id}) async {
    Uri uri = Uri.parse(ApiSetting.link.replaceFirst('{id}', id.toString()));
    var response = await http.delete(
      uri,
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ApiResponse(json['message'], json['status']);
    }
    return errorResponse;
  }
}

