# Regression_RicianNoiseLevel_3DMRI_DistributionFirstSignificantDigit

This repository contains the source code of the paper Regression of the Rician Noise Level in 3D Magnetic Resonance Images from the Distribution of the First Significant Digit (URL doi paper XXXXXX).

This code executes the method mentioned in the paper for a set of input images. The contents of this code are provided without any warranty. They are intended for evaluation purposes only.

Pre-requisites
The system operated on Ubuntu 20.04 and utilized Python 3.8, 237 along with various scientific libraries matplotlib, nibabel, scipy, and sklearn.

Set up
Open GenerateTrainingDataBenfordMRI.ipynb, Open CrossValidatedModelTrainingBenfordMRI.ipynb, and FiguresForPaper.ipynb.
Paths are prepared to work on any computer.
Parameter values are assigned by default. But some parameters' values can be modified. Read any .ipynb file.

1.- GenerateTrainingDataBenfordMRI.ipynb you must choose:
	- repository: the name of the MRI dataset	
	- directory : the directory where the MRI is located	
	Run GenerateTrainingDataBenfordMRI.ipynb	
	
2.- CrossValidatedModelTrainingBenfordMRI.ipynb you must choose:
	- repository: the name of the MRI dataset	
	Run CrossValidatedModelTrainingBenfordMRI.ipynb

3.- FiguresForPaper.ipynb you must choose:
	- dataset_path: refer a pkl file, created by GenerateTrainingDataBenfordMRI.ipynb
	- result_path: a folder where save the pdf output file.
	- NdxSet: a integer, refering the couple of metrics. The value of NdxSet is in the table in the .doc file.
	- predictedValuesOfBestModel: refer the best model, its mean, the values to do the figure. The values of predictedValuesOfBestModel is in the table in the .doc file.
	Run FiguresForPaper.ipynb 

Create '../input/input_to_do_score' folder. Copy and paste inside in all CrossValidationResults.xls files, only the columns to do the score:  metrics column and regressors columns, sort by best regressor.

4.- Score_table_score.ipynb you must choose:
	- sheet_name variable.
	- The element in newList variable.
	Run Score_table_score.ipynb three times, one by each sheet_name varuable: MSE, MAE and R2.

5.- Score_table_performanceMeasure.ipynb you must choose:
	- Define the path to CrossValidationResults.xls files in #Read dataset paragraph.
	- Define mse_data, the score of metrics dataset file.
	Run Score_table_performanceMeasure.ipynb tree times, one by performance measure: MSE, MAE and R2

6.- Score_table_sum_performanceMeasure.ipynb
	- mse, mae and r2 path. Read dataset
	- Run Score_table_sum_performanceMeasure.ipynb
	

To compare the model with VST model, follow the following steps for each dataset:
Run AddingNoiseTo3DMRI.ipynb
Run CreateFilePath.ipynb

Run VST model:
sigmaValues.m

Then run in python:
PerformanceMeasure.ipynb

To do an stimation of the SNR:
Run EstimateSignalToNoiseRatioMRI.ipynb with one dataset.


Citation
Please, cite this work as: XXXXXX
