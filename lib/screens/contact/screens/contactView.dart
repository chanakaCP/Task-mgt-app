import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_mgt_app/customWidgets/appbar/customAppBar.dart';
import 'package:task_mgt_app/customWidgets/buttons/customIconButton.dart';
import 'package:task_mgt_app/customWidgets/buttons/custombutton.dart';
import 'package:task_mgt_app/customWidgets/container/customContainer.dart';
import 'package:task_mgt_app/customWidgets/text/customText.dart';
import 'package:task_mgt_app/customWidgets/imageView/customImageView.dart';
import 'package:task_mgt_app/customWidgets/container/customCardWidget.dart';
import 'package:task_mgt_app/getX/controller/constacController.dart';
import 'package:task_mgt_app/screens/drawer/screens/customDrawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContactView extends StatelessWidget {
  final cantactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Contact Us",
        drawerCallback: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      drawerEnableOpenDragGesture: false,
      endDrawer: CustomDrawer(),
      body: CustomContainer(
        child: Column(
          children: [
            CustomCardWidget(
              childWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imageURL: "default",
                    defaultImageURL: "assets/logo.jpg",
                    imageHeight: 5.h,
                    imageWidth: 15.h,
                    continerWidth: 15.h,
                    imageRadius: BorderRadius.circular(0),
                    containerRadius: BorderRadius.circular(0),
                  ),
                  CustomContainer(
                    child: CustomText(
                      text:
                          "Insteller Pvt(Ltd), \nNo123, \nColombo, \nSrilanka.",
                      size: 4.5.w,
                      weight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            CustomCardWidget(
              childWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomContainer(
                    child: CustomText(
                      text: "Contact Us ",
                      size: 5.w,
                      weight: FontWeight.w300,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.call,
                    iconSize: 8.w,
                    bgColor: Colors.blue[100],
                    iconColor: Colors.blue,
                    callback: () async {},
                  ),
                  CustomIconButton(
                    icon: Icons.facebook_rounded,
                    iconSize: 8.w,
                    bgColor: Colors.blue[100],
                    iconColor: Colors.blue,
                    callback: () {
                      // onTapIcon();
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.web,
                    iconSize: 8.w,
                    bgColor: Colors.blue[100],
                    iconColor: Colors.blue,
                    callback: () {
                      // onTapIcon();
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.email_outlined,
                    iconSize: 8.w,
                    bgColor: Colors.blue[100],
                    iconColor: Colors.blue,
                    callback: () {
                      // onTapIcon();
                    },
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                CustomContainer(
                  marginTop: 2.5.h,
                  marginLeft: 2.5.w,
                  marginRight: 2.5.w,
                  height: 55.h,
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapToolbarEnabled: true,
                    zoomControlsEnabled: true,
                    rotateGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                      zoom: 12.5,
                      target: cantactController.markerLatLng,
                    ),
                    markers: cantactController.markers,
                    onMapCreated: (GoogleMapController gMapController) {},
                    onLongPress: (positionCoordinates) {},
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 7.5.w,
                  child: CustomButton(
                    buttonColor: Colors.blue[200]!,
                    width: 30.w,
                    title: "view on Map",
                    fontsize: 3.5.w,
                    textColor: Colors.black45,
                    callback: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
