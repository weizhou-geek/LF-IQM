function  LF = preprocess_func(input_dir)

% input_dir = '.\LFALL_DIST\ArtGallery2_DepthInterpolation_Skip1';
img_dirs = dir(fullfile(input_dir,'*.png'));
LF = zeros(101,720,960,3);
assert(length(img_dirs)==101,'The Light Field Views are wrong.');
for img_id = 1:length(img_dirs)
    img_fn = fullfile(input_dir,img_dirs(img_id).name);
    LF(img_id,:,:,:) = imread(img_fn);
end
LF = uint8(LF);