#!/bin/sh

ssh x70a "purepod create jj-shell
    purepod add --array PureCZ-X70-B jj-shell
	purevol create --size 500G jj-shell::jj-shellvol1
	purevol create --size 500G jj-shell::jj-shellvol2
	purevol create --size 500G jj-shell::jj-shellvol3
	purevol connect --host jjRHEL jj-shell::jj-shellvol1
	purevol connect --host jjRHEL jj-shell::jj-shellvol2
	purevol connect --host jjRHEL jj-shell::jj-shellvol3"

ssh x70b "purevol connect --host jjRHEL jj-shell::jj-shellvol1
    purevol connect --host jjRHEL jj-shell::jj-shellvol2
    purevol connect --host jjRHEL jj-shell::jj-shellvol3"

