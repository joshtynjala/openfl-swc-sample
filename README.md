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

Sample created by [Josh Tynjala](https://github.com/sponsors/joshtynjala), the author of [Feathers UI](https://feathersui.com/) and core contributor to [OpenFL](https://openfl.org/).
