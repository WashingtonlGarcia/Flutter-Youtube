class Video {
  String id;
  String titulo;
  String imagem;
  String canal;

  Video({this.id, this.titulo, this.imagem, this.canal});

  /*static converterJson(Map<String,dynamic> json)
  {
    return Video(
    id:json["id"]["videoId"],
    titulo:json["snippet"]["title"],
    imagem: json["snippet"]["thumbnails"]["high"]["url"],
    canal:json["snippet"]["channelId"]
    );

  }*/

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"]["videoId"],
        titulo: json["snippet"]["title"],
        imagem: json["snippet"]["thumbnails"]["high"]["url"],
        canal: json["snippet"]["channelId"]);
  }
  /*
  set id(String value) {
    this._id = value;
  }

  String get id => _id;

  set titulo(String value) {
    this._titulo = value;
  }

  String get titulo => _titulo;

  set imagem(String value) {
    this._imagem = value;
  }

  String get imagem => _imagem;

  set canal(String value) {
    this._canal = value;
  }

  String get canal => _canal;

  Map<String, dynamic> jsonTo() {
    return {
      "id": _id,
      "titulo":_titulo,
      "imagem":_imagem,
      "canal":_canal
    };
  }*/
}
