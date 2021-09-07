---
title: "What's the deal with Python wheels?"
date: 2021-09-06T16:00:00+01:00
draft: false
syntax_highlighting: false
mathjax: false
---

Python wheels are at the heart of Python packaging. If you've ever
installed a package with `pip` from the Python Packaging Index, there
is a high chance that it downloaded a wheel file.

    $ pip install numpy
    Collecting numpy
      Downloading numpy-1.21.2-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.8 MB)
         |████████████████████████████████| 15.8 MB 65 kB/s
    Installing collected packages: numpy
    Successfully installed numpy-1.21.2

In the example above the file
`numpy-1.21.2-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl`
is a Python wheel. It contains everything needed to install NumPy 1.21
inside my current Python 3.9 environment, on my 64 bits GNU/Linux
machine.  In Python, wheels play the role of what we would call a
package in some other contexts (e.g. `.rpm` or `.deb` package
installation on GNU/Linux). But the word "package" is already taken. In
Python we say that wheels are *distribution packages*.

This walktrough is divided into two main sections:

1.  Building a wheel for an example package. This is relevant to
    GNU/Linux, MacOS and Windows.
2.  Building wheels for GNU/Linux. In these case a bit more work is
    required in order to ensure wheels are portable across *manylinux*
    distributions.


# Example package

Let's consider an example package with the following layout:

![img](/images/package_layout.svg)

The example package consists of two main files:

-   A C++ extension module `src/cpp/ddot.cpp` named `ddot`. This
    extension relies on the `cblas_ddot` function from an (external)
    CBLAS library. This module turns into a Python module
    `ddot.cpython-39-x86_64-linux-gnu.so` with a runtime (dynamic)
    dependency on some CBLAS library (*e.g.* OpenBLAS).
-   A Python file `dot_product.py` that imports the `ddot` extension
    module.

Package build and installation:

-   The extension module is written using `pybind11` which is a C++
    library that makes it easy interface Python and C++.
-   I used CMake to manage the build simply because CMake works well
    with pybind11 (and this usecase is well documented).
-   Overall, the Python package is built with `scikit-build` which is
    a extension of `setuptools` that makes it easy to use CMake as
    part of the setup process.


# Source distributions

Let's pretend that we want to share this package with a friend.

A first option is to put everything in an archive:

    tar -cf septembrse-0.0.0.tar.gz \
        pyproject.toml \
        setup.py \
        CMakeLists.txt \
        pybind11 \
        src

This is actually better done automatically using the `setuptools` package.

    python setup.py sdist

This creates a `source distribution`, that contains all the files
necessary to build and install the package. It also embarks some
metadata (`PKG-INFO`). Lots of formats available:

    python setup.py sdist --help-formats

Easy enough. We bundled our package's sources into a archive and now
we can share it with our friend so they can install it with `pip` in the
same way.

    pip install dist/septembrse-0.0.0.tar.gz

This unpacks the archive and runs the `setup.py` script. It

1.  Installs the build tools (`setuptools`, `cmake`, `scikit-build`).
2.  Writes metadata.
3.  Compiles the extension module.
4.  Bundles everything together and copies it to the right.
    install location (likely the local *site-packages* directory).

Let's see what happens on our friend's machine:

    friend@machine:~$ pip install dist/septembrse-0.0.0.tar.gz
    Processing ./dist/septembrse-0.0.0.tar.gz
      ERROR: Command errored out with exit status 1:
      ...
      Complete output (127 lines):
      ... 
      -- Could NOT find BLAS (missing: BLAS_LIBRARIES)
      -- Configuring done
      CMake Error: The following variables are used in this project, but they are set to NOTFOUND.

Whoops. The package cannot be installed since our freind don't have a BLAS
library installed! After some time looking things up, they figure
out that they can

    apt install libopenblas-dev

and things run fine.

A `sdist` is an archive containing the sources of your package. If
you give an `sdist` to someone, you expect them to be able to
*build* the package from scratch. This means meeting all the
requirements to run the `setup.py` script and compiling any
extension modules.

In some cases (like the one above), users may be able to  get away with
installing a package from their system's package manager. Fine. But
in general, this is a real problem:

