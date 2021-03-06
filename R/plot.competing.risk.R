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


plot.competing.risk.rfsrc <- function (x, plots.one.page = FALSE, ...) {
  if (is.null(x)) {
    stop("object x is empty!")
  }
  if (sum(inherits(x, c("rfsrc", "grow"), TRUE) == c(1, 2)) != 2 &
      sum(inherits(x, c("rfsrc", "predict"), TRUE) == c(1, 2)) != 2) {
    stop("This function only works for objects of class `(rfsrc, grow)' or '(rfsrc, predict)'.")
  }
  if (x$family != "surv-CR") {
    stop("this function only supports competing risk settings")
  }
  matPlot <- function(matx, ylab = "", legend = "", pos = 1) {
    m <- dim(cbind(matx))[2]
    if (m > 1) legend <- paste(legend, 1:m, "  ")
    matplot(x$time.interest, matx, xlab = "Time", ylab = ylab, type = "l",
            col = (1:m), lty = 1, lwd = 3)
    legend(c("topright", "bottomright")[pos], legend = legend, col = (1:m), lty = 1, lwd = 3)
  }
  opar <- par(no.readonly = TRUE)
  on.exit(par(opar))
  if (plots.one.page) par(mfrow = c(1,1)) else par(mfrow = c(1,2))
  matPlot(apply(x$chf, c(2, 3), mean, na.rm = TRUE), "CHF", "CSCHF", pos = 2)
  matPlot(100 * apply(x$cif, c(2, 3), mean, na.rm = TRUE), "Probability (%)", "CIF", 2)
}
plot.competing.risk <- plot.competing.risk.rfsrc
