imgnames = {'patrat.png','cerc.png','casa.jpg','autostrada.jpg'};

fx = [-1 1];

for i = 1:length(imgnames)
    img = imread(imgnames{i});
    %calculeaza gradient ...
    %detecteaza muchii ...
end

img = imread('autostrada.jpg');
temp = load('ferestreCandidat.mat');
%calculeaza scorul pt fiecare fereastra ...