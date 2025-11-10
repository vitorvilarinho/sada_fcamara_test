import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sada_design_system/sada_design_system.dart';
import 'package:signature/signature.dart';

import 'store/occurrence_store.dart';

class SignatureScreen extends StatelessWidget {
  const SignatureScreen({required this.store, super.key});

  final OccurrenceStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SadaAppBar(
        title: 'Assinatura',
        leading: SadaBackButton(onPressed: () => Modular.to.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/illustrations/erase.svg',
                  package: 'sada_design_system',
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () => store.signatureController.clear(),
                  child: Text('Apagar'),
                ),
              ],
            ),
            Signature(
              controller: store.signatureController,
              height: 300,
              backgroundColor: Colors.grey[200]!,
            ),
            Divider(),
            Spacer(),
            Observer(
              builder: (_) {
                return SadaButton(
                  label: 'Confirmar',
                  onPressed: store.signatureIsNotEmpty
                      ? () async {
                          final image = await store.signatureController
                              .toImage();
                          Modular.to.pop(image);
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
