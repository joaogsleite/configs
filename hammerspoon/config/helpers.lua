local helpers = {}

function helpers.endsWith(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end

function helpers.startsWith(str, prefix)
  return string.sub(str, 1, #prefix) == prefix
end

function helpers.startsWithAny(str, arr)
  for _, prefix in ipairs(arr) do
    if helpers.startsWith(str, prefix) then
      return true
    end
  end
  return false
end

return helpers