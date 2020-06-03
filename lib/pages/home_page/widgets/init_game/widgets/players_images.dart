import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcadordetruco/models/player_description.dart';
import 'package:marcadordetruco/widgets/custom_snackbar.dart';
import '../../../../../widgets/edit_image_player.dart';
import '../../../../../widgets/image_container.dart';

class PlayersImages extends StatefulWidget {
  final PlayerDescription p1Description;
  final PlayerDescription p2Description;
  final double imageSize;
  PlayersImages({
    @required this.p1Description,
    @required this.p2Description,
    @required this.imageSize,
  });

  @override
  _PlayersImagesState createState() => _PlayersImagesState();
}

class _PlayersImagesState extends State<PlayersImages> {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: widget.p1Description.image,
              type: widget.p1Description.imageType,
              height: widget.imageSize,
              width: widget.imageSize,
              borderColor: primaryColor,
            );
          }),
          onTap: () => editImage(widget.p1Description),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Observer(builder: (_) {
            return ImageContainer(
              image: widget.p2Description.image,
              type: widget.p2Description.imageType,
              height: widget.imageSize,
              width: widget.imageSize,
              borderColor: primaryColor,
            );
          }),
          onTap: () => editImage(widget.p2Description),
        ),
      ],
    );
  }

  void editImage(PlayerDescription playerDescription) {
    showModalBottomSheet(
      context: context,
      builder: (context) => EditImagePlayer(
        playerDescription,
        onSucess: sucess,
        onFail: fail,
      ),
    );
  }

  void sucess() {
    final ThemeData theme = Theme.of(context);
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(CustomSnackbar(
      text: "Imagem alterada com sucesso!",
      textColor: theme.textSelectionHandleColor,
      backgroundColor: theme.primaryColorLight,
      secondsDuration: 2,
    ));
  }

  void fail(Exception erro) {
    String myText;
    if (erro.runtimeType == PlatformException) {
      myText = "A permissão de acesso aos arquivos é necessária para" +
          " a opção escolhida...";
    } else {
      myText = "Um erro inesperado ocorreu!";
    }
    print(erro.toString());
    final ThemeData theme = Theme.of(context);
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(CustomSnackbar(
      text: myText,
      textColor: theme.textSelectionHandleColor,
      backgroundColor: theme.errorColor,
      secondsDuration: 3,
    ));
  }
}
