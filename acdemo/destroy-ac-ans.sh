#!/bin/sh

ssh x70a purevol disconnect --host jjRHEL jj-ans::jj-ans
ssh x70b purevol disconnect --host jjRHEL jj-ans::jj-ans

ssh x70a "purepod remove --array PureCZ-X70-B jj-ans
	purevol destroy jj-ans::jj-ans
	purevol eradicate jj-ans::jj-ans
	purepod destroy jj-ans
	purepod eradicate jj-ans"

ssh x70b purepod eradicate --eradicate-contents jj-ans.restretch

