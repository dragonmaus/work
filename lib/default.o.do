redo-ifchange ../bin/compile "$2.c" "$2.o.deps"
test -s "$2.o.deps" && xargs redo-ifchange < "$2.o.deps"
../bin/compile -o "$3" "$2.c"
