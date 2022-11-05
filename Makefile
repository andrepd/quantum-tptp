all: Axioms/ARI001-24.ax \
	Axioms/QUA001-1.ax \
	Problems/QUA008-1.p \
	Problems/QUA009-1.p \
	Problems/QUA010-1.p \
	Problems/QUA011-1.p \
	Problems/QUA012-1.p \
	Problems/QUA013-1.p \
	Problems/QUA014-1.p \
	Problems/QUA015-1.p \
	Problems/QUA016-1.p \
	Problems/QUA017-1.p \
	Problems/QUA018-1.p \
	Problems/QUA019-1.p \
	Problems/QUA020-1.p \
	Problems/QUA021-1.p \
	Problems/QUA008-1.min.p \
	Problems/QUA009-1.min.p \
	Problems/QUA010-1.min.p \
	Problems/QUA011-1.min.p \
	Problems/QUA012-1.min.p \
	Problems/QUA013-1.min.p \
	Problems/QUA014-1.min.p \
	Problems/QUA015-1.min.p \
	Problems/QUA016-1.min.p \
	Problems/QUA017-1.min.p \
	Problems/QUA018-1.min.p \
	Problems/QUA019-1.min.p \
	Problems/QUA020-1.min.p \
	Solutions/QUA008-1.1.s \
	Solutions/QUA008-1.2.s \
	Solutions/QUA008-1.3.s \
	Solutions/QUA008-1.4.s \
	Solutions/QUA008-1.5.s \
	Solutions/QUA008-1.1.min.s \
	Solutions/QUA008-1.2.min.s \
	Solutions/QUA008-1.3.min.s \
	Solutions/QUA008-1.4.min.s \
	Solutions/QUA008-1.5.min.s \
	Solutions/QUA009-1.1.s \
	Solutions/QUA009-1.2.s \
	Solutions/QUA009-1.3.s \
	Solutions/QUA009-1.4.s \
	Solutions/QUA009-1.5.s \
	Solutions/QUA009-1.1.min.s \
	Solutions/QUA009-1.2.min.s \
	Solutions/QUA009-1.3.min.s \
	Solutions/QUA009-1.4.min.s \
	Solutions/QUA009-1.5.min.s \
	Solutions/QUA010-1.1.s \
	Solutions/QUA010-1.2.s \
	Solutions/QUA010-1.3.s \
	Solutions/QUA010-1.1.min.s \
	Solutions/QUA010-1.2.min.s \
	Solutions/QUA010-1.3.min.s \
	Solutions/QUA011-1.1.s \
	Solutions/QUA011-1.2.s \
	Solutions/QUA011-1.3.s \
	Solutions/QUA011-1.4.s \
	Solutions/QUA011-1.5.s \
	Solutions/QUA011-1.1.min.s \
	Solutions/QUA011-1.2.min.s \
	Solutions/QUA011-1.3.min.s \
	Solutions/QUA011-1.4.min.s \
	Solutions/QUA011-1.5.min.s \
	Solutions/QUA013-1.1.s \
	Solutions/QUA013-1.2.s \
	Solutions/QUA013-1.3.s \
	Solutions/QUA013-1.4.s \
	Solutions/QUA013-1.1.min.s \
	Solutions/QUA013-1.2.min.s \
	Solutions/QUA013-1.3.min.s \
	Solutions/QUA013-1.4.min.s

Axioms/ARI001-24.ax:
	./Axioms/gen-ARI001.py 24 > Axioms/ARI001-24

Axioms/QUA001.ax: Axioms/QUA001.axq
	./Tools/preprocess.py < Axioms/QUA001.axq > Axioms/QUA001.ax

Problems/%.p: Problems/%.pq
	./Tools/preprocess.py < Problems/$*.pq > Problems/$*.p

Solutions/%.s: Solutions/%.sq
	./Tools/preprocess.py < Solutions/$*.sq > Solutions/$*.s

# clean:


# .PHONY: clean
