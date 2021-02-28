function [l, d] = shorted_stub_design(zL, beta)
    % 1) Calculate normalized load admittance yl
    y_l = 1/zL;
    
    % 2) Calculate negative Reflection coefficient
    nGammaL = (y_l-1)/(y_l+1);
    
    % 3) Calculate angle of reflection coefficient (in degrees)
    psi = mod(angle(nGammaL), 2*pi);
   % psi_p = mod(angle(-1*nGammaL), 2*pi);
    
    
    % 4) Calculate psi' - > Must minimize psi - psi'
    psi_p1 = mod(acos(abs(nGammaL)), 2*pi);
    psi_p2 = mod(-psi_p1, 2*pi);
   
    % 4b) Must minimize psi - psi'
    if (psi - psi_p1) < (psi - psi_p2)
        psi_p = psi_p1;
    else 
        psi_p = psi_p2;
    end
    
    % we calculate d:
    d = (psi - psi_p)/(2*beta);
        
    % To solve for l, we must first solve for phi:
    % Using the formulas provided in the handout:
    nGammaA = abs(nGammaL)*exp(j*psi_p);
    yA = (1+nGammaA)/(1-nGammaA);
    bA = imag(yA);
    nGammaS_p = ((-j*bA)-1)/((-j*bA)+1);
    l = mod(angle(1/nGammaS_p),2*pi)/(2*beta);
      
    end

