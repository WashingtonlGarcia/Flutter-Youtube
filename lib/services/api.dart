import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDfnbRwNlFrfNWrVJspeo_vMG66sOMMa4I";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future <List<Video>>pesquisar(String pesquisar) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisar");
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos =
          dadosJson["items"].map<Video>((map) => Video.fromJson(map)).toList();
      return videos;

      /*for(var video in videos)
      {
        print(video.imagem);
      }*/
      /* for(var video in dadosJson["items"])
      {

      }
    print("R:"+dadosJson["items"][0]["snippet"]["title"].toString());*/
    } else {}
  }
}
