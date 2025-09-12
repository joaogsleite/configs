In `./Spoons/RecursiveBinder.spoon/init.lua`, replace:

```lua
modal:bind(key[1], key[2], function() modal:exit() killHelper() func() end)
```

with this:

```lua
modal:bind(key[1], key[2], function() modal:exit() killHelper() func() end)
-- start added by joaogsleite
if (key[1] == nil or next(key[1]) == nil) then
    modal:bind({'command'}, key[2], function() modal:exit() killHelper() func() end)
end
-- end added by joaogsleite
```