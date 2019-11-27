redo-ifchange "$2.exe.deps"
xargs redo-ifchange bin/load bin/strip "$2.o" < "$2.exe.deps"

sed -E -e 's;^lib/lib(.+)\.a$;-l\1;' -e '1i-Wl,--start-group' -e '$a-Wl,--end-group' < "$2.exe.deps" | xargs bin/load -o "$3" "$2.o"
bin/strip "$3"
