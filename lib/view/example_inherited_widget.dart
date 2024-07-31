import 'package:flutter/material.dart';

class FamilyProvider extends InheritedWidget {
  final String? colorOfHair;

  const FamilyProvider({
    super.key,
    required Widget child,
    this.colorOfHair,
  }) : super(child: child);

  static FamilyProvider of(BuildContext context) {
    final FamilyProvider? result =
        context.dependOnInheritedWidgetOfExactType<FamilyProvider>();
    assert(result != null, 'No FamilyProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FamilyProvider oldWidget) {
    return colorOfHair != oldWidget.colorOfHair;
  }
}

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FamilyProvider(
          // colorOfHair: 'black',
          child: ChildWidget(),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final familyProvider = FamilyProvider.of(context);
    final String? colorOfHair = familyProvider.colorOfHair;
    return colorOfHair == null
        ? const CircularProgressIndicator()
        : Text(colorOfHair);
  }
}
