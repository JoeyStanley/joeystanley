---
layout: aside
title: Datasets
---

Datasets
========

Below you will find some datasets I use for various workshops. They are all either my own data (so like, based on my voice or behavior) or are publicly available.

## Cereal ([.csv](/data/cereal.csv) or [.txt](/data/cereal.txt).)

A dataset of containing a bunch of information about 80 different kinds of breakfast cereal. I use this in some of my ggplot2 workshops. I got the dataset from the the one that [Chris Crawford](https://www.kaggle.com/crawford) at [Kaggle.com](https://www.kaggle.com/crawford/80-cereals) has made available but I've removed some of the columns to make it more manageable for a workshop. In his words, "If you like to eat cereal, do yourself a favor and avoid this dataset at all costs. After seeing these data it will never be the same for me to eat Fruity Pebbles again."

## [Joey's Vowels](/data/joey.csv)

This dataset from me reading about 300 sentences at home in my kitchen. I had it automatically transcribed, force-aligned, and formant-extracted using [DARLA](http://darla.dartmouth.edu) and I took zero effort to clean it up so it's a little messy. Because DARLA utilizes FAVE for formant extraction, all the typical FAVE columns are there. This dataset is the one I use in a lot of my tutorials.

## [McDonald's Menu Items](/data/menu.csv)

A dataset of each menu item at McDonald's. I use this in some of my ggplot2 workshops. The full dataset, with many more columns than what I have provided here, is available on [Kaggle.com](https://www.kaggle.com/mcdonalds/nutrition-facts), which was ultimately scraped from the McDonald's website. I've trimmed it down a little bit for the purposes of the workshop.

## Olympic Games ([athletes](/data/athletes.csv), [events](/data/events.csv), [years](/data/years.csv))

This is data about the atheletes, events, from the Olympic games. The dataset was downloaded from [Kaggle.com](https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results), which was made available thanks to user [Randi Griffin](https://www.kaggle.com/heesoo37). I use this in my tidyverse workshops to illustrate joining different datasetes. 

## [Sample Audio](/data/sample_audio.zip)

This is a collection of recordings from two projects I've done. The ones labeled Carol, Daniel, Kathleen, Doug, and Margaret are roughly one-minute clips from interviews I did in Washington and contain first-hand accounts of Mount St. Helens. Stephanie, Jordan, Erica, Julia, Sabrina, Rodney, and Corey are one-sentence recordings collected via Amazon Mechanical Turk from Western American English speakers. There is also one clip of my own voice in there. Each recording comes with a sentence, word, and phoneme-level transcription. These speakers have given consent for me to distribute brief recordings for educational purposes. All names are pseudonyms.

## [Snoozing](/data/snoozing.xlsx)

This is data about when I've woken up every morning for about two years. Just information I downloaded from my iPhone's Health app. I use this in some Tidyverse workshops for simple illustrations of reading in an excel file and doing some data manipulation and joining. 

## [Stranger Things](/data/stranger.csv)

A small dataset with basic information about each episode of *Stranger Things*. I use this in my most recent ggplot2 workshops. I went to IMDb's [data download page](https://www.imdb.com/interfaces/) to actually get it, and did a little bit of prep work to make it ready for the workshop.

## [Top 25 Girl Names in 2017](/data/girlnames.txt)

A small dataset simply listing the top 25 most common baby girl names in 2017 in the US and how many babies were given those names. Created with the help of the `babynames` package which contains data from the Social Security database. This is used in the ggplot2 workshop. Note that this is saved as a tab-delimited file to help practice reading in different file types.

## Vowels ([tall](/data/vowels_tall.csv) and [wide](/data/vowels_wide.csv))

Two very small datasets of sample acoustic measurements. They contain identical information, but one is "tall" and the other is "wide." They're used in my first Tidyverse workshop to illustrate reshaping dataframes.