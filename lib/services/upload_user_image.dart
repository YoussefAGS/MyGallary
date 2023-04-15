import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadUserImage {


  static Future<void> uploadNewImage(ImageSource goSource,String token) async {
    final imageFile = await ImagePicker().pickImage(source: goSource,);
    final url = Uri.parse('https://technichal.prominaagency.com/api/upload');
    final request = http.MultipartRequest('POST', url);
    final fileStream = http.ByteStream(imageFile!.readAsBytes().asStream());
    final fileLength = await imageFile.length();
    final multipartFile = http.MultipartFile(
      'img',
      fileStream,
      fileLength,
      filename: imageFile.path.split('/').last,
    );
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add(multipartFile);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Error uploading image: ${response.reasonPhrase}');
    }
  }
}
// import 'package:image_picker/image_picker.dart';
//
// import '../helper/api.dart';
// import '../models/MyGallery.dart';
//
// Future<MyGallery> uploadNewImage({
//   required ImageSource Source,
//   required String Token,
// }) async {
//   final imageFile = await ImagePicker().pickImage(
//     source: Source,
//   );
//   Map<String, dynamic> data = await Api().post(
//     url: 'https://technichal.prominaagency.com/api/auth/login',
//     body: {
//       'img': imageFile,
//     },
//   );
//   MyGallery user = MyGallery.fromJson(data);
//   return user;
// }
