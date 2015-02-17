# Guess86

This is a very basic "Guess the Number" game implementation written in x86 assembly language. Example session:

    $ misc/build.sh && ./build/hello.out
    Welcome to Guess86, my friend!
    Enter a number [0,7]:5
    Nope. It's too high!
    Enter a number [0,7]:4
    Nope. It's too high!
    Enter a number [0,7]:3
    Winner! 

## Build intructions
Currently supported platforms:
 - OS X
 - MS DOS

Just use build script for your platform (e.g. `misc/osx_build.sh`). Build scripts depend on
[nasm](http://www.nasm.us/) assembler and (for some platforms) system linker.

## Porting to Other Platforms
Basically the game consists of two parts: platform-independent code located in `code/*.asm` and
platform API code located in `code/{platform}/*.asm`. So hopefully all you need is to prepare a build script for your platform
and implemenent platform API (that's just macros like `sys.read`, `sys.exit` etc).

## TODOs
 - Use better PRNG
 - Add failure conditions
