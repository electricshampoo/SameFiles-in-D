void main(string[] args){
    import std.algorithm, std.digest.sha, std.stdio, std.file;
    string[][ubyte[20]] table;

    foreach (DirEntry entry; args[1].dirEntries(SpanMode.depth))
    {
        if (entry.isDir || entry.isSymlink)
            continue;
        table[entry.name.read.sha1Of] ~= entry.name;
    }

    foreach (string[] collisions; table.values){
        if (collisions.length > 1)
            writeln(collisions);
    }
}
