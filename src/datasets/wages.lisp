;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;; Determinants of Wages from the 1985 Current Population Survey
;;; Therese Stukel
;;; The datafile contains 534 observations on 11 variables
;;; sampled from the Current Population Survey of 1985
;;; http://lib.stat.cmu.edu/datasets/CPS_85_Wages
;;; Attribute Information:
;;;    1. EDUCATION: Number of years of education.
;;;    2. SOUTH: Indicator variable for Southern Region (1=Person
;;;       lives in South, 0=Person lives elsewhere).
;;;    3. SEX: Indicator variable for sex (1=Female, 0=Male).
;;;    4. EXPERIENCE: Number of years of work experience.
;;;    5. UNION: Indicator variable for union membership
;;;       (1=Union member, 0=Not union member).
;;;    6. WAGE: Wage (dollars per hour).
;;;    7. AGE: Age (years).
;;;    8. RACE: Race (1=Other, 2=Hispanic, 3=White).
;;;    9. OCCUPATION: Occupational category (1=Management,
;;;       2=Sales, 3=Clerical, 4=Service, 5=Professional, 6=Other).
;;;    10. SECTOR: Sector (0=Other, 1=Manufacturing, 2=Construction).
;;;    11. MARR: Marital Status (0=Unmarried,  1=Married)
;;; converted to CL list by Frank Zalkow, 2013

(in-package :mlep)

