import 'package:drippe/viewModels/alarm_view_model.dart';
import 'package:drippe/views/add_edit_alarm_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlarmScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _alarmList(context, ref),
    );
  }

  Widget _alarmList(context, ref) {
    final alarmViewModel = ref.watch(alarmViewModelProvider.notifier);
    final alarmState = ref.watch(alarmViewModelProvider);

    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text(
            'Alarm',
            style: Theme.of(context).textTheme.headline4,
          ),
          trailing: GestureDetector(
            child: const Icon(Icons.add, color: Colors.orange),
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddEditAlarmScreen(alarmState.alarms)));
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final alarm = alarmState.alarms[index];
              return Column(
                children: [
                  Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (value) async {
                            await alarmViewModel.deleteAlarm(alarm.id);
                          },
                          label: '削除',
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: alarm.isActive
                          ? const Icon(
                              Icons.notifications_active,
                              size: 24,
                              color: Colors.orange,
                            )
                          : const Icon(Icons.notifications_off, size: 24),
                      title: Text(
                        "${(alarm.alarmTime.inMinutes.remainder(60)).toString().padLeft(2, "0")}:${(alarm.alarmTime.inSeconds.remainder(60)).toString().padLeft(2, "0")}",
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w200),
                      ),
                      trailing: Switch(
                        value: alarm.isActive,
                        onChanged: (value) async {
                          // alarm.isActive = value;
                          print(value);
                          await alarmViewModel.changeStatus(
                              alarm, value ? 1 : 0);
                        },
                        activeColor: Colors.orange,
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEditAlarmScreen(
                                alarmState.alarms,
                                index: index),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(color: Colors.grey),
                ],
              );
            },
            childCount: alarmState.alarms.length,
          ),
        ),
      ],
    );
  }
}
