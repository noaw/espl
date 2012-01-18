#! /src/bin/python

from dirwatch import Dirwatch
import os, sys, time, subprocess

if __name__ == '__main__':
  
    dirs = sys.argv[2]
    if not dirs:
        dirs = ["."]
    print "dir: " + dirs + "\n"
        
    fun = sys.argv[1]
    if not fun:
	fun = "ls"
    print "fun: "+fun + "\n"
  
    def f (changed_files, removed_files):
        print changed_files
        for cfile in changed_files:
	    line = fun + " " + cfile
	    subprocess.call(line,shell=True)

    
    Dirwatch(dirs, f, 1).watch()