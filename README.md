# CSharp-Class-Runner
Small batch file used to easily and quickly run .cs files without compiling.
This is used mainly for short snippets or scripts where you want to be able to change the code easily.

## Features
Easily run C# code without compiling

Arguments get passed to `Main(string[] args)`

## Not working
Classes in external files do not work, as Powershell will move the code to %temp% with a random name.
