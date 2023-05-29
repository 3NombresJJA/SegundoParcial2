library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SegundoParcialParte2 is
    Port (
        clk : in std_logic;
        rst : in std_logic;
		 Sigue: in std_logic);
end SegundoParcialParte2;

architecture blanco of SegundoParcialParte2 is
    type state_type is (InicioTiempo, AsignacionTiempo, Salida);
    signal Actual, Siguiente : state_type;


begin
reset : process (clk, Siguiente)
BEGIN
	IF rst = '1' THEN
		Actual <= Iniciotiempo;
	ELSIF clk='1' AND clk'event THEN
		Actual <= Siguiente;
	END IF;
END PROCESS;
logica : proCESS(Actual,Sigue)
   begin
	case Actual is
      when InicioTiempo =>
         if	(Sigue='1') then
            Siguiente <= AsignacionTiempo;
			else 
				siguiente <=inicioTiempo;
			end if;
			
      when AsignacionTiempo =>
         if (Sigue='1') then
            Siguiente <= Salida;
			else
				siguiente <=AsignacionTiempo;
         end if;
			
      when Salida =>
         if (siGue='1') then
            Siguiente <= InicioTiempo;
			else 
				siguiente <=Salida;
         end if;
      end case;
end process;

end blanco;