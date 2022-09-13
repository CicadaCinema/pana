# API Analysis

Refer to the [introductory blog post](https://arseny.uk/posts/gsoc2022/) before reading this document.

## Running API analysis

Three CLI subcommands are provided. Run `dart pub global activate --source git https://github.com/dart-lang/pana` to make them globally available and run them with `dart pub global run pana:api_analysis <subcommand>`.

### `summary`

```
Displays a summary of the public API of a package.

Usage: api-analysis summary <package-path>
```

This command writes a JSON *summary* of the package at `<package-path>`, which must point to the root directory of a package, to standard output.

This package does not have to be published to pub.dev , and `<package-path>` can point to a directory in the [pub cache](https://dart.dev/tools/pub/glossary#system-cache).

### `lower-bounds`

```
Runs lower bound constraint analysis on a single package.

Usage: api-analysis lower-bounds <target-name>
-c, --cache=<path>    Cache directory for requests to https://pub.dev/api/packages/PACKAGE-NAME .
```

This command performs *lower bound constraint analysis* on the latest version of the package named `<target-name>`, which must be the name of a package published to pub.dev . If at least one *issue* is discovered, a report is written to standard output. Any warnings are written to standard error.

If `--cache=<path>` is not provided, a temporary folder is created automatically in the system temp directory and deleted after *analysis* exits.

### `lower-bounds-batch`

```
Runs lower bound constraint analysis on many packages.

Usage: api-analysis lower-bounds-batch <N> <concurrency> <log-path>
-c, --cache=<path>    Cache directory for requests to https://pub.dev/api/packages/PACKAGE-NAME .
```

This command performs *lower bound constraint analysis* on a number of eligible packages published to pub.dev .

A package is considered eligible if it satisfies the following requirements:
- The current version of the Dart SDK satisfies the SDK constraint of the package.
- The SDK constraint lower bound of the package is 2.12 or later, meaning it is [null safe](https://dart.dev/null-safety).
- The package is not marked as discontinued.
- There is at least one non-retracted version of the package.

`<N>` specifies the number of eligible packages to *analyse*.

If the number of packages provided by https://pub.dev/api/package-name-completion-data is greater than or equal to `<N>`, the first `<N>` eligible packages from this list are *analysed*.

Otherwise, the first `<N>` eligible packages from https://pub.dev/api/package-names are *analysed*. If `<N>` is strictly greater than the number of eligible packages from this list, all the eligible packages from the list are *analysed*.

*Analysis* consists of `<concurrency>` concurrent child processes of the `lower-bounds` command running in parallel. The standard output and standard error streams produced by these processes are saved as text files in the `<log-path>` directory. If a package takes over 10 minutes to analyse, the `lower-bounds` process is killed.

If `--cache=<path>` is not provided, a temporary folder is created automatically in the system temp directory and deleted after *analysis* exits. In an effort to make the results consistent (the parent `lower-bounds-batch` process can take several hours), this cache is populated before any child `lower-bounds` processes are started.

## Hacking on API analysis

This directory (along with the CLI runner https://github.com/dart-lang/pana/blob/master/bin/api_analysis.dart ) contains the code for running API analysis.

The directory https://github.com/dart-lang/pana/blob/master/test/api_analysis containing tests and related documentation gives a great overview of the capabilities of API analysis.

## Definitions

### (lower bound constraint) issue

The scenario of a package specifying a wider range of allowed versions of a particular dependency than the range of versions which define the symbols required by the package from this dependency.

This typically requires the package to specify a dependency version constraint which spans a breaking change in the dependency's public API (allowing a package version before and after the breaking change took place). Specifying the wrong dependency constraint is a bug.

### target (package)

The package being analysed for *issues*.

### lower bound constraint analysis

The process of statically analyzing one or many *target packages* to find *issues*. 

### (package) summary

An overview of the public API of a package.