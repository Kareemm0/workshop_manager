import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshop_manager/Core/constant/app_shared_pref_keys.dart';
import 'package:workshop_manager/Feature/EditWorkshopProfile/domain/repo/edit_workshop_profile_repo.dart';
import '../../../../Core/service/shared_pref.dart';

part 'edit_workshop_profile_state.dart';

class EditWorkshopProfileCubit extends Cubit<EditWorkshopProfileState> {
  final EditWorkshopProfileRepo repo;
  EditWorkshopProfileCubit(this.repo) : super(EditWorkshopProfileInitial());

  ImagePicker picker = ImagePicker();
  File? logo;
  String capacityNumber = "القدرة الاستيعابية ";

  //! Controllers
  TextEditingController workshopNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneOneController = TextEditingController();
  TextEditingController phonetwoController = TextEditingController();
  TextEditingController arDescritptionController = TextEditingController();
  TextEditingController enDescritptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  //! Image Picker
  Future<void> logoPicker(ImageSource source) async {
    try {
      final pick = await picker.pickImage(source: source);
      if (pick != null) {
        logo = File(pick.path);
        emit(ImagePickerSuccessState(logo!));
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editWorkshop(String id) async {
    final gove = await SharedPref().get(AppSharedPrefrencesKeys.goves);
    final district = await SharedPref().get(AppSharedPrefrencesKeys.distric);
    List<dynamic> brand =
        await SharedPref().getList(AppSharedPrefrencesKeys.brand);
    emit(EditWorkshopProfileLoadingState());
    final result = await repo.editWorkshop(
      id,
      logo: logo!,
      name: workshopNameController.text,
      address: addressController.text,
      geoLat: "24.7136",
      geolng: "46.6753",
      phone: phoneOneController.text,
      arDescritption: arDescritptionController.text,
      enDescritption: enDescritptionController.text,
      capacity: capacityNumber,
      govesId: gove!,
      districId: district!,
      brands: brand,
      days: [
        {
          "day": "saturday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 0,
        },
        {
          "day": "sunday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 1,
        },
        {
          "day": "monday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 1,
        },
        {
          "day": "tuesday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 1,
        },
        {
          "day": "wednesday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 1,
        },
        {
          "day": "thursday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 1,
        },
        {
          "day": "friday",
          "start_hour": "00:00:00",
          "end_hour": "23:59:00",
          "is_off": 1,
        }
      ],
      method: "PUT",
    );
    result.fold(
        (failure) => emit(EditWorkshopProfileFailureState(failure.message)),
        (success) => emit(EditWorkshopProfilSuccessState()));
  }
}
