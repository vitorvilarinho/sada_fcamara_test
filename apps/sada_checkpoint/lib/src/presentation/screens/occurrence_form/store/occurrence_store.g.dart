// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occurrence_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OccurrenceStore on _OccurrenceStoreBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(
    () => super.isValid,
    name: '_OccurrenceStoreBase.isValid',
  )).value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid => (_$isFormValidComputed ??= Computed<bool>(
    () => super.isFormValid,
    name: '_OccurrenceStoreBase.isFormValid',
  )).value;

  late final _$photosAtom = Atom(
    name: '_OccurrenceStoreBase.photos',
    context: context,
  );

  @override
  ObservableList<File> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<File> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$_isValideLicensePlateAtom = Atom(
    name: '_OccurrenceStoreBase._isValideLicensePlate',
    context: context,
  );

  @override
  bool get _isValideLicensePlate {
    _$_isValideLicensePlateAtom.reportRead();
    return super._isValideLicensePlate;
  }

  @override
  set _isValideLicensePlate(bool value) {
    _$_isValideLicensePlateAtom.reportWrite(
      value,
      super._isValideLicensePlate,
      () {
        super._isValideLicensePlate = value;
      },
    );
  }

  late final _$signatureImageAtom = Atom(
    name: '_OccurrenceStoreBase.signatureImage',
    context: context,
  );

  @override
  ui.Image? get signatureImage {
    _$signatureImageAtom.reportRead();
    return super.signatureImage;
  }

  @override
  set signatureImage(ui.Image? value) {
    _$signatureImageAtom.reportWrite(value, super.signatureImage, () {
      super.signatureImage = value;
    });
  }

  late final _$hasResponsableNameAtom = Atom(
    name: '_OccurrenceStoreBase.hasResponsableName',
    context: context,
  );

  @override
  bool get hasResponsableName {
    _$hasResponsableNameAtom.reportRead();
    return super.hasResponsableName;
  }

  @override
  set hasResponsableName(bool value) {
    _$hasResponsableNameAtom.reportWrite(value, super.hasResponsableName, () {
      super.hasResponsableName = value;
    });
  }

  late final _$signatureIsNotEmptyAtom = Atom(
    name: '_OccurrenceStoreBase.signatureIsNotEmpty',
    context: context,
  );

  @override
  bool get signatureIsNotEmpty {
    _$signatureIsNotEmptyAtom.reportRead();
    return super.signatureIsNotEmpty;
  }

  @override
  set signatureIsNotEmpty(bool value) {
    _$signatureIsNotEmptyAtom.reportWrite(value, super.signatureIsNotEmpty, () {
      super.signatureIsNotEmpty = value;
    });
  }

  late final _$isSubmittingAtom = Atom(
    name: '_OccurrenceStoreBase.isSubmitting',
    context: context,
  );

  @override
  bool get isSubmitting {
    _$isSubmittingAtom.reportRead();
    return super.isSubmitting;
  }

  @override
  set isSubmitting(bool value) {
    _$isSubmittingAtom.reportWrite(value, super.isSubmitting, () {
      super.isSubmitting = value;
    });
  }

  late final _$submitAsyncAction = AsyncAction(
    '_OccurrenceStoreBase.submit',
    context: context,
  );

  @override
  Future<void> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  late final _$_OccurrenceStoreBaseActionController = ActionController(
    name: '_OccurrenceStoreBase',
    context: context,
  );

  @override
  void _licensePlateListener() {
    final _$actionInfo = _$_OccurrenceStoreBaseActionController.startAction(
      name: '_OccurrenceStoreBase._licensePlateListener',
    );
    try {
      return super._licensePlateListener();
    } finally {
      _$_OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPhoto(File photo) {
    final _$actionInfo = _$_OccurrenceStoreBaseActionController.startAction(
      name: '_OccurrenceStoreBase.addPhoto',
    );
    try {
      return super.addPhoto(photo);
    } finally {
      _$_OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSignatureImage(ui.Image signature) {
    final _$actionInfo = _$_OccurrenceStoreBaseActionController.startAction(
      name: '_OccurrenceStoreBase.setSignatureImage',
    );
    try {
      return super.setSignatureImage(signature);
    } finally {
      _$_OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _responsavelNameListener() {
    final _$actionInfo = _$_OccurrenceStoreBaseActionController.startAction(
      name: '_OccurrenceStoreBase._responsavelNameListener',
    );
    try {
      return super._responsavelNameListener();
    } finally {
      _$_OccurrenceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
photos: ${photos},
signatureImage: ${signatureImage},
hasResponsableName: ${hasResponsableName},
signatureIsNotEmpty: ${signatureIsNotEmpty},
isSubmitting: ${isSubmitting},
isValid: ${isValid},
isFormValid: ${isFormValid}
    ''';
  }
}
