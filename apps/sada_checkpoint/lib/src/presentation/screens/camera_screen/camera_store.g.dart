// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CameraStore on _CameraStoreBase, Store {
  late final _$capturedImageAtom = Atom(
    name: '_CameraStoreBase.capturedImage',
    context: context,
  );

  @override
  XFile? get capturedImage {
    _$capturedImageAtom.reportRead();
    return super.capturedImage;
  }

  @override
  set capturedImage(XFile? value) {
    _$capturedImageAtom.reportWrite(value, super.capturedImage, () {
      super.capturedImage = value;
    });
  }

  late final _$isCameraInitializedAtom = Atom(
    name: '_CameraStoreBase.isCameraInitialized',
    context: context,
  );

  @override
  bool get isCameraInitialized {
    _$isCameraInitializedAtom.reportRead();
    return super.isCameraInitialized;
  }

  @override
  set isCameraInitialized(bool value) {
    _$isCameraInitializedAtom.reportWrite(value, super.isCameraInitialized, () {
      super.isCameraInitialized = value;
    });
  }

  late final _$initAsyncAction = AsyncAction(
    '_CameraStoreBase.init',
    context: context,
  );

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$takePictureAsyncAction = AsyncAction(
    '_CameraStoreBase.takePicture',
    context: context,
  );

  @override
  Future<void> takePicture() {
    return _$takePictureAsyncAction.run(() => super.takePicture());
  }

  late final _$_CameraStoreBaseActionController = ActionController(
    name: '_CameraStoreBase',
    context: context,
  );

  @override
  void resetPicture() {
    final _$actionInfo = _$_CameraStoreBaseActionController.startAction(
      name: '_CameraStoreBase.resetPicture',
    );
    try {
      return super.resetPicture();
    } finally {
      _$_CameraStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
capturedImage: ${capturedImage},
isCameraInitialized: ${isCameraInitialized}
    ''';
  }
}
