const std = @import("std");

const Platform = struct {
    name: []const u8,
    ext: []const u8,
    arches: []const []const u8,
};
const platforms = [_]Platform{.{
    .name = "windows",
    .ext = "zip",
    .arches = &[_][]const u8 {
        "x86_64",
        "x86",
        "aarch64",
    },
},.{
    .name = "macos",
    .ext = "tar.xz",
    .arches = &[_][]const u8 {
        "aarch64",
        "x86_64",
    },
},.{
    .name = "linux",
    .ext = "tar.xz",
    .arches = &[_][]const u8 {
        "x86_64",
        "x86",
        "aarch64",
        "riscv64",
        "powerpc64le",
        "powerpc",
    },
}};

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const al = arena.allocator();
    const cmd_args = try std.process.argsAlloc(al);
    if (cmd_args.len != 3) {
        try std.io.getStdErr().writer().writeAll("Usage: zig run makelinks.zig -- VERSION ziglang|bazel\n");
        std.os.exit(0xff);
    }
    const version = cmd_args[1];
    const kind_str = cmd_args[2];

    const kind : enum { ziglang, bazel } = blk: {
        if (std.mem.eql(u8, kind_str, "ziglang")) break :blk .ziglang;
        if (std.mem.eql(u8, kind_str, "bazel")) break :blk .bazel;
        std.log.err("expected 'ziglang' or 'bazel' but got '{s}'", .{kind_str});
        std.os.exit(0xff);
    };

    const stdout = std.io.getStdOut().writer();
    try stdout.writeAll("| Platform | Download Link |\n");
    try stdout.writeAll("|----------|---------------|\n");
    for (platforms) |platform| {
        var links_buf = std.ArrayList(u8).init(al);
        defer links_buf.deinit();
        const links_writer = links_buf.writer();

        var prefix: []const u8 = "";
        for (platform.arches) |arch| {
            try links_writer.writeAll(prefix);
            prefix = " &#124; ";
            switch (kind) {
                .ziglang => try links_writer.print(
                    "[{[arch]s}](https://ziglang.org/builds/zig-{[name]s}-{[arch]s}-{[version]s}.{[ext]s})", .{
                        .arch = arch,
                        .name = platform.name,
                        .version = version,
                        .ext = platform.ext,
                    },
                ),
                .bazel => try links_writer.print(
                    "[{[arch]s}](https://mirror.bazel.build/ziglang.org/builds/zig-{[name]s}-{[arch]s}-{[version]s}.{[ext]s})", .{
                        .arch = arch,
                        .name = platform.name,
                        .version = version,
                        .ext = platform.ext,
                    },
                ),
            }
        }
        try stdout.print("| {s} | {s} |\n", .{platform.name, links_buf.items});
    }
}
