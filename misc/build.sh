mkdir -p ./build

nasm ./code/main.asm \
    -f macho \
    -i ./code/ \
    -o ./build/main.o

ld ./build/main.o \
    -e main \
    -macosx_version_min 10.0 \
    -o ./build/main.out
