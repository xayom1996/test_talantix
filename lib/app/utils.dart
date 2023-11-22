import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void showTextDialog(BuildContext context, String message) {
  showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          insetPadding: const EdgeInsets.all(0),
          child: Container(
            width: MediaQuery.of(context).size.width - 24 * 2,
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                  ),
                )
              ],
            ),
          ),
        );
      });
}

void showImagesDialog(BuildContext context, List<String> images) {
  showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          insetPadding: const EdgeInsets.all(0),
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  viewportFraction: 0.8,
                  aspectRatio: 2.0,
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    image,
                                  ))),
                        ),
                      );
                    },
                  );
                }).toList(),
              )),
        );
      });
}
