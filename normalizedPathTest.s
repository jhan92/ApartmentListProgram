#!/bin/sh

echo "Test for normalized Path
"
#TEST1
toNormalize="/path"
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "/path" ];
    then
        echo ERROR
        echo Should have been /path but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test1 Succeeded
    
    "
fi

#TEST2
toNormalize="/home/path1/./.."
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "/home" ];
    then
        echo ERROR
        echo Should have been /home but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test2 Succeeded
    
    "
fi

#TEST3
toNormalize="/home/path1/./../path2"
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "/home/path2" ];
    then
        echo ERROR
        echo Should have been /home/path2 but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test3 Succeeded
    
    "
fi

#TEST4
toNormalize="~/"
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "~/" ];
    then
        echo ERROR
        echo Should have been ~/ but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test4 Succeeded
    
    "
fi

#TEST5
toNormalize=""
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [[ -n "$STR" ]];
    then
        echo ERROR
        echo Should have been but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test5 Succeeded
    
    "
fi

#TEST6
toNormalize="foo//bar"
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "foo//bar" ];
    then
        echo ERROR
        echo Should have been "foo//bar" but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test6 Succeeded
    
    "
fi

#TEST7
toNormalize="~/home/./path1/../path2/.."
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "~/home" ];
    then
        echo ERROR
        echo Should have been ~/home but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test7 Succeeded
    
    "
fi

#TEST8
toNormalize="///"
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "///" ];
    then
        echo ERROR
        echo Should have been /// but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test8 Succeeded
    
    "
fi

#TEST9
toNormalize="~/home///"
echo Testing for $toNormalize
STR=$(ruby normalizedPath.rb $toNormalize)
if [ $STR != "~/home///" ];
    then
        echo ERROR
        echo Should have been ~/home/// but was $STR
        exit 1;
else
    echo $toNormalize normalized to $STR
    echo "Test9 Succeeded
    
    "
fi
echo ALL TESTS PASSED!