%
% Implementare in Matlab a articolului "Hybrid Images", aparut in  SIGGRAPH 
% 2006; autori:A.Oliva, A. Torralba, P.G. Schyns. 
% Versiune initiala Derek Hoiem + James Hays
% 
%% Setup
% citim cele doua imagini si le convertim in format single
% img1  - furnizeaza frecventele joase - continutul
% img2  - furnizeaza frecevntale inalte - detaliul
close all;
img1 = im2single(imread('../data/marilyn.bmp'));
img2 = im2single(imread('../data/einstein.bmp'));
% perechile de imagini sunt:
% marilyn - einstein
% dog - cat
% bird - plane
% fish - submarine
% motorcycle - bicycle
%
%% Filtrare si constructia imaginii hibrid
%
%setam parametri conform articolului 
cutoff_frequency = 7; %aceasta este deviatia standard, in pixeli, folosita
%pentru a elimina frecventele inalte din prima imagine si frecventele joase 
%din a doua imagine; valoarea acestui parametru poate varia pentru diferite
%perechi de imagini

%cream filtrul
f = fspecial('Gaussian', cutoff_frequency*4+1, cutoff_frequency);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eliminam frecventele inalte din img1 prin a "blura" imaginea. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Completati codul aici
frecvente_joase = ...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eliminam frecventele joase din img2. Cea mai simpla cale este de a 
% scadea din imaginea initiala img2  o versiunea "blurata" a imaginii img2. 
% Obtinem o imagine centrata la 0 cu valori negative.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Completati codul aici
frecvente_inalte = ...

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Combinam frecventele joase din prima imagine cu frecventele inalte din a 
% doua imagine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Completati codul aici
img_hibrid = ...

%% Visualizarea imaginii hibrid
figure; imshow(frecvente_joase)
figure; imshow(frecvente_inalte + 0.5);
vis = vizualizare_imagini_hibrid(img_hibrid);
figure; imshow(vis);
imwrite(frecvente_joase, 'frecvente_joase.jpg', 'quality', 95);
imwrite(frecvente_inalte + 0.5, 'frecvente_inalte.jpg', 'quality', 95);
imwrite(img_hibrid, 'imagine_hibrid.jpg', 'quality', 95);
imwrite(vis, 'imagine_hibrid_scales.jpg', 'quality', 95);