import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/bloc/square_bloc_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Random rnd = Random();
    int indexlist;
    List<int> countlist = [];

    void editIndex(int index) {
      context.read<SquareBlocBloc>().add(IncrementCountEvent(count: index + 1));
    }

    return BlocBuilder<SquareBlocBloc, SquareBlocState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    indexlist = rnd.nextInt(20) + 1;
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                indexlist,
                                (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      editIndex(index);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Выбрать квадратик',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                if (state is SquareState) Text(state.history.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
