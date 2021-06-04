the_Video = VideoReader('../video/test.mkv');
k=1;
for i = 1:15:9180
    frame = read(the_Video,i);
      [r,c] = size(frame);
      cropped = imcrop(frame,[1 15 490 c]);
      imwrite(cropped,[num2str(k) '.jpg']);
      k = k+1;
end