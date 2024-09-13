function up
  set cdNum $argv[1]
  if test -n "$cdNum"
    echo Number Arg is $cdNum
    for i in (seq $cdNum)
      cd ..
    end
  else
    cd ..
  end

  clear && pwd && ls -FGl
end
