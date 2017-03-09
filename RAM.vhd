library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity RAM is port(
	cs:        	in std_logic;
	wr:        	in std_logic;
	rd:			in std_logic;
	addr:      	in std_logic_vector(15 downto 0); 
	di:        	in std_logic_vector(15 downto 0);
	do:       	out std_logic_vector(15 downto 0));
end RAM;

architecture imp of RAM is

	subtype cell is std_logic_vector(15 downto 0);
	type ram_type is array(0 to 255) of cell; -- 0 to 255
	signal RAM: ram_type :=(
                "XXXXXXXXXXXXXXXX",  --0
                "XXXXXXXXXXXXXXXX",  --1
                "XXXXXXXXXXXXXXXX",  --2
                "XXXXXXXXXXXXXXXX",  --3
                "XXXXXXXXXXXXXXXX",  --4
                "XXXXXXXXXXXXXXXX",  --5
                "XXXXXXXXXXXXXXXX",  --6
                "XXXXXXXXXXXXXXXX",  --7
                "XXXXXXXXXXXXXXXX",  --8
                "XXXXXXXXXXXXXXXX",  --9
                "XXXXXXXXXXXXXXXX",  --10
                "XXXXXXXXXXXXXXXX",  --11
                "XXXXXXXXXXXXXXXX",  --12
                "XXXXXXXXXXXXXXXX",  --13
                "XXXXXXXXXXXXXXXX",  --14
                "XXXXXXXXXXXXXXXX",  --15
                "XXXXXXXXXXXXXXXX",  --16
                "XXXXXXXXXXXXXXXX",  --17
                "XXXXXXXXXXXXXXXX",  --18
                "XXXXXXXXXXXXXXXX",  --19
                "XXXXXXXXXXXXXXXX",  --20
                "XXXXXXXXXXXXXXXX",  --21
                "XXXXXXXXXXXXXXXX",  --22
                "XXXXXXXXXXXXXXXX",  --23
                "XXXXXXXXXXXXXXXX",  --24
                "XXXXXXXXXXXXXXXX",  --25
                "XXXXXXXXXXXXXXXX",  --26
                "XXXXXXXXXXXXXXXX",  --27
                "XXXXXXXXXXXXXXXX",  --28
                "XXXXXXXXXXXXXXXX",  --29
                "XXXXXXXXXXXXXXXX",  --30
                "XXXXXXXXXXXXXXXX",  --31
                "XXXXXXXXXXXXXXXX",  --32
                "XXXXXXXXXXXXXXXX",  --33
                "XXXXXXXXXXXXXXXX",  --34
                "XXXXXXXXXXXXXXXX",  --35
                "XXXXXXXXXXXXXXXX",  --36
                "XXXXXXXXXXXXXXXX",  --37
                "XXXXXXXXXXXXXXXX",  --38
                "XXXXXXXXXXXXXXXX",  --39
                "XXXXXXXXXXXXXXXX",  --40
                "XXXXXXXXXXXXXXXX",  --41
                "XXXXXXXXXXXXXXXX",  --42
                "XXXXXXXXXXXXXXXX",  --43
                "XXXXXXXXXXXXXXXX",  --44
                "XXXXXXXXXXXXXXXX",  --45
                "XXXXXXXXXXXXXXXX",  --46
                "XXXXXXXXXXXXXXXX",  --47
                "XXXXXXXXXXXXXXXX",  --48
                "XXXXXXXXXXXXXXXX",  --49
                "XXXXXXXXXXXXXXXX",  --50
                "XXXXXXXXXXXXXXXX",  --51
                "XXXXXXXXXXXXXXXX",  --52
                "XXXXXXXXXXXXXXXX",  --53
                "XXXXXXXXXXXXXXXX",  --54
                "XXXXXXXXXXXXXXXX",  --55
                "XXXXXXXXXXXXXXXX",  --56
                "XXXXXXXXXXXXXXXX",  --57
                "XXXXXXXXXXXXXXXX",  --58
                "XXXXXXXXXXXXXXXX",  --59
                "XXXXXXXXXXXXXXXX",  --60
                "XXXXXXXXXXXXXXXX",  --61
                "XXXXXXXXXXXXXXXX",  --62
                "XXXXXXXXXXXXXXXX",  --63
                "XXXXXXXXXXXXXXXX",  --64
                "XXXXXXXXXXXXXXXX",  --65
                "XXXXXXXXXXXXXXXX",  --66
                "XXXXXXXXXXXXXXXX",  --67
                "XXXXXXXXXXXXXXXX",  --68
                "XXXXXXXXXXXXXXXX",  --69
                "XXXXXXXXXXXXXXXX",  --70
                "XXXXXXXXXXXXXXXX",  --71
                "XXXXXXXXXXXXXXXX",  --72
                "XXXXXXXXXXXXXXXX",  --73
                "XXXXXXXXXXXXXXXX",  --74
                "XXXXXXXXXXXXXXXX",  --75
                "XXXXXXXXXXXXXXXX",  --76
                "XXXXXXXXXXXXXXXX",  --77
                "XXXXXXXXXXXXXXXX",  --78
                "XXXXXXXXXXXXXXXX",  --79
                "XXXXXXXXXXXXXXXX",  --80
                "XXXXXXXXXXXXXXXX",  --81
                "XXXXXXXXXXXXXXXX",  --82
                "XXXXXXXXXXXXXXXX",  --83
                "XXXXXXXXXXXXXXXX",  --84
                "XXXXXXXXXXXXXXXX",  --85
                "XXXXXXXXXXXXXXXX",  --86
                "XXXXXXXXXXXXXXXX",  --87
                "XXXXXXXXXXXXXXXX",  --88
                "XXXXXXXXXXXXXXXX",  --89
                "XXXXXXXXXXXXXXXX",  --90
                "XXXXXXXXXXXXXXXX",  --91
                "XXXXXXXXXXXXXXXX",  --92
                "XXXXXXXXXXXXXXXX",  --93
                "XXXXXXXXXXXXXXXX",  --94
                "XXXXXXXXXXXXXXXX",  --95
                "XXXXXXXXXXXXXXXX",  --96
                "XXXXXXXXXXXXXXXX",  --97
                "XXXXXXXXXXXXXXXX",  --98
                "XXXXXXXXXXXXXXXX",  --99
                "XXXXXXXXXXXXXXXX",  --100
                "XXXXXXXXXXXXXXXX",  --101
                "XXXXXXXXXXXXXXXX",  --102
                "XXXXXXXXXXXXXXXX",  --103
                "XXXXXXXXXXXXXXXX",  --104
                "XXXXXXXXXXXXXXXX",  --105
                "XXXXXXXXXXXXXXXX",  --106
                "XXXXXXXXXXXXXXXX",  --107
                "XXXXXXXXXXXXXXXX",  --108
                "XXXXXXXXXXXXXXXX",  --109
                "XXXXXXXXXXXXXXXX",  --110
                "XXXXXXXXXXXXXXXX",  --111
                "XXXXXXXXXXXXXXXX",  --112
                "XXXXXXXXXXXXXXXX",  --113
                "XXXXXXXXXXXXXXXX",  --114
                "XXXXXXXXXXXXXXXX",  --115
                "XXXXXXXXXXXXXXXX",  --116
                "XXXXXXXXXXXXXXXX",  --117
                "XXXXXXXXXXXXXXXX",  --118
                "XXXXXXXXXXXXXXXX",  --119
                "XXXXXXXXXXXXXXXX",  --120
                "XXXXXXXXXXXXXXXX",  --121
                "XXXXXXXXXXXXXXXX",  --122
                "XXXXXXXXXXXXXXXX",  --123
                "XXXXXXXXXXXXXXXX",  --124
                "XXXXXXXXXXXXXXXX",  --125
                "XXXXXXXXXXXXXXXX",  --126
                "XXXXXXXXXXXXXXXX",  --127
                "XXXXXXXXXXXXXXXX",  --128
                "XXXXXXXXXXXXXXXX",  --129
                "XXXXXXXXXXXXXXXX",  --130
                "XXXXXXXXXXXXXXXX",  --131
                "XXXXXXXXXXXXXXXX",  --132
                "XXXXXXXXXXXXXXXX",  --133
                "XXXXXXXXXXXXXXXX",  --134
                "XXXXXXXXXXXXXXXX",  --135
                "XXXXXXXXXXXXXXXX",  --136
                "XXXXXXXXXXXXXXXX",  --137
                "XXXXXXXXXXXXXXXX",  --138
                "XXXXXXXXXXXXXXXX",  --139
                "XXXXXXXXXXXXXXXX",  --140
                "XXXXXXXXXXXXXXXX",  --141
                "XXXXXXXXXXXXXXXX",  --142
                "XXXXXXXXXXXXXXXX",  --143
                "XXXXXXXXXXXXXXXX",  --144
                "XXXXXXXXXXXXXXXX",  --145
                "XXXXXXXXXXXXXXXX",  --146
                "XXXXXXXXXXXXXXXX",  --147
                "XXXXXXXXXXXXXXXX",  --148
                "XXXXXXXXXXXXXXXX",  --149
                "XXXXXXXXXXXXXXXX",  --150
                "XXXXXXXXXXXXXXXX",  --151
                "XXXXXXXXXXXXXXXX",  --152
                "XXXXXXXXXXXXXXXX",  --153
                "XXXXXXXXXXXXXXXX",  --154
                "XXXXXXXXXXXXXXXX",  --155
                "XXXXXXXXXXXXXXXX",  --156
                "XXXXXXXXXXXXXXXX",  --157
                "XXXXXXXXXXXXXXXX",  --158
                "XXXXXXXXXXXXXXXX",  --159
                "XXXXXXXXXXXXXXXX",  --160
                "XXXXXXXXXXXXXXXX",  --161
                "XXXXXXXXXXXXXXXX",  --162
                "XXXXXXXXXXXXXXXX",  --163
                "XXXXXXXXXXXXXXXX",  --164
                "XXXXXXXXXXXXXXXX",  --165
                "XXXXXXXXXXXXXXXX",  --166
                "XXXXXXXXXXXXXXXX",  --167
                "XXXXXXXXXXXXXXXX",  --168
                "XXXXXXXXXXXXXXXX",  --169
                "XXXXXXXXXXXXXXXX",  --170
                "XXXXXXXXXXXXXXXX",  --171
                "XXXXXXXXXXXXXXXX",  --172
                "XXXXXXXXXXXXXXXX",  --173
                "XXXXXXXXXXXXXXXX",  --174
                "XXXXXXXXXXXXXXXX",  --175
                "XXXXXXXXXXXXXXXX",  --176
                "XXXXXXXXXXXXXXXX",  --177
                "XXXXXXXXXXXXXXXX",  --178
                "XXXXXXXXXXXXXXXX",  --179
                "XXXXXXXXXXXXXXXX",  --180
                "XXXXXXXXXXXXXXXX",  --181
                "XXXXXXXXXXXXXXXX",  --182
                "XXXXXXXXXXXXXXXX",  --183
                "XXXXXXXXXXXXXXXX",  --184
                "XXXXXXXXXXXXXXXX",  --185
                "XXXXXXXXXXXXXXXX",  --186
                "XXXXXXXXXXXXXXXX",  --187
                "XXXXXXXXXXXXXXXX",  --188
                "XXXXXXXXXXXXXXXX",  --189
                "XXXXXXXXXXXXXXXX",  --190
                "XXXXXXXXXXXXXXXX",  --191
                "XXXXXXXXXXXXXXXX",  --192
                "XXXXXXXXXXXXXXXX",  --193
                "XXXXXXXXXXXXXXXX",  --194
                "XXXXXXXXXXXXXXXX",  --195
                "XXXXXXXXXXXXXXXX",  --196
                "XXXXXXXXXXXXXXXX",  --197
                "XXXXXXXXXXXXXXXX",  --198
                "XXXXXXXXXXXXXXXX",  --199
                "XXXXXXXXXXXXXXXX",  --200
                "XXXXXXXXXXXXXXXX",  --201
                "XXXXXXXXXXXXXXXX",  --202
                "XXXXXXXXXXXXXXXX",  --203
                "XXXXXXXXXXXXXXXX",  --204
                "XXXXXXXXXXXXXXXX",  --205
                "XXXXXXXXXXXXXXXX",  --206
                "XXXXXXXXXXXXXXXX",  --207
                "XXXXXXXXXXXXXXXX",  --208
                "XXXXXXXXXXXXXXXX",  --209
                "XXXXXXXXXXXXXXXX",  --210
                "XXXXXXXXXXXXXXXX",  --211
                "XXXXXXXXXXXXXXXX",  --212
                "XXXXXXXXXXXXXXXX",  --213
                "XXXXXXXXXXXXXXXX",  --214
                "XXXXXXXXXXXXXXXX",  --215
                "XXXXXXXXXXXXXXXX",  --216
                "XXXXXXXXXXXXXXXX",  --217
                "XXXXXXXXXXXXXXXX",  --218
                "XXXXXXXXXXXXXXXX",  --219
                "XXXXXXXXXXXXXXXX",  --220
                "XXXXXXXXXXXXXXXX",  --221
                "XXXXXXXXXXXXXXXX",  --222
                "XXXXXXXXXXXXXXXX",  --223
                "XXXXXXXXXXXXXXXX",  --224
                "XXXXXXXXXXXXXXXX",  --225
                "XXXXXXXXXXXXXXXX",  --226
                "XXXXXXXXXXXXXXXX",  --227
                "XXXXXXXXXXXXXXXX",  --228
                "XXXXXXXXXXXXXXXX",  --229
                "XXXXXXXXXXXXXXXX",  --230
                "XXXXXXXXXXXXXXXX",  --231
                "XXXXXXXXXXXXXXXX",  --232
                "XXXXXXXXXXXXXXXX",  --233
                "XXXXXXXXXXXXXXXX",  --234
                "XXXXXXXXXXXXXXXX",  --235
                "XXXXXXXXXXXXXXXX",  --236
                "XXXXXXXXXXXXXXXX",  --237
                "XXXXXXXXXXXXXXXX",  --238
                "XXXXXXXXXXXXXXXX",  --239
                "XXXXXXXXXXXXXXXX",  --240
                "XXXXXXXXXXXXXXXX",  --241
                "XXXXXXXXXXXXXXXX",  --242
                "XXXXXXXXXXXXXXXX",  --243
                "XXXXXXXXXXXXXXXX",  --244
                "XXXXXXXXXXXXXXXX",  --245
                "XXXXXXXXXXXXXXXX",  --246
                "XXXXXXXXXXXXXXXX",  --247
                "XXXXXXXXXXXXXXXX",  --248
                "XXXXXXXXXXXXXXXX",  --249
                "XXXXXXXXXXXXXXXX",  --250
                "XXXXXXXXXXXXXXXX",  --251
                "XXXXXXXXXXXXXXXX",  --252
                "XXXXXXXXXXXXXXXX",  --253
                "XXXXXXXXXXXXXXXX",  --254
                "XXXXXXXXXXXXXXXX"  --255
	);

--signal bagator : std_logic_vector(15 downto 0) := "000000000000000X";
begin
	process(cs,rd, wr, addr,di)
	variable ctrl:			std_logic_vector(2 downto 0);
	begin
		ctrl := cs & rd & wr;	
		case ctrl is
			when "101" =>
				if(conv_integer(addr)>100) then
			        RAM(conv_integer(addr)) <= di;
				end if;
			when "110" =>
			       	do <= RAM(conv_integer(addr));
			when "111" =>
				if(conv_integer(addr)>100) then
			       	do <= RAM(conv_integer(addr) + 1);
					RAM(conv_integer(addr) + 1) <= "XXXXXXXXXXXXXXXX";
				end if;
			when others =>
				do <= (others => 'Z');
		end case;
	end process;
end imp;