-   If there are many dependencies, users have to install them all. Tedious.
-   This is assuming that, for all these dependencies, there is a package
    ready in the system's package repository. Otherwise they will have
    to build the dependency themselves. Tedious, potentially
    technically challenging, and time consuming.
-   This is also assuming that a  *compatible version* of the dependency
    is packaged. This is especially a problem on GNU/Linux, since
    different distributions package different versions of software. If
    the extension module for our package was linked against version
    `x` of a dependency, it's not guaranteed to work with version
    `y`. Frustrating.

On top of this, remember that when installing a package from a
`sdist`, the `setup.py` script is executed. This script can actually
contain any valid Python in addition to the call to
`setuptools.setup()`. This means anyone installing a source
distribution with superuser privileges should feel a bit
uncomfortable.


# Building a wheel distribution

What if we gave our friend an archive, but containing an *built*
version of our package? In this case `pip`'s only job would be to
extract the files and copy them in the right place on our friend's computer.

That's precisely the idea behind Python wheels, and more generally
behind *built distributions* (as opposed to *source distributions*).

A wheel is built using `setuptools` with the `wheel` package.

    python setup.py bdist_wheel

You can also use `pip` directly

    # By default "pip wheel" build wheels for your package and all its
    # dependencies. We specify --no-deps to suppress that behavior.
    pip wheel . --no-deps

Let's take a look at the output of this command (if you used `pip`, you
may want to add `-v` to increase verbosity).

1.  We start with some CMake output. The C++ extension module
    `ddot` is compiled.
    
        -- Build files have been written to: /home/tlestang/repos/septembrse_example/_skbuild/linux-x86_64-3.9/cmake-build
        [ 50%] Building CXX object CMakeFiles/ddot.dir/src/cpp/ddot.cpp.o
        [100%] Linking CXX shared module ddot.cpython-39-x86_64-linux-gnu.so
        [100%] Built target ddot
    
2.  Then there is a succesion of creating temporary directories and
    copying files around. Ultimately, both the the Python source
	files and the compiled extension are copied into the `wheel/`
	directory.
        
		installing to _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel
		running install
		running install_lib
		creating _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64
		creating _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel
		creating _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel/example_pkg
		copying _skbuild/linux-x86_64-3.9/setuptools/lib/example_pkg/__init__.py -> _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel/example_pkg
		copying _skbuild/linux-x86_64-3.9/setuptools/lib/example_pkg/dot_prod.py -> _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel/example_pkg
		copying _skbuild/linux-x86_64-3.9/setuptools/lib/example_pkg/ddot.cpython-39-x86_64-linux-gnu.so -> _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel/exam
		ple_pkg                                                                                                                                                              
		copied 3 files
    
3.  The third step is writing some metadata about the package itself
	and its build.
        
		running egg_info
		writing src/septembrse.egg-info/PKG-INFO
		writing dependency_links to src/septembrse.egg-info/dependency_links.txt
		writing entry points to src/septembrse.egg-info/entry_points.txt
		writing top-level names to src/septembrse.egg-info/top_level.txt
		reading manifest file 'src/septembrse.egg-info/SOURCES.txt'
		writing manifest file 'src/septembrse.egg-info/SOURCES.txt'
		Copying src/septembrse.egg-info to _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel/septembrse-0.0.0-py3.9.egg-info
		running install_scripts
		copied 0 files
		creating _skbuild/linux-x86_64-3.9/setuptools/bdist.linux-x86_64/wheel/septembrse-0.0.0.dist-info/WHEEL
        
    So far, this is very similar - if not identical - to what happens when
	you install a Python package in your local Python
	environment. Except this time, the package is installed into
	the temporary `wheel/` directory instead.
    
3.  The final step is taking the content of that `wheel` directory
	and putting its content into a zip archive. The `wheel`
	directory is removed.

