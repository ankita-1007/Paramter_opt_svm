# Paramter Optimization of SVM

Selected dataset is Dry Bean dataset download from <a href="https://archive.ics.uci.edu/ml/datasets.php?format=&task=cla&att=num&area=&numAtt=greater100&numIns=greater1000&type=&sort=nameUp&view=list" target="_blank">UCI library</a> . 
## About the dataset
Images of 13,611 grains of 7 different registered dry beans were taken with a high-resolution camera.Seven different types of dry beans were used in this research, taking into account the features such as form, shape, type, and structure by the market situation.

# Basic Data Analytics
Some basic Analysis is done on the dataset.
## 1. Datatypes of every column of the dataset: 
The datatypes of attributes is examined and is plotted to depict the variations among columns based on datatypes. <br>
Here 0.5 means that data is numerical and 0 means it is categorical data. <br>
<img src="https://user-images.githubusercontent.com/100415671/233077815-66f89574-2e28-464e-943f-c145dec42edb.png" width="500">



## 2. Percentage of every class present in dataset: 
The distribution of seven classes present in the dataset can be analysed by viewing their percentage in the data. <br>
<img src="https://user-images.githubusercontent.com/100415671/233079152-23a06738-f603-4fd1-ae64-c9be3c867ec7.png" width="500">

## 3. Relationship between roundness and area with the classes(types of beans): 
Analysing the relationship by plotting graphs as it helps to analyse better through visual representation. <br>
<img src="https://user-images.githubusercontent.com/100415671/233080110-9b83214a-5ec5-47c3-9def-8a17ca38a2c6.png" width="400"> <img src="https://user-images.githubusercontent.com/100415671/233080132-d8913eb0-dc6e-488e-a206-39ca01043b6a.png" width="550">

## 4. Correlation between attributes of the data:
Analysing correlations and then removing the columns which are highly correlated with another. <br>
<img src="https://user-images.githubusercontent.com/100415671/233081294-9db62d29-8946-4f47-8724-863591641a10.png" width="600">

## 5. Mean values of ShapeFactor1 and ShapeFactor2 of various classes:
Visualizing how does shapefactors determine class. DERMASON has highest average value of Shapefactor1 and BOMBAY the least. <br>
<img src="https://user-images.githubusercontent.com/100415671/233087959-e88a362c-2392-4d8a-90d5-edb01dabce81.png" width="500">


# SVM Optimisation
1. In Support Vector Machines (SVM), there are three parameters to consider: kernel, Nu, and Epsilon. To achieve the highest accuracy, we will optimize these parameters using randomization techniques. <br>
2. To evaluate the performance of our algorithm, we will first take 10 samples from our dataset and split each into a training set and a test set.
3. Next, we will apply our algorithm to each sample for 1000 iterations and record the best accuracy, kernel, and Nu in a table for each sample. 
4. Finally, we will create a graph that plots accuracy versus iterations for the sample that achieved the highest accuracy.

## The resulting table for the selected dataset: 
<img src="https://user-images.githubusercontent.com/100415671/233085051-2b1e41b3-c079-40c8-b70c-868a3877e764.png" width="500"> <br>

Here as you can see Sample 3rd has the highest accuracy, so we will be plotting a graph for sample 3. <br>

# Graph: 
<img src="https://user-images.githubusercontent.com/100415671/233085937-80e4e16d-cc1d-4e27-8d3d-ed69d1a5cb71.png" width="650" height="600">













