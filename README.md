Releases of Zig done every 2 weeks.

Use this list if you want to use/support a newer version of Zig than the latest release.

Goals:

- help projects coordinate what version of Zig to support and when to update
- provide a summary of what's going on with Zig development

The summary for each release will prioritize "breaking" and "bigger" public facing
changes at the top.

# Release Table

| Date       | Version                   | The Gist |
|------------|---------------------------|-------------|
| 2023-05-15 | 0.11.0-dev.3132+465272921 [summary](#0110-dev3132465272921-summary) | `std.build.*Step` renamed to `std.Build.Step.*` |
| 2023-04-30 | 0.11.0-dev.2892+fd6200eda [summary](#0110-dev2892fd6200eda-summary) | `@memcpy`/`@memset` now work with slices |
| 2023-04-16 | 0.11.0-dev.2619+bd3e248c7 [summary](#0110-dev2619bd3e248c7-summary) | HTTP Server added to std |
| 2023-04-02 | 0.11.0-dev.2336+5b82b4004 [summary](#0110-dev23365b82b4004-summary) |  |
| 2023-03-18 | 0.11.0-dev.2157+f56f3c582 [summary](#0110-dev2157f56f3c582-summary) | zig build parallelism |
| 2023-03-04 | 0.11.0-dev.1862+e7f128c20 [summary](#0110-dev1862e7f128c20-summary) | new for-loop syntax |
| 2023-02-18 | 0.11.0-dev.1639+438b71155 [summary](#0110-dev1639438b71155-summary) | build API refactored |
| 2023-02-01 | 0.11.0-dev.1507+6f13a725a | last version before the build API was changed |

### 0.11.0-dev.3132+465272921 Summary

| Platform | Download Link |
|----------|---------------|
| windows | [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.3132+465272921.zip) &#124; [x86](https://mirror.bazel.build/ziglang.org/builds/zig-windows-x86-0.11.0-dev.3132+465272921.zip) &#124; [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.3132+465272921.zip) |
| macos | [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.3132+465272921.tar.xz) &#124; [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.3132+465272921.tar.xz) |
| linux | [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.3132+465272921.tar.xz) &#124; [x86](https://mirror.bazel.build/ziglang.org/builds/zig-linux-x86-0.11.0-dev.3132+465272921.tar.xz) &#124; [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.3132+465272921.tar.xz) &#124; [riscv64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.3132+465272921.tar.xz) &#124; [powerpc64le](https://mirror.bazel.build/ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.3132+465272921.tar.xz) &#124; [powerpc](https://mirror.bazel.build/ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.3132+465272921.tar.xz) |

- `std.build.*Step` renamed to `std.Build.Step.*`
- `@memset` and `@memcpy` fixes and wider use throughout the stdlib
- build runner: fix a race condition that results in `error: FileNotFound`.
- add multi-argument `@min`/`@max`
- `test_runner`
   - log improvements on test failures
   - disallow named test declarations with duplicate names
- `std.c.darwin`: add cpu affinity api for macOS
- `std.meta` remove tagName, use `@tagName` or `@errorName` directly
- `std.fmt` add `parseIntSizeSuffix` for numbers like `2G`, `2GiB` or `2Q`.
- `std.mem` add `indexOfNone*`
- `std.enums` add `tagName`
- `std.os.linux`
  - add `tc{set,get}pgrp`
  - add some NUMA support
- `std.c.darwin` add basic darwin's host_statistics data
- `std.c.freebsd`
  - add domainset api
  - add `kinfo_vmobject`
  - add ioctl base operands
- `std.c.openbsd` add sigcontext/ucontext for arm64
- `std.http`
  - fix keepalive and buffer writes
  - use larger buffer to hit faster TLS code
  - `Server`
      - Response gets an allocator
      - use client recommendation for keepalive
      - use enum for reset state instead of bool
- linker: support `--dynamicbase`
- more work to various linkers
- work on sparc64 backend
- work on spirv backend
- work on x86_64 backend
- more work on autodoc
- autodoc: updated favicon to the latest logo mark!

### 0.11.0-dev.2892+fd6200eda Summary

| Platform | Download Link |
|----------|---------------|
| windows | [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.2892+fd6200eda.zip) &#124; [x86](https://mirror.bazel.build/ziglang.org/builds/zig-windows-x86-0.11.0-dev.2892+fd6200eda.zip) &#124; [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.2892+fd6200eda.zip) |
| macos | [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.2892+fd6200eda.tar.xz) &#124; [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.2892+fd6200eda.tar.xz) |
| linux | [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2892+fd6200eda.tar.xz) &#124; [x86](https://mirror.bazel.build/ziglang.org/builds/zig-linux-x86-0.11.0-dev.2892+fd6200eda.tar.xz) &#124; [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.2892+fd6200eda.tar.xz) &#124; [riscv64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.2892+fd6200eda.tar.xz) &#124; [powerpc64le](https://mirror.bazel.build/ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.2892+fd6200eda.tar.xz) &#124; [powerpc](https://mirror.bazel.build/ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.2892+fd6200eda.tar.xz) |

- `@memcpy` and `@memset` now support slices
- `@inComptime` builtin added
- options added to CompileStep init, "link_libc", "single_threaded", "use_llvm", "use_lld"
- `GeneralPuproseAllocator.deinit` now returns `Check` enum  with `ok` or `leak` instead of a `bool`
- `std.json.parse` now supports `@Vector`
- `std.net.StreamServer.Options` added `reuse_port`
- `std.Build.RunStep` return type of `captureStdOut` fixed to be `FileSource`
- `std.http.Client`
    - added `redirect`
    - errors updated
    - basic proxy support added
- `std.http.Server`
    - errors updated
    - fixed reading chunked bodies
    - `deinit` added to `Response`
- `std.http.Field` added
- `std.http.Headers`, added some `clear*` methods
- `std.math` added lerp function
- sigevent added to supported platforms
- `std.os.linux`, new `CAP` constants added, `io_uring_{probe/restriction}` fixed
- `std.c.darwin`, added subset of libproc api
- `std.c.freebsd`
    - added `reallocf`, `getentropy`, `(cpuset/sched)_(get/set)affinity`, `mincore` and `elf_aux_info` functions
    - added mcontext layout for x86
- `std.c.netbsd`, added pthread and cpu affinity api
- Windows
    - use NtSetInformationFile in DeleteFile to avoid silent failures and improved error handling
    - leaks fixed if `LockFile` fails after opening a file handle
    - stack traces during crashes fixed
- WASM
    - no longer uses simplified `start.zig` logic
    - `cmpxchg{weak/strong}`, `@atomicLoad`, `@atomicRmw` and `@fence` implemented
    - `cmp_lt_errors_len` instruction implemented
    - more runtime safety checks
- Haiku, added `find_path` decl and implemented `selfExePath`
- option exposed to produce 64-bit DWARF format
- translate-c: support brace-closed string initializers
- some fixes inside std.Thread implementation
- more work to x86_64 backend
- more work to various linkers
- more work to C backend
- more work to autodoc

### 0.11.0-dev.2619+bd3e248c7 Summary

| Platform | Download Link |
|----------|---------------|
| windows | [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.2619+bd3e248c7.zip) &#124; [x86](https://mirror.bazel.build/ziglang.org/builds/zig-windows-x86-0.11.0-dev.2619+bd3e248c7.zip) &#124; [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.2619+bd3e248c7.zip) |
| macos | [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.2619+bd3e248c7.tar.xz) &#124; [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.2619+bd3e248c7.tar.xz) |
| linux | [x86_64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2619+bd3e248c7.tar.xz) &#124; [x86](https://mirror.bazel.build/ziglang.org/builds/zig-linux-x86-0.11.0-dev.2619+bd3e248c7.tar.xz) &#124; [aarch64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.2619+bd3e248c7.tar.xz) &#124; [riscv64](https://mirror.bazel.build/ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.2619+bd3e248c7.tar.xz) &#124; [powerpc64le](https://mirror.bazel.build/ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.2619+bd3e248c7.tar.xz) &#124; [powerpc](https://mirror.bazel.build/ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.2619+bd3e248c7.tar.xz) |

- std.http.Server added
- std.Build.CompileStep
    - removed run and install functions (big breaking change)
    - removed redundant dest_builder field (already know as step.owner)
    - deleted install_step field
    - output_dir removed, use FileSource abstraction instead
    - setName, setFilter and setTestRunner removed, pass as options instead
- std.Build.RunStep no longer closes stdin
- Update to LLVM16
- GeneralPurposeAllocator: catch invalid frees
- new objcopy options, --strip-debug, --strip-all, -add-gnu-debuglink, --only-keep-debug
- std.MultiArrayList support for tagged unions
- std.math.log10 added
- some backwards compatibility added to glibc headers
    - now possible to use `fcntl` with glibc 2.27 or older and
      the `res_{,n}{search,query,querydomain}` functions with glibc 2.33 or older.
- os_log/signpost/subset of Apple's QOS api added to srd.c.darwin
- madvise flags and procctl added to std.c.freebsd
- mincore syscall added for linux
- termios constants added to std.c.netbsd
- std.json.strigify now uses inferred error so it can support more error than `@TypeOf(out_stream_.Error)`
- std.mem.reverseIterator: accepts pointer to array and added nextPtr
- std.os.sendto now uses ws2_32 on Windows
- c_char type added
- support for the spirv target
- zig cc handle the -r flag
- linker -wrap flag added
- macos libc SDK updated to 13.3
- updated YAML parser (used for MacOS linker)
- more work to various linkers
- more work to x86_64 backend


### 0.11.0-dev.2336+5b82b4004 Summary

| Platform | Download Link |
|----------|---------------|
| windows | [x86_64](https://ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.2336+5b82b4004.zip) &#124; [x86](https://ziglang.org/builds/zig-windows-x86-0.11.0-dev.2336+5b82b4004.zip) &#124; [aarch64](https://ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.2336+5b82b4004.zip) |
| macos | [aarch64](https://ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.2336+5b82b4004.tar.xz) &#124; [x86_64](https://ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.2336+5b82b4004.tar.xz) |
| linux | [x86_64](https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2336+5b82b4004.tar.xz) &#124; [x86](https://ziglang.org/builds/zig-linux-x86-0.11.0-dev.2336+5b82b4004.tar.xz) &#124; [aarch64](https://ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.2336+5b82b4004.tar.xz) &#124; [riscv64](https://ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.2336+5b82b4004.tar.xz) &#124; [powerpc64le](https://ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.2336+5b82b4004.tar.xz) &#124; [powerpc](https://ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.2336+5b82b4004.tar.xz) |

- io_uring_prep_provide_buffers argument order changed
- some public "wrapper stuff" moved from ntdll to `std.os.windows`
- new builtins: `@workItemId`, `@workGroupId`, `@workGroupSize`
- `@export` now supports arbitrary values (not just declarations)
- std.MultiArrayList: set/get added to Slice
- std.enums: IndexedSet added initOne and initMany
- std.json: stringify supports `[*:0]const u8`
- std.os:
    - ptrace wrapper added for darwin/linux
- std.json:
    - support tuples
- coff:
    - linker work
    - dynamicbase default is now true (matches lld)
- wasm:
    - __wasm_init_memory implemented
    - atomics added
    - linker work
- libc:
    - update macOS headers
- mach linker work, hot code swapping PIC
- lots of work to x86_64 backend
- crypto:
    - Gimli and Xoodoo removed from std to be maintained outside it
    - Default to ChaCha instead of AES on CPUs without AES support


### 0.11.0-dev.2157+f56f3c582 Summary

| Platform | Download Link |
|----------|----- |
| windows | [x86_64](https://ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.2157+f56f3c582.zip) &#124; [x86](https://ziglang.org/builds/zig-windows-x86-0.11.0-dev.2157+f56f3c582.zip) &#124; [aarch64](https://ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.2157+f56f3c582.zip) |
| macos | [aarch64](https://ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.2157+f56f3c582.tar.xz) &#124; [x86_64](https://ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.2157+f56f3c582.tar.xz) |
| linux | [x86_64](https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.2157+f56f3c582.tar.xz) &#124; [x86](https://ziglang.org/builds/zig-linux-x86-0.11.0-dev.2157+f56f3c582.tar.xz) &#124; [aarch64](https://ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.2157+f56f3c582.tar.xz) &#124; [riscv64](https://ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.2157+f56f3c582.tar.xz) &#124; [powerpc64le](https://ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.2157+f56f3c582.tar.xz) &#124; [powerpc](https://ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.2157+f56f3c582.tar.xz) |

- zig build parallelism, improved APIs and improved output
    - many of the Steps' API's have been reworked
    - compiler/build runner now communicate over a binary protocol
    - command-line option `-j<N>` added for limiting concurrency
    - many more enhancements, see https://github.com/ziglang/zig/commit/58edefc6d1716c0731ee2fe672ec8d073651aafb
- `DeviceBusy` and `InvalidArgument` added to `std.os.WriteError`
- ability added to import dependencies from `build.zig`
- added `std.Thread.Pool` and `std.Thread.WaitGroup`
- added `std.heap.ThreadSafeAllocator`, wraps any allocator to make it thread safe
- `std.fifo` added `toOwnedSlice`
- Hot Code Swapping POC
- C Backend, more big integer/vector support
- `std.os.linux` added ptrace
- posix_spawnp declaration and usage eliminated from std, it's trash
- `ArrayList.insertAssumeCapacity` added
- added `std.fmt.bytesToHex`
- `std.http`: connection pooling/keep-alive, compression, relative redirects
- Crypto:
    - Kyber post-quantum key encapsulation mechanism added
    - Configurable side-channel mitigations
    - `std.crypto.hash.sha3` added TurboSHAKE
- lots of `x86_64` backend work

## 0.11.0-dev.1862+e7f128c20 Summary

| Platform | Download Link |
|----------|----- |
| windows | [x86_64](https://ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.1862+e7f128c20.zip) &#124; [x86](https://ziglang.org/builds/zig-windows-x86-0.11.0-dev.1862+e7f128c20.zip) &#124; [aarch64](https://ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.1862+e7f128c20.zip) |
| macos | [aarch64](https://ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.1862+e7f128c20.tar.xz) &#124; [x86_64](https://ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.1862+e7f128c20.tar.xz) |
| linux | [x86_64](https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.1862+e7f128c20.tar.xz) &#124; [x86](https://ziglang.org/builds/zig-linux-x86-0.11.0-dev.1862+e7f128c20.tar.xz) &#124; [aarch64](https://ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.1862+e7f128c20.tar.xz) &#124; [riscv64](https://ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.1862+e7f128c20.tar.xz) &#124; [powerpc64le](https://ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.1862+e7f128c20.tar.xz) &#124; [powerpc](https://ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.1862+e7f128c20.tar.xz) |

- New for-loop syntax! (Big Breaking Change)
    - zig fmt will autofix the old syntax
- `--pkg-begin [name] [path] [sub_packages] --pkg-end` replaced with `--mod [name]:[deps]:[src]` and `--deps [dep],[dep],...`, which define modules in a "flat" manner, i.e.

```
--pkg-begin foo foo.zig --pkg-begin bar bar.zig --pgk-end --pkg-end `
```
Now becomes:
```
--deps foo --mod foo:bar:foo.zig --mod bar::bar.zig
```

- `@trap` builtin added
- `std.compress.zstd` added
- `std.io.poll` added, abstraction for reading from mulitple Files in a single thread
- `std.RingBuffer` added
- added `std.os.fchmodat`, use `std.fs.has_executable_bit` for conditional compilation
- `std.process.Child` added an `Id` abstraction to represent a PID on posix or a HANDLE on Windows
- for Zig executables, SIGPIPE will now be set to a no-op handler by default.
  Add `keep_sigpipe = true` to `root.std_options` to disable this.
- `zig cc` will now fail hard on unsupported linker flags instead of ignoring them
    - support `--no-undefined, -z undefs`
    - support `--sort-section`, ignore `--sort-common`
    - detect linker color diagnostic flags
    - `-z<arg>` equivalent to `-z` `<arg>`
- build changes
    - modules with the same name are now reused
    - `InstallRawStep` renamed to `ObjCopyStep`
    - `--build-runner` option added to `zig build`
    - `std.Build.addModule` now returns the created module
- crypto
    - Keccak permutation is now public
    - crypto.hash.sha3 has added SHAKE in PR #14756


## 0.11.0-dev.1639+438b71155 Summary

| Platform | Download Link |
|----------|----- |
| windows | [x86_64](https://ziglang.org/builds/zig-windows-x86_64-0.11.0-dev.1639+438b71155.zip) &#124; [x86](https://ziglang.org/builds/zig-windows-x86-0.11.0-dev.1639+438b71155.zip) &#124; [aarch64](https://ziglang.org/builds/zig-windows-aarch64-0.11.0-dev.1639+438b71155.zip) |
| macos | [aarch64](https://ziglang.org/builds/zig-macos-aarch64-0.11.0-dev.1639+438b71155.tar.xz) &#124; [x86_64](https://ziglang.org/builds/zig-macos-x86_64-0.11.0-dev.1639+438b71155.tar.xz) |
| linux | [x86_64](https://ziglang.org/builds/zig-linux-x86_64-0.11.0-dev.1639+438b71155.tar.xz) &#124; [x86](https://ziglang.org/builds/zig-linux-x86-0.11.0-dev.1639+438b71155.tar.xz) &#124; [aarch64](https://ziglang.org/builds/zig-linux-aarch64-0.11.0-dev.1639+438b71155.tar.xz) &#124; [riscv64](https://ziglang.org/builds/zig-linux-riscv64-0.11.0-dev.1639+438b71155.tar.xz) &#124; [powerpc64le](https://ziglang.org/builds/zig-linux-powerpc64le-0.11.0-dev.1639+438b71155.tar.xz) &#124; [powerpc](https://ziglang.org/builds/zig-linux-powerpc-0.11.0-dev.1639+438b71155.tar.xz) |

- build API refactored
    - https://devlog.hexops.com/2023/zig-0-11-breaking-build-changes/
    - old "package" terminology renamed to "module"
    - combine std.build and std.build.Builder into std.Build
    - new std.Build.addModule API introduced
    - remove setPreferredReleaseMode and standardReleaseOptions in favor of
      standardOptimizeOption which has a future-proof options parameter.
    - setting target/optimize_mode moved to create function
    - LibExeObjStep deprecated, renamed to CompileStep
    - support for generated C headers with std.Build.addConfigHeader
    - std.Build.Cache now available in std library
- move src.type.CType to std lib, use it from std.Build, this helps with populating config.h files.
- `@embedFile` now supports module-mapped names the same way as `@import`
- added LZMA decoder
- ZON "Zig Object Notation" introduced, use build.zig.zon instead of build.zig.ini
- std.crypto: add the Ascon permutation and AES-CMAC
- `@constCast` and `@volatileCast` added
