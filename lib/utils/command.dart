import 'package:curso_arquitetura_software/utils/result.dart';
import 'package:flutter/material.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, P> = Future<Result<T>> Function(P params);

abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  bool get running => _running;

  Result<T>? _result;
  Result<T>? get result => _result;

  bool get completed => _result is Ok;
  bool get error => _result is Error;

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();
    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T> extends Command<T> {
  final CommandAction0<T> action;

  Command0(this.action);

  Future<void> execute() async {
    await _execute(action);
  }
}

class Command1<T, P> extends Command<T> {
  final CommandAction1<T, P> action;
  Command1(this.action);

  Future<void> execute(P params) async {
    await _execute(() => action(params));
  }
}
