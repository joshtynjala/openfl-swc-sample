# Create SWC Library with OpenFL Sample

Demonstrates how to create a _.swc_ library for ActionScript 3.0 using [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/). This allows AS3 developers using Adobe AIR to access Haxe libraries too.

To build the _.swc_ library, use the following command:

```sh
openfl build flash -debug
```

The file will be created at _bin/flash/bin/mylibrary.swc_.

To use the _.swc_ library in an ActionScript project, add it with the `--library-path` compiler option.

```sh
mxmlc --library-path+=mylibrary.swc
```

During startup, such as in the constructor of the main AS3 class, you should add the following AS3 code because it initializes a few things that are expected by Haxe-compiled _.swc_ libraries:

```as3
haxe.initSwc(null);
```

## Build SWC instead of SWF

The [OpenFL](https://openfl.org) library contains a number of template files that are used when building a project. You can find them in the [_openfl/assets/templates_](https://github.com/openfl/openfl/tree/develop/assets/templates) and the [_lime/templates_](https://github.com/openfl/lime/tree/develop/templates) directories. Using the `<template>` element in _project.xml_, it's possible to replace one or more of these template files with custom versions, on a per-project basis, and without forking OpenFL.

This sample project contains a directory named [_custom-templates_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates). It is configured in [_project.xml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/project.xml) like this:

```xml
<template path="custom-templates"/>
```

Inside [_custom-templates_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates), there's a directory [_flash/hxml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates/flash/hxml/) that contains custom _.hxml_ files for compiling with Haxe, including [_debug.hxml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates/flash/hxml/debug.hxml), [_release.hxml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates/flash/hxml/release.hxml), and [_final.hxml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates/flash/hxml/final.hxml). The relative path to this directory inside [_custom-templates_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/custom-templates) matches the directory named [_flash/hxml_](https://github.com/openfl/lime/tree/develop/templates/flash/hxml) inside Lime's [_templates_](https://github.com/openfl/lime/tree/develop/templates) directory.

These custom _.hxml_ template files modify the `-swf` compiler option to use the file extension _.swc_ instead of _.swf_ for the name of the output file. This is how you configure the Haxe compiler to generate a _.swc_ library for Adobe AIR.

## Include all classes in a package

This sample uses the [`Compiler.include()`](https://api.haxe.org/haxe/macro/Compiler.html#include) macro to include all classes (recrusively) in the _com.example_ package. This macro is configured in [_project.xml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/project.xml) like this:

```xml
<haxeflag name="--macro" value="include('com.example')"/>
```

## `@:flash.property` meta

Finally, a custom [`AddFlashPropertyMeta.find()`](https://github.com/joshtynjala/openfl-swc-sample/tree/main/build_macros/flash/AddFlashPropertyMeta.hx) macro is used to automatically add `@:flash.property` meta to all properties with getters and setters. Normally, you'd need to do this manually. Haxe's `@:flash.property` meta ensures that a property is compiled with native AS3 getters and setters, instead of `get_propertyName()` and `set_propertyName()` methods. This macro is configured in [_project.xml_](https://github.com/joshtynjala/openfl-swc-sample/tree/main/project.xml) like this:

```xml
<source path="build_macros/flash"/>
<haxeflag name="--macro" value="AddFlashPropertyMeta.find('com.example')"/>
```

---

Sample created by [Josh Tynjala](https://github.com/sponsors/joshtynjala), the author of [Feathers UI](https://feathersui.com/) and core contributor to [OpenFL](https://openfl.org/).
