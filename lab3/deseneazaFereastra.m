function deseneazaFereastra(img,fereastra,culoare)

if nargin <3
    culoare = 'red';
end

figure, imshow(img);
for idx = 1:size(fereastra,1)
    ymin = fereastra(idx,1);
    ymax = fereastra(idx,3);
    xmin = fereastra(idx,2);
    xmax = fereastra(idx,4);
    line([xmin xmin], [ymin ymax],'color',culoare,'linewidth',3);
    line([xmax xmax], [ymin ymax],'color',culoare,'linewidth',3);
    line([xmin xmax], [ymin ymin],'color',culoare,'linewidth',3);
    line([xmin xmax], [ymax ymax],'color',culoare,'linewidth',3);
end
    
    
    
    
