import "package:petsaojoao/screens/register_tutor/end_register_tutor.dart";
import 'package:petsaojoao/screens/reg_my_pet/end_form_reg_my_pet.dart';

import '../../screens/reg_my_pet/end_form_reg_my_pet.dart';

class GetInformation {
  getTutorId() async {
    int tutorId = await EndRegisterTutor().getId();

    return tutorId;
  }

  getPetId() async {
    int petId = await EndFormRegMypet().getId();

    return petId;
  }
}