What we learn from this is that **a wheel distribution is a archive
that contains the installed version of a Python package**. A wheel is
actually a zip archive:

    unzip -l dist/septembrse-0.0.0-cp39-cp39-linux_x86_64.whl
    Archive:  dist/septembrse-0.0.0-cp39-cp39-linux_x86_64.whl
      Length      Date    Time    Name
    ---------  ---------- -----   ----
           15  2021-09-04 09:02   example_pkg/__init__.py
        93400  2021-09-04 09:02   example_pkg/example.cpython-39-x86_64-linux-gnu.so
          241  2021-09-04 09:02   septembrse-0.0.0.dist-info/METADATA
           97  2021-09-04 09:02   septembrse-0.0.0.dist-info/WHEEL
           12  2021-09-04 09:02   septembrse-0.0.0.dist-info/top_level.txt
          495  2021-09-04 09:02   septembrse-0.0.0.dist-info/RECORD
    ---------                     -------
        94260                     6 files

When our friend feeds this wheel to `pip`, all it has to do is copy
the files into their local package directory. It doesn't have to run
the `setup.py` script - all the hard work is already done at (wheel)
build time! Actually, notice that the `setup.py` script isn't even
contained inside the wheel.

The immediate benefit of wheels is that we share our package with
other people, and they don't have to worry about building it.  They
don't have to worry about setuptools, scikit-build, CMake, OpenBLAS
and so on. They just `pip install` and use the package. Let's add
that its also a smaller file to share (compared to the all source
code) and that installation is even faster since there's no need to
run the setup script.

