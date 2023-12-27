import 'package:dio/dio.dart';
import 'package:wallpaper_app/models/photo.dart';
import 'package:wallpaper_app/services/api_response.dart';

class APIService {
  final Dio dio =
      Dio(BaseOptions(baseUrl: "https://api.pexels.com/v1/", headers: {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "y5LAvJ6BT1pFa94qS4PK9RQgRUiX9s1si9P4Ydl3oqPCQXjVrKC4cUCZ"
  }));

  Future<ApiResponse<Photo>> getPhotos(
      {int page = 1, int pageSize = 15, search = ""}) async {
    try {
      var parameters = search == ""
          ? {"page": page, "per_page": pageSize}
          : {
              "query": search,
              "page": page,
              "per_page": pageSize,
            };
      var url = search == "" ? "/curated" : "/search";
      var response = await dio.get(url, queryParameters: parameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Photo> photos = List<Photo>.from(
            response.data["photos"].map((json) => Photo.fromJson(json)));
        return ApiResponse(
            success: true, data: photos, message: "Success get all Photos.");
      }
      return ApiResponse(
          success: false, data: [], message: "Failed get all photos.");
    } on DioException catch (e) {
      return ApiResponse(success: false, data: [], message: e.toString());
    }
  }
}
