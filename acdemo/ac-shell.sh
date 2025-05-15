#!/bin/sh

ssh x70a purepod create jjtest2
ssh x70a purepod add --array PureCZ-X70-B jjtest2
ssh x70a purevol create --size 500G jjtest2::jjtest2vol1
ssh x70a purevol create --size 500G jjtest2::jjtest2vol2
ssh x70a purevol create --size 500G jjtest2::jjtest2vol3
ssh x70a purevol connect --host jjRHEL jjtest2::jjtest2vol1
ssh x70a purevol connect --host jjRHEL jjtest2::jjtest2vol2
ssh x70a purevol connect --host jjRHEL jjtest2::jjtest2vol3

ssh x70b purevol connect --host jjRHEL jjtest2::jjtest2vol1
ssh x70b purevol connect --host jjRHEL jjtest2::jjtest2vol2
ssh x70b purevol connect --host jjRHEL jjtest2::jjtest2vol3

