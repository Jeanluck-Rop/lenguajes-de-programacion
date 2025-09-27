{
  module Grammar where
  
  import Token
  import ASA
}

%name parse
%tokentype { Token }
%error { parseError }
  
-- Definimos las reglas de la gramatica y producciones ASA
  
