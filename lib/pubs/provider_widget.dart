import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, Widget child) builder;
  final T model;
  final Function(T) onReady;

  const ProviderWidget({
    key: Key,
    this.model,
    this.onReady,
    this.builder,
  });

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.onReady != null) {
      widget.onReady(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => widget.model,
      builder: widget.builder,
    );
  }
}
