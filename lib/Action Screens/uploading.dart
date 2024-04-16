import 'package:flutter/material.dart';
import 'package:image_editings/Action%20Screens/editingImages.dart';

import 'package:image_editings/Constants/assetsPath.dart';
import 'package:image_picker/image_picker.dart';

class uploading extends StatelessWidget {
  uploading({super.key});
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 70,
          ),
          Center(
            child: IconButton(
                onPressed: () async {
                  XFile? file = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (file != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => editingImages(
                            fontSize: 20,
                            selectedImage: file.path,
                            imagetype: 3)));
                  }
                },
                icon: Icon(
                  Icons.upload_file,
                  size: 50,
                )),
          ),
          SizedBox(
            height: 50,
          ),
          RowBackground(),
          SizedBox(
            height: 20,
          ),
          RowBackground(),
          SizedBox(
            height: 20,
          ),
          RowBackground(),
          SizedBox(
            height: 20,
          ),
          RowBackground(),
          SizedBox(
            height: 20,
          ),
          RowBackground(),
          SizedBox(
            height: 20,
          ),
          RowBackground(),
          SizedBox(
            height: 20,
          ),
          RowBackground(),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class RowBackground extends StatelessWidget {
  const RowBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editingImages(
                    selectedImage: imagesPath.backgroundImage,
                    imagetype: 2,
                    fontSize: 20,
                  ),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              imagesPath.backgroundImage,
              fit: BoxFit.contain,
              width: 150,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => editingImages(
                          selectedImage: imagesPath.backgroundImage,
                          imagetype: 2,
                          fontSize: 20,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              imagesPath.backgroundImage,
              fit: BoxFit.contain,
              width: 150,
            ),
          ),
        )
      ],
    );
  }
}
