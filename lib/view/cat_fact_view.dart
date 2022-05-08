import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_demo/models/cat_fact_model.dart';
import 'package:riverpod_demo/provider/cat_fact_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatFactView extends ConsumerWidget {
  const CatFactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(catFactProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Fact"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/cat.png'),
              _showCatFact(viewModel),
              ElevatedButton(
                onPressed: () => _getNewCatFact(ref),
                child: const Text("Get Fact"),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showCatFact(AsyncValue<CatFactModel> viewModel) {
    return viewModel.when(
      data: (data) => Text(
        data.fact.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      error: (err, __) => Text("$err"),
      loading: () => const CupertinoActivityIndicator(),
    );
  }

  _getNewCatFact(WidgetRef ref) {
    ref.refresh(catFactProvider);
  }
}
