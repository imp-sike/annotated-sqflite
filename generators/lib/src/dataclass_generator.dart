// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:annotations/annotations.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:generators/src/dataclass_visitor.dart';
import 'package:source_gen/source_gen.dart';

class DataclassGenerator extends GeneratorForAnnotation<DataClass> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = DataclassVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();
    String className = '${visitor.className}Gen';
    buffer.writeln('class $className {');
    
    // create fields
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln('final ${visitor.fields.values.elementAt(i)} ${visitor.fields.keys.elementAt(i)}');
    }

    // create constructor
    buffer.writeln('const $className ({');
    for (int i = 0; i < visitor.fields.length; i++) {
      buffer.writeln('required ${visitor.fields.keys.elementAt(i)},');
    }
    buffer.writeln('})');


    // TODO toMAP and fromMap, etc
    buffer.writeln('}');

    return buffer.toString();
  }
}
