/// name : "Wheat"
/// scientific_name : "Triticum aestivum"
/// ipni : "TestUpdate"
/// _id : "65d1d91b32bb7d2ea3afc826"
///
///
///
///
///
class CropsListModel {
  List<CropsModel>? cropsList = [];

  CropsListModel({this.cropsList});

  CropsListModel.fromJson(List<dynamic> json) {
    print("Json data : ${json..runtimeType}");
    for (var v in json) {
      print("Crops : ${v}");
      cropsList?.add(CropsModel.fromJson(v));
    }
  }
}

class CropsModel {
  CropsModel({
    String? name,
    String? scientificName,
    var ipni,
    var id,
  }) {
    _name = name;
    _scientificName = scientificName;
    _ipni = ipni;
    _id = id;
  }

  CropsModel.fromJson(dynamic json) {
    _name = json['name'];
    _scientificName = json['scientific_name'];
    _ipni = json['ipni'];
    _id = json['_id'];
  }

  String? _name;
  String? _scientificName;
  String? _ipni;
  var _id;

  CropsModel copyWith({
    String? name,
    String? scientificName,
    String? ipni,
    String? id,
  }) =>
      CropsModel(
        name: name ?? _name,
        scientificName: scientificName ?? _scientificName,
        ipni: ipni ?? _ipni,
        id: id ?? _id,
      );

  String? get name => _name;

  String? get scientificName => _scientificName;

  String? get ipni => _ipni;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['scientific_name'] = _scientificName;
    map['ipni'] = _ipni;
    map['_id'] = _id;
    return map;
  }
}
