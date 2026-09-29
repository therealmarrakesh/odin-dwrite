# odin-dwrite

[DirectWrite](https://learn.microsoft.com/en-us/windows/win32/api/_directwrite/) bindings for [Odin](https://odin-lang.org).

## Install

Copy `dwrite.odin` into your Odin installation at:

```
vendor/directx/dwrite/dwrite.odin
```

It sits next to the existing `vendor/directx/dxgi` package, which it imports as `../dxgi`.

## Usage

```odin
package main

import "core:fmt"
import win32 "core:sys/windows"
import "vendor:directx/dwrite"

main :: proc() {
    factory: ^dwrite.IFactory
    hr := dwrite.CreateFactory(.SHARED, dwrite.IFactory_UUID, (^^dwrite.IUnknown)(&factory))
    if win32.FAILED(hr) {
        fmt.eprintfln("CreateFactory failed: 0x%08X", u32(hr))
        return
    }
    defer factory->Release()

    fonts: ^dwrite.IFontCollection
    hr = factory->GetSystemFontCollection(&fonts, false)
    if win32.FAILED(hr) {
        fmt.eprintfln("GetSystemFontCollection failed: 0x%08X", u32(hr))
        return
    }
    defer fonts->Release()

    fmt.println("Font families:", fonts->GetFontFamilyCount())
}
```

## Notes

- Overloaded COM methods follow the naming used by Microsoft's official Rust projection ([windows-rs](https://github.com/microsoft/windows-rs)). The count continues across an interface's whole inheritance chain, so the suffix is not an interface version: `IFactory3` has `CreateCustomRenderingParams4`, because `IFactory`, `IFactory1` and `IFactory2` each declare one before it.
- `IBitmapRenderTarget3` is declared by the Windows SDK, but only DWriteCore (Windows App SDK) implements it so far; the system `DWrite.dll` does not.
- Verified against Windows SDK 10.0.28000.0 (vtable layouts, IIDs, structs, enums, constants and the exported function), and every method has been tested at runtime (`IBitmapRenderTarget3` through DWriteCore).
