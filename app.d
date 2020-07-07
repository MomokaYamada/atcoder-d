import std;

alias sread = () => readln.chomp();
alias lread = () => readln.chomp.to!long();
alias aryread(T = long) = () => readln.split.to!(T[]);

void main()
{
    long n, m, q;
    scan(n, m, q);
    writeln(n, m, q);

    auto cnt = new long[](m);
    //どの問題が何人に解かれたのか
    writeln(cnt);
    auto x = new long[][](n);
    //その人がどの問題を解いたのか
    writeln(query);
    foreach (i; 0 .. q)

    {
        auto s = aryread();
        writeln(s);
        if (s[0] == 1)
        {
            long ans;
            foreach (j; x[s[1] - 1])
            {
                ans += n - cnt[j];
            }
        }
        else if (s[0] == 2)
        {

        }
    }
}

void scan(L...)(ref L A)
{
    auto l = readln.split;
    foreach (i, T; L)
    {
        A[i] = l[i].to!T;
    }
}
