import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loginwithgalary/models/MyGallery.dart';
import 'package:loginwithgalary/provider/my_provider.dart';
import 'package:provider/provider.dart';

import '../../services/get_user_images.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  @override
  Widget build(BuildContext context) {
    MyProvider provider=Provider.of<MyProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/gellary.png'), fit: BoxFit.fill)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(

            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Welcom \n${provider.myUser?.user!.name}',style: TextStyle(color: Colors.black),),
            actions: [
              Image.asset('assets/person.png'),
              SizedBox(width: 30,),
            ],
          ),
          body: Container(
            padding: EdgeInsets.only(top: 30,left: 20,right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Image.asset('assets/logout.png'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            // showDialoug();
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/upload.png'),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Upload',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: FutureBuilder<MyGallery>(
                      future: GetImages(MyToken: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE3MTBmNTA4MzFmY2NiNDYwNGExMzY0ODJmNDFiZjU5OTEzY2JkY2ZhZmU2ZDY1OWJmZmQ5OGVkODE1MDk5MTRmNTRmMjZmZDA2NGZjZDIiLCJpYXQiOjE2NjcyODk3ODUuMDMzMTk5LCJuYmYiOjE2NjcyODk3ODUuMDMzMjAzLCJleHAiOjE2OTg4MjU3ODUuMDI2MzI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bWImC0xkzNQe8iKxL1Scg0tGGZGUy3vWsiX1vBzj1gLvynIMJcOqVkEVZc2C3MgSaCHjyqGkN7zWyqYVqLasAaKKFmj9JiQgXozvPcHJPoJCGQQvogt-gnM0DPeFMF-g_CVJPNZ3nUkXpOLl3Os5DhvW53OVT1n5pisoNyvsrEJURWTXxt1EIxwnmoj0An8y9kq2WSX4Zn2RoVGKe3QnL-KOGKksfv2ahj7hG-ZNwVYazI6TXCIxZBCYGoZtfvq9CjTrVUcCBSiGgdyaJzAZi0lNR2c2zcZxWGbBQ_QvfTFDZmmPyogScE5cgy4MGsnYe4Sw7qLmHIrSsrMaJxRgQ_b7xobq9ob1vDhw9O-VcPpiCllEFyjMkdKOFC8UffoYZB3bafp9KZB6Dr3tS7fo6f4ojAKnj-b8g6AigjuFb4FAYlC0vxT76mtvvYFm8MjH1kH2QmJ0HzvhBxv45K9Cdtuvr3DdrwyDaoROR4eZ6S-Xp-LYuCkZ-e4UenLJC4mDUu8u6xoyLHKul3FhNlAUMj-oScKZgJxRUYhbVxzXruHwaycKdlX284-Y6cfSAf3AjIvfaXYeB1ajGuuCtYceBVGM5tDxY4i9I7kthk3DNRjaRQPIl5c8GQlYV3I3p-RItB33Y-ECNiG92U2fgB8fAVw5urOuFX7pIZZ0NEc6VAY'),
                      builder: (contxt, snapShot) {
                        if (snapShot.hasData) {
                          return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16),
                            itemCount: snapShot.data!.data!.images!.length,
                            itemBuilder: (context, index) => CachedNetworkImage(
                              imageUrl:
                              '${snapShot.data!.data!.images![index]}',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  )),
                              errorWidget: (context, url, error) => Center(
                                  child:
                                  Image.asset('assets/person.png')),
                            ),
                          );
                        } else if (snapShot.hasError) {
                          return Image.asset('assets/img_not_found.jpg');
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                ),

              ],
            ),
          ),

        )
    );
  }
  // void showDialoug() {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return AlertDialog(
  //         backgroundColor: Colors.white.withOpacity(0.7),
  //         elevation: 33,
  //         actions: [
  //           Container(
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(25),
  //                   border: Border.all(color: Colors.white, width: 1)),
  //               child: Column(
  //                 children: [
  //                   InkWell(
  //                     onTap: (){
  //                       Navigator.pop(context);
  //                       UploadUserImage.uploadNewImage(ImageSource.gallery,MyToken);
  //                       setState(() {
  //
  //                       });
  //
  //                     },
  //                     child: Container(
  //                       padding: EdgeInsets.all(16),
  //                       margin: EdgeInsets.only(
  //                           right: 32, left: 32, top: 16, bottom: 16),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20),
  //                         color: Color(0xFFEFD8F9),
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Image.asset('assets/from_gallery.png'),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Text(
  //                             'Gallery',
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 20,
  //                   ),
  //                   InkWell(
  //                     onTap: (){
  //                       Navigator.pop(context);
  //                       UploadUserImage.uploadNewImage(ImageSource.camera,MyToken);
  //                       setState(() {
  //
  //                       });
  //                     },
  //                     child: Container(
  //                       margin: EdgeInsets.only(
  //                           right: 32, left: 32, top: 16, bottom: 16),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20),
  //                         color: Color(0xFFEBF6FF),
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Image.asset('assets/camera.png'),
  //                           SizedBox(
  //                             width: 10,
  //                           ),
  //                           Text(
  //                             'Camera',
  //                             style: TextStyle(
  //                               fontSize: 18,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               )),
  //         ],
  //       );
  //     },
  //   );
  // }
}
