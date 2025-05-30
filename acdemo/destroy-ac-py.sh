#!/bin/sh

ssh x70a purevol disconnect --host jjRHEL jjpy::jjpy
ssh x70b purevol disconnect --host jjRHEL jjpy::jjpy

ssh x70a "purepod remove --array PureCZ-X70-B jjpy
    purevol destroy jjpy::jjpy
    purevol eradicate jjpy::jjpy
    purepod destroy jjpy
    purepod eradicate jjpy"

ssh x70b purepod eradicate --eradicate-contents jjpy.restretch

