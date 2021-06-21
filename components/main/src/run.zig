const c = @cImport({
    @cInclude("stdio.h");
});

export fn run() i64 {
    _ = c.printf("Hello, world!!\n");
    return 0;
}
