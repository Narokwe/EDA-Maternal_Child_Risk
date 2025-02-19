---
title: "Maternal Health Risk EDA"
author: "Augustine Narokwe"
date: '`r Sys.Date()`'
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# 1. Installing the required packages 

```{r}
install.packages(c("tidyverse", "ggplot2", "dplyr"))
```

# 2. Loading Installed Libraries

```{r}
library(tidyverse)
library(ggplot2)
library(dplyr)
```

# 3. Loading the dataset

```{r}
data <- read_delim("C:\\Users\\DELL\\Downloads\\Maternal Health Risk Data Set.csv", delim = "\t")
```

# 4. Veiwing the structure of the dataset

```{r}
glimpse(data)
```

# 5. Printing the first few rows of the dataset

```{r}
head(data)
```

# 6. Printing columns names

```{r}
colnames(data)
```

# 7. Exploratory Data Analysis

## 7.1 Summary Statistics

```{r}
summary(data)
```

## 7.2 Checking on the Risk Levels (Categorical)

```{r}
table(data$RiskLevel)
```

## 7.3 Age Distribution

```{r}
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  geom_vline(aes(xintercept = mean(Age)), color = "red", linetype = "dashed") +
  geom_vline(aes(xintercept = median(Age)), color = "blue", linetype = "dashed") +
  labs(title = "Distribution of Maternal Age", x = "Age", y = "Frequency") +
  theme_minimal()
```

## 7.4 SystolicBP Vs. DiastolicBP

```{r}
ggplot(data, aes(x = SystolicBP, y = DiastolicBP, color = RiskLevel)) +
  geom_point(alpha = 0.5) +
  labs(title = "Systolic vs. Diastolic Blood Pressure by Risk Level", x = "Systolic BP", y = "Diastolic BP") +
  theme_minimal()
```

## 7.5 Risk Level Distribution

```{r}
ggplot(data, aes(x = RiskLevel, fill = RiskLevel)) +
  geom_bar() +
  labs(title = "Distribution of Risk Levels", x = "Risk Level", y = "Count") +
  theme_minimal()
```
