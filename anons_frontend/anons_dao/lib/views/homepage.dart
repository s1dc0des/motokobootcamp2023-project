import 'package:anons_dao/assets/images.dart';
import 'package:anons_dao/did/anons_ic_backend.idl.dart';
import 'package:anons_dao/helpers/chain_utils.dart';
import 'package:anons_dao/providers/anon_dao_provider.dart';
import 'package:anons_dao/providers/auth_provider.dart';
import 'package:anons_dao/services/anons_service.dart';
import 'package:anons_dao/services/plug_service.dart';
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
        title: Text(
          "Anons Dao",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          SizedBox(
            width: 200,
            child: InkWell(
              onTap: () async {
                await auth.login();
              },
              child: !auth.loggedIn
                  ? Padding(
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
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    )
                  : Center(child: Text(ChainUtils.formatPrincipal(principal: auth.myPrincipal!.toString()))),
            ),
          )
        ],
      ),
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    maxLines: 3,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () async {
                      if (auth.loggedIn) {
                        var res = await PlugService().submitProposal(_textEditingController.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.toString())));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("login to submit proposal")));
                      }
                    },
                    color: Colors.black,
                    minWidth: 200,
                    height: 40,
                    child: const Text("Submit Proposal"),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: anon.proposals.length,
              itemBuilder: ((context, index) {
                final Proposal p = anon.proposals[index];

                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (p.executed == null && auth.loggedIn) ...[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                              onPressed: () async {
                                var res = await PlugService().vote(p.id.toInt(), false, "");
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.toString())));
                                anon.getAllProposals();
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Id : ",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  anon.proposals[index].id.toInt().toString(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
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
                              children: [
                                Text(
                                  "Proposer : ",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  ChainUtils.formatPrincipal(principal: anon.proposals[index].proposer.toString()),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const Text(""),
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
                                Text(
                                  "Pass votes : ",
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.green),
                                ),
                                Text(
                                  anon.proposals[index].passedWith?.toString() ?? "",
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.green),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rejected with : ",
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.red),
                                ),
                                Text(
                                  anon.proposals[index].rejectedWith?.toString() ?? "",
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (p.executed == null && auth.loggedIn) ...[
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                              onPressed: () async {
                                var res = await PlugService().vote(p.id.toInt(), false, "");
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.toString())));
                                anon.getAllProposals();
                              },
                              icon: const Icon(
                                Icons.verified,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                          ),
                        ]
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
