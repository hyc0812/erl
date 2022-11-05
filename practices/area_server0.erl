-module(area_server0).
-export([loop/0]).

loop() -> 
	receive
		{rectangle, Width, Ht} -> 
			io:fwrite("Area of rectangle is ~p~n", [Width * Ht]),
			loop();
		{circle, R} ->
			io:fwrite("Area of circle is ~p~n", [3.1415926 * R * R]),
			loop();
		Other -> 
			io:fwrite("I don't know what the area of a ~p is ~n", [Other]),
			loop()
	end.
