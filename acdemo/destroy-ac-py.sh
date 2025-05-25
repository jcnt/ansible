#!/bin/sh

ssh x70a purevol disconnect --host jjRHEL jjpy::jjpy
ssh x70b purevol disconnect --host jjRHEL jjpy::jjpy

ssh x70a purepod remove --array PureCZ-X70-B jjpy
ssh x70a purevol destroy jjpy::jjpy

ssh x70a purevol eradicate jjpy::jjpy

ssh x70a purepod destroy jjpy
ssh x70a purepod eradicate jjpy

ssh x70b purepod eradicate --eradicate-contents jjpy.restretch

