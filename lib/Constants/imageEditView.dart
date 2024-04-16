import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_editings/Action%20Screens/editingImages.dart';
import 'package:image_editings/Constants/buttons.dart';
import 'package:image_editings/Constants/myTexts.dart';
import 'package:image_editings/Constants/myTextsInfo.dart';
import 'package:image_editings/Constants/utilities.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

abstract class imageEditView extends State<editingImages> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  List<myTextsInfo> texts = [];
  saveToGallery(BuildContext context) {
    if (texts.isNotEmpty) {
      screenshotController.capture().then((Uint8List? image) {
        if (image != null) {
          saveImage(image);
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text(imagesavedText)));
        } else {}
      }).catchError((err) => print(err));
    }
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll(".", '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  int currentIndex = 0;
  removeText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      deleteText,
      style: TextStyle(fontSize: 16.0),
    )));
  }

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      selectedforStyTEXT,
      style: TextStyle(fontSize: 16.0),
    )));
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increasingFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  DecreasingFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  aligningleft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  aligningright() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  aligningcenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  boldingText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  ItalicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  addingLinestoTexts() {
    setState(() {
      if (texts[currentIndex].text.contains('\n')) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('\n', '');
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('', '\n');
      }
    });
  }

  addingNewText(BuildContext context) {
    setState(() {
      texts.add(myTextsInfo(
          left: 0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: 20,
          fontStyle: FontStyle.normal,
          text: textEditingController.text,
          textAlign: TextAlign.left,
          top: 0));
      Navigator.of(context).pop();
    });
  }

  addNewDialogue(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(addnewText),
              content: TextField(
                controller: textEditingController,
                maxLines: 5,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit),
                  filled: true,
                  hintText: yourTexthere,
                ),
              ),
              actions: <Widget>[
                buttons(
                    child: Text(
                      backText,
                    ),
                    color: Colors.black,
                    onPressed: () => Navigator.of(context).pop(),
                    textcolor: Colors.white),
                buttons(
                    child: Text(
                      addtext,
                    ),
                    color: Colors.red,
                    onPressed: () => addingNewText(context),
                    textcolor: Colors.white),
              ],
            ));
  }
}
