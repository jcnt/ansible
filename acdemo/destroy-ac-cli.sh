#!/bin/sh

ssh x70a purevol disconnect --host jjRHEL jjtest1::jjtest1

ssh x70b purevol disconnect --host jjRHEL jjtest1::jjtest1

ssh x70a "purepod remove --array PureCZ-X70-B jjtest1
	purevol destroy jjtest1::jjtest1
	purevol eradicate jjtest1::jjtest1
	purepod destroy jjtest1
	purepod eradicate jjtest1"

ssh x70b purepod eradicate --eradicate-contents jjtest1.restretch

