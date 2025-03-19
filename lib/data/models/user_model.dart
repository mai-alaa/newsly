class UserModel {
   UserModel({
    required this.name,
    required this.email,
    required this.uId,
    required this.isVerified,
    });

  late final String name;
late final String email;
  
 late final String uId;
 late final bool isVerified;

 
  UserModel.fromJson(Map<String, dynamic>json) {
    name = json['name'];
    email = json['email'];
  
    uId = json['uId'];
    isVerified = json['isVerified'];
  }

  Map<String, dynamic> toJson() {
         final userData = <String, dynamic>{};
    userData['name'] = name;
    userData['email'] = email;
    userData['uId'] = uId;
    userData['isVerified']=isVerified;
    return userData;
    
  }
}