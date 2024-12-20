import 'package:flutter/material.dart';
import 'package:master_plan/model/data_layer.dart';
import 'package:master_plan/plan_creator_screen.dart';
// import 'package:master_plan/plan_screen.dart';
import 'package:master_plan/provider/plan_provider.dart';
// import './plan_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
