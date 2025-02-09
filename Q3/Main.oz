functor
import
   % necessario trocar o path onde o arquivo LogicGatesAndCircuits.oz
   LogicGatesAndCircuits at 'file:///home/luis/lip/LogicGatesAndCircuits.ozf'
   Browser
define
  
   A = 1 | 0 | 1 | 0 | nil
   B = 0 | 1 | 0 | 1 | nil
   Cin = 0 | 0 | 1 | 1 | nil

   Sum = _
   Cout = _
   Parity = _

   {LogicGatesAndCircuits.fulladder A B Cin Sum Cout}
   {LogicGatesAndCircuits.paritychecker A B Cin Parity}

   {Browser.browse Sum}
   {Browser.browse Cout}
   {Browser.browse Parity}
end

