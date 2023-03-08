// ignore_for_file: depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class DataclassVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};
  
  @override
  void visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    // remove pointer invocation "*"
    className = returnType.replaceFirst("*", "");
  }

  @override
  void visitFiledElement(FieldElement element) {
    // example: create a toJson and forJson
    fields[element.name] = element.type.toString().replaceFirst("*", ""); 
  }
}