% function Generate_DepthMap()

clear ;clc ;close all;

addpath('./LF_IQM/DepthEstimation(Ch4)');
addpath('.\LF_IQM\DepthEstimation(Ch4)\gco-v3.0\matlab');
addpath('.\LF_IQM\DepthEstimation(Ch4)\gco-v3.0\matlab\bin');

ref_img = './DATA/ref.bmp';
dis_img = './DATA/dis.bmp';

ref_lens    = imread(ref_img);
ref_lf      = permute(reshape(ref_lens,[9, 434, 9, 625, 3]),[1,3,2,4,5]);
dis_lens    = imread(dis_img);
dis_lf      = permute(reshape(dis_lens,[9, 434, 9, 625, 3]),[1,3,2,4,5]);

for row = 1:size(dis_lf,1)
    for col = 1:size(dis_lf,2)
        CurrImg = squeeze(dis_lf(row,col,:,:,:));
        dis_lf(row,col,:,:,:) = im2double(CurrImg);
        
        CurrImg = squeeze(ref_lf(row,col,:,:,:));
        ref_lf(row,col,:,:,:) = im2double(CurrImg);
    end
end

ref_lf = single(ref_lf);
[ref_depthmap] = MAIN(ref_lf);

dis_lf = single(dis_lf);
[dis_depthmap] = MAIN(dis_lf);

ssim_val = ssim(dis_depthmap,ref_depthmap);

load('model_params.mat');
[pred, ~] = nlpredci(@four_parm_logistic,ssim_val,bayta,ehat,J)


