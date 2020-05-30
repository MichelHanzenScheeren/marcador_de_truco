import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marcadordetruco/models/player_description.dart';
import './custom_button.dart';

class EditImagePlayer extends StatelessWidget {
  final PlayerDescription playerDescription;
  final style = TextStyle(color: Colors.white, fontSize: 15);
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  EditImagePlayer(this.playerDescription);

  void imageSelected(BuildContext context, File image, ImageType type) async {
    if (image == null) return;
    File cropped = await croppImage(image);
    if (cropped == null) return;
    playerDescription.setImage(cropped.path, ImageType.file);
    Navigator.pop(context);
  }

  Future<File> croppImage(File image) async {
    return await ImageCropper.cropImage(
      sourcePath: image.path,
      cropStyle: CropStyle.circle,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomButton(
                buttonText: "Imagem da galeria",
                backGroundColor: Theme.of(context).accentColor,
                textColor: Theme.of(context).splashColor,
                onPressed: () async {
                  File image = await ImagePicker.pickImage(
                    source: ImageSource.gallery,
                  );
                  imageSelected(context, image, ImageType.file);
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonText: "Imagem da câmera",
                backGroundColor: Theme.of(context).accentColor,
                textColor: Theme.of(context).splashColor,
                onPressed: () async {
                  File image = await ImagePicker.pickImage(
                    source: ImageSource.camera,
                  );
                  imageSelected(context, image, ImageType.file);
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonText: "Cancelar",
                backGroundColor: Colors.transparent,
                borderColor: Colors.red,
                textColor: Colors.black,
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }

  Widget textButton(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
