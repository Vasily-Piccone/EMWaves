function [l, d] = shorted_stub_design(zL, beta)
    % 1) Calculate normalized load admittance yl
    y_l = 1/zL;
    
    % 2) Calculate negative Reflection coefficient
    nGammaL = (y_l-1)/(y_l+1);
    
    % 3) Calculate angle of reflection coefficient (in degrees)
    psi = angle(nGammaL)*180/pi;
    
    
    % 4) Calculate psi' - > Must minimize psi - psi'
    psi_p1 = acos(abs(nGammaL))*180/pi;
    psi_p2 = -psi_p1
   
    % 4b) Must minimize psi - psi'
    if (psi - psi_p1) < (psi - psi_p2)
        psi_p = psi_p1;
    else 
        psi_p = psi_p2;
        
    % we calculate d:
    d = (psi - psi_p)/(2*beta);
        
    % To solve for l, we must first solve for phi:
    % Using the formulas provided in the handout:
    nGammaA = abs(nGammaL)*exp(j*phi_p);
    yA = (1+nGammaA)/(1-nGammaA);
    bA = imag(yA);
    nGammaS_p = ((-j*bA)-1)/((-j*bA)+1);
    
    phi = acosd(Re(nGammaS_p))
    phi2 = asind(Imag(nGammaS_p))
    
    l = -phi/(2*beta);
      
    end

    z=0.7-j*0.95
    b=2*pi
    
    [l1, d1] = shorted_stub_design(z,b)

