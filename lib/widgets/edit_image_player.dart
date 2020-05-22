import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import './image_container.dart';
import '../models/player.dart';

class EditImagePlayer extends StatelessWidget {
  final Player player;
  final style = TextStyle(color: Colors.white, fontSize: 15);
  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  EditImagePlayer(this.player);

  void imageSelected(BuildContext context, File image, ImageType type) async {
    if (image == null) return;
    File cropped = await croppImage(image);
    if (cropped == null) return;
    player.setImage(cropped.path, ImageType.file);
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
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Observer(builder: (_) {
                return ImageContainer(
                  width: 220,
                  height: 220,
                  image: player.image,
                  type: player.imageType,
                );
              }),
              SizedBox(height: 15),
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
                      imageSelected(context, image, ImageType.file);
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
                      imageSelected(context, image, ImageType.file);
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
