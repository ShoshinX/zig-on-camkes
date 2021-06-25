const c = @cImport({
    @cInclude("stdio.h");
    @cInclude("sel4/types.h");
});

export fn run() i64 {
    _ = c.printf("Hello, world!!\n");
    var uint: c.seL4_Uint64 = 85;
    return 0;
}
