import std.stdio;
import std.string;

auto input()
{
    return readln().chomp();
}

void main()
{
    auto S = input();
    if ((S == "AAA") || (S == "BBB"))
    {
        writeln("No");
        return;
    }
    writeln("Yes");
}
