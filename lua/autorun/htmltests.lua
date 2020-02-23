local clientFiles = {
    "htmltests/cl_html.lua",
    "htmltests/cl_render.lua",
}

if SERVER then
    AddCSLuaFile()

    for i, filepath in ipairs(clientFiles) do
        AddCSLuaFile(filepath)
    end

    include("htmltests/sv_tests.lua")
elseif CLIENT then
    for i, filepath in ipairs(clientFiles) do
        include(filepath)
    end

    print("Loaded HTML tests")
end

