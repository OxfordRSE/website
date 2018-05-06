---
title: "Building this site with Hugo"
date: 2018-05-05T14:19:57+01:00
draft: false
syntax_highlighting: true
mathjax: true
include_toc: true
---

## Introduction

## Why Hugo?

Hugo is a static website generator.

## Easy integrations


### Synatx highlighting

Hugo has built-in support for [chroma](https://github.com/alecthomas/chroma), a syntax highlighter written in Go and based on [Pygments](http://pygments.org/).
You can choose a formatting style you like from a [gallery of samples](https://help.farbox.com/pygments.html), and then use `hugo` to generate a stylesheet:

{{< highlight bash >}}
hugo gen chromastyles --style=<name> > syntax.css
{{< /highlight >}}

We have used the `default` style for this site, with a few tweaks, and you can see the resulting stylesheet
[here]({{< base-url >}}css/syntax.css).
All that's left is to tell Hugo to expect synatx highlighting by adding
{{< highlight toml >}}
pygmentsUseClasses = true
{{< /highlight >}}
to the `config.toml` file.
That's it!
To mark up some code, simply surround it with Hugo's built-in `highlight` shortcode:

{{< highlight go >}}
{{</* highlight language-name "options" */>}}
...
code
...
{{</* /highlight */>}}
{{< /highlight >}}

A very wide range of languages are supported, and options allow for line numbers and highlighting lines.
For instance, `"linenos=table"` will prepend numbers to each line while keeping the code copy-and-paste friendly.
Here's a short example of some syntax-highlighted C++ code:

{{< highlight cxx "linenos=table" >}}
#include <iostream>

int main()
{
    auto message = [](){return "Hugo's highlighting this syntax!";};
    std::cout << message() << std::endl;
    return 0;
}
{{< /highlight >}}



### Typesetting maths

### Tables of contents

### Citations
