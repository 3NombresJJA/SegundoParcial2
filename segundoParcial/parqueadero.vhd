library ieee;
use ieee.std_logic_1164.all;
entity parqueadero is
	port(
		Clock, Reset: in std_logic;
		FRONT_SENSOR, BACK_SENSOR, contra: in std_logic;
		LED_R, LED_V: out std_logic);
end parqueadero;
architecture arq of parqueadero is
	type estados is (inicio, primero, segundo, tercero, aprovado, ingreso);
	signal ant_state, next_state : estados;
begin
secuencial : process (Reset, Clock)
	begin
		if Reset = '1' then
			ant_state <= inicio;
		elsif rising_edge(Clock) then 
			ant_state <= next_state;
		end if;
	end process secuencial;
combinacional : process (ant_state, FRONT_SENSOR, BACK_SENSOR, contra)
begin	
	case (ant_state) is 
	when inicio =>
	if (contra = '0') and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then 
		next_state <= primero;
	else
		next_state <= inicio;
	end if;
	when primero =>
	if (contra='0')and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		next_state <= segundo;
	elsif 
	(contra='1') and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		next_state <= aprovado;
	else
		next_state <= primero;
	end if;
	when segundo =>
	if (contra='0') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then 
		next_state <= tercero;
	elsif 
	(contra='1') and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		next_state <= aprovado;
	else 
		next_state <= segundo ;
	end if;
	when tercero =>
	if (contra='0') and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		next_state <= inicio ;
	elsif 
	(contra='1') and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		next_state <= aprovado;
	else
		next_state <= aprovado ;
	end if;
	when aprovado =>
	if (contra='1') and(FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then 
		next_state <= aprovado;
	else
		next_state <= ingreso;
	end if;
	when ingreso =>
	if (contra='1') and (FRONT_SENSOR = '0') and (BACK_SENSOR = '0') then
		next_state <= inicio;
	else 
		next_state <= ingreso ;
	end if;
	when others => next_state <= inicio;
	end case;
end process;
salida : process (ant_state, FRONT_SENSOR, BACK_SENSOR)
begin 
	case (ant_state) is 
	when inicio =>
	if (contra='0') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then 
		LED_V <= '0'; LED_R <= '1';
	else
		LED_V <= '0'; LED_R <= '0';
	end if;
		when primero =>
	if (contra='0') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		LED_V <= '0'; LED_R <= '1';
	elsif 
	(contra='1') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		LED_V <= '1'; LED_R <= '0';
	else
		LED_V <= '0'; LED_R <= '1';
	end if;
	when segundo =>
	if (contra='0') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then 
		LED_V <= '0'; LED_R <= '1';
	elsif 
	(contra='1') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		LED_V <= '1'; LED_R <= '0';
	else 
		LED_V <= '0'; LED_R <= '1';
	end if;
	when tercero =>
	if (contra='0') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		LED_V <= '0'; LED_R <= '1';
	elsif 
	(contra='1') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then
		LED_V <= '1'; LED_R <= '0';
	else
		LED_V <= '0'; LED_R <= '1';
	end if;
	when aprovado =>
	if(contra='1') and (FRONT_SENSOR = '1') and (BACK_SENSOR = '0') then 
		LED_V <= '1'; LED_R <= '0';
	else
		LED_V <= '0'; LED_R <= '0';
	end if;
	when ingreso =>
	if (contra='1') and (FRONT_SENSOR = '0') and (BACK_SENSOR = '0') then
		LED_V <= '1'; LED_R <= '0';
	else 
		LED_V <= '1'; LED_R <= '0';
	end if;
	when others => LED_V <= '0'; LED_R <= '1';
	end case;
end process;
end arq;