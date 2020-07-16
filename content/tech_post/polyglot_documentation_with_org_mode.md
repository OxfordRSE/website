---
title: "Polyglot Documentation with Org-mode"
date: 2020-07-16T11:00:00+01:00
draft: false
syntax_highlighting: true
include_toc: false
---

An important part of teaching is meeting the students on common ground. Find out what experience they have, and bring your teaching to them so that they can incorporate their new knowledge alongside what they already know.

In teaching software engineering concepts, that usually means tailoring the discussion to the programming language that a student is familiar with. You may be explaining a language-agnostic concept like object-oriented programming, designing reusable functions, or drawing graphs, but students will find examples given in unfamiliar languages a barrier to understanding.

In the RSE group, we work with lots of different programming languages: a quick sample of projects we've worked on in the University in the last year includes Javascript, C++, C#, Ruby, PHP, Swift, Python, R, and Matlab. There may be others. The point is that just because _we_ have to pick up different programming languages all the time, that doesn't mean the people we teach should too.

When developing teaching materials, we could do what many commercial SaaS companies do when they document their web APIs. We could embed example code in many languages in the documentation, and let readers choose which they want to see. There are tools that will make that easy, like the [`markdown-fenced-code-tabs`](https://yassir.dev/markdown-fenced-code-tabs/) extension to the Python markdown parser.

While that's good enough for API samples, it won't really work in tutorial content. We need to talk about the code in the prose, and that will be subtly different for each language. We also don't want to maintain wholly separate forks of our material. We want one narrative, with language-specific samples and prose sections where necessary. From a single source, we'd like to be able to build a version of the documentation tailored to a specific language, with sample code in that language and any necessary tweaks to the discussion.

# Org-mode

We found that it's possible to do just that, by writing the document in [org-mode](https://orgmode.org). Org-mode is an extensible format for writing structured text, with a hierarchical outline system, markdown-like formatting syntax, and facilities for marking sections as to-do items with due dates, as sample code in particular languages, as presenter notes when used for presentations, and more. Originally written for the venerable GNU Emacs text editor, org-mode parsers exist for vim, Visual Studio Code, Atom, and elsewhere.

Using the Emacs parser, it's possible to export org-mode files to multiple formats, including hugo ([which our website is built on](https://www.rse.ox.ac.uk/tech_post/building_site_with_hugo/)), LaTeX (suitable for generating printed handouts), [reveal.js](https://revealjs.com) slides for giving lectures, and more.

Crucially, org-mode also has a "tagging" system where sections in the hierarchical outline can be tagged with arbitrary words. You can control which tags get included or excluded in the files exported from org-mode, and this is how we can build our multi-lingual documentation.

## Babel

Another nifty capability of org-mode is [Babel](https://orgmode.org/worg/org-contrib/babel/), designed for reproducible research (there are even [research papers written in org-mode with Babel](https://github.com/tsdye/hawaii-colonization)). Babel adds literate programming facilities to org-mode. If there's a code block in an org-mode document, Babel can run the code, incorporating the results into the document or even using the results as inputs to other code blocks. For tutorial material a really good use of this is testing code snippits in situ, without having to keep them in sync with a separate code file or project.

## A Fork in the Path

Combining these facilities gives us our polyglot programming documentation. The document is kept as a single org-mode file, with most of the discussion appearing exactly once: no multiple copies for multiple programming languages. Both sample code segments and language-specific prose sections are tagged with the name of the language, for example "C".

Tagging the sample code means that Babel can work out how to run the code and what syntax highlighting rules to use, both of which make it easier to maintain the code blocks in the document. Using the same tags for prose means that by excluding or including a language's tag on export, we choose both the sample code and relevant discussion that appears in the output.

# Example

Finally, here's an example describing the classic "Hello, World!" program in three languages: C, Python, and Ruby. Each uses a different function to print the message, though overall the description of the program is the same. In C, we also have to explain why there's that `\n` thing at the end of the message string.

    #+EXCLUDE_TAGS: C python
    #+PROPERTY: header-args :results output
    #+OPTIONS: tags:nil
    * Let's talk about a simple computer program.

    The program puts the phrase "Hello, world!" on the screen. An early
    version appeared the book "The C Programming Language" by Kernighan
    and Ritchie, where it was included as a demonstration to prove that
    you had your compiler set up correctly. These days, "Hello, world!" is
    a common example program in every programming language, to give
    newcomers a flavour of the language.

    There is a single contributor to the behaviour of this program: the
    function that prints text to the screen.

    ** The ~printf~ function                                                  :C:
    You use ~printf()~ to print to the screen in C.
    #+BEGIN_SRC C
    #include <stdio.h>

    int main()
    {
      printf("Hello, world!\n");
    }
    #+END_SRC

    The weird ~\n~ in the string tells ~printf()~ to output a "newline"
    character, moving the cursor to the start of the next line.
    ** The ~puts~ method                                                   :ruby:
    You use ~puts~ to print to the screen in Ruby.
    #+BEGIN_SRC ruby
    puts "Hello, world!"
    #+END_SRC

    ** The ~print~ function                                              :python:
    You use ~print~ to print to the screen in Python.
    #+BEGIN_SRC python
    print("Hello, world!")
    #+END_SRC

    ** Print to the screen?

    I'm playing fast and loose with terminology here. The "Hello, world!"
    program writes its message to a stream called _standard output_, often
    written ~stdout~. It happens that the standard output stream is
    usually displayed on the screen in a terminal application.


# Output

The rest of this document is generated from the `org-mode` file above. The `C` and `python` tags were excluded (the `#+EXCLUDE_TAGS` line at the start of the file, above), so the result only includes the discussion and example code relevant to the Ruby programming language. We could similarly get the version for the other languages.

## Let's talk about a simple computer program. {#let-s-talk-about-a-simple-computer-program-dot}

The program puts the phrase "Hello, world!" on the screen. An early version appeared the book "The C Programming Language" by Kernighan and Ritchie, where it was included as a demonstration to prove that you had your compiler set up correctly. These days, "Hello, world!" is a common example program in every programming language, to give newcomers a flavour of the language.

There is a single contributor to the behaviour of this program: the function that prints text to the screen.


### The `puts` method {#the-puts-method}

You use `puts` to print to the screen in Ruby.

```ruby
puts "Hello, world!"
```


### Print to the screen? {#print-to-the-screen}

I'm playing fast and loose with terminology here. The "Hello, world!" program writes its message to a stream called <span class="underline">standard output</span>, often written `stdout`. It happens that the standard output stream is usually displayed on the screen in a terminal application.