home="$( cd "$( dirname "$0" )/.." && env - "PATH=$PATH" pwd )"

if test -e "$2.s" || redo-whichdo "$2.s" > /dev/null
then
	redo-ifchange "$2.o.deps"
	xargs redo-ifchange "$home/bin/assemble" "$2.s" < "$2.o.deps"
	"$home/bin/assemble" -o "$3" "$2.s"
elif test -e "$2.c" || redo-whichdo "$2.c" > /dev/null
then
	redo-ifchange "$2.o.deps"
	xargs redo-ifchange "$home/bin/compile" "$2.c" < "$2.o.deps"
	"$home/bin/compile" -o "$3" "$2.c"
else
	echo "$0: Fatal: don't know how to build '$1'" 1>&2
	exit 99
fi
