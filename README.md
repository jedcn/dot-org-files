# Literately Programmed Dot Files

Emacs (+ org-mode) friendly dot-files.

Simple replication with minimal dependencies via homeshick.

## Background

[Literate Programming][literate-programming] allows you to pair a
prose description of code with the code itself.

There are several Literate Programming frameworks, and the one we're
making use of here is known as [Babel][org-babel].

This project tracks [dot-files][github-dot-files] written in
[org-mode][org-mode] with Babel extensions. Hence the name.

## Make?

To be useful to a computer, the configuration files need to be
separated from prose descriptions. This is achieved using
[GNU Make][make].

## Homeshick?

Once separated, the resulting dot-files land in a directory named
`home/`, and this qualifies them to be a [homeshick][homeshick]
Castle.

In a sentence, this means that dot-files are backed up online and
their contents are easily synchronized between computers.

## Motivation

Homeshick lets you synchronize dependencies with just bash and
git. This minimal set of pre-requisites means it's easier to get
started in alien environments.

dot-files, as a whole, tend toward gigantic, rarely cultivated, and
monotonically increasing in size. If you can build them in an
environment that supports literate programming you'll easily have an
explanation for anything you've added.

## How to?

Use emacs to edit the .org files. Run =make= to translate to pure
dot-files underneath `home/`. Commit both simultaneously.

Create new .org files. Update the makefile accordingly.

[homeshick]: https://github.com/andsens/homeshick
[literate-programming]: https://en.wikipedia.org/wiki/Literate_programming
[org-babel]: http://orgmode.org/worg/org-contrib/babel/intro.html
[org-mode]: http://orgmode.org/
[github-dot-files]: http://dotfiles.github.io/
[make]: https://www.gnu.org/software/make/
[homeshick]: https://github.com/andsens/homeshick
