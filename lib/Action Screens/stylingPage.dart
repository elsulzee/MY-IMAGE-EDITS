import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editings/Action%20Screens/imageText.dart';
import 'package:image_editings/Constants/imageEditView.dart';
import 'package:image_editings/Constants/myTexts.dart';
import 'package:screenshot/screenshot.dart';

class stylingPage extends StatefulWidget {
  const stylingPage({super.key});

  @override
  _stylingPageState createState() => _stylingPageState();
}

class _stylingPageState extends imageEditView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar,
      body: Screenshot(
        controller: ScreenshotController(),
        child: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height / 0.6,
          child: Stack(
            children: [
              selectedImage,
              for (int i = 0; i < texts.length; i++)
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        currentIndex = i;
                        removeText(context);
                      });
                    },
                    onTap: () => setCurrentIndex(context, i),
                    child: Draggable(
                      feedback: imageText(
                        textsInfo: texts[i],
                      ),
                      child: imageText(
                        textsInfo: texts[i],
                      ),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy - 96;
                          texts[i].left = off.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorText.text.isNotEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorText.text,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.3)),
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        )),
      ),
      floatingActionButton: _addingnewTextFloatingAB,
    );
  }

  Widget get selectedImage => Center(
        child: Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fitWidth,
          width: MediaQuery.of(context).size.width,
        ),
      );

  Widget get _addingnewTextFloatingAB => FloatingActionButton(
        onPressed: () => addNewDialogue(context),
        backgroundColor: Colors.white,
        tooltip: addnewText,
        child: Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );
  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                  onPressed: () => saveToGallery(context),
                  tooltip: saveImgeText,
                  icon: Icon(
                    Icons.save,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: increasingFontSize,
                  tooltip: increaseFontText,
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: DecreasingFontSize,
                  tooltip: decreaseFontsizeText,
                  icon: Icon(
                    Icons.remove,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: aligningleft,
                  tooltip: alignLeft,
                  icon: Icon(
                    Icons.format_align_left,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: aligningcenter,
                  tooltip: alignCenterText,
                  icon: Icon(
                    Icons.format_align_center,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: aligningright,
                  tooltip: alinRightText,
                  icon: Icon(
                    Icons.format_align_right,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: boldingText,
                  tooltip: boldText,
                  icon: Icon(
                    Icons.format_bold,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: ItalicText,
                  tooltip: italicText,
                  icon: Icon(
                    Icons.format_italic,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: addingLinestoTexts,
                  tooltip: addnewLineText,
                  icon: Icon(
                    Icons.space_bar,
                    color: Colors.black,
                  )),
              Tooltip(
                message: redText,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.red),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: whiteText,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.white),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: blacktext,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: bluetext,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.blue),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: yellowText,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.yellow),
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: greenText,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.green),
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: orangeText,
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.orange),
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Tooltip(
                message: pinktext,
                child: GestureDetector(
                  onTap: () =>
                      changeTextColor(const Color.fromARGB(255, 61, 44, 50)),
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      );
}
