// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_board_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TaskBoard extends _TaskBoard
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TaskBoard(
    Uuid id,
    String title, {
    bool enable = true,
    Iterable<Task> task = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TaskBoard>({
        'enable': true,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'enable', enable);
    RealmObjectBase.set<RealmList<Task>>(this, 'task', RealmList<Task>(task));
  }

  TaskBoard._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  RealmList<Task> get task =>
      RealmObjectBase.get<Task>(this, 'task') as RealmList<Task>;
  @override
  set task(covariant RealmList<Task> value) => throw RealmUnsupportedSetError();

  @override
  bool get enable => RealmObjectBase.get<bool>(this, 'enable') as bool;
  @override
  set enable(bool value) => RealmObjectBase.set(this, 'enable', value);

  @override
  Stream<RealmObjectChanges<TaskBoard>> get changes =>
      RealmObjectBase.getChanges<TaskBoard>(this);

  @override
  TaskBoard freeze() => RealmObjectBase.freezeObject<TaskBoard>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TaskBoard._);
    return const SchemaObject(ObjectType.realmObject, TaskBoard, 'TaskBoard', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('task', RealmPropertyType.object,
          linkTarget: 'Task', collectionType: RealmCollectionType.list),
      SchemaProperty('enable', RealmPropertyType.bool),
    ]);
  }
}

class Task extends _Task with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Task(
    Uuid id,
    String description, {
    bool complete = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Task>({
        'complete': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'complete', complete);
  }

  Task._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  bool get complete => RealmObjectBase.get<bool>(this, 'complete') as bool;
  @override
  set complete(bool value) => RealmObjectBase.set(this, 'complete', value);

  @override
  Stream<RealmObjectChanges<Task>> get changes =>
      RealmObjectBase.getChanges<Task>(this);

  @override
  Task freeze() => RealmObjectBase.freezeObject<Task>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Task._);
    return const SchemaObject(ObjectType.realmObject, Task, 'Task', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('complete', RealmPropertyType.bool),
    ]);
  }
}
