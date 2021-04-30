procedure elementosMinimoMaximo(v:vector; maxPos, minPos:integer);
var
    i, min, max :integer;
begin
    max := 0;
    min := 999;
    for i:=1 to 100 do
        begin
            if (v[i] >= max) then
                begin
                    max := v[i];
                    maxPos := i;
                end;
            if (v[i] <= min) then
                begin
                    min := v[i];
                    minPos := i;
                end;
        end;
end;