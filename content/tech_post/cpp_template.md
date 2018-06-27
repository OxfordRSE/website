---
title: "C++ template project"
date: 2018-06-27
draft: false
syntax_highlighting: false
mathjax: false
---

We have finished putting together a [template C++ 
project](https://github.com/OxfordRSE/template-project-cpp). This repository is 
a template to help get you set up quickly when starting a new C++ project.
We have tried to conform to common software engineering 'best practices', and to that end this repository features the following:

- C++14
- [CMake](https://cmake.org/) build script for cross-platform configuration in
  Linux, MacOS or Windows
- [Catch](https://github.com/catchorg/Catch2) unit testing framework
- [Travis](https://travis-ci.org/) and [AppVeyor](https://www.appveyor.com/)
  integration for automated testing on Ubuntu, MacOS and Windows
- [Codecov](https://codecov.io/) integration for automated coverage testing 
- [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html) for automated 
  source code formatting
- [Clang-Tidy](http://clang.llvm.org/extra/clang-tidy/) for static analysis to 
  catch coding errors
- [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html) for 
  catching memory-related issues 

In addition, the project is set up to use the [boost 
libraries](https://www.boost.org/), and we will hopefully add other common 
libraries to the configuration soon. Please head over to the GitHub
repository at https://github.com/OxfordRSE/template-project-cpp and browse the
code, or feel free to duplicate the repository to start your next C++ project.
Note that all the code is under a permissive BSD 3-Clause License for either
academic or commercial use.
