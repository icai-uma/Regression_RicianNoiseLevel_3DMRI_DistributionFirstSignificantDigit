
%clear
clear;
clc;

%Variables
noiselevels = 20;
path_noiseless = 'Paths\path_noiseless\fastMRI_brain_DICOM_Axial_T1_SE.xlsx'; %paths_12HLN_T1Volume_ordered %paths_21MMRR_T1Volume_ordered %paths_22NKI-RS_T1Volume_ordered %paths_20NKI-TRT_T1Volume_ordered %paths_20OASIS_T1Volume_ordered
path_noise = 'Paths\path_noise\paths_noiseImages_Axial_T1_SE.xlsx'; %paths_noiseImages_12HLN %paths_noiseImages_MMRR-21_volumes %paths_noiseImages_NKI-RS-22_volumes %paths_noiseImages_NKI-TRT-20_volumes %paths_noiseImages_OASIS-TRT-20_volumes
outputFileName = 'SigmaValues\NoiseSigma_Axial_T1_SE.xlsx'; %NoiseSigma_12HLN %NoiseSigma_21MMRR %NoiseSigma_20OASIS-TRT

%Load paths files
T1 = readtable(path_noiseless);
T2 = readtable(path_noise);

%Noseless images
table1_size = size(T1) ;
sizeDataset = table1_size(1); 

%Noises images
table2_size = size(T2) ;
sizeNoisesImages = table2_size(1); 

%Variables
sigma_array = zeros(sizeDataset, noiselevels);



%Read noisless t1
for i = 1:1%sizeDataset 
    i
    %Path to noiseless image
    path_noiselessImage = T1{i,1}{1};
    path_noiselessImage
    %Load the nifti noiseless image
    noiseless_t1 = niftiread(path_noiselessImage);
    noiseless_t1_single =  single(noiseless_t1);
    %Calculate IQR
    iqr_t1 = iqr(noiseless_t1_single(noiseless_t1_single ~= 0));
    iqr_t1
    %For each noise value
    for j = 1:1%noiselevels
        j
        %Path to noise image
        rowLevel = noiselevels *(i-1);
        row = rowLevel + j;
        path_noiseImage = T2{row,1}{1};
        path_noiseImage
        %Load the nifti noiseless image
        noise_t1 = niftiread(path_noiseImage);
        %Call to riceVST_sigmaEst to calculate the sigma value. Divide by
        %IQR value
        sigma = riceVST_sigmaEst(noise_t1)/iqr_t1
        %Save sigma value in a matrix
        sigma_array(i, j) = sigma;
    end    
end 

%Save all sigma values in a excel file
writematrix(sigma_array, outputFileName)




