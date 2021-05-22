the_Video = VideoReader('video/test.mkv');
p = 'dataset/';
k=1;
for i = 1:30:9000
    frame = readFrame(the_Video);
    imwrite(frame,[p k '.jpg']);
    k = k+1;
end