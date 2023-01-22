import 'package:agent_dart/agent_dart.dart';
import 'init.dart';

class AnonsController extends ActorHook {
  AnonsController();

  factory AnonsController.create(CanisterActor _actor) {
    return AnonsController()..setActor(_actor);
  }

  setActor(CanisterActor _actor) {
    actor = _actor;
  }
}
