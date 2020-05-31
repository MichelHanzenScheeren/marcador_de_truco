import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marcadordetruco/widgets/title_divider.dart';

class TimeDetails extends StatelessWidget {
  final DateTime startDate;
  final DateTime finalDate;
  TimeDetails(this.startDate, this.finalDate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: <Widget>[
          TitleDivider(
            text: "Tempo de Jogo",
            dividerColor: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 5),
          getDateRow(startDate, "iniciada", Icons.hourglass_empty),
          getDateRow(finalDate, "finalizada", Icons.hourglass_full),
          getDurationRow(finalDate.difference(startDate), Icons.access_time),
        ],
      ),
    );
  }

  Widget getDateRow(DateTime date, String condition, IconData icon) {
    var dateFormat = DateFormat("dd/MM/yyyy");
    var hourFormat = DateFormat("HH:mm");
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 5),
          Flexible(
            flex: 1,
            child: Text("Partida $condition em ${dateFormat.format(date)}" +
                " às ${hourFormat.format(date)}hrs."),
          ),
        ],
      ),
    );
  }

  Widget getDurationRow(Duration difference, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: <Widget>[
          Icon(icon),
          SizedBox(width: 5),
          Flexible(
            flex: 1,
            child: difference.inMinutes == 0
                ? Text("Menos de um minuto de jogo.")
                : Text("${difference.inMinutes} " +
                    (difference.inMinutes > 1 ? "minutos" : "minuto") +
                    " de jogo."),
          ),
        ],
      ),
    );
  }
}
