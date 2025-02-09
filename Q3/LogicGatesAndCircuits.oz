functor
export
   notg:NotG
   andg:AndG
   org:OrG
   nandg:NandG
   norg:NorG
   xorg:XorG
   fulladder:FullAdder
   paritychecker:ParityChecker
define
   % Porta NOT
   fun {NotG Xs}
      local
         fun {Loop Xs}
            case Xs of 
               X|Xr then (1 - X) | {Loop Xr} 
            [] nil then nil
            else nil
            end
         end
      in
         {Loop Xs}
      end
   end

   % Porta AND
   fun {AndG Xs Ys}
      local
         fun {Loop Xs Ys}
            case Xs#Ys of 
               (X|Xr)#(Y|Yr) then (X * Y) | {Loop Xr Yr} 
            [] nil#nil then nil
            else nil 
            end
         end
      in
         {Loop Xs Ys}
      end
   end

   % Porta OR
   fun {OrG Xs Ys}
      local
         fun {Loop Xs Ys}
            case Xs#Ys of 
               (X|Xr)#(Y|Yr) then (X + Y - X * Y) | {Loop Xr Yr} 
            [] nil#nil then nil
            else nil  
            end
         end
      in
         {Loop Xs Ys}
      end
   end

   % Porta NAND
   fun {NandG Xs Ys}
      {NotG {AndG Xs Ys}}
   end

   % Porta NOR
   fun {NorG Xs Ys}
      {NotG {OrG Xs Ys}}
   end

   % Porta XOR
   fun {XorG Xs Ys}
      local
         fun {Loop Xs Ys}
            case Xs#Ys of 
               (X|Xr)#(Y|Yr) then (X + Y - 2 * X * Y) | {Loop Xr Yr} 
            [] nil#nil then nil
            else nil  
            end
         end
      in
         {Loop Xs Ys}
      end
   end

   % Full Adder: soma completa de três bits (A, B, Cin)
   proc {FullAdder A B Cin ?Sum ?Cout}
      local
         S1 C1 C2 C3
      in
         S1 = {XorG A B}
         Sum = {XorG S1 Cin}
         C1 = {AndG A B}
         C2 = {AndG B Cin}
         C3 = {AndG A Cin}
         Cout = {OrG {OrG C1 C2} C3}
      end
   end

   % Parity Checker: verifica se o número de bits 1 é par
   proc {ParityChecker A B C ?Parity}
      local
         AB
      in
         AB = {XorG A B}
         Parity = {XorG AB C}
      end
   end
end
