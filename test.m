A = bitart(125, 125, @(x, y)  mod(int8(bitxor(x, y)), 9), 4);
imshow(A);

function img = bitart(R, C, fn, s)
    img = ones(R, C);

    for x=1:R
        for y=1:C
            if fn(x, y)
                img(y, x) = 0;
            end
        end
    end
    
    img = imresize(img, s, 'nearest');
end