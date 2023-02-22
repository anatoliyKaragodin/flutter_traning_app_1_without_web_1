import 'package:flutter_traning_app_1/data/shared_preferences.dart';

import 'package:dio/dio.dart';
import 'package:flutter_traning_app_1/main.dart';
import 'package:flutter_traning_app_1/riverpod/riverpod.dart';

import '../models/server_responce_model.dart';

class GetUrl {
  String url = '';

  /// Get request to server
  /// Return url from json
  Future<String?> getHttp(
      {required String advertisingId, required String timezone}) async {
    String siteName = 'seriouss.xyz/';
    String app = 'com.test123';
    final _url = await LocalData().getUrl();
    print('LOAD URL: $_url');

    url = _url;
    print('SET URL: $url');
    print('_________________HOME PAGE: ${container.read(homePageProvider)}');

    /// We make request if we have advertisingId and timezone
    /// and don't have url yet
    if (advertisingId != '' && timezone != 'Unknown' && url == '') {
      try {
        var response = await Dio().get(
            'https://$siteName?usserid=$advertisingId&getz=$timezone&app=$app');

        /// Json from server to our model
        ServerResponseModel userData =
            ServerResponseModel.fromJson(response.data);
        url = userData.url;

        /// Save url in local storage
        await LocalData().setUrl(url);

        /// Load url from local storage
        String newUrl = await LocalData().getUrl();
        if(newUrl != '') {container.read(homePageProvider.notifier).update((state) => 1);
        }
        /// Check that we do one request to server(it must be printed one time)
        print('Url from sever: $newUrl');

        return newUrl;
      } catch (e) {
        /// TODO: add error riverpod
        print(e);
      }
    }
    else if(url != '') {
      return url;
    }
    return '';
  }
}
