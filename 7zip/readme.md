
### Compress

Max compress levels with multi file (max 2gb per file)

```
7z a -t7z -mx=9 -v2000m archive.7z /path/to/folder
```

### Uncompress

Pass first archive file, 7z will auto detect other parts

```
7z x archive.7z.001
```