There is also one immediate downside: if your wheel contains compiled
code, it is platform and python version specific. If your package is
purely Python, feel free to share it with the world without worry -
it's basically as portable as Python is. But if it's not, then you
must build the wheel for each plaftform, for each python version you
want to support. But fantastic people have [automated this
process](https://cibuildwheel.readthedocs.io/en/stable/).


# manylinux

Let us now focus on the case of building wheels for GNU/Linux, for
which there is an added complication.

On GNU/Linux, virtually every executable or shared library has a
dynamic (or runtime) dependency on the GNU standard C library
(*glibc*). This library is responsible for interfacing with the
Linux kernel. When you run code from a compiled Python extension,
this extension is expecting to be able to find some symbols
(constants, functions) in the *glibc* shared library.

Now, newer glibc versions are not garanteed to work with older ones.
This is a problem because different GNU/Linux distros come with the
different versions of *glibc*. \*If you build your wheel the latest
Ubuntu, it's unlikely to work on an older distribution with an older
glibc\*.

The opposite, however, is true. *glibc* developpers ensure that code
linked against an older version of glibc will work with a newer
one. Therefore, in order to build wheels that work across many
GNU/Linux distributions, we want to be building them on older
systems, *i.e.* systems that ship with older versions of glibc.

All of this is irrelevant if your package is purely Python code.
But if you do have one or more extension modules, you need to think
about that.

The good news is that, as a Python packager, you don't have to find
and install an old CentOS 5 image in order to build your
wheels. There is a working group called the [Python Packaging
Authority](https://www.pypa.io/en/latest/) who maintains [the manylinux project](https://github.com/pypa/manylinux). At the core of this
is a set of docker images, each associated to a specific version of
*glibc*. They are meant for you to build your wheels on them.

For instance the `manylinux2014` image is based on CentOS 7. CentOS
7 was released in July&#x2026; can you guess? 

    docker run -i -t -v `pwd`:/io quay.io/pypa/manylinux2014_x86_64 /bin/bash

Manylinux images contain all currently supported Python versions:

    root@221b30d4d160:/# ls /opt/python
    cp310-cp310  cp36-cp36m  cp37-cp37m  cp38-cp38	cp39-cp39  pp37-pypy37_pp73

Let's build our wheel for, say, Python 3.8. First we install
OpenBLAS (required to build the C++ extension module).

    apt update && apt install libopenblas-dev

We then build the wheel

    root@221b30d4d160:/# cd /io/
    root@221b30d4d160:/io# /opt/python/cp38-cp38/bin/pip wheel .

    root@221b30d4d160:/io# ls -l | grep .whl$
    -rw-r--r-- 1 root root   42127 Sep  3 09:58 septembrse-0.0.0-cp38-cp38-linux_x86_64.whl

Are we good yet? Not exactly. Our wheel's platform tag is still
`linux_x86_64`. This doesn't give any information on the level of
compatibility of our wheel. The platform tag is important because when
`pip` goes to look for wheels to install, the platform tag guides it
to choose the right version to download and install on your
system. The *manylinux* policies, such as the [PEP
600](https://staging.python.org/dev/peps/pep-0600/), define a
collection of platform tags based on the `manylinux` string plus some
keyword indicating the portability of your wheel. The latest
manylinux PEP, PEP 600, introduced platform tags of the form
`manylinux_X_Y` where `X_Y` indicate the oldest version of *glibc*
your wheel is expected to be compatible with.

The attribution of the `manylinux` platform tag is `auditwheel`'s
job. This Python utility scans wheels and decides whether or not
they can be attributed a `manylinux` tag. If yes, it creates a new
wheel with the correct name tag. `auditwheel` is included in
*manylinux* images.

Let's first inspect out wheel - this only prints info, it does not
create a new wheel yet.

    [root@e42ba33f35c4 io]# auditwheel show septembrse-0.0.0-cp38-cp38-linux_x86_64.whl
    
    septembrse-0.0.0-cp38-cp38-linux_x86_64.whl is consistent with the
    following platform tag: "linux_x86_64".
    
    The wheel references external versioned symbols in these
    system-provided shared libraries: libgcc_s.so.1 with versions
    {'GCC_3.0', 'GCC_3.3', 'GCC_4.2.0', 'GCC_4.3.0', 'GCC_3.3.1'},
    libc.so.6 with versions {'GLIBC_2.3', 'GLIBC_2.3.4', 'GLIBC_2.10',
    'GLIBC_2.14', 'GLIBC_2.4', 'GLIBC_2.2.5', 'GLIBC_2.17'},
    libstdc++.so.6 with versions {'CXXABI_1.3.3', 'GLIBCXX_3.4.18',
    'CXXABI_1.3', 'GLIBCXX_3.4', 'CXXABI_1.3.2', 'CXXABI_1.3.5'},
    libgfortran.so.3 with versions {'GFORTRAN_1.0'}, libm.so.6 with
    versions {'GLIBC_2.2.5'}, libquadmath.so.0 with versions
    {'QUADMATH_1.0'}
    
    This constrains the platform tag to "manylinux_2_17_x86_64". In order
    to achieve a more compatible tag, you would need to recompile a new
    wheel from source on a system with earlier versions of these
    libraries, such as a recent manylinux image.

The important information is that our wheel is valid for the
platform tag `manylinux_2_17_x86_64`. This means it is expected to
work on any GNU/Linux system with a version of glibc equal or above
2.17. That's expected because the version of glibc in this Docker
image is 2.17.

To actually produce the manylinux wheel, we use the  `auditwheel repair` command:

    auditwheel repair septembrse-0.0.0-cp38-cp38-linux_x86_64.whl

A new directory `wheelhouse` was created with our manylinux wheel in it.


## Runtime dependency on OpenBLAS

There is one <del>detail</del> aspect I glossed over.

Our C++ extension module `ddot` has dynamic dependencies to
various shared libraries. We can visualise them using the `ldd`
command (**l** ist **d** ynamic **d** ependencies?). Let's see what we
get if we use `ldd` on the extension contained inside our original
wheel (the non-repaired one).

    root@221b30d4d160:/io# ldd example_pkg/example.cpython-38-x86_64-linux-gnu.so
    	linux-vdso.so.1 (0x00007ffd2dfed000)
    	libopenblas.so.0 => /usr/lib/libopenblas.so.0 (0x00007ff591260000)
    	libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007ff590ede000)
    	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007ff590bda000)
    	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007ff5909c3000)
    	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007ff590624000)
    	libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007ff590407000)
    	libgfortran.so.3 => /usr/lib/x86_64-linux-gnu/libgfortran.so.3 (0x00007ff5900e1000)
    	/lib64/ld-linux-x86-64.so.2 (0x00007ff5935d1000)
    	libquadmath.so.0 => /usr/lib/x86_64-linux-gnu/libquadmath.so.0 (0x00007ff58fea2000)

Most of these dependencies are libraries that we would expect to be
present on most GNU/Linux systems out there. But this is not the
case of `libopenblas`. We actually installed OpenBLAS manually as a
build-time dependency inside the *manylinux* Docker image
earlier.

