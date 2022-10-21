%%  Nonlocal Patch Similarity based Graph (NPSG) for heterogeneous remote sensing change detection
%{
Code: NPSG - PR 2021
This is a test program for the NPSG. NPSG is based on the image self-similarity. 
The relationship between the target patch and its similar patches can be regarded 
as the structure of this target patch, which is quite well preserved across the different types
of imaging modality, then it can be used to build the relationship between heterogeneous images.

The computational time of NPSG is relatively long, to reduce the
computational complexity, we recommend using a larger opt.delt_s and
opt.delt_p.

Another suggestion is to use the INLPG algorithm we proposed
(https://github.com/yulisun/INLPG) or the IRG-McS algorithm
.(https://github.com/yulisun/IRG-McS).

===================================================

If you use this code for your research, please cite our papers.

@article{sun109nonlocal,
  title={Nonlocal patch similarity based heterogeneous remote sensing change detection},
  author={Sun, Yuli and Lei, Lin and Li, Xiao and Sun, Hao and Kuang, Gangyao},
  journal={Pattern Recognition},
  volume={109},
  pages={107598},
  publisher={Elsevier}
}
===================================================
%}

clc;
clear;
close all
addpath('auxi_funcs')
%% load dataset
addpath('datasets')
dataset = 'shuguang';
% For other datasets, we recommend down sampling the image to make it less than 500 in length and width 
Load_dataset 
fprintf(['\n Data loading is completed...... ' '\n'])
%% Parameter setting
% With different parameter settings, the results will be a little different
opt.p_s = 2;
opt.w_s = 50;
opt.delt_s = 5; 
opt.delt_p = 3; % opt.p_s <= opt.delt_p <= 2 * opt.p_s +1
opt.k = 35;
%% NPSG
[DI_fw, DI_bw] = NPSG_main(image_t1,image_t2,opt);
opt.remove_out = 'off'; 
if strcmp(opt.remove_out,'on') 
    DI_fw = remove_outlier(DI_fw);
    DI_bw = remove_outlier(DI_bw);
end 
%% fuse DI_fw and DI_bw
DI_fusion = fuse_DI(DI_fw,DI_bw,opt);
%% display result
figure;
subplot(131);imshow(DI_fw,[]);title('DIfw')
subplot(132);imshow(DI_bw,[]);title('DIbw')
subplot(133);imshow(DI_fusion,[]);title('DIfusion')

n=500;
[TPR_fw, FPR_fw]= Roc_plot(DI_fw,Ref_gt,n);
[TPR_bw, FPR_bw]= Roc_plot(DI_bw,Ref_gt,n);
[TPR_fusion, FPR_fusion]= Roc_plot(DI_fusion,Ref_gt,n);

figure; plot(FPR_fw,TPR_fw);
hold on ; plot(FPR_bw,TPR_bw);
hold on ; plot(FPR_fusion,TPR_fusion);
legend('fw','bw','fusion')
title('ROC curve')

[AUC_fw, Ddist_fw] = AUC_Diagdistance(TPR_fw, FPR_fw);
[AUC_bw, Ddist_bw] = AUC_Diagdistance(TPR_bw, FPR_bw);
[AUC_fusion, Ddist_fusion] = AUC_Diagdistance(TPR_fusion, FPR_fusion);
fprintf(['\n The AUC and Ddist of forward, backward, and fused DIs are' '\n'])
AUC_diagdis = [AUC_fw AUC_bw AUC_fusion;Ddist_fw Ddist_bw Ddist_fusion]

 
