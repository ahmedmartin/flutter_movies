class Popular_person_model {
  int? _page;
  List<Results>? _results;
  int? _totalPages;
  int? _totalResults;

  Popular_person_model(
      {int? page, List<Results>? results, int? totalPages, int? totalResults}) {
    if (page != null) {
      this._page = page;
    }
    if (results != null) {
      this._results = results;
    }
    if (totalPages != null) {
      this._totalPages = totalPages;
    }
    if (totalResults != null) {
      this._totalResults = totalResults;
    }
  }

  int? get page => _page;
  set page(int? page) => _page = page;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalResults => _totalResults;
  set totalResults(int? totalResults) => _totalResults = totalResults;

  Popular_person_model.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this._page;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this._totalPages;
    data['total_results'] = this._totalResults;
    return data;
  }
}

class Results {
  bool? _adult;
  int? _gender;
  int? _id;
  String? _knownForDepartment;
  String? _name;
  double? _popularity;
  String? _profilePath;

  Results(
      {bool? adult,
        int? gender,
        int? id,
        String? knownForDepartment,
        String? name,
        double? popularity,
        String? profilePath}) {
    if (adult != null) {
      this._adult = adult;
    }
    if (gender != null) {
      this._gender = gender;
    }
    if (id != null) {
      this._id = id;
    }
    if (knownForDepartment != null) {
      this._knownForDepartment = knownForDepartment;
    }
    if (name != null) {
      this._name = name;
    }
    if (popularity != null) {
      this._popularity = popularity;
    }
    if (profilePath != null) {
      this._profilePath = profilePath;
    }
  }

  bool? get adult => _adult;
  set adult(bool? adult) => _adult = adult;
  int? get gender => _gender;
  set gender(int? gender) => _gender = gender;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get knownForDepartment => _knownForDepartment;
  set knownForDepartment(String? knownForDepartment) =>
      _knownForDepartment = knownForDepartment;
  String? get name => _name;
  set name(String? name) => _name = name;
  double? get popularity => _popularity;
  set popularity(double? popularity) => _popularity = popularity;
  String? get profilePath => _profilePath;
  set profilePath(String? profilePath) => _profilePath = profilePath;

  Results.fromJson(Map<String, dynamic> json) {
    _adult = json['adult'];
    _gender = json['gender'];
    _id = json['id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _popularity = json['popularity'];
    //if(json['profile_path']!=null)
    _profilePath = 'https://image.tmdb.org/t/p/w500'+json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this._adult;
    data['gender'] = this._gender;
    data['id'] = this._id;
    data['known_for_department'] = this._knownForDepartment;
    data['name'] = this._name;
    data['popularity'] = this._popularity;
    data['profile_path'] = this._profilePath;
    return data;
  }
}
