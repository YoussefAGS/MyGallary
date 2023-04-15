// /// status : "success"
// /// data : []
// /// message : "Image uploaded successfully"
//
// class UloadImage {
//   UloadImage({
//       this.status,
//       this.data,
//       this.message,});
//
//   UloadImage.fromJson(dynamic json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Dynamic.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }
//   String? status;
//   List<dynamic>? data;
//   String? message;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (data != null) {
//       map['data'] = data?.map((v) => v.toJson()).toList();
//     }
//     map['message'] = message;
//     return map;
//   }
//
// }