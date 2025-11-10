import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:signature/signature.dart';

import '../../../../domain/models/occurrence.dart';
import '../../../../domain/use_cases/submit_occurrence_use_case.dart';

part 'occurrence_store.g.dart';

// ignore: library_private_types_in_public_api
class OccurrenceStore = _OccurrenceStoreBase with _$OccurrenceStore;

abstract class _OccurrenceStoreBase with Store {
  _OccurrenceStoreBase({
    required SubmitOccurrenceUseCase submitOccurrenceUseCase,
  }) : _submitOccurrenceUseCase = submitOccurrenceUseCase;

  final TextEditingController licensePlateController = TextEditingController();
  final TextEditingController responsavelNameController =
      TextEditingController();
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final SubmitOccurrenceUseCase _submitOccurrenceUseCase;

  @observable
  ObservableList<File> photos = ObservableList<File>();
  @observable
  bool _isValideLicensePlate = false;
  @observable
  ui.Image? signatureImage;
  @observable
  bool hasResponsableName = false;
  @observable
  bool signatureIsNotEmpty = false;
  @observable
  bool isSubmitting = false;
  DateTime? createdAt;

  @computed
  bool get isValid => _isValideLicensePlate && photos.isNotEmpty;
  @computed
  bool get isFormValid => hasResponsableName && signatureImage != null;

  void initOccurence() {
    licensePlateController.addListener(_licensePlateListener);
  }

  void initResponsable() {
    responsavelNameController.addListener(_responsavelNameListener);
  }

  void initSignature() {
    signatureController.addListener(_signatureControllerListener);
  }

  @action
  void _licensePlateListener() {
    final licensePlate = licensePlateController.text;

    if (licensePlate.isEmpty || licensePlate.length < 7) {
      _isValideLicensePlate = false;
      return;
    }

    final regex = RegExp(r'^[A-Z]{3}-\d{4}$|^[A-Z]{3}-\d[A-Z]\d{2}$');
    final temp = regex.hasMatch(licensePlate);
    _isValideLicensePlate = temp;
  }

  @action
  void addPhoto(File photo) => photos.add(photo);

  @action
  void setSignatureImage(ui.Image signature) => signatureImage = signature;

  @action
  void _responsavelNameListener() =>
      hasResponsableName = responsavelNameController.text.isNotEmpty;

  void _signatureControllerListener() =>
      signatureIsNotEmpty = signatureController.isNotEmpty;

  @action
  Future<void> submit() async {
    isSubmitting = true;
    createdAt = DateTime.now();
    await _submitOccurrenceUseCase(
      Occurrence(
        licensePlate: licensePlateController.text,
        responsibleName: responsavelNameController.text,
        signature: signatureImage!,
        photos: photos.toList(),
        createdAt: createdAt!,
      ),
    );
    isSubmitting = false;

    Modular.to.pushNamed('/occurrence/success');
  }

  void close() {
    licensePlateController.clear();
    responsavelNameController.clear();
    signatureController.clear();
    signatureImage = null;
    photos = ObservableList<File>();
    createdAt = null;

    Modular.to.popAndPushNamed('/');
  }
}
