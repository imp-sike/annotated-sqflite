library generators;

import 'package:build/build.dart';
import 'package:generators/src/dataclass_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonClass(BuilderOptions options) =>SharedPartBuilder([DataclassGenerator()], "data_class_generator");