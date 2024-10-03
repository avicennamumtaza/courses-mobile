import 'package:flutter/material.dart';
import 'package:master_plan/model/plan.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required super.child, required
   ValueNotifier<Plan> super.notifier});

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.
    dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}