class FormValidators {
  FormValidators._();

  static String name(String value) {
    if (value == "") {
      return "O nome de um jogador não pode ser vazio!";
    } else {
      return null;
    }
  }
}
