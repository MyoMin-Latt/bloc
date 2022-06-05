import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/api_bloc.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _apiBloc = BlocProvider.of<ApiBloc>(context);
    return Scaffold(
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is ApiLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ApiSuccess) {
            return Center(
              child: Text(state.data),
            );
          } else if (state is ApiError) {
            return const Center(
              child: Text('Something wrong '),
            );
          }
          return Center(
            child: ElevatedButton(
              onPressed: () async {
                _apiBloc.add(GetApiEvent());
              },
              child: const Text('Get Data'),
            ),
          );
        },
      ),
    );
  }
}
