whichsrc() {
	for f
	do
		if test -e "$f" || redo-whichdo "$f"
		then
			echo "$f"
			return 0
		fi
	done
	return 1
}

home="$( cd "$( dirname "$0" )" && env - "PATH=$PATH" pwd )"

if whichsrc "$2.s" > /dev/null
then
	redo-ifchange "$2.s"
	sed -En "s|^[	 ]*%[	 ]*include[	 ]+'(.+)'.*$|$home/inc/\\1|p" < "$2.s" \
	| sort -u > "$3"
elif whichsrc "$2.c" > /dev/null
then
	redo-ifchange "$2.c"
	sed -En "s|^[	 ]*#[	 ]*include[	 ]+\"(.+)\".*$|$home/inc/\\1|p" < "$2.c" \
	| sort -u > "$3"
else
	echo "$0: fatal: don't know how to build '$1'" 1>&2
	exit 99
fi
