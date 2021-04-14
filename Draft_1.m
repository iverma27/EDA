clc; clear;

fprintf('Welcome to the eczema detection program! \n');
fprintf('This program will help you determine what type of eczema or skin condition you may have. \n');
fprintf('Answer the following questions with the CAPITAL letter ''Y'' (for yes) or ''N'' (for no). \n');
fprintf('At the end, we will tell you what type of eczema you most likely have and offer suggestions for treatment. \n')

fprintf('---------------------------------------------------------------------------------------------------------- \n');

%Need to add: 
%explaination for each
%Mayble multiple images per disease
%possible other diagnosis (i wrote alternates on "EDA Project" google doc. 
%Also consider adding ringworm, psoriasis, dandruff etc
%Can someone make it so that if they answer something besides "Y" or "N" the code repeats the question....

neuro = imread('Neuro.jpg');
stasis = imread('stasis.jpg');
atopic = imread('atopic.jpg');
contact = imread('contact.jpg');
seb = imread('seb.jpg');
dys = imread('dys.jpg');
num= imread('num.jpg');

count = 0;
A = input('Do you have bumps?: ', 's');
if A== 'Y'
    B = input('Are they in a coin shape?: ','s');
    if B== 'Y'
        fprintf('Nummular/Discoid Dermatitis')
        imshow(num)
        count = 1;
    else
        C = input('Are the bumps filled with fluid or look like a cluster of blisters?: ','s');
        if C== 'Y'
            fprintf('Dys, possibly contact');
            imshow(dys)
            count = 1;
        end
    end
end

if count~=1
    fprintf(' Section 2 ----------------------------------------------------------------------------------------------- \n')
    
    D = input('Does your skin come off in flakes?: ','s');
    if D=='Y'
        E = input('Are the flakes greasy and white/yellow/gray?: ','s');
        if E == 'Y'
            fprintf('Sebhorreic');
            imshow(seb)
            count =1;
        end
    end
    
end

if count ~=1
    fprintf('Section 3 ----------------------------------------------------------------------------------------------- \n')
    
    F= input('Is the affected skin very thick?: ','s');
    if F == 'Y'
        G = input('Is the affected area on your lower legs and/or feet?: ','s');
        if G == 'Y'
            H = input('Is the affected area swollen and/or do you feel heaviness after standing for a long period of time?','s');
            if H== 'Y'
                fprintf('Stasis');
                imshow(stasis)
                count = 1;
            end
        else
            figure(2)
            subplot(141)
            imshow(stasis)
            title('AA')
            
            hold on;

            subplot(142)
            imshow(neuro)
            title('BB');
            
            hold on;

            subplot(143)
            imshow(atopic)
            title('CC')
            
            hold on;

            subplot(144)
            imshow(contact)
            title('DD')
            
            hold off;
               
                I= input('Which image is most similar to your skin condition? (Enter the capital letters): ', 's');
                
                if I == 'AA'
                    figure(3)
                    imshow(stasis)
                    fprintf('stasis');
                    count = 1;
                elseif I == 'BB'
                    figure(4)
                    fprintf('neuro');
                    imshow(neuro)
                    count = 1;
                end 
        end
    end
    
end

if count ~= 1
    fprintf('Section 4 ----------------------------------------------------------------------------------------------- \n')
    fprintf('Did you recently come into contact with something that you don''t usually touch? \n');
    J = input('(for example, did you use a new soap, cosmetic product, detergent, or touch metal such as nickel?: ','s');
    
    if J == 'Y'
        fprintf('Contact');
        imshow(contact)
        count =1;
    else
        fprintf('Atopic');
        imshow(atopic)
        count= 1;
    end
    
end







