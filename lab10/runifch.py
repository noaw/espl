#! /src/bin/python

from dirwatch import Dirwatch
import os, sys, time, subprocess

if __name__ == '__main__':
  
    if len(sys.argv)>2:
      dirs = [sys.argv[2]]
    #dirs = ["."]
    else:
        dirs = ["."]
    #print "dir: " + dirs + "\n"
        
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