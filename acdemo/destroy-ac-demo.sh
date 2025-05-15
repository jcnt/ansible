#!/bin/sh

ssh x70a purevol disconnect --hgroup One jj-acdemo::jj-acdemo

ssh x70b purevol disconnect --hgroup One jj-acdemo::jj-acdemo

ssh x70a purepod remove --array PureCZ-X70-B jj-acdemo
ssh x70a purevol destroy jj-acdemo::jj-acdemo

ssh x70a purevol eradicate jj-acdemo::jj-acdemo

ssh x70a purepod destroy jj-acdemo
ssh x70a purepod eradicate jj-acdemo

ssh x70b purepod eradicate --eradicate-contents jj-acdemo.restretch

