GettingCleaningData_PeerAssignment
==================================

Peer assignment for the Getting And Cleaning Data course on Coursera.org from JHU, taught by Jeff Leek, PhD, Brian Caffo, PhD, Roger D. Peng, PhD.

This script is to processing the Human Activity Recognition data set from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The files are organized in the following way:
```
.
|-- CodeBook.md
|-- LICENSE
|-- run_analysis.R
|-- HumanActivityRecognitionDataset
|   |-- README.txt
|   |-- activity_labels.txt
|   |-- features.txt
|   |-- features_info.txt
|   |-- test
|   |   |-- Inertial\ Signals
|   |   |   |-- body_acc_x_test.txt
|   |   |   |-- body_acc_y_test.txt
|   |   |   |-- body_acc_z_test.txt
|   |   |   |-- body_gyro_x_test.txt
|   |   |   |-- body_gyro_y_test.txt
|   |   |   |-- body_gyro_z_test.txt
|   |   |   |-- total_acc_x_test.txt
|   |   |   |-- total_acc_y_test.txt
|   |   |   `-- total_acc_z_test.txt
|   |   |-- X_test.txt
|   |   |-- subject_test.txt
|   |   `-- y_test.txt
|   `-- train
|       |-- Inertial\ Signals
|       |   |-- body_acc_x_train.txt
|       |   |-- body_acc_y_train.txt
|       |   |-- body_acc_z_train.txt
|       |   |-- body_gyro_x_train.txt
|       |   |-- body_gyro_y_train.txt
|       |   |-- body_gyro_z_train.txt
|       |   |-- total_acc_x_train.txt
|       |   |-- total_acc_y_train.txt
|       |   `-- total_acc_z_train.txt
|       |-- X_train.txt
|       |-- subject_train.txt
`-------`-- y_train.txt
```

run_analysis.R is the main file in which all the processing scripts are included.
CodeBook.md is a MarkDown file to give a better explaination of the processing procedure.
Note HumanActivityRecognitionDataset folder is NOT included in this repository and is supposed to be downloaded from the address above and unzipped.
