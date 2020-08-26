class LoginRequestData {
  String email = '';
  String phone = '';
  String password = '';
//  String tes = '08988387271';
}

class RegisterData {
  String srNo;
  String name = '';
  String phone = '';
  String password = '';
  String cpassword = '';

  RegisterData({
    this.srNo,
    this.name,
    this.phone,
    this.password,
    this.cpassword,
  });

  RegisterData.fromJson(Map<String, dynamic> json) {

          srNo= json['user']['SrNo'];
          name= json['user']['fullname'];
          phone= json['user']['phone'];
          password= "";
          cpassword= "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SrNo']= this.srNo;
    data['name']= this.name;
    data['phone']= this.phone;
    data['password']= this.password;
    data['cpassword']= this.cpassword;
    return data;
  }
}

//tambahiklanbisnis

class IklanbisnisData {
  //String idiklan;
  String judul = '';
  String dekripsi = '';


  IklanbisnisData({
    //this.idiklan,
    this.judul,
    this.dekripsi,

  });

  IklanbisnisData.fromJson(Map<String, dynamic> json) {

//    srNo= json['user']['SrNo'];
//    name= json['user']['fullname'];
//    phone= json['user']['phone'];
    //idiklan= json['user']['idiklan'];
    judul= json['user']['judul'];
    dekripsi= json['user']['dekripsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['idiklan']= this.idiklan;
    data['judul']= this.judul;
    data['dekripsi']= this.dekripsi;
    return data;
  }
}