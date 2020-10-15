for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$(pwd)/$f" "$HOME"/"$f"
done