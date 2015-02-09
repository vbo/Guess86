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

I am building it using nasm macro-assembler on OS X (check out `misc/build.sh`).
The game uses direct BSD system calls so may be a bit non-portable =)

## TODOs
 - Make it cross-platform
 - Use better PRNG
 - Add failure conditions
