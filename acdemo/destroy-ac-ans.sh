#!/bin/sh

ssh x70a purevol disconnect --host jjRHEL jjans::jjans

ssh x70a purepod remove --array PureCZ-X70-B jjans
ssh x70a purevol destroy jjans::jjans

ssh x70a purevol eradicate jjans::jjans

ssh x70a purepod destroy jjans
ssh x70a purepod eradicate jjans

ssh x70b purepod eradicate --eradicate-contents jjans.restretch

