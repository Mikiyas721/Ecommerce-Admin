import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  final T bloc;

  Provider({@required Widget child, @required this.bloc}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static T of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider<T>>()?.bloc;
  }
}

class BlocProvider<T> extends StatefulWidget {
  final T Function() blocFactory;
  final Widget Function(BuildContext context, T bloc) builder;

  BlocProvider({@required this.blocFactory, @required this.builder});

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T> extends State<BlocProvider<T>> {
  T bloc;

  @override
  void initState() {
    bloc = widget.blocFactory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<T>(bloc: bloc, child: widget.builder(context, bloc));
  }
}
