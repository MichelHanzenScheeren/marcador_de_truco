class FormValidators {
  FormValidators._();

  static String playerName(String value) {
    if (value == "") {
      return "O nome de um jogador não pode ser vazio!";
    } else if (value.replaceAll(" ", "").length == 0) {
      return "Nome inválido!";
    } else {
      return null;
    }
  }
}
