%citeste imaginea
img1 = imread('img1.jpg');
figure, imshow(img1);
%incarca detectiile - detector fete + detector placute inmatriculare
temp = load('img1_detectii.mat');
detectii = temp.D;
img1_blur = blureazaImagine(img1,detectii);%scrieti aceasta functie
figure, imshow(img1_blur);

%prelucreaza toate imaginile
numeImagini = {'img1','img2','img3','img4'};
for idx = 1:length(numeImagini)
    %citeste imaginea curenta
    img = imread([numeImagini{idx} '.jpg']);
    %incarca detectiile
    temp = load([numeImagini{idx} '_detectii.mat']);
    D = temp.D;%D - matricea de detectii
    %obtine imaginea blurata
    imgBlurata = blurImagine(img,D);
    %afiseaza
    figure,
    subplot(1,2,1);imshow(img);title('imagine initiala')
    subplot(1,2,2);imshow(imgBlurata);title('imagine blurata')
    pause
    clear temp;
end