# setup local settings
for file in ~/.local/*.sh
do . $file
done

# setup peco functions
#for file in ~/.peco/*.sh
#do . $file
#done

# load alias settings
for file in ~/.alias/*
do . $file
done
