# The typical use case for a macro is when you want to reuse a rule.

# For example, genrule in a BUILD file generates a file using
# //:generator with a some_arg argument hardcoded in the command:

# Example:
# genrule(
#     name = "file",
#     outs = ["file.txt"],
#     cmd = "$(location //:generator) some_arg > $@",
#     tools = ["//:generator"],
# )

# If you want to generate more files with different arguments, you may
# want to extract this code to a macro function. Let's call the macro
# file_generator, which has name and arg parameters. Replace the genrule
# with the following:

load("//path:generator.bzl", "file_generator", "file_writer")
file_generator(
    name = "file",
    arg = "some_arg",
)
file_generator(
    name = "file-two",
    arg = "some_arg_two",
)
file_writer(
    name = "generator",
    srcs = ["cat.sh"]
)
# Here, you load the file_generator symbol from a .bzl file located in
#     the //path package. By putting macro function definitions in a
#     separate .bzl file, you keep your BUILD files clean and
#     declarative, The .bzl file can be loaded from any package in the
#     workspace.file_generator( name = "file-three", arg =
#     "some_arg_three", )

