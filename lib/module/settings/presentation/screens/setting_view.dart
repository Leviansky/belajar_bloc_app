import 'package:bloc_beginner/module/settings/logic/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      floatingActionButton: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (BuildContext context, state) {
          if (state.totalIndicator > 0) {
            return FloatingActionButton(
              onPressed: () {},
              child: Text(state.totalIndicator.toString()),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
      body: Column(
        children: [
          BlocBuilder<SettingsCubit, SettingsState>(
            bloc: context.read<SettingsCubit>(),
            builder: (context, state) {
              return Column(
                children: [
                  SwitchListTile(
                    value: state.toggleAppIndicator,
                    onChanged: (newValue) {
                      context.read<SettingsCubit>().emitAppIndicator(newValue);
                    },
                    title: Text("Ini indicator App"),
                  ),
                  SwitchListTile(
                    value: state.toggleEmailIndicator,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .emitEmailIndicator(newValue);
                    },
                    title: Text("Ini indicator Email"),
                  ),
                  ListTile(
                    title: const Text('Sepatu'),
                    subtitle: const Text('Masukan sepatu dalam keranjang'),
                    trailing: state.totalSepatuIndicator > 0
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              state.totalSepatuIndicator > 0
                                  ? IconButton(
                                      onPressed: () {
                                        context
                                            .read<SettingsCubit>()
                                            .emitSepatuDecrement();
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 24.0,
                                      ),
                                    )
                                  : Container(),
                              Text(state.totalSepatuIndicator.toString()),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<SettingsCubit>()
                                      .emitSepatuIncrement();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              context
                                  .read<SettingsCubit>()
                                  .emitSepatuIncrement();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: const Text("ADD"),
                            ),
                          ),
                  ),
                  ListTile(
                    title: const Text('Baju'),
                    subtitle: const Text('Masukan baju dalam keranjang'),
                    trailing: state.totalBajuIndicator > 0
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              state.totalBajuIndicator > 0
                                  ? IconButton(
                                      onPressed: () {
                                        context
                                            .read<SettingsCubit>()
                                            .emitBajuDecrement();
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 24.0,
                                      ),
                                    )
                                  : Container(),
                              Text(state.totalBajuIndicator.toString()),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<SettingsCubit>()
                                      .emitBajuIncrement();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 24.0,
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              context.read<SettingsCubit>().emitBajuIncrement();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              child: const Text("ADD"),
                            ),
                          ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
