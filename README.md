# An analysis of vanilla ice cream selling price in Loblaws and Metro

## Overview

This project applies Bayesian statistical modeling to analyze the pricing dynamics of vanilla ice cream across different vendors (Metro and Loblaws) and months (June to November). Using a dataset of historical prices, the analysis explores the effects of seasonal trends, vendor differences, and prior pricing on current prices. The project demonstrates how to implement and interpret Bayesian modeling results in R, providing insights into price fluctuations and influencing factors.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from https://jacobfilipp.com/hammer/. You should download it and put it into 01-raw_data in the data folder before running the R program.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT and the entire chat history is available in inputs/llms/usage.txt.

