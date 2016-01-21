// ==========================================================================

// SOC 4650/5650 - LECTURE 02

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
file name - lecture02.do

project name -	SOC 4650/5650
                                                                                 
purpose - week 2 replication file
	                                                                               
created - 20 Jan 2016

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
21 Jan 2016 - file paths updated to reflect proper use of the backslash 
in Windows OS.
*/

// ==========================================================================

/* 
superordinates  - 
This file requires the following data be saved to your Desktop folder:
- sampledata.dta
- sampledata.csv
- sampledata.xlsx
*/

/* 
subordinates - 
none
*/

// ==========================================================================

// 1. review from last week

// ==========================================================================

// to open a stata sample file:
sysuse gnp96.dta

// to list the variables in that sample file:
describe

// to list a selection of variables:
describe pop

// to get descriptive statistics for a variable:
summarize pop

// ==========================================================================

// 2. clear Stata's memory

// ==========================================================================

// to clear Stata’s memory:
clear

/* Stata will not generate an error message if your data has not
saved. It is important that you are careful with this command! */

// ==========================================================================

// 3. interacting with the working directory

// ==========================================================================

// to view your current working directory:
pwd

// to change your working directory:
// cd [folder name]
cd E:\Users\{insert username here}\Desktop

/* if file name or folder has a space, path must be surrounded
with quotes: */
// cd “E:\Users\{insert username here}\Desktop\Week 1”

// ==========================================================================

// 4. use pre-existing data:

// ==========================================================================

// if data is in working directory, just need .dta file’s name
// use [filename] 
use sampledata.dta

// if data is not in working directory, supply full file path:
// use E:\Users\{insert username here}\Desktop\sampledata.dta

/* if file name or folder has a space, path must be surrounded
with quotes: */
// use “E:\Users\{insert username here}\Desktop\Week 1\sampledata.dta” 

// ==========================================================================

// 5. saving data

// ==========================================================================

// if data is in working directory, just need .dta file’s name
// save [filename] [, options]
save sampledata.dta, replace

// the replace option will overwrite the existing file
// file path requirements from slide 48 apply

clear // clear data from memory

// ==========================================================================

// 6. using csv data

// ==========================================================================

// if data is in working directory, just need .csv file’s name
// import delimited [filename] [, options]
import delimited sampledata.csv, varnames(1)

// the varnames(1) option uses first row to create variable names
// file path requirements from slide 48 apply

clear // clear data from memory

// ==========================================================================

// 7. using excel data

// ==========================================================================

// if data is in working directory, just need .dta file’s name
// import excel [filename] [, options]
import excel sampledata.xlsx, sheet("Sheet1") firstrow 

// the sheet option specifies the sheet in the excel workbook
// the firstrow option uses first row to create variable names
// file path requirements from slide 48 apply

clear // clear data from memory

// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit
