class FormValidators {
  FormValidators._();

  static String playerName(String value) {
    if (value == "") {
      return "O nome do jogador não pode ser vazio...";
    } else if (value.replaceAll(" ", "").length == 0) {
      return "Nome inválido!";
    } else if (value.length > 20) {
      return "Nome não pode ter mais de 20 caracters...";
    } else {
      return null;
    }
  }

  static String maxPoint(String value) {
    if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return "O valor informado deve ser um número inteiro maior do que 0.";
    } else if (int.parse(value) == 0) {
      return "O valor informado deve ser um número inteiro maior do que 0.";
    } else {
      return null;
    }
  }
}
