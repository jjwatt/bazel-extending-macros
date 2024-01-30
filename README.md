# Basic bazel setup for Macros

For learning and experimenting with Bazel Macros.

Adapted from here: https://bazel.build/extending/macros

So far, in this main branch, I've only added just enough to make the
examples from the manual work. It could have been done in a simpler way,
but I wanted to do it in a way that did not force the examples to change.

## To build

```shell
$ bazel build //:file
INFO: Analyzed target //:file (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
Target //:file up-to-date:
  bazel-bin/file.txt
INFO: Elapsed time: 0.043s, Critical Path: 0.00s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```
```shell
$ bazel build //:file-two
```

You'll have files in `bazel-bin/`

## To see macro expansions

From the manual, too

```shell
$ bazel query --output=build //:file
```

output on my system
```shell
# /home/jwatt/git/github.com/jjwatt/bazel-extending-macros/BUILD:20:15
genrule(
  name = "file",
  generator_name = "file",
  generator_function = "file_generator",
  generator_location = "/home/jwatt/git/github.com/jjwatt/bazel-extending-macros/BUILD:20:15",
  tools = ["//:generator"],
  outs = ["//:file.txt"],
  cmd = "$(location //:generator) some_arg > $@",
)
# Rule file instantiated at (most recent call last):
#   /home/jwatt/git/github.com/jjwatt/bazel-extending-macros/BUILD:20:15             in <toplevel>
#   /home/jwatt/git/github.com/jjwatt/bazel-extending-macros/path/generator.bzl:3:19 in file_generator
```

You can sort of get the whole "real" build file like this

```
$ bazel query --output=build :all
```

