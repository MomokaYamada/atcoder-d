import std;

alias sread = () => readln.chomp();
alias lread = () => readln.chomp.to!long();
alias aryread(T = long) = () => readln.split.to!(T[]);
//aryread!string();
//auto PS = new Tuple!(long,string)[](M);
//x[]=1;でlong[]全要素1に初期化
void main()
{
    long 冊数, アルゴリズム数, 目標;
    scan(冊数, アルゴリズム数, 目標);
    auto 参考書の値段とアルゴリズム = new long[][](冊数);
    foreach (本番号; 0 .. 冊数)
    {
        参考書の値段とアルゴリズム[本番号] = aryread();
    }

    auto C = new long[](N);
    auto A = new long[][](N);
    foreach (本番号; 0 .. N)
    {
        C[本番号] = 参考書の値段とアルゴリズム[0];
        A[本番号] = 参考書の値段とアルゴリズム[1 .. $];
    }

    long func(long state)
    {
        auto アルゴリズムの合計 = new long[](アルゴリズム数);
        long 合計金額;
        foreach (本番号; 0 .. 冊数)
        {
            if (bit(state, 本番号))
            {
                合計金額 += C[本番号];
                アルゴリズムの合計[] += A[本番号][];
            }
        }
        foreach (アルゴリズム番号; 0 .. アルゴリズム数)
        {
            if (アルゴリズムの合計[アルゴリズム番号] < 目標)
                return long.max;
        }
        return 合計金額;
    }

    long ans = long.max;
    foreach (state; 0 .. (1 << 冊数))
    {
        long cost = func(state);
        ans = min(ans, cost);
    }
    writeln(ans == long.max ? -1 : ans);

    // long func(long state)
    // {
    //     auto アルゴリズムの合計 = new long[](アルゴリズム数);
    //     long 合計金額;
    //     foreach (i; 0 .. 冊数)
    //     {
    //         if ((state & (1 << i)) != 0)
    //         {
    //             合計金額 += 参考書の値段とアルゴリズム[i][0];
    //             foreach (j; 1 .. アルゴリズム数 + 1)
    //             {
    //                 アルゴリズムの合計[j - 1] += 参考書の値段とアルゴリズム[i][j];
    //             }
    //         }
    //     }
    //     foreach (k; 0 .. アルゴリズム数)
    //     {
    //         if (アルゴリズムの合計[k] >= 目標)
    //         {
    //             continue;
    //         }
    //         else
    //         {
    //             return long.max;
    //         }
    //     }
    //     return 合計金額;
    // }

    // long ans = long.max;
    // foreach (state; 0 .. 1 << 冊数)
    // {
    //     ans = min(func(state), ans);
    // }
    // if (ans == long.max)
    // {
    //     writeln(-1);
    //     return;
    // }
    // writeln(ans);

}

bool bit(long x, long i)
{
    return (x & (1 << i)) != 0;
}

void scan(L...)(ref L A)
{
    auto l = readln.split;
    foreach (i, T; L)
    {
        A[i] = l[i].to!T;
    }
}

void arywrite(T)(T a)
{
    a.map!text.join(' ').writeln;
}
