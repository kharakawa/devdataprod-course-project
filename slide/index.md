---
title       : Wine Classification Demo
subtitle    : 
author      : kharakawa
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## UCI Wine Dataset

https://archive.ics.uci.edu/ml/datasets/Wine

<span style="font-size:2em;">''</span> The wine dataset contains the results of a chemical analysis of wines grown in  specific area of Italy. Three types of wine are represented in the 178 samples, with the results of 13 chemical analyses recorded for each sample. The Type variable has been transformed into a categoric variable. 


```r
library(rattle); data(wine)
names(wine)
```

```
##  [1] "Type"            "Alcohol"         "Malic"          
##  [4] "Ash"             "Alcalinity"      "Magnesium"      
##  [7] "Phenols"         "Flavanoids"      "Nonflavanoids"  
## [10] "Proanthocyanins" "Color"           "Hue"            
## [13] "Dilution"        "Proline"
```

---

## UCI Wine Dataset

| Column | Description |
|:-:|:-:|
| Type | The type of wine, into one of three classes, 1 (59 obs), 2(71 obs), and 3 (48 obs). |
| Alcohol | Alcohol |
| Malic | Malic acid |
| Ash | Ash |
| Alcalinity | Alcalinity of ash |
| Magnesium | Magnesium |
| Phenols | Total phenols |
| Flavanoids | Flavanoids |
| Nonflavanoids | Nonflavanoid phenols |
| Proanthocyanins | Proanthocyanins |
| Color | Color intensity |
| Hue | Hue |
| Dilution | D280/OD315 of diluted wines |
| Proline | Proline |

---

## Classification Models

* Naive Bayes
 * http://en.wikipedia.org/wiki/Naive_Bayes_classifier
 * Implemented as naiveBayes function in [e1071](http://cran.r-project.org/web/packages/e1071/index.html) package
* Random Forest
 * http://en.wikipedia.org/wiki/Random_forest
 * Implemented in [randomForest](http://cran.r-project.org/web/packages/randomForest/index.html) package
* Classification and Regression Tree (CART)
 * http://en.wikipedia.org/wiki/Classification_and_regression_tree
 * Implemented in [tree](http://cran.r-project.org/web/packages/tree/index.html) package

---

## Try the Demo

http://kharakawa.shinyapps.io/devdataprod-cp/

* This shiny application demonstrates three clasiffication models on the wine dataset
* You can select:
 * Arbitrary two predictors (X and Y) out of 13
 * One out of three classification models
* Then the application builds a classification model by using the specified predictors and the algorithm, producing:
 * Two scatter plots, one is the actual wine types, the other is the predicted types
 * Model's miss classification rate of training data
