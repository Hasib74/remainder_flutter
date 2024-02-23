/// name : "string"
/// _id : "5eb7cf5a86d9755df3a6c593"
/// support_crops : [{"crop_id":"5eb7cf5a86d9755df3a6c593","causal_organism":"string","example_format":{"file_details":"string","file_url":"string","file_type":"string"},"details":"string"}]



class DiseaseListModel {
  List<DiseaseModel>? diseaseList = [];

  DiseaseListModel({this.diseaseList});

  DiseaseListModel.fromJson(List<dynamic> json) {
    print("Json data : ${json..runtimeType}");
    for (var v in json) {
      print("Crops : ${v}");
      diseaseList?.add(DiseaseModel.fromJson(v));
    }
  }
}




class DiseaseModel {
  DiseaseModel({
      String? name, 
      String? id, 
      List<SupportCrops>? supportCrops,}){
    _name = name;
    _id = id;
    _supportCrops = supportCrops;
}

  DiseaseModel.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['_id'];
    if (json['support_crops'] != null) {
      _supportCrops = [];
      json['support_crops'].forEach((v) {
        _supportCrops?.add(SupportCrops.fromJson(v));
      });
    }
  }
  String? _name;
  String? _id;
  List<SupportCrops>? _supportCrops;
DiseaseModel copyWith({  String? name,
  String? id,
  List<SupportCrops>? supportCrops,
}) => DiseaseModel(  name: name ?? _name,
  id: id ?? _id,
  supportCrops: supportCrops ?? _supportCrops,
);
  String? get name => _name;
  String? get id => _id;
  List<SupportCrops>? get supportCrops => _supportCrops;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['_id'] = _id;
    if (_supportCrops != null) {
      map['support_crops'] = _supportCrops?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// crop_id : "5eb7cf5a86d9755df3a6c593"
/// causal_organism : "string"
/// example_format : {"file_details":"string","file_url":"string","file_type":"string"}
/// details : "string"

class SupportCrops {
  SupportCrops({
      String? cropId, 
      String? causalOrganism, 
      ExampleFormat? exampleFormat, 
      String? details,}){
    _cropId = cropId;
    _causalOrganism = causalOrganism;
    _exampleFormat = exampleFormat;
    _details = details;
}

  SupportCrops.fromJson(dynamic json) {
    _cropId = json['crop_id'];
    _causalOrganism = json['causal_organism'];
    _exampleFormat = json['example_format'] != null ? ExampleFormat.fromJson(json['example_format']) : null;
    _details = json['details'];
  }
  String? _cropId;
  String? _causalOrganism;
  ExampleFormat? _exampleFormat;
  String? _details;
SupportCrops copyWith({  String? cropId,
  String? causalOrganism,
  ExampleFormat? exampleFormat,
  String? details,
}) => SupportCrops(  cropId: cropId ?? _cropId,
  causalOrganism: causalOrganism ?? _causalOrganism,
  exampleFormat: exampleFormat ?? _exampleFormat,
  details: details ?? _details,
);
  String? get cropId => _cropId;
  String? get causalOrganism => _causalOrganism;
  ExampleFormat? get exampleFormat => _exampleFormat;
  String? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['crop_id'] = _cropId;
    map['causal_organism'] = _causalOrganism;
    if (_exampleFormat != null) {
      map['example_format'] = _exampleFormat?.toJson();
    }
    map['details'] = _details;
    return map;
  }

}

/// file_details : "string"
/// file_url : "string"
/// file_type : "string"

class ExampleFormat {
  ExampleFormat({
      String? fileDetails, 
      String? fileUrl, 
      String? fileType,}){
    _fileDetails = fileDetails;
    _fileUrl = fileUrl;
    _fileType = fileType;
}

  ExampleFormat.fromJson(dynamic json) {
    _fileDetails = json['file_details'];
    _fileUrl = json['file_url'];
    _fileType = json['file_type'];
  }
  String? _fileDetails;
  String? _fileUrl;
  String? _fileType;
ExampleFormat copyWith({  String? fileDetails,
  String? fileUrl,
  String? fileType,
}) => ExampleFormat(  fileDetails: fileDetails ?? _fileDetails,
  fileUrl: fileUrl ?? _fileUrl,
  fileType: fileType ?? _fileType,
);
  String? get fileDetails => _fileDetails;
  String? get fileUrl => _fileUrl;
  String? get fileType => _fileType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file_details'] = _fileDetails;
    map['file_url'] = _fileUrl;
    map['file_type'] = _fileType;
    return map;
  }

}