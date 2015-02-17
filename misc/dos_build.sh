mkdir -p ./build

nasm ./code/main.asm \
    -f bin \
    -i ./code/ \
    -i ./code/dos/ \
    -o ./build/main.com
