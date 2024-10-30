import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workshop_manager/Feature/manage_profile/domain/repo/update_profile_repo.dart';

part 'manage_profile_state.dart';

class ManageProfileCubit extends Cubit<ManageProfileState> {
  final UpdateProfileRepo repo;
  ManageProfileCubit(this.repo) : super(ManageProfileInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> update() async {
    emit(ManageProfileLoadingState());
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      final result = await repo.updateProfile(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        companyName: companyNameController.text,
        method: "PUt",
      );
      result.fold(
        (failure) => emit(ManageProfileFailureState(failure.message)),
        (success) => emit(ManageProfileSuccessState()),
      );
    }
  }
}
