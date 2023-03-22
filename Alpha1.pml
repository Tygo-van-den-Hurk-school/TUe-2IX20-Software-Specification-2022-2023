proctype Alpha (int x; int y) {
    int z = 1;
    x=2;
    x>2 && y>z && z==1;
    skip;
}

init {
    run Alpha(5, 3)
}