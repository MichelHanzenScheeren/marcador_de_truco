import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import './image_container.dart';
import '../models/player.dart';

class EditImagePlayer extends StatelessWidget {
  final Player player;
  final style = TextStyle(color: Colors.white, fontSize: 16);
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  EditImagePlayer(this.player);

  void imageCropp(File image) async {
    if (image == null) return;
    try {
      File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: CropStyle.circle,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      );
      player.setImage(croppedImage.path);
    } catch (_) {
      print("Crop error");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Observer(builder: (_) {
                return ImageContainer(
                  width: 250,
                  height: 250,
                  image: player.image,
                  type: player.imageType,
                );
              }),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    elevation: 0,
                    color: Theme.of(context).accentColor,
                    shape: shape,
                    child: textButton("Imagem da galeria"),
                    onPressed: () async {
                      File image = await ImagePicker.pickImage(
                        source: ImageSource.gallery,
                      );
                      imageCropp(image);
                      print("OK");
                    },
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                    elevation: 0,
                    color: Theme.of(context).accentColor,
                    shape: shape,
                    child: textButton("Imagem da câmera"),
                    onPressed: () async {
                      File image = await ImagePicker.pickImage(
                        source: ImageSource.camera,
                      );
                      imageCropp(image);
                    },
                  ),
                ],
              )
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
