import 'package:flutter/material.dart';
import 'package:youtube/models/Video.dart';
import '../../services/api.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String value) {
    Api api = Api();
    return api.pesquisar(value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];
                  return GestureDetector(
                    onTap: () {
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE_API,
                            videoId: video.id,
                          autoPlay: true,
                          fullScreen: true);
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.none,
                            image: NetworkImage(video.imagem),
                          )),
                        ),
                        ListTile(
                          onTap: () {},
                          title: Text(video.titulo),
                          subtitle: Text(video.descricao),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    new Divider(height: 20, color: Colors.transparent),
                itemCount: snapshot.data.length,
              );
            }
            return Center(
              child: Text("Nenhum dado a ser exibido!"),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
        }
      },
    );
  }
}
