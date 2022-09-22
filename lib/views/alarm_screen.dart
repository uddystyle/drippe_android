import 'package:drippe/models/alarm.dart';
import 'package:drippe/viewModels/alarm_view_model.dart';
import 'package:drippe/views/add_edit_alarm_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  List<Alarm> alarmList = [];

  Future<void> initDb() async {
    await AlarmProvider.setDb();
    reBuild();
  }

  Future<void> reBuild() async {
    alarmList = await AlarmProvider.getData();
    alarmList.sort((a, b) => a.alarmTime.compareTo(b.alarmTime));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                        builder: (context) => AddEditAlarmScreen(alarmList)));
                reBuild();
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Alarm alarm = alarmList[index];
                return Column(
                  children: [
                    // if (index == 0)
                    //   const Divider(color: Colors.grey, height: 1),
                    Slidable(
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (value) async {
                              await AlarmProvider.deleteData(alarm.id);
                              reBuild();
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            label: '削除',
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
                          onChanged: (newValue) async {
                            alarm.isActive = newValue;
                            await AlarmProvider.updateData(alarm);
                            reBuild();
                          },
                          activeColor: Colors.orange,
                        ),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddEditAlarmScreen(alarmList, index: index),
                            ),
                          );
                          // 画面遷移から戻ってきた時に再描画する
                          reBuild();
                        },
                      ),
                    ),
                    const Divider(color: Colors.grey),
                  ],
                );
              },
              childCount: alarmList.length,
            ),
          ),
        ],
      ),
    );
  }
}
