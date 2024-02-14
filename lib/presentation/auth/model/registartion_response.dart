/// email : "user@example.com"
/// full_name : "John Doe"
/// is_active : true
/// is_verified : false

class RegResponse {
  RegResponse({
      String? email, 
      String? fullName, 
      bool? isActive, 
      bool? isVerified,}){
    _email = email;
    _fullName = fullName;
    _isActive = isActive;
    _isVerified = isVerified;
}

  RegResponse.fromJson(dynamic json) {
    _email = json['email'];
    _fullName = json['full_name'];
    _isActive = json['is_active'];
    _isVerified = json['is_verified'];
  }
  String? _email;
  String? _fullName;
  bool? _isActive;
  bool? _isVerified;
RegResponse copyWith({  String? email,
  String? fullName,
  bool? isActive,
  bool? isVerified,
}) => RegResponse(  email: email ?? _email,
  fullName: fullName ?? _fullName,
  isActive: isActive ?? _isActive,
  isVerified: isVerified ?? _isVerified,
);
  String? get email => _email;
  String? get fullName => _fullName;
  bool? get isActive => _isActive;
  bool? get isVerified => _isVerified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['full_name'] = _fullName;
    map['is_active'] = _isActive;
    map['is_verified'] = _isVerified;
    return map;
  }

}