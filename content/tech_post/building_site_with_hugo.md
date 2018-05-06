---
title: "Building this site with Hugo"
date: 2018-05-05T14:19:57+01:00
draft: false
syntax_highlighting: true
mathjax: true
include_toc: true
---

This post is very much in a draft stage - stay tuned for a more thorough version.

## What is Hugo?

Hugo is a static website generator.
That mean that, instead of wasting time writing cumbersome HTML from scratch, you can author content in markdown files and Hugo turns that information into a website for you.

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

Hugo sites work well with [MathJax](https://www.mathjax.org/), a javascript tool for turning TeX-like input into typeset mathematics in HTML for viewing in a web browser.

MathJax is available via CDNJS, so all that's required in Hugo is to add something similar to the following to each page on your site that contains mathematical content:

{{< highlight html >}}
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.4/MathJax.js?config=TeX-AMS_HTML">
</script>
{{< /highlight >}}

You could, for instance, add this to your `head.html` partial template so that it appears on every page.
Everything is then up and running immediately.
The `config=TeX-AMS_HTML` part tells the renderer how to expect input and how to present the output, and can be changed dependning on your needs.
This particular configuration is a good deafult if the mathematical content is provided entirely in a TeX style, and if you want to render the equations as HTML (rather than, say, as an image).
Full documentation can be found [here](http://docs.mathjax.org/en/latest/config-files.html#combined-configurations), as many other configurations are possible.

Let's have a look at an example.
If you wanted to display the time-dependent [Schrödinger equation](https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation), you could put it between two sets of `$$`:

{{< highlight tex >}}
$$
i\hbar\frac{\partial}{\partial t} \Psi(\mathbf{r},t) = \left [ \frac{-\hbar^2}{2\mu}\nabla^2 + V(\mathbf{r},t)\right ] \Psi(\mathbf{r},t)
$$
{{< /highlight >}}

which, hopefully, will display as:

$$
i\hbar\frac{\partial}{\partial t} \Psi(\mathbf{r},t) = \left [ \frac{-\hbar^2}{2\mu}\nabla^2 + V(\mathbf{r},t)\right ] \Psi(\mathbf{r},t)
$$

That's all there is to it.

### Tables of contents

### Citations
