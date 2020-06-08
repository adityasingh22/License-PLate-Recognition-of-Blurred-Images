function wiener_filter_noise(img)

Ioriginal = img;
imshow(Ioriginal)
title('Original image')
PSF = fspecial('motion',211,11);
Idouble = im2double(Ioriginal);

% Add blurr to image with no noise
blurred = imfilter(Idouble,PSF,'conv','circular');
figure, imshow(blurred)
title('Blurred image with no noise')
restore_blur=deconvwnr(blurred, PSF);
figure, imshow(restore_blur)
title('Deblurred image')
imwrite(restore_blur, 'G:\License Plate Recognition of Blurred image\Test data\Restore_blur.png');

%Add blurr and Gaussian noise to image
noise_mean=0;
noise_var=0.0001;
blurred_noisy=imnoise(blurred, 'gaussian', noise_mean, noise_var);
figure, imshow(blurred_noisy)
title('Blurred image with Gaussian noise')
signal_var=var(Idouble(:));
NSR=noise_var/signal_var;
restore_gaussian=deconvwnr(blurred_noisy, PSF, NSR);
figure, imshow(restore_gaussian)
title('Deblurred image')
imwrite(restore_gaussian, 'G:\License Plate Recognition of Blurred image\Test data\Restore_gaussian.png');

%Add blurr nad 8-bit quantization noise
blurred_quantizied=imfilter(Ioriginal, PSF, 'conv', 'circular');
figure, imshow(blurred_quantizied)
title('Blurred image with Quantized noise')
uniform_quantization_var=(1/256)^2/12;
NSR=uniform_quantization_var/signal_var;
restore_quantized=deconvwnr(blurred_quantizied, PSF, NSR);
figure, imshow(restore_quantized);
title('Deblurred image')
imwrite(restore_quantized, 'G:\License Plate Recognition of Blurred image\Test data\Restore_quantized.png');

end