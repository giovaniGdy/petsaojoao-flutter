import 'package:flutter/material.dart';

import 'package:petsaojoao/models/back_reg_my_pet/camera_functions.dart';
import 'package:petsaojoao/models/back_reg_my_pet/orientation_organize.dart';
import 'package:petsaojoao/models/back_reg_my_pet/picture_upload_firebase.dart';

import 'package:petsaojoao/screens/dashboard/dashboard.dart';


class PopUpSelector {
  void showDelete(context, num) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red[900],
                  ),
                  Text("Apagar Foto?"),
                ],
              ),
            ),
            content: Text(
              "Deseja apagar a foto selecionada e tirar uma nova?",
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Não"),
              ),
              FlatButton(
                onPressed: () {
                  CameraFunctions().deletePicture(context, num);
                },
                child: Text(
                  "Sim",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
      barrierDismissible: false);

  void showLoading(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Text("Enviando Imagens..."),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
              ),
            ),
            content: Text(
              "Por favor, aguarde um momento enquanto processamos suas imagens...",
              style: TextStyle(color: Colors.black54),
            ),
          ),
      barrierDismissible: false);

  showRedirect(context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.error,
                    size: 30,
                    color: Colors.red[900],
                  ),
                  Text("Erro!"),
                ],
              ),
            ),
            content: Text(
              "Ops... Parece que ocorreu um erro...",
              style: TextStyle(color: Colors.black54),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  releaseOrientation();

                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                child: Text("Cancelar"),
              ),FlatButton(
                onPressed: () {
                  releaseOrientation();
                  FirebaseUpload().saving(context);
                },
                child: Text("Tentar Novamente"),
              ),
            ],
          ),
      barrierDismissible: false);

  closePopup(context) async {

    backDash(context);
  }
  backDash(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Dashboard(),
      ),
    );
  }
}
