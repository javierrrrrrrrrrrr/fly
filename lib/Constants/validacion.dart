//correo electronico
String? mail(value) {
  String gmailpatter =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(gmailpatter);
  if (regExp.hasMatch(value ?? "")) {
    return null;
  } else {
    return 'Introduce un correo valido';
  }
}
