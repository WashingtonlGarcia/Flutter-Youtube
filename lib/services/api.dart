import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAFhXFJCB1K95YdZZadWPQ9jLJ8rObKDgo";
const ID_CANAL = "UCSfwM5u0Kce6Cce8_S72olg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisar) async {
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

      /* for(var video in dadosJson["items"])
      {

      }
      //print("R:"+dadosJson["items"][0]["snippet"]["title"].toString());*/
    } else {}
  }
}
