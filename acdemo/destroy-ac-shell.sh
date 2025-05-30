#!/bin/sh

ssh x70a "purevol disconnect --host jjRHEL jj-shell::jj-shellvol1
    purevol disconnect --host jjRHEL jj-shell::jj-shellvol2
    purevol disconnect --host jjRHEL jj-shell::jj-shellvol3"

ssh x70b "purevol disconnect --host jjRHEL jj-shell::jj-shellvol1
    purevol disconnect --host jjRHEL jj-shell::jj-shellvol2
    purevol disconnect --host jjRHEL jj-shell::jj-shellvol3"

ssh x70a "purepod remove --array PureCZ-X70-B jj-shell
	purevol destroy jj-shell::jj-shellvol1
	purevol destroy jj-shell::jj-shellvol2
	purevol destroy jj-shell::jj-shellvol3
	purevol eradicate jj-shell::jj-shellvol1
	purevol eradicate jj-shell::jj-shellvol2
	purevol eradicate jj-shell::jj-shellvol3
	purepod destroy jj-shell
	purepod eradicate jj-shell"

ssh x70b purepod eradicate --eradicate-contents jj-shell.restretch

