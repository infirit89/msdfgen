include "Freetype"

project "msdfgen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{prj.location}/bin/" .. outputdir)
    objdir ("%{prj.location}/bin-int/" .. outputdir)

    files
    {
        -- msdf core
        "core/**.cpp",
        "core/**.hpp",
        "core/**.h",

        -- msdf extensions
        "ext/**.cpp",
        "ext/**.h",
    }

    includedirs
    {
        "core",
        "ext",
        "freetype/include"
    }

    links
    {
        "Freetype"
    }

    defines
    {
        "MSDFGEN_USE_CPP11",
        "MSDFGEN_PUBLIC=",
        "MSDFGEN_EXT_PUBLIC="
    }

    filter "system:windows"
        architecture "x86_64"
        systemversion "latest"

        disablewarnings
        {
            4005,
            4267
        }

    filter "system:macosx"
		architecture "ARM64"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
