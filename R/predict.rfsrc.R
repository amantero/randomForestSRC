####**********************************************************************
####**********************************************************************
####
####  RANDOM FORESTS FOR SURVIVAL, REGRESSION, AND CLASSIFICATION (RF-SRC)
####  Version 2.4.1.5 (_PROJECT_BUILD_ID_)
####
####  Copyright 2016, University of Miami
####
####  This program is free software; you can redistribute it and/or
####  modify it under the terms of the GNU General Public License
####  as published by the Free Software Foundation; either version 3
####  of the License, or (at your option) any later version.
####
####  This program is distributed in the hope that it will be useful,
####  but WITHOUT ANY WARRANTY; without even the implied warranty of
####  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
####  GNU General Public License for more details.
####
####  You should have received a copy of the GNU General Public
####  License along with this program; if not, write to the Free
####  Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
####  Boston, MA  02110-1301, USA.
####
####  ----------------------------------------------------------------
####  Project Partially Funded By: 
####  ----------------------------------------------------------------
####  Dr. Ishwaran's work was funded in part by DMS grant 1148991 from the
####  National Science Foundation and grant R01 CA163739 from the National
####  Cancer Institute.
####
####  Dr. Kogalur's work was funded in part by grant R01 CA163739 from the 
####  National Cancer Institute.
####  ----------------------------------------------------------------
####  Written by:
####  ----------------------------------------------------------------
####    Hemant Ishwaran, Ph.D.
####    Director of Statistical Methodology
####    Professor, Division of Biostatistics
####    Clinical Research Building, Room 1058
####    1120 NW 14th Street
####    University of Miami, Miami FL 33136
####
####    email:  hemant.ishwaran@gmail.com
####    URL:    http://web.ccs.miami.edu/~hishwaran
####    --------------------------------------------------------------
####    Udaya B. Kogalur, Ph.D.
####    Adjunct Staff
####    Department of Quantitative Health Sciences
####    Cleveland Clinic Foundation
####    
####    Kogalur & Company, Inc.
####    5425 Nestleway Drive, Suite L1
####    Clemmons, NC 27012
####
####    email:  ubk@kogalur.com
####    URL:    http://www.kogalur.com
####    --------------------------------------------------------------
####
####**********************************************************************
####**********************************************************************


predict.rfsrc <-
  function(object,
           newdata,
           outcome.target=NULL,
           importance = c(FALSE, TRUE, "none", "permute", "random", "anti", "permute.ensemble", "random.ensemble", "anti.ensemble")[1],
           na.action = c("na.omit", "na.impute"),
           outcome = c("train", "test"),
           proximity = FALSE,
           var.used = c(FALSE, "all.trees", "by.tree"),
           split.depth = c(FALSE, "all.trees", "by.tree"),
           seed = NULL,
           do.trace = FALSE,
           membership = FALSE,
           statistics = FALSE,
           ...)
{
  result.predict <- generic.predict.rfsrc(object,
                                          newdata,
                                          outcome.target = outcome.target,
                                          importance = importance,
                                          na.action = na.action,
                                          outcome = outcome,
                                          proximity = proximity,
                                          var.used = var.used,
                                          split.depth = split.depth,
                                          seed = seed,
                                          do.trace = do.trace,
                                          membership = membership,
                                          statistics = statistics,
                                          ...)
  return(result.predict)
}
