# Zig Unofficial Releases

Use this list if you want to use a newer version of Zig than the latest official release.
Versions will be selected based on when breaking changes come in.
This will help projects coordinate on what versions to choose and provide information
about what breaks between versions.


| Date       | Version                   | Description |
|------------|---------------------------|-------------|
| 2023-03-04 | [0.11.0-dev.1862+e7f128c20](#0110-dev1862e7f128c20) | new for-loop syntax |
| 2023-02-18 | [0.11.0-dev.1639+438b71155](#0110-dev1639438b71155) | build API refactored |
| 2023-02-01 | 0.11.0-dev.1507+6f13a725a | last version before the build API was changed |


## 0.11.0-dev.1862+e7f128c20

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
