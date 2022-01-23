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

Sample created by [Josh Tynjala](https://twitter.com/joshtynjala), the author of [Feathers UI](https://feathersui.com/).
