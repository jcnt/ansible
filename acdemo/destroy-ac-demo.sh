#!/bin/sh

ssh x70a purevol disconnect --hgroup One jj-acdemo::jj-acdemo

ssh x70b purevol disconnect --hgroup One jj-acdemo::jj-acdemo

ssh x70a "purepod remove --array PureCZ-X70-B jj-acdemo
	purevol destroy jj-acdemo::jj-acdemo
	purevol eradicate jj-acdemo::jj-acdemo
	purepod destroy jj-acdemo
	purepod eradicate jj-acdemo"

ssh x70b purepod eradicate --eradicate-contents jj-acdemo.restretch

