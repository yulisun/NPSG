
if strcmp(dataset,'Italy') == 1
    image_t1 = imread('Italy_1.bmp');
    image_t1 = rgb2gray(image_t1);
    image_t2 = imread('Italy_2.bmp');
    gt = imread('Italy_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'optical';
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
    image_t1 = double(image_t1);
    image_t2 = double(image_t2);
    image_t1 = (image_t1 - min(image_t1(:)))./(max(image_t1(:))-min(image_t1(:)));
    image_t2 = (image_t2 - min(image_t2(:)))./(max(image_t2(:))-min(image_t2(:)));
elseif strcmp(dataset,'shuguang') == 1
    image_t1 = imread('shuguang_1.bmp');
    image_t1 = rgb2gray(image_t1);
    image_t2 = imread('shuguang_2.bmp');
    gt = imread('shuguang_gt.bmp');
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'sar';
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
    image_t1 = double(image_t1);
    image_t2 = double(image_t2);
    image_t1(abs(image_t1)<=0) = min(image_t1(abs(image_t1)>0));
    image_t1 = log(image_t1+1);
    image_t1 = (image_t1 - min(image_t1(:)))./(max(image_t1(:))-min(image_t1(:)));
    image_t2 = (image_t2 - min(image_t2(:)))./(max(image_t2(:))-min(image_t2(:)));
elseif strcmp(dataset,'wuhan') == 1
    image_t1 = imread('wuhan_1.bmp');
    image_t1 = rgb2gray(image_t1);
    image_t2 = imread('wuhan_2.bmp');
    gt = imread('wuhan_gt.bmp');
    opt.type_t1 = 'sar';
    opt.type_t2 = 'optical';
    Ref_gt = gt(:,:,1);
    figure;
    subplot(131);imshow(image_t1,[]);title('imaget1')
    subplot(132);imshow(image_t2,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
    image_t1 = double(image_t1);
    image_t2 = double(image_t2);
    image_t1(abs(image_t1)<=0) = min(image_t1(abs(image_t1)>0));
    image_t1 = log(image_t1+1);
    image_t1 = (image_t1 - min(image_t1(:)))./(max(image_t1(:))-min(image_t1(:)));
    image_t2 = (image_t2 - min(image_t2(:)))./(max(image_t2(:))-min(image_t2(:)));
elseif strcmp(dataset,'California') == 1
    load('California.mat')
    Ref_gt = gt(:,:,1);
    opt.type_t1 = 'optical';% the SAR image have been Log transformed
    opt.type_t2 = 'optical';
    figure;
    subplot(131);imshow(image_t1,[-1 1]);title('imaget1')
    subplot(132);imshow(image_t2(:,:,[4 3 2])+1,[]);title('imaget2')
    subplot(133);imshow(Ref_gt,[]);title('Refgt')
    image_t1 = (image_t1 - min(image_t1(:)))./(max(image_t1(:))-min(image_t1(:)));
    image_t2 = (image_t2 - min(image_t2(:)))./(max(image_t2(:))-min(image_t2(:)));
elseif strcmp(dataset,'California') == 1
     load('Cross-sensor-Bastrop-data.mat')
     opt.type_t1 = 'optical';
     opt.type_t2 = 'optical'; 
     t = 96;
     brightnessScaling_t1_L5 = max(t1_L5(:)) / double(prctile(t1_L5(:), t));
     brightnessScaling_t2_ALI = max(t2_ALI(:)) / double(prctile(t2_ALI(:), t));
     figure;subplot(131);imshow(2*t1_L5(:,:,[4 3 2]),[])
     subplot(132);imshow(2*t2_L5(:,:,[4 3 2]),[])
     subplot(133);imshow(ROI_1,[])
     image_t1 = double(t1_L5);
     image_t2 = double(t2_ALI);
     gt = double(ROI_1);
     Ref_gt = gt(:,:,1);
     image_t1 = (image_t1 - min(image_t1(:)))./(max(image_t1(:))-min(image_t1(:)));
     image_t2 = (image_t2 - min(image_t2(:)))./(max(image_t2(:))-min(image_t2(:)));
end


  
        
    