In the current state of things, our friend could install the wheel
fine, but at the moment they would import the `ddot` extension
module package things would break: `libopenblas not found`!

The solution to this is rather straightfoward: let's add
`libopenblas` to the wheel (remember, a wheel is nothing else than
an archive). This is, however, not enough. We also need to make
sure that, at runtime, our friend's system (more precisely, the
dynamic linker) knows where to look to find this shared
library. There is only a restricted set of locations the dynamic
linker looks into, and the installed wheel isn't going to be one of
them. 

Binary executables and shared libraries, however, can contain
some information guiding the dynamic linker on where to find their
dynammic dependencies at runtime. This information is contained in
the `DT_RUNPATH` (or `DT_RPATH`) entry in the shared object or
executable.  If you're interested in learning more on this topic, I
recommend your read chapters 41 and 42 of [*The Linux Programming
Interface*, by Micheal Kerrisk](https://www.man7.org/tlpi/index.html).

You don't have to, however, because `auditwheel repair` does all
the hard work for you. The `auditwheel repair` command scans the set of
our wheel's dynamic dependencies, and identify these outside of
small set of specific libraries that we would expect any GNU/Linux
system to provide. For any dependency not in this set (this is the
case of OpenBLAS in the example above), `autditwheel` adds the
shared library inside the wheel archive, and modify the
corresponding dependant (binary) extension module (`ddot` in the
example above) to point dynamic linkers to it (by modifying the
`rpath`).

Let's watch `autditwheel` in action, always inside the `manylinux2014` Docker image.

    [root@f19196cfd3f6 wheel_build]# auditwheel repair septembrse-0.0.0-cp38-cp38-linux_x86_64.whl 
    INFO:auditwheel.main_repair:Repairing septembrse-0.0.0-cp38-cp38-linux_x86_64.whl
    INFO:auditwheel.wheeltools:Previous filename tags: linux_x86_64
    INFO:auditwheel.wheeltools:New filename tags: manylinux_2_17_x86_64, manylinux2014_x86_64
    INFO:auditwheel.wheeltools:Previous WHEEL info tags: cp38-cp38-linux_x86_64
    INFO:auditwheel.wheeltools:New WHEEL info tags: cp38-cp38-manylinux_2_17_x86_64, cp38-cp38-manylinux2014_x86_64
    INFO:auditwheel.main_repair:
    Fixed-up wheel written to /wheel_build/wheelhouse/septembrse-0.0.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl

    [root@f19196cfd3f6 wheel_build]# unzip -l wheelhouse/septembrse-0.0.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl 
    Archive:  wheelhouse/septembrse-0.0.0-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
      Length      Date    Time    Name
    ---------  ---------- -----   ----
    	1  09-05-2021 10:33   example_pkg/__init__.py
          109  09-05-2021 10:33   example_pkg/dot_prod.py
       224256  09-06-2021 15:31   example_pkg/ddot.cpython-38-x86_64-linux-gnu.so
     37325000  09-06-2021 15:31   septembrse.libs/libopenblas-r0-f650aae0.3.3.so
       247608  09-06-2021 15:31   septembrse.libs/libquadmath-96973f99.so.0.0.0
      1259664  09-06-2021 15:31   septembrse.libs/libgfortran-91cc3cb1.so.3.0.0
           58  09-05-2021 10:33   septembrse-0.0.0.dist-info/entry_points.txt
           12  09-05-2021 10:33   septembrse-0.0.0.dist-info/top_level.txt
          241  09-05-2021 10:33   septembrse-0.0.0.dist-info/METADATA
          142  09-06-2021 15:31   septembrse-0.0.0.dist-info/WHEEL
          997  09-06-2021 15:31   septembrse-0.0.0.dist-info/RECORD
    ---------                     -------
     39058088                     11 files

    [root@f19196cfd3f6 wheel_build]# ldd wheelhouse/example_pkg/
    ddot.cpython-38-x86_64-linux-gnu.so  dot_prod.py                          __init__.py                          
    [root@f19196cfd3f6 wheel_build]# ldd wheelhouse/example_pkg/ddot.cpython-38-x86_64-linux-gnu.so 
    	linux-vdso.so.1 =>  (0x00007ffea75f8000)
    	libopenblas-r0-f650aae0.3.3.so => /wheel_build/wheelhouse/example_pkg/../septembrse.libs/libopenblas-r0-f650aae0.3.3.so (0x00007fe5461a4000)
    	libstdc++.so.6 => /lib64/libstdc++.so.6 (0x00007fe545e9c000)
    	libm.so.6 => /lib64/libm.so.6 (0x00007fe545b9a000)
    	libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007fe545984000)
    	libc.so.6 => /lib64/libc.so.6 (0x00007fe5455b6000)
    	libgfortran-91cc3cb1.so.3.0.0 => /wheel_build/wheelhouse/example_pkg/../septembrse.libs/libgfortran-91cc3cb1.so.3.0.0 (0x00007fe545282000)
    	/lib64/ld-linux-x86-64.so.2 (0x00007fe548732000)
    	libquadmath-96973f99.so.0.0.0 => /wheel_build/wheelhouse/example_pkg/../septembrse.libs/libquadmath-96973f99.so.0.0.0 (0x00007fe545045000)

