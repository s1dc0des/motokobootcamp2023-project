import 'package:anons_dao/assets/images.dart';
import 'package:anons_dao/providers/auth_provider.dart';
import 'package:anons_dao/services/anons_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final anonsService = AnonsService();
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: 200,
            child: InkWell(
              onTap: () async {
                await auth.login();
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Image.asset(ImageAssets.plugLogo),
                    ),
                    Text(
                      "Connect with plug",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SizedBox(
        child: Center(
          child: MaterialButton(
            onPressed: () async {
              var res = await anonsService.getAllProposalsS();
              print(res.first.item2.message);
            },
            child: const Text("get all proposals"),
          ),
        ),
      ),
    );
  }
}
