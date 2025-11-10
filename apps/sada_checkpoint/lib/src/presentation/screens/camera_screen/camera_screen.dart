import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sada_design_system/sada_design_system.dart';

import 'camera_store.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({required this.cameraStore, super.key});

  final CameraStore cameraStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!cameraStore.isCameraInitialized) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: SadaAppBar(
            title: 'Ocorrência',
            leading: SadaBackButton(onPressed: () => Modular.to.pop()),
          ),
          body: FutureBuilder<void>(
            future: cameraStore.initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Observer(
                  builder: (_) {
                    if (cameraStore.capturedImage != null) {
                      return Center(
                        child: Image.file(
                          File(cameraStore.capturedImage!.path),
                        ),
                      );
                    }
                    return SizedBox.expand(
                      child: CameraPreview(cameraStore.controller),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: Observer(
            builder: (_) {
              if (cameraStore.capturedImage != null) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipOval(
                      child: FloatingActionButton(
                        heroTag: 'cancel',
                        backgroundColor: Colors.red,
                        onPressed: cameraStore.resetPicture,
                        child: const Icon(Icons.close),
                      ),
                    ),
                    ClipOval(
                      child: FloatingActionButton(
                        heroTag: 'approve',
                        backgroundColor: Colors.green,
                        onPressed: () async {
                          final file = File(cameraStore.capturedImage!.path);
                          cameraStore.controller.dispose();
                          Modular.to.pop<File>(file);
                        },
                        child: const Icon(Icons.check),
                      ),
                    ),
                  ],
                );
              }
              return GestureDetector(
                onTap: cameraStore.takePicture,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
