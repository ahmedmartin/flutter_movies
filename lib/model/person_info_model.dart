class Person_info_model {
  bool? _adult;
  List<String>? _alsoKnownAs;
  String? _biography;
  String? _birthday;//
  String? _deathday;//
  int? _gender;//
  int? _id;
  String? _imdbId;
  String? _knownForDepartment;//
  String? _name;//
  String? _placeOfBirth;//
  double? _popularity;//
  String? _profilePath;
  Images? _images;

  Person_info_model(
      {bool? adult,
        List<String>? alsoKnownAs,
        String? biography,
        String? birthday,
        String? deathday,
        int? gender,
        int? id,
        String? imdbId,
        String? knownForDepartment,
        String? name,
        String? placeOfBirth,
        double? popularity,
        String? profilePath,
        Images? images}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (alsoKnownAs != null) {
      this._alsoKnownAs = alsoKnownAs;
    }
    if (biography != null) {
      this._biography = biography;
    }
    if (birthday != null) {
      this._birthday = birthday;
    }
    if (deathday != null) {
      this._deathday = deathday;
    }
    if (gender != null) {
      this._gender = gender;
    }

    if (id != null) {
      this._id = id;
    }
    if (imdbId != null) {
      this._imdbId = imdbId;
    }
    if (knownForDepartment != null) {
      this._knownForDepartment = knownForDepartment;
    }
    if (name != null) {
      this._name = name;
    }
    if (placeOfBirth != null) {
      this._placeOfBirth = placeOfBirth;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (profilePath != null) {
      this._profilePath = profilePath;
    }
    if (images != null) {
      this._images = images;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  List<String>? get alsoKnownAs => _alsoKnownAs;
  set alsoKnownAs(List<String>? alsoKnownAs) => _alsoKnownAs = alsoKnownAs;
  String? get biography => _biography;
  set biography(String? biography) => _biography = biography;
  String? get birthday => _birthday;
  set birthday(String? birthday) => _birthday = birthday;
  String? get deathday => _deathday;
  set deathday(String? deathday) => _deathday = deathday;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get imdbId => _imdbId;
  set imdbId(String? imdbId) => _imdbId = imdbId;
  String? get knownForDepartment => _knownForDepartment;
  set knownForDepartment(String? knownForDepartment) =>
      _knownForDepartment = knownForDepartment;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get placeOfBirth => _placeOfBirth;
  set placeOfBirth(String? placeOfBirth) => _placeOfBirth = placeOfBirth;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get profilePath => _profilePath;
  set profilePath(String? profilePath) => _profilePath = profilePath;
  Images? get images => _images;
  set images(Images? images) => _images = images;

  Person_info_model.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _alsoKnownAs = json['also_known_as'].cast<String>();
    _biography = json['biography'].toString();
    _birthday = json['birthday'].toString();
    _deathday = json['deathday'];
    _gender = json['gender'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _knownForDepartment = json['known_for_department'].toString();
    _name = json['name'].toString();
    _placeOfBirth = json['place_of_birth'];
    _popularity = json['popularity'];
    _profilePath = 'https://image.tmdb.org/t/p/w500'+json['profile_path'].toString();
    _images =
    json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['also_known_as'] = this._alsoKnownAs;
    data['biography'] = this._biography;
    data['birthday'] = this._birthday;
    data['deathday'] = this._deathday;
    data['gender'] = this._gender;
    data['id'] = this._id;
    data['imdb_id'] = this._imdbId;
    data['known_for_department'] = this._knownForDepartment;
    data['name'] = this._name;
    data['place_of_birth'] = this._placeOfBirth;
    data['popularity'] = this._popularity;
    data['profile_path'] = this._profilePath;
    if (this._images != null) {
      data['images'] = this._images!.toJson();
    }
    return data;
  }
}

class Images {
  List<Profiles>? _profiles;

  Images({List<Profiles>? profiles}) {
    if (profiles != null) {
      this._profiles = profiles;
    }
  }

  List<Profiles>? get profiles => _profiles;
  set profiles(List<Profiles>? profiles) => _profiles = profiles;

  Images.fromJson(Map<String, dynamic> json) {
    if (json['profiles'] != null) {
      _profiles = <Profiles>[];
      json['profiles'].forEach((v) {
        _profiles!.add(new Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._profiles != null) {
      data['profiles'] = this._profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  double? _aspectRatio;
  int? _height;
  Null? _iso6391;
  String? _filePath;
  double? _voteAverage;
  int? _voteCount;
  int? _width;

  Profiles(
      {double? aspectRatio,
        int? height,
        Null? iso6391,
        String? filePath,
        double? voteAverage,
        int? voteCount,
        int? width}) {
    if (aspectRatio != null) {
      this._aspectRatio = aspectRatio;
    }
    if (height != null) {
      this._height = height;
    }
    if (iso6391 != null) {
      this._iso6391 = iso6391;
    }
    if (filePath != null) {
      this._filePath = filePath;
    }
    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
    if (voteCount != null) {
      this._voteCount = voteCount;
    }
    if (width != null) {
      this._width = width;
    }
  }

  double? get aspectRatio => _aspectRatio;
  set aspectRatio(double? aspectRatio) => _aspectRatio = aspectRatio;
  int? get height => _height;
  set height(int? height) => _height = height;
  Null? get iso6391 => _iso6391;
  set iso6391(Null? iso6391) => _iso6391 = iso6391;
  String? get filePath => _filePath;
  set filePath(String? filePath) => _filePath = filePath;
  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;
  int? get voteCount => _voteCount;
  set voteCount(int? voteCount) => _voteCount = voteCount;
  int? get width => _width;
  set width(int? width) => _width = width;

  Profiles.fromJson(Map<String, dynamic> json) {
    _aspectRatio = json['aspect_ratio'];
    _height = json['height'];
    _iso6391 = json['iso_639_1'];
    _filePath = 'https://image.tmdb.org/t/p/w500'+json['file_path'].toString();
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
    _width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this._aspectRatio;
    data['height'] = this._height;
    data['iso_639_1'] = this._iso6391;
    data['file_path'] = this._filePath;
    data['vote_average'] = this._voteAverage;
    data['vote_count'] = this._voteCount;
    data['width'] = this._width;
    return data;
  }
}
