/// user : {"id":160,"name":"Mr. Demario Heaney DDS","email":"gzieme@example.net","email_verified_at":"2022-11-01T07:19:58.000000Z","created_at":"2022-11-01T07:19:58.000000Z","updated_at":"2022-11-01T07:19:58.000000Z"}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTI1MzZmYTA0ZWI2MWUxOGFmMTY3OTU0NTAwODcwNjdlZGUyOWI0MjU2NDE5ZDkxZjRhZDZlMjNmZjI2ODQyYTEzMzM1ZjViMWNhYzgwY2UiLCJpYXQiOjE2ODEzMTQyMjUuNTM0NzgzLCJuYmYiOjE2ODEzMTQyMjUuNTM0Nzg2LCJleHAiOjE3MTI5MzY2MjUuNTMzNDYsInN1YiI6IjE2MCIsInNjb3BlcyI6W119.Q-m_5TKgZlxPtKPaRCXYaNbICZYgIhYKmHu7b58E4Ma9i8irteJKB3Q-ThT-etsVsoLLW-HKg6rmaXhctz7mMuA8Po4-yIdVOe0UoiKPVBwngYu8GWFx8q9yH2bD_DIK8QDP4PqpH-qMcHxLlmbQiGjKKjG6ewHNipBRULBBPMJgA7Ed5eLEEq61W5lRRoMTMlplB3c7LqfGbCwO9dL7C-isMSnSOxGyfrQ25W-oiN6zKRmxY_LfHy3LHtOhfQ0cKmUns_YB4yAdP48IrelQbsVQQFbeosi9vA3AxKQgcNFii2TyyVXVvCW3vwVMHO5Vq3snuWsvacg_zcp2wyjGmUmIq_ic_8nkk2npgJrpJjt2XIVfjHzoxrbSh492bPohEjB-kOvyDOIBbvenyF9vthJINVCjAcia-fBH7DPB5Y4NbYfrjBC2MI-NN_3uTBuT5fFOfe8AmpfiYtPQU0jT1t6urX8s-_DYtzKbqxf-KNWIL-NqOi2-uEXd-G5gOqrov3dlRK7R6tpy-_Ve3WqpXXTUpogzyBZ83mSP39XxhjQ3MaSbB4zryIvEukKY6InrxDTYoaPXHyqAkN3NSloi7Nz9pIsYuveLdVXMcTg-geNWplPITCMvV-jsFGbj85K8AryvWqnZ349k6_GOotVMEy-4OuDXuXxkXiFinP78kS8"

class MyUser {
  MyUser({
      this.user, 
      this.token,});

  MyUser.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// id : 160
/// name : "Mr. Demario Heaney DDS"
/// email : "gzieme@example.net"
/// email_verified_at : "2022-11-01T07:19:58.000000Z"
/// created_at : "2022-11-01T07:19:58.000000Z"
/// updated_at : "2022-11-01T07:19:58.000000Z"

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}