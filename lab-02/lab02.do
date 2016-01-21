// ==========================================================================

// SOC 4650/5650 - LAB 02 REPLICATION

// ==========================================================================

// standard opening options

version 14
log close _all
graph drop _all
clear all
set more off
set linesize 80

// ==========================================================================

/* 
file name - lab02.do

project name -	SOC 4650/5650
                                                                                 
purpose - week 2 lab replication file
	                                                                               
created - 21 Jan 2016

updated - 21 Jan 2016
                                                                                
author - CHRIS
*/                                                                              

// ==========================================================================
                                                                                 
/* 
full description - 
This file replicates the Stata steps for Lecture 01. Line 100 requires
editing before use.
*/

/* 
updates - 
none
*/

// ==========================================================================

/* 
superordinates  - 
This file requires the following data be saved to in your working directory:
- census.dta
- census.csv
- census.xlsx
*/

/* 
subordinates - 
none
*/

// ==========================================================================

// PART 1 - Review from Week 1

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 1

sysuse citytemp.dta // open built-in file from Stata

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 2

describe // describe all variables in dataset

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 3

describe heatdd cooldd tempjan // describe three variables

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 4

summarize heatdd // descriptive statistics for the variable heatdd

// ==========================================================================

// PART 2 - Working Directories

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 5

clear // clear data from Stata's memory

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 6

pwd // display current working directory

// the current working directory on my computer is E:\Users\prenercg\Desktop

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 7

cd E:\Users\prenercg\Desktop\week-02\lab-02 // change working directory

// ==========================================================================

// PART 3 - Using and Saving Stata Files

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 8

use census.dta // open stata dataset

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 9

// used the data viewer to explore dataset

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 10

save census.dta, replace // the replace option overwrites the existing data

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 11

save censusNew.dta // save by changing the filename to something new

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 12

describe // describe all variables in dataset

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 13

summarize pop // descriptive statistics

// ==========================================================================

// PART 4 - Using CSV Files

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 14

clear // clear data from Stata's memory

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 15

// import CSV file with variable names in first row
import delimited census.csv, varnames(1) 

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 16

// used the data viewer to explore dataset

// ==========================================================================

// PART 5 - Using Excel Files

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 17

clear // clear data from Stata's memory

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 18

// import excel file with data in `Sheet1' and variable names in first row
import excel census.xlsx, sheet("Sheet1") firstrow

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 19

// used the data viewer to explore dataset

// ==========================================================================

// PART 6 - Working with File Paths

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 20

clear // clear data from Stata's memory

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 21

// open census.dta using full file path
use E:\Users\prenercg\Desktop\week-02\lab-02\census.dta 

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// question 22

clear // clear data from Stata's memory

// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit
