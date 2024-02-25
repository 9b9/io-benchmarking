current_mk_abspathname := $(abspath $(lastword $(MAKEFILE_LIST)))
current_mk_absdir := $(dir $(current_mk_abspathname))

action:=?

fileio-prepare: action=prepare
fileio-run: action=run
fileio-cleanup: action=cleanup

fileio-prepare fileio-run fileio-cleanup:
	sysbench --threads=32 --report-interval=10 --time=30 --file-num=1280 --file-total-size=128M --file-test-mode=rndrw fileio ${action}

volume-type:=tmpfs

test-tmpfs: volume-type=tmpfs
test-disk: volume-type=disk

test-tmpfs test-disk:
	$(MAKE) -C /${volume-type} fileio-prepare -f ${current_mk_abspathname}
	$(MAKE) -C /${volume-type} fileio-run -f ${current_mk_abspathname} >> /reports/${volume-type}.txt
	$(MAKE) -C /${volume-type} fileio-cleanup  -f ${current_mk_abspathname}
