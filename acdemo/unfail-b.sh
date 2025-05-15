#!/bin/sh

ssh x70b purenetwork fc enable --override-npiv-check CT0.FC4 CT0.FC5 CT0.FC6 CT0.FC7 CT0.FC12 CT0.FC13 CT1.FC4 CT1.FC5 CT1.FC6 CT1.FC7 CT1.FC12 CT1.FC13
ssh x70b purenetwork eth enable ct0.eth2 ct0.eth3 ct1.eth2 ct1.eth3
