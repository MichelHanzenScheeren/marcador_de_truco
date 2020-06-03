import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marcadordetruco/models/player_description.dart';
import './custom_button.dart';

class EditImagePlayer extends StatelessWidget {
  final PlayerDescription playerDescription;
  final Function() onSucess;
  final Function(Exception erro) onFail;
  EditImagePlayer(
    this.playerDescription, {
    @required this.onSucess,
    @required this.onFail,
  });

  void selectNewImage(ImageSource mySource) async {
    try {
      await getImage(mySource);
      onSucess();
    } catch (erro) {
      onFail(erro);
    }
  }

  Future getImage(ImageSource mySource) async {
    File image = await ImagePicker.pickImage(source: mySource);
    if (image != null) await croppImage(image);
  }

  Future croppImage(File image) async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: image.path,
      cropStyle: CropStyle.circle,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (cropped != null) defineNewImage(cropped);
  }

  void defineNewImage(File image) {
    playerDescription.setImage(image.path, ImageType.file);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomSheet(
      backgroundColor: theme.dialogBackgroundColor,
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
                textColor: theme.textSelectionColor,
                backGroundColor: theme.primaryColor,
                borderColor: theme.primaryColor,
                onPressed: () {
                  Navigator.pop(context);
                  selectNewImage(ImageSource.gallery);
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonText: "Imagem da câmera",
                textColor: theme.textSelectionColor,
                backGroundColor: theme.primaryColor,
                borderColor: theme.primaryColor,
                onPressed: () {
                  Navigator.pop(context);
                  selectNewImage(ImageSource.camera);
                },
              ),
              SizedBox(height: 10),
              CustomButton(
                buttonText: "Cancelar",
                textColor: theme.errorColor,
                backGroundColor: theme.dialogBackgroundColor,
                borderColor: theme.errorColor,
                onPressed: () {
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
}
