function Invoke-ContainerBuild($ContainerPath, $Language) {
    Push-Location $ContainerPath
    docker build . -t $Language"-hello-world:latest"
    Pop-Location
}

$RootPath = Split-Path $MyInvocation.MyCommand.Path -Parent
$RootPath = $RootPath + '\'

try {
    # Dart
    $DartPath = $RootPath + '.\dart\darttest\'
    Invoke-ContainerBuild $DartPath "dart"

    # #Dotnet A.K.A C#
    $CSharpPath = $RootPath + '.\dotnet\App\'
    Invoke-ContainerBuild $CSharpPath "csharp"

    #FSharp
    $FSharpPath = $RootPath + '.\fsharptest\'
    Invoke-ContainerBuild $FSharpPath "fsharp"

    #Go
    $GoLangPath = $RootPath + '.\go\'
    Invoke-ContainerBuild $GoLangPath "go"

    #Rust
    $RustPath = $RootPath + '.\rust\rustthing'
    Invoke-ContainerBuild $RustPath "rust"
}
catch {
    Set-Location $RootPath
}