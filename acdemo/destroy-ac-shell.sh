#!/bin/sh

ssh x70a purevol disconnect --host jjRHEL jjtest2::jjtest2vol1
ssh x70a purevol disconnect --host jjRHEL jjtest2::jjtest2vol2
ssh x70a purevol disconnect --host jjRHEL jjtest2::jjtest2vol3

ssh x70b purevol disconnect --host jjRHEL jjtest2::jjtest2vol1
ssh x70b purevol disconnect --host jjRHEL jjtest2::jjtest2vol2
ssh x70b purevol disconnect --host jjRHEL jjtest2::jjtest2vol3

ssh x70a purepod remove --array PureCZ-X70-B jjtest2
ssh x70a purevol destroy jjtest2::jjtest2vol1
ssh x70a purevol destroy jjtest2::jjtest2vol2
ssh x70a purevol destroy jjtest2::jjtest2vol3

ssh x70a purevol eradicate jjtest2::jjtest2vol1
ssh x70a purevol eradicate jjtest2::jjtest2vol2
ssh x70a purevol eradicate jjtest2::jjtest2vol3

ssh x70a purepod destroy jjtest2
ssh x70a purepod eradicate jjtest2

ssh x70b purepod eradicate --eradicate-contents jjtest2.restretch

