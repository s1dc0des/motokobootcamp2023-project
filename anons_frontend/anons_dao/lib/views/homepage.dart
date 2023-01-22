import 'package:anons_dao/assets/images.dart';
import 'package:anons_dao/helpers/chain_utils.dart';
import 'package:anons_dao/providers/anon_dao_provider.dart';
import 'package:anons_dao/providers/auth_provider.dart';
import 'package:anons_dao/services/anons_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Future.delayed(const Duration(microseconds: 200), () {
      ref.read(anonDaoProvider).getAllProposals();
    });
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final anon = ref.watch(anonDaoProvider);
    final anonsService = AnonsService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anons Dao"),
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
        child: Column(
          children: [
            Container(
              height: 400,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text("Submit Proposal"),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: anon.proposals.length,
              itemBuilder: ((context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("Id : "),
                                Text(anon.proposals[index].id.toInt().toString()),
                                const Text(""),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Message : "),
                                Text(anon.proposals[index].message),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Executed : "),
                                Text(anon.proposals[index].executed?.toString() ?? ""),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Created At: "),
                                Text(ChainUtils.getDateFromNano(anon.proposals[index].createdOn.toInt()).toString()),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(""),
                                Text(""),
                                Text(""),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Finalised At : "),
                                Text(anon.proposals[index].finalisedAt != null
                                    ? ChainUtils.getDateFromNano(anon.proposals[index].finalisedAt!.toInt()).toString()
                                    : ""),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Pass votes : "),
                                Text(anon.proposals[index].passedWith?.toString() ?? ""),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Rejected with : "),
                                Text(anon.proposals[index].rejectedWith?.toString() ?? ""),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
