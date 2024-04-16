import 'dart:io';
import 'package:image_editings/Constants/assetsPath.dart';
import 'package:flutter/material.dart';
import 'package:image_editings/Action%20Screens/imageText.dart';
import 'package:image_editings/Constants/imageEditView.dart';
import 'package:image_editings/Constants/myTexts.dart';
import 'package:screenshot/screenshot.dart';

class editingImages extends StatefulWidget {
  const editingImages(
      {super.key,
      required this.selectedImage,
      required this.imagetype,
      required this.fontSize});
  final String selectedImage;
  final int imagetype; // 1- files = 2
  final double fontSize;
  @override
  State<editingImages> createState() => _editingImagesState();
}

class _editingImagesState extends imageEditView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 43, 30),
      appBar: _appBar,
      body: Screenshot(
        controller: ScreenshotController(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                  child: SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Stack(
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
                                  Offset off =
                                      renderBox.globalToLocal(drag.offset);
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Image.asset(
                        imagesPath.nurquestImage,
                        fit: BoxFit.contain,
                        width: 50,
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 38, 50, 35),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 120),
                      child: Container(
                        height: 50,
                        width: 107.5,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            textText,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        filterText,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    languageText,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  Container(
                    height: 40,
                    width: 155,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(
                          255,
                          38,
                          50,
                          35,
                        ),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40))),
                            child: Center(
                              child: Text(
                                englishText,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          arabicText,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      alignmentText,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.format_align_left,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(
                          Icons.format_align_center,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.format_align_right,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Text(
                      textSizeText,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(),
                child: Slider(
                    activeColor: Colors.green,
                    value: 20,
                    min: 10.0,
                    max: 50.0,
                    onChanged: (newValue) {
                      setState(() {
                        newValue = 20;
                      });
                      Text(textSizeText, style: TextStyle(fontSize: newValue));
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      aText,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      aText,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      fontText,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          defaultText,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    alphaSlabText,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      alqalamText,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      fontcolorText,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.brown,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: whiteText,
                    child: GestureDetector(
                      onTap: () => changeTextColor(Colors.white),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _addingnewTextFloatingAB,
    );
  }

  Widget get _selectedImage => widget.imagetype == 2
      ? Center(
          child: Image.asset(
          (widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ))
      : Image.file(
          File(widget.selectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        );

  Widget get selectedImage => widget.imagetype == 3
      ? Center(
          child: Image.file(
            File(widget.selectedImage),
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
        )
      : Image.asset(
          widget.selectedImage,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
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
