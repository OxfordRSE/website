---
title: "Modern CMake"
draft: false
summary: "Using CMake to modernise your build process: make it more modular, more 
configurable and easier to maintain"
duration: "0.5 days"
prerequisites: "a basic familiarity with the unix command line and at least basic 
knowledge of a compiled language such as C, C++ or Fortran."
publishDate: 2021-03-10
---

![modern CMake course](/images/events/modern_cmake_course_1080.jpg "modern CMake 
course")

"**Using CMake to modernise your build process: make it more modular, more configurable 
and easier to maintain**"


## Overview

CMake is now the de facto standard build system for C++ and other compiled languages, and with huge improvements over the last few years there has never been a better time to learn CMake and modernise your build process.

This course is a gentle introduction to modern CMake.
We will start off with configuring a simple project with a single source file, and move through to a more complex modular arrangement of source files that require multiple dependencies, with a clean, readable and intuitive set of build files.


## Why use CMake?

If you write code in a compiled language like C, C++ or Fortran, you need to build an executable before you can run your software.
This build step can quickly get complicated if your code involves several source files and external libraries, to the point that manually specifying the required files and libraries each time you compile just isn't an option.

Often we end up with a jungle of Makefiles, or a solution that locks us into a particular IDE.
Either way this isn’t portable.
If you’ve ever tried running your Makefile on a different computer you’ll know exactly why: everything’s in a different place!
All of a sudden you’ve spent the afternoon changing all the paths and manually setting a bunch of environment variables.

Fortunately, this is where CMake comes in!
In this course you will learn how to use CMake to configure and automate the build of your projects, keeping track of your project’s organisation, properties and dependencies.

CMake can dramatically simplify the configuration of projects in a way that can easily work completely cross-platform, regardless of the operating system.
CMake is a meta build system in that it generates build files: you tell CMake how your project fits together and what dependencies are required, and CMake builds your Makefile, your Ninja build file, your Visual Studio project files, or whatever it is you require.


## Prerequisites

We suggest having a basic familiarity with the unix command line and at least basic knowledge of a compiled language such as C, C++ or Fortran.


Photo by [Anas Alshanti](https://unsplash.com/@otenteko) on 
[Unsplash](https://unsplash.com/).
