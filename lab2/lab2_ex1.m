%
% 
% Filtre Gaussiene - elementul din mijloc cel mai mare, restul scad in
% functie de sigma; suma lor = 1
close all;
for fsize = [7 19 31]
    for fsigma = [1 3 5 10]        
        f = fspecial('gaussian', fsize, fsigma);
        figure,
        subplot(2,2,1); mesh(f);title('Vizualizare 3D a filtrului');
        xlabel(['size = ' num2str(fsize) ' sigma =' num2str(fsigma)]);
        subplot(2,2,2);imagesc(f);title('Vizualizare 2D a filtrului');
        imgf = imfilter(img,f);     
        subplot(2,2,3);imshow(img);title('imagine initiala');
        subplot(2,2,4);imshow(imgf);title('imagine obtinuta prin filtrarea cu f');
        pause 
        close(gcf);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cum extrapolam valorile pixelilor din afara imaginii?
%
% Optiuni: 
% 0 - implicit: toti pixelii iau valoarea 0 (culoare neagra),
% 'circular'  - pixelii de la sfarsit de (linie,coloana) se copiaza la inceput de (linie, coloana)
% 'replicate' -  se copiaza pixelul cel mai apropiat
% 'symmetric' -  se copiza in oglinda pixelii cei mai apropiati
%
% Ce dimensiune are imaginea filtrata? 
%
% Optuni:
% 'same' - implicit, aceleasi dimensiuni
% 'full' - se adauga si dimensiunea filtrului

img = imread('rainbow.jpg');
f = fspecial('gaussian', 31, 10);imagesc(f)
imgf = imfilter(img,f);

imgf_1 = imfilter(img, f, 0);figure,imshow(imgf_1)
%sunt imgf si imgf_1 la fel?
isequal(imgf,imgf_1)

imgf_2 = imfilter(img, f, 'circular');figure, imshow(imgf_2);
disp(size(imgf_2));
imgf_2 = imfilter(img, f, 'circular','full');
figure, imshow(imgf_2);
disp(size(imgf_2));

imgf_3 = imfilter(img, f, 'replicate');figure, imshow(imgf_3);
disp(size(imgf_3));
imgf_3 = imfilter(img, f, 'replicate','full');figure, imshow(imgf_3);
disp(size(imgf_3));

imgf_4 = imfilter(img, f, 'symmetric');figure, imshow(imgf_4);
disp(size(imgf_4));
imgf_4 = imfilter(img, f, 'replicate','full');figure, imshow(imgf_4);
disp(size(imgf_4));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%inter-corelatie versus convolutie
%
%pentru filtre "simetrice" nicio diferenta
img = imread('peppers.png');
f = fspecial('gaussian', 31, 10);
imgf = imfilter(img,f);%implicit se realizeaza inter-corelatia
imgf_corr = imfilter(img,f,'corr');
isequal(imgf,imgf_corr)
imgf_conv = imfilter(img,f,'conv');%optiune pentru convolutie
isequal(imgf,imgf_conv)
figure,
subplot(1,3,1);
imshow(img);title('imagine initiala');
subplot(1,3,2);
imshow(imgf_corr);title('inter-corelatie cu f');
subplot(1,3,3);
imshow(imgf_conv);title('convolutie cu f');

%
% pentru filtre "nesimetrice" avem diferente
f = zeros(41,41);
f(21,41) = 1;
imgf_corr = imfilter(img,f);
figure, imshow(imgf_corr);
imgf_conv = imfilter(img,f,'conv');
figure, imshow(imgf_conv);
isequal(imgf_corr,imgf_conv)
figure,
subplot(1,3,1);
imshow(img);title('imagine initiala');
subplot(1,3,2);
imshow(imgf_corr);title('inter-corelatie cu f');
subplot(1,3,3);
imshow(imgf_conv);title('convolutie cu f');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zgomot in imagini
%
% adaugam zgomot "salt and pepper"
I = rgb2gray(img);
J1 = imnoise(I,'salt & pepper', 0.02);
figure, imshow(I), figure, imshow(J1)
% aduagam zgomot mai dens
J2 = imnoise(I,'salt & pepper', 0.10);
figure, imshow(I), figure, imshow(J2)
%
%eliminam zgomotul pentru J1
%filtrul de medie cu diverse dimensiuni
for fsize = [5 10 25]
    f = fspecial('average',fsize);
    imgf = imfilter(J1,f);
    figure, 
    subplot(1,2,1);imshow(J1);title('imagine cu zgomot');
    subplot(1,2,2);imshow(imgf);title('imagine filtrata cu filtru de medie');
    xlabel(['dimensune filtru = ' num2str(fsize)])
    pause;
    close(gcf);
end
%filtru gaussian
for fsize = [7 19 31]
    for fsigma = [1 3 5 10]
        f = fspecial('gaussian', fsize, fsigma);
        imgf = imfilter(J1,f);
        figure,
        subplot(1,2,1);imshow(J1);title('imagine cu zgomot');
        subplot(1,2,2);imshow(imgf);title('imagine filtrata cu filtru Gaussian');
        xlabel(['dimensiune filtru= ' num2str(fsize) ', sigma=' num2str(fsigma)]);
        pause;
        close(gcf)
    end
end


%filtru neliniar - filtrul median
for fsize = [3 5 7 11]
    imgf = medfilt2(J1,[fsize fsize]);
    figure,
    subplot(1,2,1);imshow(J1);title('imagine cu zgomot');
    subplot(1,2,2);imshow(imgf);title('imagine filtrata cu filtru median');
    xlabel(['dimensiune filtru= ' num2str(fsize) ]);
    pause;
    close(gcf)
end

%completati codul Matlab
%eliminati zgomotul pentru J2
