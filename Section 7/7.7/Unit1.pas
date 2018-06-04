{* Given the side a of a square, find the perimeter  *
 *   P of the square                                 *
 *                              P = 4 * a            *}

unit Unit1;

interface

type
  TSquare = class
    function Square(a: Integer): Integer;
  end;

implementation

{ TSquare }

function TSquare.Square(a: Integer): Integer;
begin
  Result := Abs(4 * a);
end;

end.
