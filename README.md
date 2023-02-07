# helpdoc
A KISS CLI tool for managing GNU-style help messages. Extracts help messages from comments in source code and prints them when asked.

## Purpose
A good command-line tool needs to produce a help message containing its *usage* information (e.g. `cat --help`). It may also produce texts containing information such as *about*, *version*, *author*, *license* etc. (e.g. `cat --version`).

Good coding style also demands these information to be documented as comments in the prelude of the corresponding source code.

Usually, therefore, one would need to write the help text twice - 
1. as comments at the beginning of the source code, and 
2. as character string(s) inside the code that will print the help text for the end-user.

`helpdoc` comes to the rescue by eliminating the repetition in step 2 above.

## Design / How it works
The workflow of `helpdoc` is very simple:
- Extract *commented* help texts from the source code of any given `<command>` and store the extracted text in a local/system-wide database:
```bash
helpdoc -e <source code path> <command>
```
- Print the stored text when invoked: 
```bash
helpdoc <command>
```

`helpdoc` should be able to extract the help text, documented as comments, from the source code written in any programming language, i.e. it's supposed to be language-agnostic. Printing of the help text requires a *system call* to `helpdoc`, provision for which is usually there in every standard programming language.

The end-user only needs to install `helpdoc` once as a common dependency.

## Syntax

Extraction of help text from the comment lines in the source code requires parsing according to some well-defined syntax. `helpdoc` recognizes the following syntax.

- Help messages must be written in as single-line comments only. For discussion's sake, assume the single-line comment marker is `//` (as in the C language).

- The entire message block must be put between the header, `//help:begin` and the footer, `//help:end`, both case-insensitive. Spaces/tabs are allowed before and after these phrases. Spaces/tabs may also separate the comment marker `//` and `help:begin` or `help:end`.

- *Usage* message must start with the case-insensitive prefix, `//Usage:`. Spaces/tabs are allowed as above.

- Whatever comes before the *Usage* message (i.e. before the `//Usage:` prefix) is considered the *About* message. It may contain repository URL, author information, license, version etc.
 
- Version information, if any, must start with the case-insensitive `//Version: ` prefix and must come before the *Usage* message.

See [examples](examples/) for illustration.

## Installation
- Download with 
```bash
git clone https://github.com/SomajitDey/helpdoc
```
- Install with (requires `sudo` priviledge)
```bash
make
```
- Uninstall with (requires `sudo` priviledge)
```bash
make uninstall
```

## Usage
For usage information, consult `helpdoc` help
```bash
helpdoc helpdoc
```
or, equivalently,
```bash
helpdoc -h
```
*Dogfooding Note*: `helpdoc` uses itself to serve its own help message.

## Examples
Extract and store help message for [hello_world](examples/hello_world.c):
```bash
helpdoc -e examples/hello_world.c
```

To show command-line help, `hello_world --help|-h` can now simply make a system call to 
```bash
helpdoc hello_world
```

## Feedback
[Bug-reports](https://github.com/SomajitDey/helpdoc/issues) and [suggestions for improvement](https://github.com/SomajitDey/helpdoc/discussions) are welcome.

## License
[MIT](https://github.com/SomajitDey/helpdoc/blob/main/LICENSE)
