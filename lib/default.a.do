redo-ifchange "$2.a.deps"
xargs redo-ifchange ../bin/archive < "$2.a.deps"
xargs ../bin/archive cr "$3" < "$2.a.deps"
