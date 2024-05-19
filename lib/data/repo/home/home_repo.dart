import 'package:api_service_interceptor/api_service_interceptor.dart';
import 'package:cubit_practice/core/global/constant/api_url.dart';

class HomeRepo{
  ApiServiceInterceptor apiService;
  HomeRepo({required this.apiService});

  /// ------------------- this method is used to get user data
  Future<ApiResponseModel> getUserData() async{
    String url = "${ApiUrl.baseUrl}${ApiUrl.userEndPoint}";
    print("------------------ url: $url");

    ApiResponseModel responseModel = await apiService.requestToServer(
      requestUrl: url,
      requestMethod: ApiRequestMethod.getRequest
    );
    print("------------------- status code: ${responseModel.statusCode}");
    print("------------------- response data: ${responseModel.responseJson}");

    return responseModel;
  }
}