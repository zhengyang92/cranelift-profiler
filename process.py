#/usr/bin/python
import sys

human_readable = False

symtable = dict()
exec_time = dict()
exec_count = dict()

with open(sys.argv[1]) as fp:
    line = fp.readline()
    while line:
        d = line.strip().split(',')
        symtable[d[0]] = d[1]
        exec_time[d[1]] = 0
        line = fp.readline()

seq = []
with open(sys.argv[2]) as fp:
    line = fp.readline()
    while line:
        d = line.strip().split(',')
        if d[0] == 's' or  d[0] == 't':
            seq.append(tuple(d))

        line = fp.readline()
    pass


event_stack = []

for e in seq:
    if e[0] == 's':
        event_stack.append(e)
        exec_count[symtable[e[2]]] = exec_count.get(symtable[e[2]], 0) + 1
    if e[0] == 't':
        if event_stack[-1][2] == e[2]:
            exec_time[symtable[e[2]]] += int(e[1]) - int(event_stack[-1][1])
            event_stack.pop()

for e in exec_time:
    if not e in exec_count:
        continue
    if human_readable:
        print "{:>40}\t{}\t{}".format(e, exec_time[e]/1000.0, exec_count[e])
    else:
        print "{},{},{}".format(e, exec_count[e], exec_time[e]/1000.0)
