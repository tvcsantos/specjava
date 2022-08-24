# Overview

!!! warning "Warning"

    This project is no longer maintained

SpecJava is an extension to the Java compiler with support for lightweight
static logical assertions.

Type systems are effective but not very precise, while program logics tend to be
very precise, but undecidable. The aim of this work is to extend the
expressiveness of more familiar type-based verification towards more informative
logical reasoning, without compromising soundness and completeness. We thus
investigate a lightweight specification language based on propositional logic
for Java and describe a prototype implementation on top of Polyglot. The
verification process is modular and based on Dijkstra's weakest precondition
calculus, which we extend to a large fragment of the Java object-oriented
language. A distinguishing aspect of our approach is a novel "dual" separation
logic formulation, which combines Hoare logic with separation logic reasoning in
a unified way, allowing us to handle aliasing through a separation of pure from
linear properties.

SpecJava's specification language is inspired on JML and Spec#, but is
lightweight because it is based on a monadic dual logic. It is simpler, not
presenting, for example, quantifiers - to maintain decidability -, and reference
to the value of an expression in its precondition and uses a novel approach to
handle aliasing by separating pure from linear properties.

## Simple Example

In the following example we have a simple method that computes the absolute
value of a number. We all know that when this method is well implemented the
resulting value must not be negative.

<pre><code class="language-specjava">public static pure int abs(int x)
  ensures !return:neg 
{
  if (x > 0) return x;
  else return -x;
}</code></pre>

With what we propose in this project we can specify exactly that constraints on
the method itself, ensuring in compile time by doing static analysis on our code
that it will only compile if it satisfies the specification.

We can see in the example above that we extended `java` programming language
with some extra keywords that allows the user to add specifications to their
programs. In the example we have the keyword `pure` stating that this method has
no side effects on the heap memory of our program. In addition, we have the
specification `ensures !return:neg` that corresponds to the post-condition of
the method (i.e. what must be true after method execution), stating that the
`return` should not be negative.

For a deep dive on how this is done please read one of the publications
[below](#publications).

## Complete Examples

- [File](examples/File.sj)
- [Math](examples/Math.sj)
- [Stack](examples/Stack.sj)

## How to Run

Creat a folder to be your working directory e.g. `app`:

```shell
mkdir app
```

Execute the following docker command:

```shell
docker run --rm -it --platform linux/amd64 \
  -v "$(pwd)"/app:/app \
  -w /app ghcr.io/tvcsantos/specjava:main /bin/bash
```

A shell to the container was opened. Add `.sj` files to your working directory
`app`. See [Complete Examples](#complete-examples) section for some examples.

Suppose that we have the `Math.sj` file from our examples in the working
directory.

Run the following command to compile your code:

```shell
specjavac Math.sj
```

Run the following command to execute your code:

```shell
specjava Math
```

The following output should appear:

```shell
24
120
```

## Publications

Tiago Santos. Lightweight Type-Like Hoare-Separation Specs for Java.<br>
In Proceedings of [InForum 2010][inforum-2010] - September 2010.
[[BibTex][lhssj10-bib], [PDF][lhssj10-paper],
[Presentation][lhssj10-presentation]]

Tiago Santos. Linguagem de Especificação Leve Hoare-Separação para Java.<br>
MSc Thesis - July 2010. (in PT) [[BibTex][ts-msc-thesis-bib]
, [PDF][ts-msc-thesis-document], [Presentation][ts-msc-thesis-presentation]
, [SpecJava Tool][prototype]]

---

<img src="img/fctunl.png" alt="FCT">
<img src="img/citi.jpeg" alt="CITI">

[inforum-2010]: http://inforum.org.pt/INForum2010
[lhssj10-bib]: bibtex/LHSSJ10Bib.txt
[lhssj10-paper]: pdf/LHSSJ10.pdf
[lhssj10-presentation]: pdf/softpt2010-presentation.pdf
[ts-msc-thesis-bib]: bibtex/TS-MSc-thesisBib.txt
[ts-msc-thesis-document]: pdf/TS-MSc-thesis.pdf
[ts-msc-thesis-presentation]: pdf/TS-MSc-thesisPres.pdf
