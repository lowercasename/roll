#!/usr/bin/env python

import sys, re
from random import randint

total = 0
individual_rolls = []

if len(sys.argv) < 2:
    print("Syntax for die roller: 'roll 1d6 [repeat n]'")
    pass
else:
    replaced = re.sub('[d+]', ',', sys.argv[1]);
    roll = filter(None, replaced.split(","))
    if len(roll) < 2:
        print("Syntax for die roller: 'roll 1d6 [repeat n]'")
        pass
    else:
        number = int(roll[0]);
        add = 0;
        repeat = 1;
        if len(roll) == 3:
            add = int(roll[2]);
        if len(sys.argv) > 2:
            repeat = int(sys.argv[3]);
        for x in range(repeat):
            for x in range(0,number):
                complete_roll = randint(1,int(roll[1]))+add
                total += complete_roll
                individual_rolls.append(complete_roll)
            print("Rolling %s..." % sys.argv[1])
            if number > 1:
                print total, sorted(individual_rolls)
                individual_rolls = []
                total = 0
            else:
                print total
