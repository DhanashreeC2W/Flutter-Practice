class Address {
  String _name="";
  int _mobile=0;
  String _email="";
  String _city="";
  String _interestedIn="";

  Address(this._name, this._mobile, this._email, this._city, this._interestedIn);

  String get name => _name;
  int get mobile => _mobile;
  String get email => _email;
  String get city => _city;
  String get interestedIn => _interestedIn;

  set name(String newName) {
    _name = newName;
  }

  set mobile(int newMobile) {
    _mobile = newMobile;
  }

  set email(String newEmail) {
    _email = newEmail;
  }

  set city(String newCity) {
    _city = newCity;
  }

  set interestedIn(String newInterestedIn) {
    _interestedIn = newInterestedIn;
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': _name,
      'Mobile': _mobile,
      'Email': _email,
      'City': _city,
      'Interestedin': _interestedIn,
    };
  }

  Address.fromMapObject(Map<String, dynamic> map) {
    _name = map['Name'];
    _mobile = map['Mobile'];
    _email = map['Email']; // Fixed this line
    _city = map['City'];
    _interestedIn = map['Interestedin'];
  }
}
