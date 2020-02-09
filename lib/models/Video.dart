class Video {
  String _id;
  String _titulo;
  String _imagem;
  String _canal;

  Video(this._id, this._titulo, this._imagem, this._canal);

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
}
