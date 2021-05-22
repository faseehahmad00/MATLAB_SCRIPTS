img = rgb2gray(imread('images/lena.jpg'));
canvas = imrotate(img,60);
imshowpair(img, canvas, 'montage');


[movedPT, fixedPT] = cpselect(img, canvas, 'wait', true);
movedPT = cpcorr(movedPT, fixedPT, canvas, img);
tform = cp2tform(movedPT, fixedPT, 'similarity');
RegCanvas = imtransform(canvas, fliptform(tform));
imshowpair(img, RegCanvas, 'montage');

% angle = 45;
% tx = 10; 
% ty = 20;
% [R, C] = size(img);
% 
% % rotation Matrix
% rot = [cosd(angle), sind(angle), 1; -sind(angle), cosd(angle), 1; 0, 0, 1];
% 
% % Image Points
% nodes = [0, 0; 0, C; R, 0; R, C]';
% mapped_nodes = round(mtimes(rot(1:2, 1:2), nodes)');
% 
% offsetx = abs(min(mapped_nodes(:, 1)));
% offsety = abs(min(mapped_nodes(:, 2)));
% 
% % projection of transformed image on actual image
% mapped_nodes(:, 1) = mapped_nodes(:, 1) + offsetx; 
% mapped_nodes(:, 2) = mapped_nodes(:, 2) + offsety; 
% canvas = zeros(max(mapped_nodes(:, 1)), max(mapped_nodes(:, 2)));
% [newR, newC] = size(canvas);
% 
% for i = 1:newR
%     for j = 1:newC
%         point = round(mtimes(inv(rot), [i - offsetx; j - offsety; 1]));
%         if(point(1) >= 1 && point(1) <= R && point(2) >= 1 && point(2) <= C)
%             canvas(i, j) = img(point(1), point(2));
%         end
%     end
% end
% canvas = uint8(canvas);
% imshow(canvas);