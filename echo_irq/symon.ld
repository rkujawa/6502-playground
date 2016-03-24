MEMORY 
{
	ram: org=0x0000, len=0x8000
	rom: org=0xC000, len=0x3FFA
	romv: org=0xFFFA, len=6
}

SECTIONS 
{
	.text:
	{
	    *(code)
	} > rom
	
	.data:
	{
	    *(data)
	} > rom
	
	.vectors:
	{
	    *(vectors)
	} > romv
}