(defparameter *wages*
  '((8 0 1 21 0 5.1 35 2 6 1 1)
    (9 0 1 42 0 4.95 57 3 6 1 1)
    (12 0 0 1 0 6.67 19 3 6 1 0)
    (12 0 0 4 0 4 22 3 6 0 0)
    (12 0 0 17 0 7.5 35 3 6 0 1)
    (13 0 0 9 1 13.07 28 3 6 0 0)
    (10 1 0 27 0 4.45 43 3 6 0 0)
    (12 0 0 9 0 19.47 27 3 6 0 0)
    (16 0 0 11 0 13.28 33 3 6 1 1)
    (12 0 0 9 0 8.75 27 3 6 0 0)
    (12 0 0 17 1 11.35 35 3 6 0 1)
    (12 0 0 19 1 11.5 37 3 6 1 0)
    (8 1 0 27 0 6.5 41 3 6 0 1)
    (9 1 0 30 1 6.25 45 3 6 0 0)
    (9 1 0 29 0 19.98 44 3 6 0 1)
    (12 0 0 37 0 7.3 55 3 6 2 1)
    (7 1 0 44 0 8 57 3 6 0 1)
    (12 0 0 26 1 22.2 44 3 6 1 1)
    (11 0 0 16 0 3.65 33 3 6 0 0)
    (12 0 0 33 0 20.55 51 3 6 0 1)
    (12 0 1 16 1 5.71 34 3 6 1 1)
    (7 0 0 42 1 7 55 1 6 1 1)
    (12 0 0 9 0 3.75 27 3 6 0 0)
    (11 1 0 14 0 4.5 31 1 6 0 1)
    (12 0 0 23 0 9.56 41 3 6 0 1)
    (6 1 0 45 0 5.75 57 3 6 1 1)
    (12 0 0 8 0 9.36 26 3 6 1 1)
    (10 0 0 30 0 6.5 46 3 6 0 1)
    (12 0 1 8 0 3.35 26 3 6 1 1)
    (12 0 0 8 0 4.75 26 3 6 0 1)
    (14 0 0 13 0 8.9 33 3 6 0 0)
    (12 1 1 46 0 4 64 3 6 0 0)
    (8 0 0 19 0 4.7 33 3 6 0 1)
    (17 1 1 1 0 5 24 3 6 0 0)
    (12 0 0 19 0 9.25 37 3 6 1 0)
    (12 0 0 36 0 10.67 54 1 6 0 0)
    (12 1 0 20 0 7.61 38 1 6 2 1)
    (12 0 0 35 1 10 53 1 6 2 1)
    (12 0 0 3 0 7.5 21 3 6 0 0)
    (14 1 0 10 0 12.2 30 3 6 1 1)
    (12 0 0 0 0 3.35 18 3 6 0 0)
    (14 1 0 14 1 11 34 3 6 1 1)
    (12 0 0 14 0 12 32 3 6 1 1)
    (9 0 1 16 0 4.85 31 3 6 1 1)
    (13 1 0 8 0 4.3 27 3 6 2 0)
    (7 1 1 15 0 6 28 3 6 1 1)
    (16 0 0 12 0 15 34 3 6 1 1)
    (10 1 0 13 0 4.85 29 3 6 0 0)
    (8 0 0 33 1 9 47 3 6 0 1)
    (12 0 0 9 0 6.36 27 3 6 1 1)
    (12 0 0 7 0 9.15 25 3 6 0 1)
    (16 0 0 13 1 11 35 3 6 1 1)
    (12 0 1 7 0 4.5 25 3 6 1 1)
    (12 0 1 16 0 4.8 34 3 6 1 1)
    (13 0 0 0 0 4 19 3 6 0 0)
    (12 0 1 11 0 5.5 29 3 6 1 0)
    (13 0 0 17 0 8.4 36 3 6 1 0)
    (10 0 0 13 0 6.75 29 3 6 1 1)
    (12 0 0 22 1 10 40 1 6 1 0)
    (12 0 1 28 0 5 46 3 6 1 1)
    (11 0 0 17 0 6.5 34 3 6 0 0)
    (12 0 0 24 1 10.75 42 3 6 2 1)
    (3 1 0 55 0 7 64 2 6 1 1)
    (12 1 0 3 0 11.43 21 3 6 2 0)
    (12 0 0 6 1 4 24 1 6 1 0)
    (10 0 0 27 0 9 43 3 6 2 1)
    (12 1 0 19 1 13 37 1 6 1 1)
    (12 0 0 19 1 12.22 37 3 6 2 1)
    (12 0 1 38 0 6.28 56 3 6 1 1)
    (10 1 0 41 1 6.75 57 1 6 1 1)
    (11 1 0 3 0 3.35 20 1 6 1 0)
    (14 0 0 20 1 16 40 3 6 0 1)
    (10 0 0 15 0 5.25 31 3 6 0 1)
    (8 1 0 8 0 3.5 22 2 6 1 1)
    (8 1 1 39 0 4.22 53 3 6 1 1)
    (6 0 1 43 1 3 55 2 6 1 1)
    (11 1 1 25 1 4 42 3 6 1 1)
    (12 0 0 11 1 10 29 3 6 0 1)
    (12 0 0 12 0 5 30 1 6 0 1)
    (12 1 0 35 1 16 53 3 6 1 1)
    (14 0 0 14 0 13.98 34 3 6 0 0)
    (12 0 0 16 1 13.26 34 3 6 0 1)
    (10 0 1 44 1 6.1 60 3 6 1 0)
    (16 1 1 13 0 3.75 35 3 6 0 0)
    (13 0 0 8 1 9 27 1 6 1 0)
    (12 0 0 13 0 9.45 31 3 6 1 0)
    (11 0 0 18 1 5.5 35 3 6 0 1)
    (12 0 1 18 0 8.93 36 3 6 0 1)
    (12 1 1 6 0 6.25 24 3 6 0 0)
    (11 1 0 37 1 9.75 54 3 6 1 1)
    (12 1 0 2 0 6.73 20 3 6 1 1)
    (12 0 0 23 0 7.78 41 3 6 1 1)
    (12 0 0 1 0 2.85 19 3 6 0 0)
    (12 1 1 10 0 3.35 28 1 6 1 1)
    (12 0 0 23 0 19.98 41 3 6 1 1)
    (12 0 0 8 1 8.5 26 1 6 0 1)
    (15 0 1 9 0 9.75 30 3 6 1 1)
    (12 0 0 33 1 15 51 3 6 2 1)
    (12 0 1 19 0 8 37 3 6 1 1)
    (13 0 0 14 0 11.25 33 3 6 0 1)
    (11 0 0 13 1 14 30 3 6 0 1)
    (10 0 0 12 0 10 28 3 6 2 1)
    (12 0 0 8 0 6.5 26 3 6 0 0)
    (12 0 0 23 0 9.83 41 3 6 1 1)
    (14 0 1 13 0 18.5 33 3 6 1 0)
    (12 1 0 9 0 12.5 27 3 6 0 1)
    (14 0 0 21 1 26 41 3 6 0 1)
    (5 1 0 44 0 14 55 3 6 2 1)
    (12 0 0 4 1 10.5 22 3 6 0 1)
    (8 0 0 42 0 11 56 3 6 1 1)
    (13 0 0 10 1 12.47 29 3 6 0 1)
    (12 0 0 11 0 12.5 29 3 6 2 0)
    (12 0 0 40 1 15 58 3 6 2 1)
    (12 0 0 8 0 6 26 3 6 2 0)
    (11 1 0 29 0 9.5 46 3 6 2 1)
    (16 0 0 3 1 5 25 3 6 0 0)
    (11 0 0 11 0 3.75 28 3 6 2 0)
    (12 0 0 12 1 12.57 30 3 6 0 1)
    (8 0 1 22 0 6.88 36 2 6 0 1)
    (12 0 0 12 0 5.5 30 3 6 0 1)
    (12 0 0 7 1 7 25 3 6 0 1)
    (12 0 1 15 0 4.5 33 3 6 1 0)
    (12 0 0 28 0 6.5 46 3 6 0 1)
    (12 1 0 20 1 12 38 3 6 1 1)
    (12 1 0 6 0 5 24 3 6 2 0)
    (12 1 0 5 0 6.5 23 3 6 1 0)
    (9 1 1 30 0 6.8 45 3 6 1 1)
    (13 0 0 18 0 8.75 37 3 6 0 1)
    (12 1 1 6 0 3.75 24 1 6 1 1)
    (12 1 0 16 0 4.5 34 2 6 0 0)
    (12 1 0 1 1 6 19 2 6 0 0)
    (12 0 0 3 0 5.5 21 3 6 1 0)
    (12 0 0 8 0 13 26 3 6 0 1)
    (14 0 0 2 0 5.65 22 3 6 1 0)
    (9 0 0 16 0 4.8 31 1 6 1 0)
    (10 1 0 9 0 7 25 3 6 2 1)
    (12 0 0 2 0 5.25 20 3 6 0 0)
    (7 1 0 43 0 3.35 56 3 6 1 1)
    (9 0 0 38 0 8.5 53 3 6 1 1)
    (12 0 0 9 0 6 27 3 6 0 1)
    (12 1 0 12 0 6.75 30 3 6 0 1)
    (12 0 0 18 0 8.89 36 3 6 1 1)
    (11 0 0 15 1 14.21 32 3 6 1 0)
    (11 1 0 28 1 10.78 45 1 6 2 1)
    (10 1 0 27 1 8.9 43 3 6 2 1)
    (12 1 0 38 0 7.5 56 3 6 0 1)
    (12 0 1 3 0 4.5 21 3 6 1 0)
    (12 0 0 41 1 11.25 59 3 6 0 1)
    (12 1 0 16 1 13.45 34 3 6 0 1)
    (13 1 0 7 0 6 26 3 6 1 1)
    (6 1 1 33 0 4.62 45 1 6 1 0)
    (14 0 0 25 0 10.58 45 3 6 1 1)
    (12 1 0 5 0 5 23 3 6 0 1)
    (14 1 0 17 0 8.2 37 1 6 0 0)
    (12 1 0 1 0 6.25 19 3 6 0 0)
    (12 0 0 13 0 8.5 31 3 6 1 1)
    (16 0 0 18 0 24.98 40 3 1 0 1)
    (14 1 0 21 0 16.65 41 3 1 0 1)
    (14 0 0 2 0 6.25 22 3 1 0 0)
    (12 1 1 4 0 4.55 22 2 1 0 0)
    (12 1 1 30 0 11.25 48 2 1 0 1)
    (13 0 0 32 0 21.25 51 3 1 0 0)
    (17 0 1 13 0 12.65 36 3 1 0 1)
    (12 0 0 17 0 7.5 35 3 1 0 0)
    (14 0 1 26 0 10.25 46 3 1 0 1)
    (16 0 0 9 0 3.35 31 3 1 0 0)
    (16 0 0 8 0 13.45 30 1 1 0 0)
    (15 0 0 1 1 4.84 22 3 1 0 1)
    (17 1 0 32 0 26.29 55 3 1 0 1)
    (12 0 1 24 0 6.58 42 3 1 0 1)
    (14 0 1 1 0 44.5 21 3 1 0 0)
    (12 0 0 42 0 15 60 3 1 1 1)
    (16 0 1 3 0 11.25 25 1 1 1 0)
    (12 0 1 32 0 7 50 3 1 0 1)
    (14 0 0 22 0 10 42 1 1 0 0)
    (16 0 0 18 0 14.53 40 3 1 0 1)
    (18 0 1 19 0 20 43 3 1 0 1)
    (15 0 0 12 0 22.5 33 3 1 0 1)
    (12 0 1 42 0 3.64 60 3 1 0 1)
    (12 1 0 34 0 10.62 52 3 1 0 1)
    (18 0 0 29 0 24.98 53 3 1 0 1)
    (16 1 0 8 0 6 30 3 1 0 0)
    (18 0 0 13 0 19 37 3 1 1 0)
    (16 0 0 10 0 13.2 32 3 1 0 0)
    (16 0 0 22 0 22.5 44 3 1 0 1)
    (16 1 0 10 0 15 32 3 1 0 1)
    (17 0 1 15 0 6.88 38 3 1 0 1)
    (12 0 0 26 0 11.84 44 3 1 0 1)
    (14 0 0 16 0 16.14 36 3 1 0 0)
    (18 0 1 14 0 13.95 38 3 1 0 1)
    (12 0 1 38 0 13.16 56 3 1 0 1)
    (12 1 0 14 0 5.3 32 1 1 0 1)
    (12 0 1 7 0 4.5 25 3 1 0 1)
    (18 1 1 13 0 10 37 3 1 0 0)
    (10 0 0 20 0 10 36 3 1 0 1)
    (16 0 0 7 1 10 29 2 1 0 1)
    (16 0 1 26 0 9.37 48 3 1 0 1)
    (16 0 0 14 0 5.8 36 3 1 0 1)
    (13 0 0 36 0 17.86 55 3 1 0 0)
    (12 0 0 24 0 1 42 3 1 0 1)
    (14 1 0 41 0 8.8 61 3 1 0 1)
    (16 0 0 7 0 9 29 1 1 0 1)
    (17 1 0 14 0 18.16 37 3 1 0 0)
    (12 1 1 1 0 7.81 19 3 1 0 0)
    (16 0 1 6 0 10.62 28 3 1 1 1)
    (12 0 1 3 0 4.5 21 3 1 0 1)
    (15 0 0 31 0 17.25 52 3 1 0 1)
    (13 0 1 14 0 10.5 33 3 1 1 1)
    (14 0 1 13 0 9.22 33 3 1 0 1)
    (16 0 0 26 1 15 48 1 1 1 1)
    (18 0 0 14 0 22.5 38 3 1 0 1)
    (13 0 1 33 0 4.55 52 3 2 0 1)
    (12 0 0 16 0 9 34 3 2 0 1)
    (18 0 0 10 0 13.33 34 3 2 0 1)
    (14 0 0 22 0 15 42 3 2 0 0)
    (14 0 0 2 0 7.5 22 3 2 0 0)
    (12 1 1 29 0 4.25 47 3 2 0 1)
    (12 0 0 43 0 12.5 61 3 2 1 1)
    (12 0 1 5 0 5.13 23 3 2 0 1)
    (16 1 1 14 0 3.35 36 1 2 0 1)
    (12 1 0 28 0 11.11 46 3 2 0 1)
    (11 1 1 25 0 3.84 42 1 2 0 1)
    (12 0 1 45 0 6.4 63 3 2 0 1)
    (14 1 0 5 0 5.56 25 3 2 0 0)
    (12 1 0 20 0 10 38 3 2 1 1)
    (16 0 1 6 0 5.65 28 3 2 0 1)
    (16 0 0 16 0 11.5 38 3 2 0 1)
    (11 0 1 33 0 3.5 50 3 2 0 1)
    (13 1 1 2 0 3.35 21 3 2 0 1)
    (12 1 1 10 0 4.75 28 3 2 0 0)
    (14 1 0 44 0 19.98 64 3 2 0 1)
    (14 1 1 6 0 3.5 26 3 2 0 1)
    (12 0 1 15 0 4 33 3 2 0 0)
    (12 0 0 5 0 7 23 3 2 0 1)
    (13 0 1 4 0 6.25 23 3 2 1 1)
    (14 0 0 14 0 4.5 34 3 2 0 1)
    (14 0 1 32 0 14.29 52 3 2 0 1)
    (12 0 1 14 0 5 32 3 2 0 1)
    (14 0 0 21 0 13.75 41 3 2 0 1)
    (12 0 0 43 1 13.71 61 3 2 0 1)
    (12 1 1 27 0 7.5 45 1 2 0 1)
    (12 0 1 4 0 3.8 22 3 2 0 0)
    (14 0 0 0 0 5 20 2 2 0 0)
    (12 1 0 32 0 9.42 50 3 2 0 1)
    (12 0 0 20 0 5.5 38 3 2 0 1)
    (15 1 0 4 0 3.75 25 3 2 0 0)
    (12 0 0 34 0 3.5 52 3 2 0 1)
    (13 0 0 5 0 5.8 24 3 2 0 0)
    (17 0 0 13 0 12 36 3 2 1 1)
    (14 0 1 17 0 5 37 2 3 0 1)
    (13 1 1 10 0 8.75 29 3 3 0 1)
    (16 0 1 7 0 10 29 3 3 0 1)
    (12 0 1 25 0 8.5 43 3 3 0 0)
    (12 0 1 18 0 8.63 36 1 3 0 1)
    (16 0 1 27 0 9 49 3 3 1 1)
    (16 0 1 2 0 5.5 24 3 3 0 0)
    (13 0 0 13 0 11.11 32 3 3 0 1)
    (14 0 1 24 0 10 44 3 3 0 0)
    (18 1 1 13 0 5.2 37 2 3 0 1)
    (14 0 1 15 1 8 35 3 3 0 0)
    (12 1 1 12 0 3.56 30 2 3 0 0)
    (12 0 1 24 0 5.2 42 3 3 0 1)
    (12 0 1 43 0 11.67 61 3 3 2 1)
    (12 0 1 13 0 11.32 31 3 3 1 1)
    (12 1 1 16 0 7.5 34 3 3 0 1)
    (11 0 1 24 0 5.5 41 3 3 0 1)
    (16 1 1 4 0 5 26 3 3 0 1)
    (12 0 1 24 0 7.75 42 3 3 0 1)
    (12 0 1 45 0 5.25 63 3 3 0 1)
    (12 0 0 20 1 9 38 3 3 0 1)
    (12 0 1 38 0 9.65 56 3 3 0 1)
    (18 1 0 10 0 5.21 34 3 3 0 1)
    (11 0 1 16 0 7 33 1 3 0 1)
    (12 1 1 32 0 12.16 50 1 3 0 1)
    (16 1 1 2 0 5.25 24 3 3 0 0)
    (13 1 1 28 0 10.32 47 3 3 0 0)
    (16 0 0 3 0 3.35 25 1 3 0 0)
    (13 0 1 8 1 7.7 27 3 3 0 0)
    (12 0 1 44 0 9.17 62 3 3 1 1)
    (12 1 0 12 0 8.43 30 3 3 0 1)
    (12 1 0 8 0 4 26 1 3 0 1)
    (12 0 1 4 0 4.13 22 3 3 0 1)
    (12 1 1 28 0 3 46 3 3 0 1)
    (13 1 1 0 0 4.25 19 3 3 0 0)
    (14 1 0 1 0 7.53 21 3 3 0 0)
    (14 0 1 12 0 10.53 32 3 3 1 1)
    (12 0 1 39 0 5 57 3 3 0 1)
    (12 0 1 24 0 15.03 42 3 3 0 1)
    (17 0 1 32 0 11.25 55 1 3 0 1)
    (16 0 0 4 0 6.25 26 1 3 0 0)
    (12 0 1 25 0 3.5 43 1 3 0 0)
    (12 0 0 8 0 6.85 26 1 3 0 0)
    (13 0 1 16 0 12.5 35 3 3 0 1)
    (12 1 0 5 0 12 23 3 3 0 0)
    (13 0 0 31 0 6 50 3 3 0 0)
    (12 0 1 25 0 9.5 43 3 3 0 0)
    (12 0 1 15 0 4.1 33 3 3 0 1)
    (14 1 1 15 0 10.43 35 3 3 0 1)
    (12 0 1 0 0 5 18 3 3 0 0)
    (12 0 0 19 0 7.69 37 3 3 0 1)
    (12 0 1 21 0 5.5 39 1 3 0 0)
    (12 0 1 6 0 6.4 24 3 3 0 0)
    (12 0 1 14 1 12.5 32 3 3 0 1)
    (13 0 1 30 0 6.25 49 3 3 0 1)
    (12 0 1 8 0 8 26 3 3 0 0)
    (9 0 0 33 1 9.6 48 3 3 0 0)
    (13 0 0 16 0 9.1 35 2 3 0 0)
    (12 1 1 20 0 7.5 38 3 3 0 0)
    (13 1 1 6 0 5 25 3 3 0 1)
    (12 0 1 10 1 7 28 3 3 0 1)
    (13 1 1 1 0 3.55 20 3 3 0 0)
    (12 1 0 2 0 8.5 20 1 3 0 0)
    (13 1 1 0 0 4.5 19 3 3 0 0)
    (16 0 0 17 0 7.88 39 1 3 0 1)
    (12 0 1 8 0 5.25 26 3 3 0 0)
    (12 1 0 4 0 5 22 3 3 0 0)
    (12 0 1 15 0 9.33 33 3 3 0 0)
    (12 0 1 29 0 10.5 47 3 3 0 1)
    (12 1 1 23 0 7.5 41 1 3 0 1)
    (12 1 1 39 0 9.5 57 3 3 0 1)
    (12 1 1 14 0 9.6 32 3 3 0 1)
    (17 1 1 6 0 5.87 29 1 3 0 0)
    (14 1 0 12 1 11.02 32 3 3 0 1)
    (12 1 1 26 0 5 44 3 3 0 0)
    (14 0 1 32 0 5.62 52 3 3 0 1)
    (15 0 1 6 0 12.5 27 3 3 0 1)
    (12 0 1 40 0 10.81 58 3 3 0 1)
    (12 0 1 18 0 5.4 36 3 3 1 1)
    (11 0 1 12 0 7 29 3 3 0 0)
    (12 1 1 36 0 4.59 54 3 3 2 1)
    (12 0 1 19 0 6 37 3 3 0 1)
    (16 0 1 42 0 11.71 64 3 3 1 0)
    (13 0 1 2 0 5.62 21 2 3 0 1)
    (12 0 1 33 0 5.5 51 3 3 0 1)
    (12 1 1 14 0 4.85 32 3 3 0 1)
    (12 0 0 22 0 6.75 40 3 3 0 0)
    (12 0 1 20 0 4.25 38 3 3 0 1)
    (12 0 1 15 0 5.75 33 3 3 0 1)
    (12 0 0 35 0 3.5 53 3 3 0 1)
    (12 0 1 7 0 3.35 25 3 3 0 1)
    (12 0 1 45 0 10.62 63 3 3 1 0)
    (12 0 1 9 0 8 27 3 3 0 0)
    (12 1 1 2 0 4.75 20 3 3 0 1)
    (17 1 0 3 0 8.5 26 3 3 0 0)
    (14 0 1 19 1 8.85 39 1 3 0 1)
    (12 1 1 14 0 8 32 3 3 0 1)
    (4 0 0 54 0 6 64 3 4 0 1)
    (14 0 0 17 0 7.14 37 3 4 0 1)
    (8 0 1 29 0 3.4 43 1 4 0 1)
    (15 1 1 26 0 6 47 3 4 0 0)
    (2 0 0 16 0 3.75 24 2 4 0 0)
    (8 0 1 29 0 8.89 43 1 4 0 0)
    (11 0 1 20 0 4.35 37 3 4 0 1)
    (10 1 1 38 0 13.1 54 1 4 0 1)
    (8 1 1 37 0 4.35 51 1 4 0 1)
    (9 0 0 48 0 3.5 63 3 4 0 0)
    (12 0 1 16 0 3.8 34 3 4 0 0)
    (8 0 1 38 0 5.26 52 3 4 0 1)
    (14 0 0 0 0 3.35 20 1 4 0 0)
    (12 0 0 14 1 16.26 32 1 4 0 0)
    (12 0 1 2 0 4.25 20 3 4 0 1)
    (16 0 0 21 0 4.5 43 3 4 0 1)
    (13 0 1 15 0 8 34 3 4 0 1)
    (16 0 1 20 0 4 42 3 4 0 0)
    (14 0 1 12 0 7.96 32 3 4 0 1)
    (12 1 0 7 0 4 25 2 4 0 0)
    (11 0 0 4 0 4.15 21 3 4 0 1)
    (13 1 0 9 0 5.95 28 3 4 0 1)
    (12 1 1 43 0 3.6 61 2 4 0 1)
    (10 1 0 19 0 8.75 35 3 4 0 0)
    (8 0 1 49 0 3.4 63 3 4 0 0)
    (12 0 1 38 0 4.28 56 3 4 0 1)
    (12 0 1 13 0 5.35 31 3 4 0 1)
    (12 0 1 14 0 5 32 3 4 0 1)
    (12 0 0 20 0 7.65 38 3 4 0 0)
    (12 0 1 7 0 6.94 25 3 4 0 0)
    (12 0 1 9 1 7.5 27 3 4 1 1)
    (12 0 1 6 0 3.6 24 3 4 0 0)
    (12 1 1 5 0 1.75 23 3 4 0 1)
    (13 1 1 1 0 3.45 20 1 4 0 0)
    (14 0 0 22 1 9.63 42 3 4 0 1)
    (12 0 1 24 0 8.49 42 3 4 0 1)
    (12 0 1 15 1 8.99 33 3 4 0 0)
    (11 1 1 8 0 3.65 25 3 4 0 1)
    (11 1 1 17 0 3.5 34 3 4 0 1)
    (12 1 0 2 0 3.43 20 1 4 0 0)
    (12 1 0 20 0 5.5 38 3 4 0 1)
    (12 0 0 26 1 6.93 44 3 4 0 1)
    (10 1 1 37 0 3.51 53 1 4 0 1)
    (12 0 1 41 0 3.75 59 3 4 0 0)
    (12 0 1 27 0 4.17 45 3 4 0 1)
    (12 0 1 5 1 9.57 23 3 4 0 1)
    (14 0 0 16 0 14.67 36 1 4 0 1)
    (14 0 1 19 0 12.5 39 3 4 0 1)
    (12 0 0 10 0 5.5 28 3 4 0 1)
    (13 1 0 1 1 5.15 20 3 4 0 0)
    (12 0 1 43 1 8 61 1 4 0 1)
    (13 0 0 3 0 5.83 22 1 4 0 0)
    (12 0 1 0 0 3.35 18 3 4 0 0)
    (12 1 1 26 0 7 44 3 4 0 1)
    (10 0 1 25 1 10 41 3 4 0 1)
    (12 0 1 15 0 8 33 3 4 0 1)
    (14 1 1 10 0 6.88 30 3 4 0 0)
    (11 0 1 45 1 5.55 62 3 4 0 0)
    (11 0 0 3 0 7.5 20 1 4 0 0)
    (8 0 0 47 1 8.93 61 2 4 0 1)
    (16 0 1 6 0 9 28 1 4 0 1)
    (10 1 1 33 0 3.5 49 3 4 0 0)
    (16 0 0 3 0 5.77 25 3 4 1 0)
    (14 0 0 4 1 25 24 2 4 0 0)
    (14 0 0 34 1 6.85 54 1 4 0 1)
    (11 1 0 39 0 6.5 56 3 4 0 1)
    (12 1 1 17 0 3.75 35 3 4 0 1)
    (9 0 0 47 1 3.5 62 3 4 0 1)
    (11 0 0 2 0 4.5 19 3 4 0 0)
    (13 1 0 0 0 2.01 19 3 4 0 0)
    (14 0 1 24 0 4.17 44 3 4 0 0)
    (12 0 0 25 1 13 43 1 4 0 1)
    (14 0 1 6 0 3.98 26 3 4 0 0)
    (12 0 1 10 0 7.5 28 3 4 0 0)
    (12 0 1 33 0 13.12 51 1 4 0 1)
    (12 0 0 12 0 4 30 3 4 0 0)
    (12 1 1 9 0 3.95 27 3 4 0 1)
    (11 1 0 18 1 13 35 3 4 0 1)
    (12 0 0 10 0 9 28 3 4 0 1)
    (8 1 1 45 0 4.55 59 3 4 0 0)
    (9 0 1 46 1 9.5 61 3 4 0 1)
    (7 1 0 14 0 4.5 27 2 4 0 1)
    (11 0 1 36 0 8.75 53 3 4 0 0)
    (13 0 0 34 1 10 53 3 5 2 1)
    (18 0 0 15 0 18 39 3 5 0 1)
    (17 0 0 31 0 24.98 54 3 5 1 1)
    (16 0 1 6 0 12.05 28 3 5 1 0)
    (14 1 0 15 0 22 35 3 5 0 1)
    (12 0 0 30 0 8.75 48 3 5 0 1)
    (18 0 0 8 0 22.2 32 3 5 0 1)
    (18 0 0 5 0 17.25 29 3 5 1 1)
    (17 0 1 3 1 6 26 3 5 0 0)
    (13 1 0 17 0 8.06 36 3 5 0 1)
    (16 0 0 5 1 9.24 27 1 5 1 1)
    (14 0 1 10 0 12 30 3 5 0 1)
    (15 0 1 33 0 10.61 54 3 5 0 0)
    (18 0 0 3 0 5.71 27 3 5 0 1)
    (16 0 1 0 0 10 18 3 5 0 0)
    (16 1 0 13 0 17.5 35 1 5 0 1)
    (18 0 0 12 0 15 36 3 5 0 1)
    (16 0 1 6 0 7.78 28 3 5 0 1)
    (17 0 0 7 0 7.8 30 3 5 0 1)
    (16 1 0 14 1 10 36 3 5 0 1)
    (17 0 1 5 0 24.98 28 3 5 0 0)
    (15 1 1 10 0 10.28 31 3 5 0 1)
    (18 0 1 11 0 15 35 3 5 0 1)
    (17 0 1 24 0 12 47 3 5 0 1)
    (16 0 0 9 0 10.58 31 3 5 1 0)
    (18 1 0 12 0 5.85 36 3 5 0 1)
    (18 0 0 19 0 11.22 43 3 5 0 1)
    (14 0 1 14 0 8.56 34 3 5 0 1)
    (16 0 1 17 0 13.89 39 3 5 1 0)
    (18 1 0 7 0 5.71 31 3 5 0 0)
    (18 0 0 7 0 15.79 31 3 5 0 1)
    (16 0 1 22 0 7.5 44 3 5 0 1)
    (12 0 1 28 0 11.25 46 3 5 0 1)
    (16 0 1 16 0 6.15 38 3 5 0 0)
    (16 1 0 16 0 13.45 38 1 5 0 0)
    (16 0 1 7 0 6.25 29 3 5 0 1)
    (12 0 1 11 0 6.5 29 3 5 0 0)
    (12 0 1 11 0 12 29 3 5 0 1)
    (12 0 1 16 0 8.5 34 3 5 0 0)
    (18 0 0 33 1 8 57 3 5 0 0)
    (12 1 1 21 0 5.75 39 3 5 0 1)
    (16 0 0 4 0 15.73 26 3 5 1 1)
    (15 0 0 13 0 9.86 34 3 5 0 1)
    (18 0 0 14 1 13.51 38 3 5 0 1)
    (16 0 1 10 0 5.4 32 3 5 0 1)
    (18 1 0 14 0 6.25 38 3 5 0 1)
    (16 1 0 29 0 5.5 51 3 5 0 1)
    (12 0 0 4 0 5 22 2 5 0 0)
    (18 0 0 27 0 6.25 51 1 5 0 1)
    (12 0 0 3 0 5.75 21 3 5 0 1)
    (16 1 0 14 1 20.5 36 3 5 0 1)
    (14 0 0 0 0 5 20 3 5 2 1)
    (18 0 0 33 0 7 57 3 5 0 1)
    (16 1 0 38 0 18 60 3 5 0 1)
    (18 0 1 18 1 12 42 3 5 0 1)
    (17 0 0 3 0 20.4 26 3 5 1 0)
    (18 0 1 40 0 22.2 64 3 5 0 0)
    (14 0 0 19 0 16.42 39 3 5 1 0)
    (14 0 1 4 0 8.63 24 3 5 0 0)
    (16 0 1 11 0 19.38 33 3 5 0 1)
    (16 0 1 16 0 14 38 3 5 0 1)
    (14 0 0 22 0 10 42 3 5 0 1)
    (17 0 1 13 1 15.95 36 3 5 0 0)
    (16 1 1 28 1 20 50 3 5 0 1)
    (16 0 1 10 0 10 32 3 5 0 1)
    (16 1 1 5 0 24.98 27 3 5 0 0)
    (15 0 0 5 0 11.25 26 3 5 0 0)
    (18 0 1 37 0 22.83 61 3 5 1 0)
    (17 0 1 26 1 10.2 49 3 5 0 1)
    (16 1 1 4 0 10 26 3 5 0 1)
    (18 0 1 31 1 14 55 3 5 0 0)
    (17 0 1 13 1 12.5 36 3 5 0 1)
    (12 0 1 42 0 5.79 60 3 5 0 1)
    (17 0 0 18 0 24.98 41 2 5 0 1)
    (12 0 1 3 0 4.35 21 3 5 0 1)
    (17 0 1 10 0 11.25 33 3 5 0 0)
    (16 0 1 10 1 6.67 32 3 5 0 0)
    (16 0 1 17 0 8 39 2 5 0 1)
    (18 0 0 7 0 18.16 31 3 5 0 1)
    (16 0 1 14 0 12 36 3 5 0 1)
    (16 0 1 22 1 8.89 44 3 5 0 1)
    (17 0 1 14 0 9.5 37 3 5 0 1)
    (16 0 0 11 0 13.65 33 3 5 0 1)
    (18 0 0 23 1 12 47 3 5 0 1)
    (12 0 0 39 1 15 57 3 5 0 1)
    (16 0 0 15 0 12.67 37 3 5 0 1)
    (14 0 1 15 0 7.38 35 2 5 0 0)
    (16 0 0 10 0 15.56 32 3 5 0 0)
    (12 1 1 25 0 7.45 43 3 5 0 0)
    (14 0 1 12 0 6.25 32 3 5 0 1)
    (16 1 1 7 0 6.25 29 2 5 0 1)
    (17 0 0 7 1 9.37 30 3 5 0 1)
    (16 0 0 17 0 22.5 39 3 5 1 1)
    (16 0 0 10 1 7.5 32 3 5 0 1)
    (17 1 0 2 0 7 25 3 5 0 1)
    (9 1 1 34 1 5.75 49 1 5 0 1)
    (15 0 1 11 0 7.67 32 3 5 0 1)
    (15 0 0 10 0 12.5 31 3 5 0 0)
    (12 1 0 12 0 16 30 3 5 0 1)
    (16 0 1 6 1 11.79 28 3 5 0 0)
    (18 0 0 5 0 11.36 29 3 5 0 0)
    (12 0 1 33 0 6.1 51 1 5 0 1)
    (17 0 1 25 1 23.25 48 1 5 0 1)
    (12 1 0 13 1 19.88 31 3 5 0 1)
    (16 0 0 33 0 15.38 55 3 5 1 1))
  "Determinants of Wages from the 1985 Current Population Survey

Therese Stukel

The datafile contains 534 observations on 11 variables
sampled from the Current Population Survey of 1985

@a[http://lib.stat.cmu.edu/datasets/CPS_85_Wages]{http://lib.stat.cmu.edu/datasets/CPS_85_Wages}

Attribute Information:

@itemize{
@item{   1. EDUCATION: Number of years of education.}
@item{   2. SOUTH: Indicator variable for Southern Region (1=Person lives in South, 0=Person lives elsewhere).}
@item{   3. SEX: Indicator variable for sex (1=Female, 0=Male).}
@item{   4. EXPERIENCE: Number of years of work experience.}
@item{   5. UNION: Indicator variable for union membership (1=Union member, 0=Not union member).}
@item{   6. WAGE: Wage (dollars per hour).}
@item{   7. AGE: Age (years).}
@item{   8. RACE: Race (1=Other, 2=Hispanic, 3=White).}
@item{   9. OCCUPATION: Occupational category (1=Management, 2=Sales, 3=Clerical, 4=Service, 5=Professional, 6=Other).}
@item{   10. SECTOR: Sector (0=Other, 1=Manufacturing, 2=Construction).}
@item{   11. MARR: Marital Status (0=Unmarried, 1=Married)}}")