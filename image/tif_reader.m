function im = tif_reader(filename)
% tif_reader(filename)
% load tiff file, support stack

InfoImage=imfinfo(filename);
mImage=InfoImage(1).Width;
nImage=InfoImage(1).Height;
nCh=InfoImage(1).SamplesPerPixel;

NumberImages=length(InfoImage);
im=zeros(nImage, mImage, nCh, NumberImages, 'uint8');

TifLink = Tiff(filename, 'r');
for i=1:NumberImages
   TifLink.setDirectory(i);
   im(:,:,:,i)=TifLink.read();
end
TifLink.close();