We now have a self-contained wheel that is usable across *manylinux*
distributions - at least these released from 2014 onwards.

Note that this runtime dependency issue isn't restricted to building
wheels on GNU/Linux systems. On MacOS,
[delocate](https://github.com/matthew-brett/delocate) does a job
similar to `auditwheel`. On Windows, I haven't found a way to embed
dynamic dependencies (`dll` files) inside `win32` or `win64`
wheels. An alternative is to link these dependencies statically. This
is for another post.


# Conclusion

If you're currently working on a Python project or plan to do so, I
encourage you to distribute wheels. It will make it much easier to
use. I also hope that, after reading post, you are interested in
learning more. If this is the case, have a look at the list of
references below.

Because you have to consider every Python version, every operating
system and every architecture you want to support, building wheels
for your project can be a tedious process. That's why [cibuildwheel](https://cibuildwheel.readthedocs.io/en/stable/)
exists. This Python package is meant to be run on your favorite
Continuous Integration system and automate all the things. Be sure
to check it out!

Building wheels is a relatively complex process for computers, but for
us packagers - not so much. This is thanks to the truly wonderful work
of the people over at [the PyPA](https://www.pypa.io/en/latest/),
developing and maintaining *manylinux*, *auditwheel* and more. I also
want to give a shout out to the original developpers and contributors
to [delocate](https://pypi.org/project/delocate/) and
[cibuildwheel](https://pypi.org/project/cibuildwheel/). Let's thank
them, and happy wheel building!

# Further reading

https://pythonwheels.com/

Daniel Holth, ‘PEP 427 -- The Wheel Binary Package Format 1.0’. Sep. 20, 2012. Available: https://www.python.org/dev/peps/pep-0427/

Elana Hashman, ‘The Black Magic of Python Wheels’, presented at the PyCon 2019 Cleveland, Jun. 04, 2019. Available: https://www.youtube.com/watch?v=02aAZ8u3wEQ

manylinux. Python Packaging Authority. Available: https://github.com/pypa/manylinux

Robert T. McGibbon, Nathaniel J. Smith, ‘PEP 513 -- A Platform Tag for Portable Linux Built Distributions’. Jan. 19, 2016. Available: https://www.python.org/dev/peps/pep-0513/

Nathaniel J. Smith, Thomas Kluyver, ‘PEP 600 -- Future “manylinux” Platform Tags for Portable Linux Built Distributions’. Jun. 03, 2019. Available: https://www.python.org/dev/peps/pep-0600/

Matthew Brett, delocate. Accessed: Sep. 06, 2021. Available: https://github.com/matthew-brett/delocate

cibuildwheel. Python Packaging Authority. Accessed: Sep. 06, 2021. Available: https://github.com/pypa/cibuildwheel/

Micheal Kerrisk, ‘Fundamentals of Shared Libraries’, in The Linux Programming Interface, no starch press, 2010. Available: https://man7.org/tlpi/

Micheal Kerrisk, ‘Advanced Features of Shared Shared Libraries’, in The Linux Programming Interface, no starch press, 2010. Available: https://man7.org/tlpi/
