# generator.bzl
def file_generator(name, arg, visibility=None):
    native.genrule(
        name = name,
        outs = [name + ".txt"],
        cmd = "$(location //:generator) %s > $@" % arg,
        tools = ["//:generator"],
        visibility = visibility,
    )
def chained_genrules(name, arg, visibility=None):
    native.genrule(
        name = name + "-one",
        outs = [name + ".one"],
        cmd = "$(location //:tool-one) $@" % arg,
        tools = ["//:tool-one"],
        visibility = ["//visibility:private"],
    )
    native.genrule(
        name = name + "-two",
        outs = [name + ".one"],
        cmd = "$(location //:tool-two) $@" % arg,
        tools = ["//:tool-two"],
        visibility = ["//visibility:private"],
    )

# The example only assigns a visibility value to the second
# genrule. This allows macro authors to hide the outputs of intermediate
# rules from being depended upon by other targets in the workspace.The
# example only assigns a visibility value to the second genrule. This
# allows macro authors to hide the outputs of intermediate rules from
# being depended upon by other targets in the workspace.

def file_writer(name, srcs):
    native.sh_binary(
        name = name,
        srcs = srcs,
    )
