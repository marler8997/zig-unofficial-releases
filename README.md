# Zig Unofficial Releases

Use this list if you want to use a newer version of Zig than the latest official release.
Versions will be selected based on when breaking changes come in.
This will help projects coordinate on what versions to choose and provide information
about what breaks between versions.


| Date       | Version                   | Description |
|------------|---------------------------|-------------|
| 2023-04-02 | 0.11.0-dev.2336+5b82b4004 [notes](#0110-dev23365b82b4004) |  |
| 2023-03-18 | 0.11.0-dev.2157+f56f3c582 [notes](#0110-dev2157f56f3c582) | zig build parallelism |
| 2023-03-04 | 0.11.0-dev.1862+e7f128c20 [notes](#0110-dev1862e7f128c20) | new for-loop syntax |
| 2023-02-18 | 0.11.0-dev.1639+438b71155 [notes](#0110-dev1639438b71155) | build API refactored |
| 2023-02-01 | 0.11.0-dev.1507+6f13a725a | last version before the build API was changed |

### 0.11.0-dev.2336+5b82b4004

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


### 0.11.0-dev.2157+f56f3c582

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

## 0.11.0-dev.1862+e7f128c20

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


## 0.11.0-dev.1639+438b71155

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
