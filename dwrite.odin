// Bindings for [[ DirectWrite ; https://learn.microsoft.com/en-us/windows/win32/api/_directwrite/ ]].
package directx_dwrite

foreign import dwrite "system:dwrite.lib"

import "../dxgi"
import win32 "core:sys/windows"

IUnknown        :: dxgi.IUnknown
IUnknown_VTable :: dxgi.IUnknown_VTable

HANDLE   :: dxgi.HANDLE
HRESULT  :: dxgi.HRESULT
IID      :: dxgi.IID
UUID     :: dxgi.UUID
BOOL     :: dxgi.BOOL
DWORD    :: dxgi.DWORD
WCHAR    :: dxgi.WCHAR
HMONITOR :: dxgi.HMONITOR

RECT  :: dxgi.RECT
POINT :: dxgi.POINT
SIZE  :: dxgi.SIZE

LPCWSTR  :: win32.LPCWSTR
COLORREF :: win32.COLORREF
FILETIME :: win32.FILETIME
LOGFONTW :: win32.LOGFONTW
HDC      :: win32.HDC

@(default_calling_convention="system", link_prefix="DWrite")
foreign dwrite {
	CreateFactory :: proc(factoryType: FACTORY_TYPE, iid: ^IID, factory: ^^IUnknown) -> HRESULT ---
}


D3DCOLORVALUE :: dxgi.D3DCOLORVALUE

FONTSIGNATURE :: struct {
	fsUsb: [4]DWORD,
	fsCsb: [2]DWORD,
}

D2D_POINT_2F :: struct {
	x: f32,
	y: f32,
}

D2D_RECT_F :: struct {
	left:   f32,
	top:    f32,
	right:  f32,
	bottom: f32,
}

D2D_SIZE_U :: struct {
	width:  u32,
	height: u32,
}

D2D_POINT_2L :: POINT

D2D1_COLOR_F  :: D3DCOLORVALUE
D2D1_POINT_2F :: D2D_POINT_2F
D2D1_POINT_2L :: D2D_POINT_2L
D2D1_SIZE_U   :: D2D_SIZE_U

D2D1_GRADIENT_STOP :: struct {
	position: f32,
	color:    D2D1_COLOR_F,
}

D2D1_BEZIER_SEGMENT :: struct {
	point1: D2D1_POINT_2F,
	point2: D2D1_POINT_2F,
	point3: D2D1_POINT_2F,
}

D2D1_FIGURE_BEGIN :: enum i32 {
	FILLED      = 0,
	HOLLOW      = 1,
	FORCE_DWORD = -1,
}

D2D1_FIGURE_END :: enum i32 {
	OPEN        = 0,
	CLOSED      = 1,
	FORCE_DWORD = -1,
}

D2D1_PATH_SEGMENT :: distinct bit_set[D2D1_PATH_SEGMENT_FLAG; u32]
D2D1_PATH_SEGMENT_FLAG :: enum u32 {
	FORCE_UNSTROKED       = 0,
	FORCE_ROUND_LINE_JOIN = 1,
}

D2D1_FILL_MODE :: enum i32 {
	ALTERNATE   = 0,
	WINDING     = 1,
	FORCE_DWORD = -1,
}

ID2D1SimplifiedGeometrySink_UUID_STRING :: "2cd9069e-12e2-11dc-9fed-001143a055f9"
ID2D1SimplifiedGeometrySink_UUID := &IID{0x2cd9069e, 0x12e2, 0x11dc, {0x9f, 0xed, 0x00, 0x11, 0x43, 0xa0, 0x55, 0xf9}}
ID2D1SimplifiedGeometrySink :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using id2d1simplifiedgeometrysink_vtable: ^ID2D1SimplifiedGeometrySink_VTable,
}
ID2D1SimplifiedGeometrySink_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetFillMode:     proc "system" (this: ^ID2D1SimplifiedGeometrySink, fillMode: D2D1_FILL_MODE),
	SetSegmentFlags: proc "system" (this: ^ID2D1SimplifiedGeometrySink, vertexFlags: D2D1_PATH_SEGMENT),
	BeginFigure:     proc "system" (this: ^ID2D1SimplifiedGeometrySink, startPoint: D2D1_POINT_2F, figureBegin: D2D1_FIGURE_BEGIN),
	AddLines:        proc "system" (this: ^ID2D1SimplifiedGeometrySink, points: [^]D2D1_POINT_2F, pointsCount: u32),
	AddBeziers:      proc "system" (this: ^ID2D1SimplifiedGeometrySink, beziers: [^]D2D1_BEZIER_SEGMENT, beziersCount: u32),
	EndFigure:       proc "system" (this: ^ID2D1SimplifiedGeometrySink, figureEnd: D2D1_FIGURE_END),
	Close:           proc "system" (this: ^ID2D1SimplifiedGeometrySink) -> HRESULT,
}


MEASURING_MODE :: enum i32 {
	NATURAL     = 0,
	GDI_CLASSIC = 1,
	GDI_NATURAL = 2,
}

GLYPH_IMAGE_FORMATS :: distinct bit_set[GLYPH_IMAGE_FORMATS_FLAG; u32]
GLYPH_IMAGE_FORMATS_FLAG :: enum u32 {
	TRUETYPE               = 0,
	CFF                    = 1,
	COLR                   = 2,
	SVG                    = 3,
	PNG                    = 4,
	JPEG                   = 5,
	TIFF                   = 6,
	PREMULTIPLIED_B8G8R8A8 = 7,
	COLR_PAINT_TREE        = 8,
}

FONT_FILE_TYPE :: enum i32 {
	UNKNOWN             = 0,
	CFF                 = 1,
	TRUETYPE            = 2,
	OPENTYPE_COLLECTION = 3,
	TYPE1_PFM           = 4,
	TYPE1_PFB           = 5,
	VECTOR              = 6,
	BITMAP              = 7,
	TRUETYPE_COLLECTION = OPENTYPE_COLLECTION,
}

FONT_FACE_TYPE :: enum i32 {
	CFF                 = 0,
	TRUETYPE            = 1,
	OPENTYPE_COLLECTION = 2,
	TYPE1               = 3,
	VECTOR              = 4,
	BITMAP              = 5,
	UNKNOWN             = 6,
	RAW_CFF             = 7,
	TRUETYPE_COLLECTION = OPENTYPE_COLLECTION,
}

FONT_SIMULATIONS :: distinct bit_set[FONT_SIMULATIONS_FLAG; u32]
FONT_SIMULATIONS_FLAG :: enum u32 {
	BOLD    = 0,
	OBLIQUE = 1,
}

FONT_WEIGHT :: enum i32 {
	THIN        = 100,
	EXTRA_LIGHT = 200,
	ULTRA_LIGHT = 200,
	LIGHT       = 300,
	SEMI_LIGHT  = 350,
	NORMAL      = 400,
	REGULAR     = 400,
	MEDIUM      = 500,
	DEMI_BOLD   = 600,
	SEMI_BOLD   = 600,
	BOLD        = 700,
	EXTRA_BOLD  = 800,
	ULTRA_BOLD  = 800,
	BLACK       = 900,
	HEAVY       = 900,
	EXTRA_BLACK = 950,
	ULTRA_BLACK = 950,
}

FONT_STRETCH :: enum i32 {
	UNDEFINED       = 0,
	ULTRA_CONDENSED = 1,
	EXTRA_CONDENSED = 2,
	CONDENSED       = 3,
	SEMI_CONDENSED  = 4,
	NORMAL          = 5,
	MEDIUM          = 5,
	SEMI_EXPANDED   = 6,
	EXPANDED        = 7,
	EXTRA_EXPANDED  = 8,
	ULTRA_EXPANDED  = 9,
}

FONT_STYLE :: enum i32 {
	NORMAL  = 0,
	OBLIQUE = 1,
	ITALIC  = 2,
}

INFORMATIONAL_STRING_ID :: enum i32 {
	NONE                             = 0,
	COPYRIGHT_NOTICE                 = 1,
	VERSION_STRINGS                  = 2,
	TRADEMARK                        = 3,
	MANUFACTURER                     = 4,
	DESIGNER                         = 5,
	DESIGNER_URL                     = 6,
	DESCRIPTION                      = 7,
	FONT_VENDOR_URL                  = 8,
	LICENSE_DESCRIPTION              = 9,
	LICENSE_INFO_URL                 = 10,
	WIN32_FAMILY_NAMES               = 11,
	WIN32_SUBFAMILY_NAMES            = 12,
	TYPOGRAPHIC_FAMILY_NAMES         = 13,
	TYPOGRAPHIC_SUBFAMILY_NAMES      = 14,
	SAMPLE_TEXT                      = 15,
	FULL_NAME                        = 16,
	POSTSCRIPT_NAME                  = 17,
	POSTSCRIPT_CID_NAME              = 18,
	WEIGHT_STRETCH_STYLE_FAMILY_NAME = 19,
	DESIGN_SCRIPT_LANGUAGE_TAG       = 20,
	SUPPORTED_SCRIPT_LANGUAGE_TAG    = 21,
	PREFERRED_FAMILY_NAMES           = TYPOGRAPHIC_FAMILY_NAMES,
	PREFERRED_SUBFAMILY_NAMES        = TYPOGRAPHIC_SUBFAMILY_NAMES,
	WWS_FAMILY_NAME                  = WEIGHT_STRETCH_STYLE_FAMILY_NAME,
}

FONT_METRICS :: struct {
	designUnitsPerEm:       u16,
	ascent:                 u16,
	descent:                u16,
	lineGap:                i16,
	capHeight:              u16,
	xHeight:                u16,
	underlinePosition:      i16,
	underlineThickness:     u16,
	strikethroughPosition:  i16,
	strikethroughThickness: u16,
}

GLYPH_METRICS :: struct {
	leftSideBearing:   i32,
	advanceWidth:      u32,
	rightSideBearing:  i32,
	topSideBearing:    i32,
	advanceHeight:     u32,
	bottomSideBearing: i32,
	verticalOriginY:   i32,
}

GLYPH_OFFSET :: struct {
	advanceOffset:  f32,
	ascenderOffset: f32,
}

FACTORY_TYPE :: enum i32 {
	SHARED   = 0,
	ISOLATED = 1,
}

IFontFileLoader_UUID_STRING :: "727cad4e-d6af-4c9e-8a08-d695b11caa49"
IFontFileLoader_UUID := &IID{0x727cad4e, 0xd6af, 0x4c9e, {0x8a, 0x08, 0xd6, 0x95, 0xb1, 0x1c, 0xaa, 0x49}}
IFontFileLoader :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfileloader_vtable: ^IFontFileLoader_VTable,
}
IFontFileLoader_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	CreateStreamFromKey: proc "system" (this: ^IFontFileLoader, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, fontFileStream: ^^IFontFileStream) -> HRESULT,
}

ILocalFontFileLoader_UUID_STRING :: "b2d9f3ec-c9fe-4a11-a2ec-d86208f7c0a2"
ILocalFontFileLoader_UUID := &IID{0xb2d9f3ec, 0xc9fe, 0x4a11, {0xa2, 0xec, 0xd8, 0x62, 0x08, 0xf7, 0xc0, 0xa2}}
ILocalFontFileLoader :: struct #raw_union {
	#subtype idwritefontfileloader: IFontFileLoader,
	using idwritelocalfontfileloader_vtable: ^ILocalFontFileLoader_VTable,
}
ILocalFontFileLoader_VTable :: struct {
	using idwritefontfileloader_vtable: IFontFileLoader_VTable,
	GetFilePathLengthFromKey: proc "system" (this: ^ILocalFontFileLoader, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, filePathLength: ^u32) -> HRESULT,
	GetFilePathFromKey:       proc "system" (this: ^ILocalFontFileLoader, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, filePath: [^]WCHAR, filePathSize: u32) -> HRESULT,
	GetLastWriteTimeFromKey:  proc "system" (this: ^ILocalFontFileLoader, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, lastWriteTime: ^FILETIME) -> HRESULT,
}

IFontFileStream_UUID_STRING :: "6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0"
IFontFileStream_UUID := &IID{0x6d4865fe, 0x0ab8, 0x4d91, {0x8f, 0x62, 0x5d, 0xd6, 0xbe, 0x34, 0xa3, 0xe0}}
IFontFileStream :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfilestream_vtable: ^IFontFileStream_VTable,
}
IFontFileStream_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	ReadFileFragment:    proc "system" (this: ^IFontFileStream, fragmentStart: ^rawptr, fileOffset: u64, fragmentSize: u64, fragmentContext: ^rawptr) -> HRESULT,
	ReleaseFileFragment: proc "system" (this: ^IFontFileStream, fragmentContext: rawptr),
	GetFileSize:         proc "system" (this: ^IFontFileStream, fileSize: ^u64) -> HRESULT,
	GetLastWriteTime:    proc "system" (this: ^IFontFileStream, lastWriteTime: ^u64) -> HRESULT,
}

IFontFile_UUID_STRING :: "739d886a-cef5-47dc-8769-1a8b41bebbb0"
IFontFile_UUID := &IID{0x739d886a, 0xcef5, 0x47dc, {0x87, 0x69, 0x1a, 0x8b, 0x41, 0xbe, 0xbb, 0xb0}}
IFontFile :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfile_vtable: ^IFontFile_VTable,
}
IFontFile_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetReferenceKey: proc "system" (this: ^IFontFile, fontFileReferenceKey: ^rawptr, fontFileReferenceKeySize: ^u32) -> HRESULT,
	GetLoader:       proc "system" (this: ^IFontFile, fontFileLoader: ^^IFontFileLoader) -> HRESULT,
	Analyze:         proc "system" (this: ^IFontFile, isSupportedFontType: ^BOOL, fontFileType: ^FONT_FILE_TYPE, fontFaceType: ^FONT_FACE_TYPE, numberOfFaces: ^u32) -> HRESULT,
}

PIXEL_GEOMETRY :: enum i32 {
	FLAT = 0,
	RGB  = 1,
	BGR  = 2,
}

RENDERING_MODE :: enum i32 {
	DEFAULT                     = 0,
	ALIASED                     = 1,
	GDI_CLASSIC                 = 2,
	GDI_NATURAL                 = 3,
	NATURAL                     = 4,
	NATURAL_SYMMETRIC           = 5,
	OUTLINE                     = 6,
	CLEARTYPE_GDI_CLASSIC       = GDI_CLASSIC,
	CLEARTYPE_GDI_NATURAL       = GDI_NATURAL,
	CLEARTYPE_NATURAL           = NATURAL,
	CLEARTYPE_NATURAL_SYMMETRIC = NATURAL_SYMMETRIC,
}

MATRIX :: struct {
	m11: f32,
	m12: f32,
	m21: f32,
	m22: f32,
	dx:  f32,
	dy:  f32,
}

IRenderingParams_UUID_STRING :: "2f0da53a-2add-47cd-82ee-d9ec34688e75"
IRenderingParams_UUID := &IID{0x2f0da53a, 0x2add, 0x47cd, {0x82, 0xee, 0xd9, 0xec, 0x34, 0x68, 0x8e, 0x75}}
IRenderingParams :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwriterenderingparams_vtable: ^IRenderingParams_VTable,
}
IRenderingParams_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetGamma:            proc "system" (this: ^IRenderingParams) -> f32,
	GetEnhancedContrast: proc "system" (this: ^IRenderingParams) -> f32,
	GetClearTypeLevel:   proc "system" (this: ^IRenderingParams) -> f32,
	GetPixelGeometry:    proc "system" (this: ^IRenderingParams) -> PIXEL_GEOMETRY,
	GetRenderingMode:    proc "system" (this: ^IRenderingParams) -> RENDERING_MODE,
}

IGeometrySink :: ID2D1SimplifiedGeometrySink

IFontFace_UUID_STRING :: "5f49804d-7024-4d43-bfa9-d25984f53849"
IFontFace_UUID := &IID{0x5f49804d, 0x7024, 0x4d43, {0xbf, 0xa9, 0xd2, 0x59, 0x84, 0xf5, 0x38, 0x49}}
IFontFace :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontface_vtable: ^IFontFace_VTable,
}
IFontFace_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetType:                      proc "system" (this: ^IFontFace) -> FONT_FACE_TYPE,
	GetFiles:                     proc "system" (this: ^IFontFace, numberOfFiles: ^u32, fontFiles: [^]^IFontFile) -> HRESULT,
	GetIndex:                     proc "system" (this: ^IFontFace) -> u32,
	GetSimulations:               proc "system" (this: ^IFontFace) -> FONT_SIMULATIONS,
	IsSymbolFont:                 proc "system" (this: ^IFontFace) -> BOOL,
	GetMetrics:                   proc "system" (this: ^IFontFace, fontFaceMetrics: ^FONT_METRICS),
	GetGlyphCount:                proc "system" (this: ^IFontFace) -> u16,
	GetDesignGlyphMetrics:        proc "system" (this: ^IFontFace, glyphIndices: [^]u16, glyphCount: u32, glyphMetrics: [^]GLYPH_METRICS, isSideways: BOOL) -> HRESULT,
	GetGlyphIndices:              proc "system" (this: ^IFontFace, codePoints: [^]u32, codePointCount: u32, glyphIndices: [^]u16) -> HRESULT,
	TryGetFontTable:              proc "system" (this: ^IFontFace, openTypeTableTag: u32, tableData: ^rawptr, tableSize: ^u32, tableContext: ^rawptr, exists: ^BOOL) -> HRESULT,
	ReleaseFontTable:             proc "system" (this: ^IFontFace, tableContext: rawptr),
	GetGlyphRunOutline:           proc "system" (this: ^IFontFace, emSize: f32, glyphIndices: [^]u16, glyphAdvances: [^]f32, glyphOffsets: [^]GLYPH_OFFSET, glyphCount: u32, isSideways: BOOL, isRightToLeft: BOOL, geometrySink: ^IGeometrySink) -> HRESULT,
	GetRecommendedRenderingMode:  proc "system" (this: ^IFontFace, emSize: f32, pixelsPerDip: f32, measuringMode: MEASURING_MODE, renderingParams: ^IRenderingParams, renderingMode: ^RENDERING_MODE) -> HRESULT,
	GetGdiCompatibleMetrics:      proc "system" (this: ^IFontFace, emSize: f32, pixelsPerDip: f32, transform: ^MATRIX, fontFaceMetrics: ^FONT_METRICS) -> HRESULT,
	GetGdiCompatibleGlyphMetrics: proc "system" (this: ^IFontFace, emSize: f32, pixelsPerDip: f32, transform: ^MATRIX, useGdiNatural: BOOL, glyphIndices: [^]u16, glyphCount: u32, glyphMetrics: [^]GLYPH_METRICS, isSideways: BOOL) -> HRESULT,
}

IFontCollectionLoader_UUID_STRING :: "cca920e4-52f0-492b-bfa8-29c72ee0a468"
IFontCollectionLoader_UUID := &IID{0xcca920e4, 0x52f0, 0x492b, {0xbf, 0xa8, 0x29, 0xc7, 0x2e, 0xe0, 0xa4, 0x68}}
IFontCollectionLoader :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontcollectionloader_vtable: ^IFontCollectionLoader_VTable,
}
IFontCollectionLoader_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	CreateEnumeratorFromKey: proc "system" (this: ^IFontCollectionLoader, factory: ^IFactory, collectionKey: rawptr, collectionKeySize: u32, fontFileEnumerator: ^^IFontFileEnumerator) -> HRESULT,
}

IFontFileEnumerator_UUID_STRING :: "72755049-5ff7-435d-8348-4be97cfa6c7c"
IFontFileEnumerator_UUID := &IID{0x72755049, 0x5ff7, 0x435d, {0x83, 0x48, 0x4b, 0xe9, 0x7c, 0xfa, 0x6c, 0x7c}}
IFontFileEnumerator :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfileenumerator_vtable: ^IFontFileEnumerator_VTable,
}
IFontFileEnumerator_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	MoveNext:           proc "system" (this: ^IFontFileEnumerator, hasCurrentFile: ^BOOL) -> HRESULT,
	GetCurrentFontFile: proc "system" (this: ^IFontFileEnumerator, fontFile: ^^IFontFile) -> HRESULT,
}

ILocalizedStrings_UUID_STRING :: "08256209-099a-4b34-b86d-c22b110e7771"
ILocalizedStrings_UUID := &IID{0x08256209, 0x099a, 0x4b34, {0xb8, 0x6d, 0xc2, 0x2b, 0x11, 0x0e, 0x77, 0x71}}
ILocalizedStrings :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritelocalizedstrings_vtable: ^ILocalizedStrings_VTable,
}
ILocalizedStrings_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetCount:            proc "system" (this: ^ILocalizedStrings) -> u32,
	FindLocaleName:      proc "system" (this: ^ILocalizedStrings, localeName: LPCWSTR, index: ^u32, exists: ^BOOL) -> HRESULT,
	GetLocaleNameLength: proc "system" (this: ^ILocalizedStrings, index: u32, length: ^u32) -> HRESULT,
	GetLocaleName:       proc "system" (this: ^ILocalizedStrings, index: u32, localeName: [^]WCHAR, size: u32) -> HRESULT,
	GetStringLength:     proc "system" (this: ^ILocalizedStrings, index: u32, length: ^u32) -> HRESULT,
	GetString:           proc "system" (this: ^ILocalizedStrings, index: u32, stringBuffer: [^]WCHAR, size: u32) -> HRESULT,
}

IFontCollection_UUID_STRING :: "a84cee02-3eea-4eee-a827-87c1a02a0fcc"
IFontCollection_UUID := &IID{0xa84cee02, 0x3eea, 0x4eee, {0xa8, 0x27, 0x87, 0xc1, 0xa0, 0x2a, 0x0f, 0xcc}}
IFontCollection :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontcollection_vtable: ^IFontCollection_VTable,
}
IFontCollection_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetFontFamilyCount:  proc "system" (this: ^IFontCollection) -> u32,
	GetFontFamily:       proc "system" (this: ^IFontCollection, index: u32, fontFamily: ^^IFontFamily) -> HRESULT,
	FindFamilyName:      proc "system" (this: ^IFontCollection, familyName: LPCWSTR, index: ^u32, exists: ^BOOL) -> HRESULT,
	GetFontFromFontFace: proc "system" (this: ^IFontCollection, fontFace: ^IFontFace, font: ^^IFont) -> HRESULT,
}

IFontList_UUID_STRING :: "1a0d8438-1d97-4ec1-aef9-a2fb86ed6acb"
IFontList_UUID := &IID{0x1a0d8438, 0x1d97, 0x4ec1, {0xae, 0xf9, 0xa2, 0xfb, 0x86, 0xed, 0x6a, 0xcb}}
IFontList :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontlist_vtable: ^IFontList_VTable,
}
IFontList_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetFontCollection: proc "system" (this: ^IFontList, fontCollection: ^^IFontCollection) -> HRESULT,
	GetFontCount:      proc "system" (this: ^IFontList) -> u32,
	GetFont:           proc "system" (this: ^IFontList, index: u32, font: ^^IFont) -> HRESULT,
}

IFontFamily_UUID_STRING :: "da20d8ef-812a-4c43-9802-62ec4abd7add"
IFontFamily_UUID := &IID{0xda20d8ef, 0x812a, 0x4c43, {0x98, 0x02, 0x62, 0xec, 0x4a, 0xbd, 0x7a, 0xdd}}
IFontFamily :: struct #raw_union {
	#subtype idwritefontlist: IFontList,
	using idwritefontfamily_vtable: ^IFontFamily_VTable,
}
IFontFamily_VTable :: struct {
	using idwritefontlist_vtable: IFontList_VTable,
	GetFamilyNames:       proc "system" (this: ^IFontFamily, names: ^^ILocalizedStrings) -> HRESULT,
	GetFirstMatchingFont: proc "system" (this: ^IFontFamily, weight: FONT_WEIGHT, stretch: FONT_STRETCH, style: FONT_STYLE, matchingFont: ^^IFont) -> HRESULT,
	GetMatchingFonts:     proc "system" (this: ^IFontFamily, weight: FONT_WEIGHT, stretch: FONT_STRETCH, style: FONT_STYLE, matchingFonts: ^^IFontList) -> HRESULT,
}

IFont_UUID_STRING :: "acd16696-8c14-4f5d-877e-fe3fc1d32737"
IFont_UUID := &IID{0xacd16696, 0x8c14, 0x4f5d, {0x87, 0x7e, 0xfe, 0x3f, 0xc1, 0xd3, 0x27, 0x37}}
IFont :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefont_vtable: ^IFont_VTable,
}
IFont_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetFontFamily:           proc "system" (this: ^IFont, fontFamily: ^^IFontFamily) -> HRESULT,
	GetWeight:               proc "system" (this: ^IFont) -> FONT_WEIGHT,
	GetStretch:              proc "system" (this: ^IFont) -> FONT_STRETCH,
	GetStyle:                proc "system" (this: ^IFont) -> FONT_STYLE,
	IsSymbolFont:            proc "system" (this: ^IFont) -> BOOL,
	GetFaceNames:            proc "system" (this: ^IFont, names: ^^ILocalizedStrings) -> HRESULT,
	GetInformationalStrings: proc "system" (this: ^IFont, informationalStringID: INFORMATIONAL_STRING_ID, informationalStrings: ^^ILocalizedStrings, exists: ^BOOL) -> HRESULT,
	GetSimulations:          proc "system" (this: ^IFont) -> FONT_SIMULATIONS,
	GetMetrics:              proc "system" (this: ^IFont, fontMetrics: ^FONT_METRICS),
	HasCharacter:            proc "system" (this: ^IFont, unicodeValue: u32, exists: ^BOOL) -> HRESULT,
	CreateFontFace:          proc "system" (this: ^IFont, fontFace: ^^IFontFace) -> HRESULT,
}

READING_DIRECTION :: enum i32 {
	LEFT_TO_RIGHT = 0,
	RIGHT_TO_LEFT = 1,
	TOP_TO_BOTTOM = 2,
	BOTTOM_TO_TOP = 3,
}

FLOW_DIRECTION :: enum i32 {
	TOP_TO_BOTTOM = 0,
	BOTTOM_TO_TOP = 1,
	LEFT_TO_RIGHT = 2,
	RIGHT_TO_LEFT = 3,
}

TEXT_ALIGNMENT :: enum i32 {
	LEADING   = 0,
	TRAILING  = 1,
	CENTER    = 2,
	JUSTIFIED = 3,
}

PARAGRAPH_ALIGNMENT :: enum i32 {
	NEAR   = 0,
	FAR    = 1,
	CENTER = 2,
}

WORD_WRAPPING :: enum i32 {
	WRAP            = 0,
	NO_WRAP         = 1,
	EMERGENCY_BREAK = 2,
	WHOLE_WORD      = 3,
	CHARACTER       = 4,
}

LINE_SPACING_METHOD :: enum i32 {
	DEFAULT      = 0,
	UNIFORM      = 1,
	PROPORTIONAL = 2,
}

TRIMMING_GRANULARITY :: enum i32 {
	NONE      = 0,
	CHARACTER = 1,
	WORD      = 2,
}

FONT_FEATURE_TAG :: enum i32 {
	ALTERNATIVE_FRACTIONS            = 0x63726661,
	PETITE_CAPITALS_FROM_CAPITALS    = 0x63703263,
	SMALL_CAPITALS_FROM_CAPITALS     = 0x63733263,
	CONTEXTUAL_ALTERNATES            = 0x746C6163,
	CASE_SENSITIVE_FORMS             = 0x65736163,
	GLYPH_COMPOSITION_DECOMPOSITION  = 0x706D6363,
	CONTEXTUAL_LIGATURES             = 0x67696C63,
	CAPITAL_SPACING                  = 0x70737063,
	CONTEXTUAL_SWASH                 = 0x68777363,
	CURSIVE_POSITIONING              = 0x73727563,
	DEFAULT                          = 0x746C6664,
	DISCRETIONARY_LIGATURES          = 0x67696C64,
	EXPERT_FORMS                     = 0x74707865,
	FRACTIONS                        = 0x63617266,
	FULL_WIDTH                       = 0x64697766,
	HALF_FORMS                       = 0x666C6168,
	HALANT_FORMS                     = 0x6E6C6168,
	ALTERNATE_HALF_WIDTH             = 0x746C6168,
	HISTORICAL_FORMS                 = 0x74736968,
	HORIZONTAL_KANA_ALTERNATES       = 0x616E6B68,
	HISTORICAL_LIGATURES             = 0x67696C68,
	HALF_WIDTH                       = 0x64697768,
	HOJO_KANJI_FORMS                 = 0x6F6A6F68,
	JIS04_FORMS                      = 0x3430706A,
	JIS78_FORMS                      = 0x3837706A,
	JIS83_FORMS                      = 0x3338706A,
	JIS90_FORMS                      = 0x3039706A,
	KERNING                          = 0x6E72656B,
	STANDARD_LIGATURES               = 0x6167696C,
	LINING_FIGURES                   = 0x6D756E6C,
	LOCALIZED_FORMS                  = 0x6C636F6C,
	MARK_POSITIONING                 = 0x6B72616D,
	MATHEMATICAL_GREEK               = 0x6B72676D,
	MARK_TO_MARK_POSITIONING         = 0x6B6D6B6D,
	ALTERNATE_ANNOTATION_FORMS       = 0x746C616E,
	NLC_KANJI_FORMS                  = 0x6B636C6E,
	OLD_STYLE_FIGURES                = 0x6D756E6F,
	ORDINALS                         = 0x6E64726F,
	PROPORTIONAL_ALTERNATE_WIDTH     = 0x746C6170,
	PETITE_CAPITALS                  = 0x70616370,
	PROPORTIONAL_FIGURES             = 0x6D756E70,
	PROPORTIONAL_WIDTHS              = 0x64697770,
	QUARTER_WIDTHS                   = 0x64697771,
	REQUIRED_LIGATURES               = 0x67696C72,
	RUBY_NOTATION_FORMS              = 0x79627572,
	STYLISTIC_ALTERNATES             = 0x746C6173,
	SCIENTIFIC_INFERIORS             = 0x666E6973,
	SMALL_CAPITALS                   = 0x70636D73,
	SIMPLIFIED_FORMS                 = 0x6C706D73,
	STYLISTIC_SET_1                  = 0x31307373,
	STYLISTIC_SET_2                  = 0x32307373,
	STYLISTIC_SET_3                  = 0x33307373,
	STYLISTIC_SET_4                  = 0x34307373,
	STYLISTIC_SET_5                  = 0x35307373,
	STYLISTIC_SET_6                  = 0x36307373,
	STYLISTIC_SET_7                  = 0x37307373,
	STYLISTIC_SET_8                  = 0x38307373,
	STYLISTIC_SET_9                  = 0x39307373,
	STYLISTIC_SET_10                 = 0x30317373,
	STYLISTIC_SET_11                 = 0x31317373,
	STYLISTIC_SET_12                 = 0x32317373,
	STYLISTIC_SET_13                 = 0x33317373,
	STYLISTIC_SET_14                 = 0x34317373,
	STYLISTIC_SET_15                 = 0x35317373,
	STYLISTIC_SET_16                 = 0x36317373,
	STYLISTIC_SET_17                 = 0x37317373,
	STYLISTIC_SET_18                 = 0x38317373,
	STYLISTIC_SET_19                 = 0x39317373,
	STYLISTIC_SET_20                 = 0x30327373,
	SUBSCRIPT                        = 0x73627573,
	SUPERSCRIPT                      = 0x73707573,
	SWASH                            = 0x68737773,
	TITLING                          = 0x6C746974,
	TRADITIONAL_NAME_FORMS           = 0x6D616E74,
	TABULAR_FIGURES                  = 0x6D756E74,
	TRADITIONAL_FORMS                = 0x64617274,
	THIRD_WIDTHS                     = 0x64697774,
	UNICASE                          = 0x63696E75,
	VERTICAL_WRITING                 = 0x74726576,
	VERTICAL_ALTERNATES_AND_ROTATION = 0x32747276,
	SLASHED_ZERO                     = 0x6F72657A,
}

TEXT_RANGE :: struct {
	startPosition: u32,
	length:        u32,
}

FONT_FEATURE :: struct {
	nameTag:   FONT_FEATURE_TAG,
	parameter: u32,
}

TYPOGRAPHIC_FEATURES :: struct {
	features:     [^]FONT_FEATURE `fmt:"v,featureCount"`,
	featureCount: u32,
}

TRIMMING :: struct {
	granularity:    TRIMMING_GRANULARITY,
	delimiter:      u32,
	delimiterCount: u32,
}

ITextFormat_UUID_STRING :: "9c906818-31d7-4fd3-a151-7c5e225db55a"
ITextFormat_UUID := &IID{0x9c906818, 0x31d7, 0x4fd3, {0xa1, 0x51, 0x7c, 0x5e, 0x22, 0x5d, 0xb5, 0x5a}}
ITextFormat :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritetextformat_vtable: ^ITextFormat_VTable,
}
ITextFormat_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetTextAlignment:        proc "system" (this: ^ITextFormat, textAlignment: TEXT_ALIGNMENT) -> HRESULT,
	SetParagraphAlignment:   proc "system" (this: ^ITextFormat, paragraphAlignment: PARAGRAPH_ALIGNMENT) -> HRESULT,
	SetWordWrapping:         proc "system" (this: ^ITextFormat, wordWrapping: WORD_WRAPPING) -> HRESULT,
	SetReadingDirection:     proc "system" (this: ^ITextFormat, readingDirection: READING_DIRECTION) -> HRESULT,
	SetFlowDirection:        proc "system" (this: ^ITextFormat, flowDirection: FLOW_DIRECTION) -> HRESULT,
	SetIncrementalTabStop:   proc "system" (this: ^ITextFormat, incrementalTabStop: f32) -> HRESULT,
	SetTrimming:             proc "system" (this: ^ITextFormat, trimmingOptions: ^TRIMMING, trimmingSign: ^IInlineObject) -> HRESULT,
	SetLineSpacing:          proc "system" (this: ^ITextFormat, lineSpacingMethod: LINE_SPACING_METHOD, lineSpacing: f32, baseline: f32) -> HRESULT,
	GetTextAlignment:        proc "system" (this: ^ITextFormat) -> TEXT_ALIGNMENT,
	GetParagraphAlignment:   proc "system" (this: ^ITextFormat) -> PARAGRAPH_ALIGNMENT,
	GetWordWrapping:         proc "system" (this: ^ITextFormat) -> WORD_WRAPPING,
	GetReadingDirection:     proc "system" (this: ^ITextFormat) -> READING_DIRECTION,
	GetFlowDirection:        proc "system" (this: ^ITextFormat) -> FLOW_DIRECTION,
	GetIncrementalTabStop:   proc "system" (this: ^ITextFormat) -> f32,
	GetTrimming:             proc "system" (this: ^ITextFormat, trimmingOptions: ^TRIMMING, trimmingSign: ^^IInlineObject) -> HRESULT,
	GetLineSpacing:          proc "system" (this: ^ITextFormat, lineSpacingMethod: ^LINE_SPACING_METHOD, lineSpacing: ^f32, baseline: ^f32) -> HRESULT,
	GetFontCollection:       proc "system" (this: ^ITextFormat, fontCollection: ^^IFontCollection) -> HRESULT,
	GetFontFamilyNameLength: proc "system" (this: ^ITextFormat) -> u32,
	GetFontFamilyName:       proc "system" (this: ^ITextFormat, fontFamilyName: [^]WCHAR, nameSize: u32) -> HRESULT,
	GetFontWeight:           proc "system" (this: ^ITextFormat) -> FONT_WEIGHT,
	GetFontStyle:            proc "system" (this: ^ITextFormat) -> FONT_STYLE,
	GetFontStretch:          proc "system" (this: ^ITextFormat) -> FONT_STRETCH,
	GetFontSize:             proc "system" (this: ^ITextFormat) -> f32,
	GetLocaleNameLength:     proc "system" (this: ^ITextFormat) -> u32,
	GetLocaleName:           proc "system" (this: ^ITextFormat, localeName: [^]WCHAR, nameSize: u32) -> HRESULT,
}

ITypography_UUID_STRING :: "55f1112b-1dc2-4b3c-9541-f46894ed85b6"
ITypography_UUID := &IID{0x55f1112b, 0x1dc2, 0x4b3c, {0x95, 0x41, 0xf4, 0x68, 0x94, 0xed, 0x85, 0xb6}}
ITypography :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritetypography_vtable: ^ITypography_VTable,
}
ITypography_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddFontFeature:      proc "system" (this: ^ITypography, fontFeature: FONT_FEATURE) -> HRESULT,
	GetFontFeatureCount: proc "system" (this: ^ITypography) -> u32,
	GetFontFeature:      proc "system" (this: ^ITypography, fontFeatureIndex: u32, fontFeature: ^FONT_FEATURE) -> HRESULT,
}

SCRIPT_SHAPES :: distinct bit_set[SCRIPT_SHAPES_FLAG; u32]
SCRIPT_SHAPES_FLAG :: enum u32 {
	NO_VISUAL = 0,
}

SCRIPT_ANALYSIS :: struct {
	script: u16,
	shapes: SCRIPT_SHAPES,
}

BREAK_CONDITION :: enum i32 {
	NEUTRAL       = 0,
	CAN_BREAK     = 1,
	MAY_NOT_BREAK = 2,
	MUST_BREAK    = 3,
}

LINE_BREAKPOINT :: struct {
	using _: bit_field u8 {
		breakConditionBefore: u8 | 2,
		breakConditionAfter:  u8 | 2,
		isWhitespace:         u8 | 1,
		isSoftHyphen:         u8 | 1,
		padding:              u8 | 2,
	},
}

NUMBER_SUBSTITUTION_METHOD :: enum i32 {
	FROM_CULTURE = 0,
	CONTEXTUAL   = 1,
	NONE         = 2,
	NATIONAL     = 3,
	TRADITIONAL  = 4,
}

INumberSubstitution_UUID_STRING :: "14885CC9-BAB0-4f90-B6ED-5C366A2CD03D"
INumberSubstitution_UUID := &IID{0x14885CC9, 0xBAB0, 0x4f90, {0xB6, 0xED, 0x5C, 0x36, 0x6A, 0x2C, 0xD0, 0x3D}}
INumberSubstitution :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritenumbersubstitution_vtable: ^INumberSubstitution_VTable,
}
INumberSubstitution_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
}

SHAPING_TEXT_PROPERTIES :: struct {
	using _: bit_field u16 {
		isShapedAlone:        u16 | 1,
		reserved1:            u16 | 1,
		canBreakShapingAfter: u16 | 1,
		reserved:             u16 | 13,
	},
}

SHAPING_GLYPH_PROPERTIES :: struct {
	using _: bit_field u16 {
		justification:    u16 | 4,
		isClusterStart:   u16 | 1,
		isDiacritic:      u16 | 1,
		isZeroWidthSpace: u16 | 1,
		reserved:         u16 | 9,
	},
}

ITextAnalysisSource_UUID_STRING :: "688e1a58-5094-47c8-adc8-fbcea60ae92b"
ITextAnalysisSource_UUID := &IID{0x688e1a58, 0x5094, 0x47c8, {0xad, 0xc8, 0xfb, 0xce, 0xa6, 0x0a, 0xe9, 0x2b}}
ITextAnalysisSource :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritetextanalysissource_vtable: ^ITextAnalysisSource_VTable,
}
ITextAnalysisSource_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetTextAtPosition:            proc "system" (this: ^ITextAnalysisSource, textPosition: u32, textString: ^[^]WCHAR, textLength: ^u32) -> HRESULT,
	GetTextBeforePosition:        proc "system" (this: ^ITextAnalysisSource, textPosition: u32, textString: ^[^]WCHAR, textLength: ^u32) -> HRESULT,
	GetParagraphReadingDirection: proc "system" (this: ^ITextAnalysisSource) -> READING_DIRECTION,
	GetLocaleName:                proc "system" (this: ^ITextAnalysisSource, textPosition: u32, textLength: ^u32, localeName: ^LPCWSTR) -> HRESULT,
	GetNumberSubstitution:        proc "system" (this: ^ITextAnalysisSource, textPosition: u32, textLength: ^u32, numberSubstitution: ^^INumberSubstitution) -> HRESULT,
}

ITextAnalysisSink_UUID_STRING :: "5810cd44-0ca0-4701-b3fa-bec5182ae4f6"
ITextAnalysisSink_UUID := &IID{0x5810cd44, 0x0ca0, 0x4701, {0xb3, 0xfa, 0xbe, 0xc5, 0x18, 0x2a, 0xe4, 0xf6}}
ITextAnalysisSink :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritetextanalysissink_vtable: ^ITextAnalysisSink_VTable,
}
ITextAnalysisSink_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetScriptAnalysis:     proc "system" (this: ^ITextAnalysisSink, textPosition: u32, textLength: u32, scriptAnalysis: ^SCRIPT_ANALYSIS) -> HRESULT,
	SetLineBreakpoints:    proc "system" (this: ^ITextAnalysisSink, textPosition: u32, textLength: u32, lineBreakpoints: [^]LINE_BREAKPOINT) -> HRESULT,
	SetBidiLevel:          proc "system" (this: ^ITextAnalysisSink, textPosition: u32, textLength: u32, explicitLevel: u8, resolvedLevel: u8) -> HRESULT,
	SetNumberSubstitution: proc "system" (this: ^ITextAnalysisSink, textPosition: u32, textLength: u32, numberSubstitution: ^INumberSubstitution) -> HRESULT,
}

ITextAnalyzer_UUID_STRING :: "b7e6163e-7f46-43b4-84b3-e4e6249c365d"
ITextAnalyzer_UUID := &IID{0xb7e6163e, 0x7f46, 0x43b4, {0x84, 0xb3, 0xe4, 0xe6, 0x24, 0x9c, 0x36, 0x5d}}
ITextAnalyzer :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritetextanalyzer_vtable: ^ITextAnalyzer_VTable,
}
ITextAnalyzer_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AnalyzeScript:                   proc "system" (this: ^ITextAnalyzer, analysisSource: ^ITextAnalysisSource, textPosition: u32, textLength: u32, analysisSink: ^ITextAnalysisSink) -> HRESULT,
	AnalyzeBidi:                     proc "system" (this: ^ITextAnalyzer, analysisSource: ^ITextAnalysisSource, textPosition: u32, textLength: u32, analysisSink: ^ITextAnalysisSink) -> HRESULT,
	AnalyzeNumberSubstitution:       proc "system" (this: ^ITextAnalyzer, analysisSource: ^ITextAnalysisSource, textPosition: u32, textLength: u32, analysisSink: ^ITextAnalysisSink) -> HRESULT,
	AnalyzeLineBreakpoints:          proc "system" (this: ^ITextAnalyzer, analysisSource: ^ITextAnalysisSource, textPosition: u32, textLength: u32, analysisSink: ^ITextAnalysisSink) -> HRESULT,
	GetGlyphs:                       proc "system" (this: ^ITextAnalyzer, textString: [^]WCHAR, textLength: u32, fontFace: ^IFontFace, isSideways: BOOL, isRightToLeft: BOOL, scriptAnalysis: ^SCRIPT_ANALYSIS, localeName: LPCWSTR, numberSubstitution: ^INumberSubstitution, features: [^]^TYPOGRAPHIC_FEATURES, featureRangeLengths: [^]u32, featureRanges: u32, maxGlyphCount: u32, clusterMap: [^]u16, textProps: [^]SHAPING_TEXT_PROPERTIES, glyphIndices: [^]u16, glyphProps: [^]SHAPING_GLYPH_PROPERTIES, actualGlyphCount: ^u32) -> HRESULT,
	GetGlyphPlacements:              proc "system" (this: ^ITextAnalyzer, textString: [^]WCHAR, clusterMap: [^]u16, textProps: [^]SHAPING_TEXT_PROPERTIES, textLength: u32, glyphIndices: [^]u16, glyphProps: [^]SHAPING_GLYPH_PROPERTIES, glyphCount: u32, fontFace: ^IFontFace, fontEmSize: f32, isSideways: BOOL, isRightToLeft: BOOL, scriptAnalysis: ^SCRIPT_ANALYSIS, localeName: LPCWSTR, features: [^]^TYPOGRAPHIC_FEATURES, featureRangeLengths: [^]u32, featureRanges: u32, glyphAdvances: [^]f32, glyphOffsets: [^]GLYPH_OFFSET) -> HRESULT,
	GetGdiCompatibleGlyphPlacements: proc "system" (this: ^ITextAnalyzer, textString: [^]WCHAR, clusterMap: [^]u16, textProps: [^]SHAPING_TEXT_PROPERTIES, textLength: u32, glyphIndices: [^]u16, glyphProps: [^]SHAPING_GLYPH_PROPERTIES, glyphCount: u32, fontFace: ^IFontFace, fontEmSize: f32, pixelsPerDip: f32, transform: ^MATRIX, useGdiNatural: BOOL, isSideways: BOOL, isRightToLeft: BOOL, scriptAnalysis: ^SCRIPT_ANALYSIS, localeName: LPCWSTR, features: [^]^TYPOGRAPHIC_FEATURES, featureRangeLengths: [^]u32, featureRanges: u32, glyphAdvances: [^]f32, glyphOffsets: [^]GLYPH_OFFSET) -> HRESULT,
}

GLYPH_RUN :: struct {
	fontFace:      ^IFontFace,
	fontEmSize:    f32,
	glyphCount:    u32,
	glyphIndices:  [^]u16 `fmt:"v,glyphCount"`,
	glyphAdvances: [^]f32 `fmt:"v,glyphCount"`,
	glyphOffsets:  [^]GLYPH_OFFSET `fmt:"v,glyphCount"`,
	isSideways:    BOOL,
	bidiLevel:     u32,
}

GLYPH_RUN_DESCRIPTION :: struct {
	localeName:   LPCWSTR,
	string:       [^]WCHAR `fmt:"v,stringLength"`,
	stringLength: u32,
	clusterMap:   [^]u16 `fmt:"v,stringLength"`,
	textPosition: u32,
}

UNDERLINE :: struct {
	width:            f32,
	thickness:        f32,
	offset:           f32,
	runHeight:        f32,
	readingDirection: READING_DIRECTION,
	flowDirection:    FLOW_DIRECTION,
	localeName:       LPCWSTR,
	measuringMode:    MEASURING_MODE,
}

STRIKETHROUGH :: struct {
	width:            f32,
	thickness:        f32,
	offset:           f32,
	readingDirection: READING_DIRECTION,
	flowDirection:    FLOW_DIRECTION,
	localeName:       LPCWSTR,
	measuringMode:    MEASURING_MODE,
}

LINE_METRICS :: struct {
	length:                   u32,
	trailingWhitespaceLength: u32,
	newlineLength:            u32,
	height:                   f32,
	baseline:                 f32,
	isTrimmed:                BOOL,
}

CLUSTER_METRICS :: struct {
	width:  f32,
	length: u16,
	using _: bit_field u16 {
		canWrapLineAfter: u16 | 1,
		isWhitespace:     u16 | 1,
		isNewline:        u16 | 1,
		isSoftHyphen:     u16 | 1,
		isRightToLeft:    u16 | 1,
		padding:          u16 | 11,
	},
}

TEXT_METRICS :: struct {
	left:                             f32,
	top:                              f32,
	width:                            f32,
	widthIncludingTrailingWhitespace: f32,
	height:                           f32,
	layoutWidth:                      f32,
	layoutHeight:                     f32,
	maxBidiReorderingDepth:           u32,
	lineCount:                        u32,
}

INLINE_OBJECT_METRICS :: struct {
	width:            f32,
	height:           f32,
	baseline:         f32,
	supportsSideways: BOOL,
}

OVERHANG_METRICS :: struct {
	left:   f32,
	top:    f32,
	right:  f32,
	bottom: f32,
}

HIT_TEST_METRICS :: struct {
	textPosition: u32,
	length:       u32,
	left:         f32,
	top:          f32,
	width:        f32,
	height:       f32,
	bidiLevel:    u32,
	isText:       BOOL,
	isTrimmed:    BOOL,
}

IInlineObject_UUID_STRING :: "8339FDE3-106F-47ab-8373-1C6295EB10B3"
IInlineObject_UUID := &IID{0x8339FDE3, 0x106F, 0x47ab, {0x83, 0x73, 0x1C, 0x62, 0x95, 0xEB, 0x10, 0xB3}}
IInlineObject :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwriteinlineobject_vtable: ^IInlineObject_VTable,
}
IInlineObject_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	Draw:               proc "system" (this: ^IInlineObject, clientDrawingContext: rawptr, renderer: ^ITextRenderer, originX: f32, originY: f32, isSideways: BOOL, isRightToLeft: BOOL, clientDrawingEffect: ^IUnknown) -> HRESULT,
	GetMetrics:         proc "system" (this: ^IInlineObject, metrics: ^INLINE_OBJECT_METRICS) -> HRESULT,
	GetOverhangMetrics: proc "system" (this: ^IInlineObject, overhangs: ^OVERHANG_METRICS) -> HRESULT,
	GetBreakConditions: proc "system" (this: ^IInlineObject, breakConditionBefore: ^BREAK_CONDITION, breakConditionAfter: ^BREAK_CONDITION) -> HRESULT,
}

IPixelSnapping_UUID_STRING :: "eaf3a2da-ecf4-4d24-b644-b34f6842024b"
IPixelSnapping_UUID := &IID{0xeaf3a2da, 0xecf4, 0x4d24, {0xb6, 0x44, 0xb3, 0x4f, 0x68, 0x42, 0x02, 0x4b}}
IPixelSnapping :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritepixelsnapping_vtable: ^IPixelSnapping_VTable,
}
IPixelSnapping_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	IsPixelSnappingDisabled: proc "system" (this: ^IPixelSnapping, clientDrawingContext: rawptr, isDisabled: ^BOOL) -> HRESULT,
	GetCurrentTransform:     proc "system" (this: ^IPixelSnapping, clientDrawingContext: rawptr, transform: ^MATRIX) -> HRESULT,
	GetPixelsPerDip:         proc "system" (this: ^IPixelSnapping, clientDrawingContext: rawptr, pixelsPerDip: ^f32) -> HRESULT,
}

ITextRenderer_UUID_STRING :: "ef8a8135-5cc6-45fe-8825-c5a0724eb819"
ITextRenderer_UUID := &IID{0xef8a8135, 0x5cc6, 0x45fe, {0x88, 0x25, 0xc5, 0xa0, 0x72, 0x4e, 0xb8, 0x19}}
ITextRenderer :: struct #raw_union {
	#subtype idwritepixelsnapping: IPixelSnapping,
	using idwritetextrenderer_vtable: ^ITextRenderer_VTable,
}
ITextRenderer_VTable :: struct {
	using idwritepixelsnapping_vtable: IPixelSnapping_VTable,
	DrawGlyphRun:      proc "system" (this: ^ITextRenderer, clientDrawingContext: rawptr, baselineOriginX: f32, baselineOriginY: f32, measuringMode: MEASURING_MODE, glyphRun: ^GLYPH_RUN, glyphRunDescription: ^GLYPH_RUN_DESCRIPTION, clientDrawingEffect: ^IUnknown) -> HRESULT,
	DrawUnderline:     proc "system" (this: ^ITextRenderer, clientDrawingContext: rawptr, baselineOriginX: f32, baselineOriginY: f32, underline: ^UNDERLINE, clientDrawingEffect: ^IUnknown) -> HRESULT,
	DrawStrikethrough: proc "system" (this: ^ITextRenderer, clientDrawingContext: rawptr, baselineOriginX: f32, baselineOriginY: f32, strikethrough: ^STRIKETHROUGH, clientDrawingEffect: ^IUnknown) -> HRESULT,
	DrawInlineObject:  proc "system" (this: ^ITextRenderer, clientDrawingContext: rawptr, originX: f32, originY: f32, inlineObject: ^IInlineObject, isSideways: BOOL, isRightToLeft: BOOL, clientDrawingEffect: ^IUnknown) -> HRESULT,
}

ITextLayout_UUID_STRING :: "53737037-6d14-410b-9bfe-0b182bb70961"
ITextLayout_UUID := &IID{0x53737037, 0x6d14, 0x410b, {0x9b, 0xfe, 0x0b, 0x18, 0x2b, 0xb7, 0x09, 0x61}}
ITextLayout :: struct #raw_union {
	#subtype idwritetextformat: ITextFormat,
	using idwritetextlayout_vtable: ^ITextLayout_VTable,
}
ITextLayout_VTable :: struct {
	using idwritetextformat_vtable: ITextFormat_VTable,
	SetMaxWidth:              proc "system" (this: ^ITextLayout, maxWidth: f32) -> HRESULT,
	SetMaxHeight:             proc "system" (this: ^ITextLayout, maxHeight: f32) -> HRESULT,
	SetFontCollection:        proc "system" (this: ^ITextLayout, fontCollection: ^IFontCollection, textRange: TEXT_RANGE) -> HRESULT,
	SetFontFamilyName:        proc "system" (this: ^ITextLayout, fontFamilyName: LPCWSTR, textRange: TEXT_RANGE) -> HRESULT,
	SetFontWeight:            proc "system" (this: ^ITextLayout, fontWeight: FONT_WEIGHT, textRange: TEXT_RANGE) -> HRESULT,
	SetFontStyle:             proc "system" (this: ^ITextLayout, fontStyle: FONT_STYLE, textRange: TEXT_RANGE) -> HRESULT,
	SetFontStretch:           proc "system" (this: ^ITextLayout, fontStretch: FONT_STRETCH, textRange: TEXT_RANGE) -> HRESULT,
	SetFontSize:              proc "system" (this: ^ITextLayout, fontSize: f32, textRange: TEXT_RANGE) -> HRESULT,
	SetUnderline:             proc "system" (this: ^ITextLayout, hasUnderline: BOOL, textRange: TEXT_RANGE) -> HRESULT,
	SetStrikethrough:         proc "system" (this: ^ITextLayout, hasStrikethrough: BOOL, textRange: TEXT_RANGE) -> HRESULT,
	SetDrawingEffect:         proc "system" (this: ^ITextLayout, drawingEffect: ^IUnknown, textRange: TEXT_RANGE) -> HRESULT,
	SetInlineObject:          proc "system" (this: ^ITextLayout, inlineObject: ^IInlineObject, textRange: TEXT_RANGE) -> HRESULT,
	SetTypography:            proc "system" (this: ^ITextLayout, typography: ^ITypography, textRange: TEXT_RANGE) -> HRESULT,
	SetLocaleName:            proc "system" (this: ^ITextLayout, localeName: LPCWSTR, textRange: TEXT_RANGE) -> HRESULT,
	GetMaxWidth:              proc "system" (this: ^ITextLayout) -> f32,
	GetMaxHeight:             proc "system" (this: ^ITextLayout) -> f32,
	GetFontCollection2:       proc "system" (this: ^ITextLayout, currentPosition: u32, fontCollection: ^^IFontCollection, textRange: ^TEXT_RANGE) -> HRESULT,
	GetFontFamilyNameLength2: proc "system" (this: ^ITextLayout, currentPosition: u32, nameLength: ^u32, textRange: ^TEXT_RANGE) -> HRESULT,
	GetFontFamilyName2:       proc "system" (this: ^ITextLayout, currentPosition: u32, fontFamilyName: [^]WCHAR, nameSize: u32, textRange: ^TEXT_RANGE) -> HRESULT,
	GetFontWeight2:           proc "system" (this: ^ITextLayout, currentPosition: u32, fontWeight: ^FONT_WEIGHT, textRange: ^TEXT_RANGE) -> HRESULT,
	GetFontStyle2:            proc "system" (this: ^ITextLayout, currentPosition: u32, fontStyle: ^FONT_STYLE, textRange: ^TEXT_RANGE) -> HRESULT,
	GetFontStretch2:          proc "system" (this: ^ITextLayout, currentPosition: u32, fontStretch: ^FONT_STRETCH, textRange: ^TEXT_RANGE) -> HRESULT,
	GetFontSize2:             proc "system" (this: ^ITextLayout, currentPosition: u32, fontSize: ^f32, textRange: ^TEXT_RANGE) -> HRESULT,
	GetUnderline:             proc "system" (this: ^ITextLayout, currentPosition: u32, hasUnderline: ^BOOL, textRange: ^TEXT_RANGE) -> HRESULT,
	GetStrikethrough:         proc "system" (this: ^ITextLayout, currentPosition: u32, hasStrikethrough: ^BOOL, textRange: ^TEXT_RANGE) -> HRESULT,
	GetDrawingEffect:         proc "system" (this: ^ITextLayout, currentPosition: u32, drawingEffect: ^^IUnknown, textRange: ^TEXT_RANGE) -> HRESULT,
	GetInlineObject:          proc "system" (this: ^ITextLayout, currentPosition: u32, inlineObject: ^^IInlineObject, textRange: ^TEXT_RANGE) -> HRESULT,
	GetTypography:            proc "system" (this: ^ITextLayout, currentPosition: u32, typography: ^^ITypography, textRange: ^TEXT_RANGE) -> HRESULT,
	GetLocaleNameLength2:     proc "system" (this: ^ITextLayout, currentPosition: u32, nameLength: ^u32, textRange: ^TEXT_RANGE) -> HRESULT,
	GetLocaleName2:           proc "system" (this: ^ITextLayout, currentPosition: u32, localeName: [^]WCHAR, nameSize: u32, textRange: ^TEXT_RANGE) -> HRESULT,
	Draw:                     proc "system" (this: ^ITextLayout, clientDrawingContext: rawptr, renderer: ^ITextRenderer, originX: f32, originY: f32) -> HRESULT,
	GetLineMetrics:           proc "system" (this: ^ITextLayout, lineMetrics: [^]LINE_METRICS, maxLineCount: u32, actualLineCount: ^u32) -> HRESULT,
	GetMetrics:               proc "system" (this: ^ITextLayout, textMetrics: ^TEXT_METRICS) -> HRESULT,
	GetOverhangMetrics:       proc "system" (this: ^ITextLayout, overhangs: ^OVERHANG_METRICS) -> HRESULT,
	GetClusterMetrics:        proc "system" (this: ^ITextLayout, clusterMetrics: [^]CLUSTER_METRICS, maxClusterCount: u32, actualClusterCount: ^u32) -> HRESULT,
	DetermineMinWidth:        proc "system" (this: ^ITextLayout, minWidth: ^f32) -> HRESULT,
	HitTestPoint:             proc "system" (this: ^ITextLayout, pointX: f32, pointY: f32, isTrailingHit: ^BOOL, isInside: ^BOOL, hitTestMetrics: ^HIT_TEST_METRICS) -> HRESULT,
	HitTestTextPosition:      proc "system" (this: ^ITextLayout, textPosition: u32, isTrailingHit: BOOL, pointX: ^f32, pointY: ^f32, hitTestMetrics: ^HIT_TEST_METRICS) -> HRESULT,
	HitTestTextRange:         proc "system" (this: ^ITextLayout, textPosition: u32, textLength: u32, originX: f32, originY: f32, hitTestMetrics: [^]HIT_TEST_METRICS, maxHitTestMetricsCount: u32, actualHitTestMetricsCount: ^u32) -> HRESULT,
}

IBitmapRenderTarget_UUID_STRING :: "5e5a32a3-8dff-4773-9ff6-0696eab77267"
IBitmapRenderTarget_UUID := &IID{0x5e5a32a3, 0x8dff, 0x4773, {0x9f, 0xf6, 0x06, 0x96, 0xea, 0xb7, 0x72, 0x67}}
IBitmapRenderTarget :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritebitmaprendertarget_vtable: ^IBitmapRenderTarget_VTable,
}
IBitmapRenderTarget_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	DrawGlyphRun:        proc "system" (this: ^IBitmapRenderTarget, baselineOriginX: f32, baselineOriginY: f32, measuringMode: MEASURING_MODE, glyphRun: ^GLYPH_RUN, renderingParams: ^IRenderingParams, textColor: COLORREF, blackBoxRect: ^RECT) -> HRESULT,
	GetMemoryDC:         proc "system" (this: ^IBitmapRenderTarget) -> HDC,
	GetPixelsPerDip:     proc "system" (this: ^IBitmapRenderTarget) -> f32,
	SetPixelsPerDip:     proc "system" (this: ^IBitmapRenderTarget, pixelsPerDip: f32) -> HRESULT,
	GetCurrentTransform: proc "system" (this: ^IBitmapRenderTarget, transform: ^MATRIX) -> HRESULT,
	SetCurrentTransform: proc "system" (this: ^IBitmapRenderTarget, transform: ^MATRIX) -> HRESULT,
	GetSize:             proc "system" (this: ^IBitmapRenderTarget, size: ^SIZE) -> HRESULT,
	Resize:              proc "system" (this: ^IBitmapRenderTarget, width: u32, height: u32) -> HRESULT,
}

IGdiInterop_UUID_STRING :: "1edd9491-9853-4299-898f-6432983b6f3a"
IGdiInterop_UUID := &IID{0x1edd9491, 0x9853, 0x4299, {0x89, 0x8f, 0x64, 0x32, 0x98, 0x3b, 0x6f, 0x3a}}
IGdiInterop :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritegdiinterop_vtable: ^IGdiInterop_VTable,
}
IGdiInterop_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	CreateFontFromLOGFONT:    proc "system" (this: ^IGdiInterop, logFont: ^LOGFONTW, font: ^^IFont) -> HRESULT,
	ConvertFontToLOGFONT:     proc "system" (this: ^IGdiInterop, font: ^IFont, logFont: ^LOGFONTW, isSystemFont: ^BOOL) -> HRESULT,
	ConvertFontFaceToLOGFONT: proc "system" (this: ^IGdiInterop, font: ^IFontFace, logFont: ^LOGFONTW) -> HRESULT,
	CreateFontFaceFromHdc:    proc "system" (this: ^IGdiInterop, hdc: HDC, fontFace: ^^IFontFace) -> HRESULT,
	CreateBitmapRenderTarget: proc "system" (this: ^IGdiInterop, hdc: HDC, width: u32, height: u32, renderTarget: ^^IBitmapRenderTarget) -> HRESULT,
}

TEXTURE_TYPE :: enum i32 {
	ALIASED_1x1   = 0,
	CLEARTYPE_3x1 = 1,
}

ALPHA_MAX :: 255

IGlyphRunAnalysis_UUID_STRING :: "7d97dbf7-e085-42d4-81e3-6a883bded118"
IGlyphRunAnalysis_UUID := &IID{0x7d97dbf7, 0xe085, 0x42d4, {0x81, 0xe3, 0x6a, 0x88, 0x3b, 0xde, 0xd1, 0x18}}
IGlyphRunAnalysis :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwriteglyphrunanalysis_vtable: ^IGlyphRunAnalysis_VTable,
}
IGlyphRunAnalysis_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetAlphaTextureBounds: proc "system" (this: ^IGlyphRunAnalysis, textureType: TEXTURE_TYPE, textureBounds: ^RECT) -> HRESULT,
	CreateAlphaTexture:    proc "system" (this: ^IGlyphRunAnalysis, textureType: TEXTURE_TYPE, textureBounds: ^RECT, alphaValues: [^]u8, bufferSize: u32) -> HRESULT,
	GetAlphaBlendParams:   proc "system" (this: ^IGlyphRunAnalysis, renderingParams: ^IRenderingParams, blendGamma: ^f32, blendEnhancedContrast: ^f32, blendClearTypeLevel: ^f32) -> HRESULT,
}

IFactory_UUID_STRING :: "b859ee5a-d838-4b5b-a2e8-1adc7d93db48"
IFactory_UUID := &IID{0xb859ee5a, 0xd838, 0x4b5b, {0xa2, 0xe8, 0x1a, 0xdc, 0x7d, 0x93, 0xdb, 0x48}}
IFactory :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefactory_vtable: ^IFactory_VTable,
}
IFactory_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetSystemFontCollection:        proc "system" (this: ^IFactory, fontCollection: ^^IFontCollection, checkForUpdates: BOOL) -> HRESULT,
	CreateCustomFontCollection:     proc "system" (this: ^IFactory, collectionLoader: ^IFontCollectionLoader, collectionKey: rawptr, collectionKeySize: u32, fontCollection: ^^IFontCollection) -> HRESULT,
	RegisterFontCollectionLoader:   proc "system" (this: ^IFactory, fontCollectionLoader: ^IFontCollectionLoader) -> HRESULT,
	UnregisterFontCollectionLoader: proc "system" (this: ^IFactory, fontCollectionLoader: ^IFontCollectionLoader) -> HRESULT,
	CreateFontFileReference:        proc "system" (this: ^IFactory, filePath: LPCWSTR, lastWriteTime: ^FILETIME, fontFile: ^^IFontFile) -> HRESULT,
	CreateCustomFontFileReference:  proc "system" (this: ^IFactory, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, fontFileLoader: ^IFontFileLoader, fontFile: ^^IFontFile) -> HRESULT,
	CreateFontFace:                 proc "system" (this: ^IFactory, fontFaceType: FONT_FACE_TYPE, numberOfFiles: u32, fontFiles: [^]^IFontFile, faceIndex: u32, fontFaceSimulationFlags: FONT_SIMULATIONS, fontFace: ^^IFontFace) -> HRESULT,
	CreateRenderingParams:          proc "system" (this: ^IFactory, renderingParams: ^^IRenderingParams) -> HRESULT,
	CreateMonitorRenderingParams:   proc "system" (this: ^IFactory, monitor: HMONITOR, renderingParams: ^^IRenderingParams) -> HRESULT,
	CreateCustomRenderingParams:    proc "system" (this: ^IFactory, gamma: f32, enhancedContrast: f32, clearTypeLevel: f32, pixelGeometry: PIXEL_GEOMETRY, renderingMode: RENDERING_MODE, renderingParams: ^^IRenderingParams) -> HRESULT,
	RegisterFontFileLoader:         proc "system" (this: ^IFactory, fontFileLoader: ^IFontFileLoader) -> HRESULT,
	UnregisterFontFileLoader:       proc "system" (this: ^IFactory, fontFileLoader: ^IFontFileLoader) -> HRESULT,
	CreateTextFormat:               proc "system" (this: ^IFactory, fontFamilyName: LPCWSTR, fontCollection: ^IFontCollection, fontWeight: FONT_WEIGHT, fontStyle: FONT_STYLE, fontStretch: FONT_STRETCH, fontSize: f32, localeName: LPCWSTR, textFormat: ^^ITextFormat) -> HRESULT,
	CreateTypography:               proc "system" (this: ^IFactory, typography: ^^ITypography) -> HRESULT,
	GetGdiInterop:                  proc "system" (this: ^IFactory, gdiInterop: ^^IGdiInterop) -> HRESULT,
	CreateTextLayout:               proc "system" (this: ^IFactory, string: [^]WCHAR, stringLength: u32, textFormat: ^ITextFormat, maxWidth: f32, maxHeight: f32, textLayout: ^^ITextLayout) -> HRESULT,
	CreateGdiCompatibleTextLayout:  proc "system" (this: ^IFactory, string: [^]WCHAR, stringLength: u32, textFormat: ^ITextFormat, layoutWidth: f32, layoutHeight: f32, pixelsPerDip: f32, transform: ^MATRIX, useGdiNatural: BOOL, textLayout: ^^ITextLayout) -> HRESULT,
	CreateEllipsisTrimmingSign:     proc "system" (this: ^IFactory, textFormat: ^ITextFormat, trimmingSign: ^^IInlineObject) -> HRESULT,
	CreateTextAnalyzer:             proc "system" (this: ^IFactory, textAnalyzer: ^^ITextAnalyzer) -> HRESULT,
	CreateNumberSubstitution:       proc "system" (this: ^IFactory, substitutionMethod: NUMBER_SUBSTITUTION_METHOD, localeName: LPCWSTR, ignoreUserOverride: BOOL, numberSubstitution: ^^INumberSubstitution) -> HRESULT,
	CreateGlyphRunAnalysis:         proc "system" (this: ^IFactory, glyphRun: ^GLYPH_RUN, pixelsPerDip: f32, transform: ^MATRIX, renderingMode: RENDERING_MODE, measuringMode: MEASURING_MODE, baselineOriginX: f32, baselineOriginY: f32, glyphRunAnalysis: ^^IGlyphRunAnalysis) -> HRESULT,
}

FACILITY_DWRITE :: 0x898
ERR_BASE :: 0x5000


PANOSE_FAMILY :: enum i32 {
	ANY          = 0,
	NO_FIT       = 1,
	TEXT_DISPLAY = 2,
	SCRIPT       = 3,
	DECORATIVE   = 4,
	SYMBOL       = 5,
	PICTORIAL    = SYMBOL,
}

PANOSE_SERIF_STYLE :: enum i32 {
	ANY                = 0,
	NO_FIT             = 1,
	COVE               = 2,
	OBTUSE_COVE        = 3,
	SQUARE_COVE        = 4,
	OBTUSE_SQUARE_COVE = 5,
	SQUARE             = 6,
	THIN               = 7,
	OVAL               = 8,
	EXAGGERATED        = 9,
	TRIANGLE           = 10,
	NORMAL_SANS        = 11,
	OBTUSE_SANS        = 12,
	PERPENDICULAR_SANS = 13,
	FLARED             = 14,
	ROUNDED            = 15,
	SCRIPT             = 16,
	PERP_SANS          = PERPENDICULAR_SANS,
	BONE               = OVAL,
}

PANOSE_WEIGHT :: enum i32 {
	ANY         = 0,
	NO_FIT      = 1,
	VERY_LIGHT  = 2,
	LIGHT       = 3,
	THIN        = 4,
	BOOK        = 5,
	MEDIUM      = 6,
	DEMI        = 7,
	BOLD        = 8,
	HEAVY       = 9,
	BLACK       = 10,
	EXTRA_BLACK = 11,
	NORD        = EXTRA_BLACK,
}

PANOSE_PROPORTION :: enum i32 {
	ANY            = 0,
	NO_FIT         = 1,
	OLD_STYLE      = 2,
	MODERN         = 3,
	EVEN_WIDTH     = 4,
	EXPANDED       = 5,
	CONDENSED      = 6,
	VERY_EXPANDED  = 7,
	VERY_CONDENSED = 8,
	MONOSPACED     = 9,
}

PANOSE_CONTRAST :: enum i32 {
	ANY               = 0,
	NO_FIT            = 1,
	NONE              = 2,
	VERY_LOW          = 3,
	LOW               = 4,
	MEDIUM_LOW        = 5,
	MEDIUM            = 6,
	MEDIUM_HIGH       = 7,
	HIGH              = 8,
	VERY_HIGH         = 9,
	HORIZONTAL_LOW    = 10,
	HORIZONTAL_MEDIUM = 11,
	HORIZONTAL_HIGH   = 12,
	BROKEN            = 13,
}

PANOSE_STROKE_VARIATION :: enum i32 {
	ANY                  = 0,
	NO_FIT               = 1,
	NO_VARIATION         = 2,
	GRADUAL_DIAGONAL     = 3,
	GRADUAL_TRANSITIONAL = 4,
	GRADUAL_VERTICAL     = 5,
	GRADUAL_HORIZONTAL   = 6,
	RAPID_VERTICAL       = 7,
	RAPID_HORIZONTAL     = 8,
	INSTANT_VERTICAL     = 9,
	INSTANT_HORIZONTAL   = 10,
}

PANOSE_ARM_STYLE :: enum i32 {
	ANY                           = 0,
	NO_FIT                        = 1,
	STRAIGHT_ARMS_HORIZONTAL      = 2,
	STRAIGHT_ARMS_WEDGE           = 3,
	STRAIGHT_ARMS_VERTICAL        = 4,
	STRAIGHT_ARMS_SINGLE_SERIF    = 5,
	STRAIGHT_ARMS_DOUBLE_SERIF    = 6,
	NONSTRAIGHT_ARMS_HORIZONTAL   = 7,
	NONSTRAIGHT_ARMS_WEDGE        = 8,
	NONSTRAIGHT_ARMS_VERTICAL     = 9,
	NONSTRAIGHT_ARMS_SINGLE_SERIF = 10,
	NONSTRAIGHT_ARMS_DOUBLE_SERIF = 11,
	STRAIGHT_ARMS_HORZ            = STRAIGHT_ARMS_HORIZONTAL,
	STRAIGHT_ARMS_VERT            = STRAIGHT_ARMS_VERTICAL,
	BENT_ARMS_HORZ                = NONSTRAIGHT_ARMS_HORIZONTAL,
	BENT_ARMS_WEDGE               = NONSTRAIGHT_ARMS_WEDGE,
	BENT_ARMS_VERT                = NONSTRAIGHT_ARMS_VERTICAL,
	BENT_ARMS_SINGLE_SERIF        = NONSTRAIGHT_ARMS_SINGLE_SERIF,
	BENT_ARMS_DOUBLE_SERIF        = NONSTRAIGHT_ARMS_DOUBLE_SERIF,
}

PANOSE_LETTERFORM :: enum i32 {
	ANY                = 0,
	NO_FIT             = 1,
	NORMAL_CONTACT     = 2,
	NORMAL_WEIGHTED    = 3,
	NORMAL_BOXED       = 4,
	NORMAL_FLATTENED   = 5,
	NORMAL_ROUNDED     = 6,
	NORMAL_OFF_CENTER  = 7,
	NORMAL_SQUARE      = 8,
	OBLIQUE_CONTACT    = 9,
	OBLIQUE_WEIGHTED   = 10,
	OBLIQUE_BOXED      = 11,
	OBLIQUE_FLATTENED  = 12,
	OBLIQUE_ROUNDED    = 13,
	OBLIQUE_OFF_CENTER = 14,
	OBLIQUE_SQUARE     = 15,
}

PANOSE_MIDLINE :: enum i32 {
	ANY              = 0,
	NO_FIT           = 1,
	STANDARD_TRIMMED = 2,
	STANDARD_POINTED = 3,
	STANDARD_SERIFED = 4,
	HIGH_TRIMMED     = 5,
	HIGH_POINTED     = 6,
	HIGH_SERIFED     = 7,
	CONSTANT_TRIMMED = 8,
	CONSTANT_POINTED = 9,
	CONSTANT_SERIFED = 10,
	LOW_TRIMMED      = 11,
	LOW_POINTED      = 12,
	LOW_SERIFED      = 13,
}

PANOSE_XHEIGHT :: enum i32 {
	ANY               = 0,
	NO_FIT            = 1,
	CONSTANT_SMALL    = 2,
	CONSTANT_STANDARD = 3,
	CONSTANT_LARGE    = 4,
	DUCKING_SMALL     = 5,
	DUCKING_STANDARD  = 6,
	DUCKING_LARGE     = 7,
	CONSTANT_STD      = CONSTANT_STANDARD,
	DUCKING_STD       = DUCKING_STANDARD,
}

PANOSE_TOOL_KIND :: enum i32 {
	ANY                = 0,
	NO_FIT             = 1,
	FLAT_NIB           = 2,
	PRESSURE_POINT     = 3,
	ENGRAVED           = 4,
	BALL               = 5,
	BRUSH              = 6,
	ROUGH              = 7,
	FELT_PEN_BRUSH_TIP = 8,
	WILD_BRUSH         = 9,
}

PANOSE_SPACING :: enum i32 {
	ANY                 = 0,
	NO_FIT              = 1,
	PROPORTIONAL_SPACED = 2,
	MONOSPACED          = 3,
}

PANOSE_ASPECT_RATIO :: enum i32 {
	ANY            = 0,
	NO_FIT         = 1,
	VERY_CONDENSED = 2,
	CONDENSED      = 3,
	NORMAL         = 4,
	EXPANDED       = 5,
	VERY_EXPANDED  = 6,
}

PANOSE_SCRIPT_TOPOLOGY :: enum i32 {
	ANY                      = 0,
	NO_FIT                   = 1,
	ROMAN_DISCONNECTED       = 2,
	ROMAN_TRAILING           = 3,
	ROMAN_CONNECTED          = 4,
	CURSIVE_DISCONNECTED     = 5,
	CURSIVE_TRAILING         = 6,
	CURSIVE_CONNECTED        = 7,
	BLACKLETTER_DISCONNECTED = 8,
	BLACKLETTER_TRAILING     = 9,
	BLACKLETTER_CONNECTED    = 10,
}

PANOSE_SCRIPT_FORM :: enum i32 {
	ANY                          = 0,
	NO_FIT                       = 1,
	UPRIGHT_NO_WRAPPING          = 2,
	UPRIGHT_SOME_WRAPPING        = 3,
	UPRIGHT_MORE_WRAPPING        = 4,
	UPRIGHT_EXTREME_WRAPPING     = 5,
	OBLIQUE_NO_WRAPPING          = 6,
	OBLIQUE_SOME_WRAPPING        = 7,
	OBLIQUE_MORE_WRAPPING        = 8,
	OBLIQUE_EXTREME_WRAPPING     = 9,
	EXAGGERATED_NO_WRAPPING      = 10,
	EXAGGERATED_SOME_WRAPPING    = 11,
	EXAGGERATED_MORE_WRAPPING    = 12,
	EXAGGERATED_EXTREME_WRAPPING = 13,
}

PANOSE_FINIALS :: enum i32 {
	ANY                  = 0,
	NO_FIT               = 1,
	NONE_NO_LOOPS        = 2,
	NONE_CLOSED_LOOPS    = 3,
	NONE_OPEN_LOOPS      = 4,
	SHARP_NO_LOOPS       = 5,
	SHARP_CLOSED_LOOPS   = 6,
	SHARP_OPEN_LOOPS     = 7,
	TAPERED_NO_LOOPS     = 8,
	TAPERED_CLOSED_LOOPS = 9,
	TAPERED_OPEN_LOOPS   = 10,
	ROUND_NO_LOOPS       = 11,
	ROUND_CLOSED_LOOPS   = 12,
	ROUND_OPEN_LOOPS     = 13,
}

PANOSE_XASCENT :: enum i32 {
	ANY       = 0,
	NO_FIT    = 1,
	VERY_LOW  = 2,
	LOW       = 3,
	MEDIUM    = 4,
	HIGH      = 5,
	VERY_HIGH = 6,
}

PANOSE_DECORATIVE_CLASS :: enum i32 {
	ANY                  = 0,
	NO_FIT               = 1,
	DERIVATIVE           = 2,
	NONSTANDARD_TOPOLOGY = 3,
	NONSTANDARD_ELEMENTS = 4,
	NONSTANDARD_ASPECT   = 5,
	INITIALS             = 6,
	CARTOON              = 7,
	PICTURE_STEMS        = 8,
	ORNAMENTED           = 9,
	TEXT_AND_BACKGROUND  = 10,
	COLLAGE              = 11,
	MONTAGE              = 12,
}

PANOSE_ASPECT :: enum i32 {
	ANY             = 0,
	NO_FIT          = 1,
	SUPER_CONDENSED = 2,
	VERY_CONDENSED  = 3,
	CONDENSED       = 4,
	NORMAL          = 5,
	EXTENDED        = 6,
	VERY_EXTENDED   = 7,
	SUPER_EXTENDED  = 8,
	MONOSPACED      = 9,
}

PANOSE_FILL :: enum i32 {
	ANY                 = 0,
	NO_FIT              = 1,
	STANDARD_SOLID_FILL = 2,
	NO_FILL             = 3,
	PATTERNED_FILL      = 4,
	COMPLEX_FILL        = 5,
	SHAPED_FILL         = 6,
	DRAWN_DISTRESSED    = 7,
}

PANOSE_LINING :: enum i32 {
	ANY      = 0,
	NO_FIT   = 1,
	NONE     = 2,
	INLINE   = 3,
	OUTLINE  = 4,
	ENGRAVED = 5,
	SHADOW   = 6,
	RELIEF   = 7,
	BACKDROP = 8,
}

PANOSE_DECORATIVE_TOPOLOGY :: enum i32 {
	ANY                      = 0,
	NO_FIT                   = 1,
	STANDARD                 = 2,
	SQUARE                   = 3,
	MULTIPLE_SEGMENT         = 4,
	ART_DECO                 = 5,
	UNEVEN_WEIGHTING         = 6,
	DIVERSE_ARMS             = 7,
	DIVERSE_FORMS            = 8,
	LOMBARDIC_FORMS          = 9,
	UPPER_CASE_IN_LOWER_CASE = 10,
	IMPLIED_TOPOLOGY         = 11,
	HORSESHOE_E_AND_A        = 12,
	CURSIVE                  = 13,
	BLACKLETTER              = 14,
	SWASH_VARIANCE           = 15,
}

PANOSE_CHARACTER_RANGES :: enum i32 {
	ANY                 = 0,
	NO_FIT              = 1,
	EXTENDED_COLLECTION = 2,
	LITERALS            = 3,
	NO_LOWER_CASE       = 4,
	SMALL_CAPS          = 5,
}

PANOSE_SYMBOL_KIND :: enum i32 {
	ANY               = 0,
	NO_FIT            = 1,
	MONTAGES          = 2,
	PICTURES          = 3,
	SHAPES            = 4,
	SCIENTIFIC        = 5,
	MUSIC             = 6,
	EXPERT            = 7,
	PATTERNS          = 8,
	BOARDERS          = 9,
	ICONS             = 10,
	LOGOS             = 11,
	INDUSTRY_SPECIFIC = 12,
}

PANOSE_SYMBOL_ASPECT_RATIO :: enum i32 {
	ANY                = 0,
	NO_FIT             = 1,
	NO_WIDTH           = 2,
	EXCEPTIONALLY_WIDE = 3,
	SUPER_WIDE         = 4,
	VERY_WIDE          = 5,
	WIDE               = 6,
	NORMAL             = 7,
	NARROW             = 8,
	VERY_NARROW        = 9,
}

OUTLINE_THRESHOLD :: enum i32 {
	ANTIALIASED = 0,
	ALIASED     = 1,
}

BASELINE :: enum i32 {
	DEFAULT            = 0,
	ROMAN              = 1,
	CENTRAL            = 2,
	MATH               = 3,
	HANGING            = 4,
	IDEOGRAPHIC_BOTTOM = 5,
	IDEOGRAPHIC_TOP    = 6,
	MINIMUM            = 7,
	MAXIMUM            = 8,
}

VERTICAL_GLYPH_ORIENTATION :: enum i32 {
	DEFAULT = 0,
	STACKED = 1,
}

GLYPH_ORIENTATION_ANGLE :: enum i32 {
	_0_DEGREES   = 0,
	_90_DEGREES  = 1,
	_180_DEGREES = 2,
	_270_DEGREES = 3,
}

FONT_METRICS1 :: struct {
	using _: FONT_METRICS,
	glyphBoxLeft:          i16,
	glyphBoxTop:           i16,
	glyphBoxRight:         i16,
	glyphBoxBottom:        i16,
	subscriptPositionX:    i16,
	subscriptPositionY:    i16,
	subscriptSizeX:        i16,
	subscriptSizeY:        i16,
	superscriptPositionX:  i16,
	superscriptPositionY:  i16,
	superscriptSizeX:      i16,
	superscriptSizeY:      i16,
	hasTypographicMetrics: BOOL,
}

CARET_METRICS :: struct {
	slopeRise: i16,
	slopeRun:  i16,
	offset:    i16,
}

PANOSE :: struct #raw_union {
	values:     [10]u8,
	familyKind: u8,
	text: struct {
		familyKind:      u8,
		serifStyle:      u8,
		weight:          u8,
		proportion:      u8,
		contrast:        u8,
		strokeVariation: u8,
		armStyle:        u8,
		letterform:      u8,
		midline:         u8,
		xHeight:         u8,
	},
	script: struct {
		familyKind:     u8,
		toolKind:       u8,
		weight:         u8,
		spacing:        u8,
		aspectRatio:    u8,
		contrast:       u8,
		scriptTopology: u8,
		scriptForm:     u8,
		finials:        u8,
		xAscent:        u8,
	},
	decorative: struct {
		familyKind:         u8,
		decorativeClass:    u8,
		weight:             u8,
		aspect:             u8,
		contrast:           u8,
		serifVariant:       u8,
		fill:               u8,
		lining:             u8,
		decorativeTopology: u8,
		characterRange:     u8,
	},
	symbol: struct {
		familyKind:             u8,
		symbolKind:             u8,
		weight:                 u8,
		spacing:                u8,
		aspectRatioAndContrast: u8,
		aspectRatio94:          u8,
		aspectRatio119:         u8,
		aspectRatio157:         u8,
		aspectRatio163:         u8,
		aspectRatio211:         u8,
	},
}

UNICODE_RANGE :: struct {
	first: u32,
	last:  u32,
}

SCRIPT_PROPERTIES :: struct {
	isoScriptCode:          u32,
	isoScriptNumber:        u32,
	clusterLookahead:       u32,
	justificationCharacter: u32,
	using _: bit_field u32 {
		restrictCaretToClusters:    u32 | 1,
		usesWordDividers:           u32 | 1,
		isDiscreteWriting:          u32 | 1,
		isBlockWriting:             u32 | 1,
		isDistributedWithinCluster: u32 | 1,
		isConnectedWriting:         u32 | 1,
		isCursiveWriting:           u32 | 1,
		reserved:                   u32 | 25,
	},
}

JUSTIFICATION_OPPORTUNITY :: struct {
	expansionMinimum:   f32,
	expansionMaximum:   f32,
	compressionMaximum: f32,
	using _: bit_field u32 {
		expansionPriority:        u32 | 8,
		compressionPriority:      u32 | 8,
		allowResidualExpansion:   u32 | 1,
		allowResidualCompression: u32 | 1,
		applyToLeadingEdge:       u32 | 1,
		applyToTrailingEdge:      u32 | 1,
		reserved:                 u32 | 12,
	},
}

IFactory1_UUID_STRING :: "30572f99-dac6-41db-a16e-0486307e606a"
IFactory1_UUID := &IID{0x30572f99, 0xdac6, 0x41db, {0xa1, 0x6e, 0x04, 0x86, 0x30, 0x7e, 0x60, 0x6a}}
IFactory1 :: struct #raw_union {
	#subtype idwritefactory: IFactory,
	using idwritefactory1_vtable: ^IFactory1_VTable,
}
IFactory1_VTable :: struct {
	using idwritefactory_vtable: IFactory_VTable,
	GetEudcFontCollection:        proc "system" (this: ^IFactory1, fontCollection: ^^IFontCollection, checkForUpdates: BOOL) -> HRESULT,
	CreateCustomRenderingParams2: proc "system" (this: ^IFactory1, gamma: f32, enhancedContrast: f32, enhancedContrastGrayscale: f32, clearTypeLevel: f32, pixelGeometry: PIXEL_GEOMETRY, renderingMode: RENDERING_MODE, renderingParams: ^^IRenderingParams1) -> HRESULT,
}

IFontFace1_UUID_STRING :: "a71efdb4-9fdb-4838-ad90-cfc3be8c3daf"
IFontFace1_UUID := &IID{0xa71efdb4, 0x9fdb, 0x4838, {0xad, 0x90, 0xcf, 0xc3, 0xbe, 0x8c, 0x3d, 0xaf}}
IFontFace1 :: struct #raw_union {
	#subtype idwritefontface: IFontFace,
	using idwritefontface1_vtable: ^IFontFace1_VTable,
}
IFontFace1_VTable :: struct {
	using idwritefontface_vtable: IFontFace_VTable,
	GetMetrics2:                   proc "system" (this: ^IFontFace1, fontMetrics: ^FONT_METRICS1),
	GetGdiCompatibleMetrics2:      proc "system" (this: ^IFontFace1, emSize: f32, pixelsPerDip: f32, transform: ^MATRIX, fontMetrics: ^FONT_METRICS1) -> HRESULT,
	GetCaretMetrics:               proc "system" (this: ^IFontFace1, caretMetrics: ^CARET_METRICS),
	GetUnicodeRanges:              proc "system" (this: ^IFontFace1, maxRangeCount: u32, unicodeRanges: [^]UNICODE_RANGE, actualRangeCount: ^u32) -> HRESULT,
	IsMonospacedFont:              proc "system" (this: ^IFontFace1) -> BOOL,
	GetDesignGlyphAdvances:        proc "system" (this: ^IFontFace1, glyphCount: u32, glyphIndices: [^]u16, glyphAdvances: [^]i32, isSideways: BOOL) -> HRESULT,
	GetGdiCompatibleGlyphAdvances: proc "system" (this: ^IFontFace1, emSize: f32, pixelsPerDip: f32, transform: ^MATRIX, useGdiNatural: BOOL, isSideways: BOOL, glyphCount: u32, glyphIndices: [^]u16, glyphAdvances: [^]i32) -> HRESULT,
	GetKerningPairAdjustments:     proc "system" (this: ^IFontFace1, glyphCount: u32, glyphIndices: [^]u16, glyphAdvanceAdjustments: [^]i32) -> HRESULT,
	HasKerningPairs:               proc "system" (this: ^IFontFace1) -> BOOL,
	GetRecommendedRenderingMode2:  proc "system" (this: ^IFontFace1, fontEmSize: f32, dpiX: f32, dpiY: f32, transform: ^MATRIX, isSideways: BOOL, outlineThreshold: OUTLINE_THRESHOLD, measuringMode: MEASURING_MODE, renderingMode: ^RENDERING_MODE) -> HRESULT,
	GetVerticalGlyphVariants:      proc "system" (this: ^IFontFace1, glyphCount: u32, nominalGlyphIndices: [^]u16, verticalGlyphIndices: [^]u16) -> HRESULT,
	HasVerticalGlyphVariants:      proc "system" (this: ^IFontFace1) -> BOOL,
}

IFont1_UUID_STRING :: "acd16696-8c14-4f5d-877e-fe3fc1d32738"
IFont1_UUID := &IID{0xacd16696, 0x8c14, 0x4f5d, {0x87, 0x7e, 0xfe, 0x3f, 0xc1, 0xd3, 0x27, 0x38}}
IFont1 :: struct #raw_union {
	#subtype idwritefont: IFont,
	using idwritefont1_vtable: ^IFont1_VTable,
}
IFont1_VTable :: struct {
	using idwritefont_vtable: IFont_VTable,
	GetMetrics2:      proc "system" (this: ^IFont1, fontMetrics: ^FONT_METRICS1),
	GetPanose:        proc "system" (this: ^IFont1, panose: ^PANOSE),
	GetUnicodeRanges: proc "system" (this: ^IFont1, maxRangeCount: u32, unicodeRanges: [^]UNICODE_RANGE, actualRangeCount: ^u32) -> HRESULT,
	IsMonospacedFont: proc "system" (this: ^IFont1) -> BOOL,
}

IRenderingParams1_UUID_STRING :: "94413cf4-a6fc-4248-8b50-6674348fcad3"
IRenderingParams1_UUID := &IID{0x94413cf4, 0xa6fc, 0x4248, {0x8b, 0x50, 0x66, 0x74, 0x34, 0x8f, 0xca, 0xd3}}
IRenderingParams1 :: struct #raw_union {
	#subtype idwriterenderingparams: IRenderingParams,
	using idwriterenderingparams1_vtable: ^IRenderingParams1_VTable,
}
IRenderingParams1_VTable :: struct {
	using idwriterenderingparams_vtable: IRenderingParams_VTable,
	GetGrayscaleEnhancedContrast: proc "system" (this: ^IRenderingParams1) -> f32,
}

ITextAnalyzer1_UUID_STRING :: "80DAD800-E21F-4E83-96CE-BFCCE500DB7C"
ITextAnalyzer1_UUID := &IID{0x80DAD800, 0xE21F, 0x4E83, {0x96, 0xCE, 0xBF, 0xCC, 0xE5, 0x00, 0xDB, 0x7C}}
ITextAnalyzer1 :: struct #raw_union {
	#subtype idwritetextanalyzer: ITextAnalyzer,
	using idwritetextanalyzer1_vtable: ^ITextAnalyzer1_VTable,
}
ITextAnalyzer1_VTable :: struct {
	using idwritetextanalyzer_vtable: ITextAnalyzer_VTable,
	ApplyCharacterSpacing:           proc "system" (this: ^ITextAnalyzer1, leadingSpacing: f32, trailingSpacing: f32, minimumAdvanceWidth: f32, textLength: u32, glyphCount: u32, clusterMap: [^]u16, glyphAdvances: [^]f32, glyphOffsets: [^]GLYPH_OFFSET, glyphProperties: [^]SHAPING_GLYPH_PROPERTIES, modifiedGlyphAdvances: [^]f32, modifiedGlyphOffsets: [^]GLYPH_OFFSET) -> HRESULT,
	GetBaseline:                     proc "system" (this: ^ITextAnalyzer1, fontFace: ^IFontFace, baseline: BASELINE, isVertical: BOOL, isSimulationAllowed: BOOL, scriptAnalysis: SCRIPT_ANALYSIS, localeName: LPCWSTR, baselineCoordinate: ^i32, exists: ^BOOL) -> HRESULT,
	AnalyzeVerticalGlyphOrientation: proc "system" (this: ^ITextAnalyzer1, analysisSource: ^ITextAnalysisSource1, textPosition: u32, textLength: u32, analysisSink: ^ITextAnalysisSink1) -> HRESULT,
	GetGlyphOrientationTransform:    proc "system" (this: ^ITextAnalyzer1, glyphOrientationAngle: GLYPH_ORIENTATION_ANGLE, isSideways: BOOL, transform: ^MATRIX) -> HRESULT,
	GetScriptProperties:             proc "system" (this: ^ITextAnalyzer1, scriptAnalysis: SCRIPT_ANALYSIS, scriptProperties: ^SCRIPT_PROPERTIES) -> HRESULT,
	GetTextComplexity:               proc "system" (this: ^ITextAnalyzer1, textString: [^]WCHAR, textLength: u32, fontFace: ^IFontFace, isTextSimple: ^BOOL, textLengthRead: ^u32, glyphIndices: [^]u16) -> HRESULT,
	GetJustificationOpportunities:   proc "system" (this: ^ITextAnalyzer1, fontFace: ^IFontFace, fontEmSize: f32, scriptAnalysis: SCRIPT_ANALYSIS, textLength: u32, glyphCount: u32, textString: [^]WCHAR, clusterMap: [^]u16, glyphProperties: [^]SHAPING_GLYPH_PROPERTIES, justificationOpportunities: [^]JUSTIFICATION_OPPORTUNITY) -> HRESULT,
	JustifyGlyphAdvances:            proc "system" (this: ^ITextAnalyzer1, lineWidth: f32, glyphCount: u32, justificationOpportunities: [^]JUSTIFICATION_OPPORTUNITY, glyphAdvances: [^]f32, glyphOffsets: [^]GLYPH_OFFSET, justifiedGlyphAdvances: [^]f32, justifiedGlyphOffsets: [^]GLYPH_OFFSET) -> HRESULT,
	GetJustifiedGlyphs:              proc "system" (this: ^ITextAnalyzer1, fontFace: ^IFontFace, fontEmSize: f32, scriptAnalysis: SCRIPT_ANALYSIS, textLength: u32, glyphCount: u32, maxGlyphCount: u32, clusterMap: [^]u16, glyphIndices: [^]u16, glyphAdvances: [^]f32, justifiedGlyphAdvances: [^]f32, justifiedGlyphOffsets: [^]GLYPH_OFFSET, glyphProperties: [^]SHAPING_GLYPH_PROPERTIES, actualGlyphCount: ^u32, modifiedClusterMap: [^]u16, modifiedGlyphIndices: [^]u16, modifiedGlyphAdvances: [^]f32, modifiedGlyphOffsets: [^]GLYPH_OFFSET) -> HRESULT,
}

ITextAnalysisSource1_UUID_STRING :: "639CFAD8-0FB4-4B21-A58A-067920120009"
ITextAnalysisSource1_UUID := &IID{0x639CFAD8, 0x0FB4, 0x4B21, {0xA5, 0x8A, 0x06, 0x79, 0x20, 0x12, 0x00, 0x09}}
ITextAnalysisSource1 :: struct #raw_union {
	#subtype idwritetextanalysissource: ITextAnalysisSource,
	using idwritetextanalysissource1_vtable: ^ITextAnalysisSource1_VTable,
}
ITextAnalysisSource1_VTable :: struct {
	using idwritetextanalysissource_vtable: ITextAnalysisSource_VTable,
	GetVerticalGlyphOrientation: proc "system" (this: ^ITextAnalysisSource1, textPosition: u32, textLength: ^u32, glyphOrientation: ^VERTICAL_GLYPH_ORIENTATION, bidiLevel: ^u8) -> HRESULT,
}

ITextAnalysisSink1_UUID_STRING :: "B0D941A0-85E7-4D8B-9FD3-5CED9934482A"
ITextAnalysisSink1_UUID := &IID{0xB0D941A0, 0x85E7, 0x4D8B, {0x9F, 0xD3, 0x5C, 0xED, 0x99, 0x34, 0x48, 0x2A}}
ITextAnalysisSink1 :: struct #raw_union {
	#subtype idwritetextanalysissink: ITextAnalysisSink,
	using idwritetextanalysissink1_vtable: ^ITextAnalysisSink1_VTable,
}
ITextAnalysisSink1_VTable :: struct {
	using idwritetextanalysissink_vtable: ITextAnalysisSink_VTable,
	SetGlyphOrientation: proc "system" (this: ^ITextAnalysisSink1, textPosition: u32, textLength: u32, glyphOrientationAngle: GLYPH_ORIENTATION_ANGLE, adjustedBidiLevel: u8, isSideways: BOOL, isRightToLeft: BOOL) -> HRESULT,
}

ITextLayout1_UUID_STRING :: "9064D822-80A7-465C-A986-DF65F78B8FEB"
ITextLayout1_UUID := &IID{0x9064D822, 0x80A7, 0x465C, {0xA9, 0x86, 0xDF, 0x65, 0xF7, 0x8B, 0x8F, 0xEB}}
ITextLayout1 :: struct #raw_union {
	#subtype idwritetextlayout: ITextLayout,
	using idwritetextlayout1_vtable: ^ITextLayout1_VTable,
}
ITextLayout1_VTable :: struct {
	using idwritetextlayout_vtable: ITextLayout_VTable,
	SetPairKerning:      proc "system" (this: ^ITextLayout1, isPairKerningEnabled: BOOL, textRange: TEXT_RANGE) -> HRESULT,
	GetPairKerning:      proc "system" (this: ^ITextLayout1, currentPosition: u32, isPairKerningEnabled: ^BOOL, textRange: ^TEXT_RANGE) -> HRESULT,
	SetCharacterSpacing: proc "system" (this: ^ITextLayout1, leadingSpacing: f32, trailingSpacing: f32, minimumAdvanceWidth: f32, textRange: TEXT_RANGE) -> HRESULT,
	GetCharacterSpacing: proc "system" (this: ^ITextLayout1, currentPosition: u32, leadingSpacing: ^f32, trailingSpacing: ^f32, minimumAdvanceWidth: ^f32, textRange: ^TEXT_RANGE) -> HRESULT,
}

TEXT_ANTIALIAS_MODE :: enum i32 {
	CLEARTYPE = 0,
	GRAYSCALE = 1,
}

IBitmapRenderTarget1_UUID_STRING :: "791e8298-3ef3-4230-9880-c9bdecc42064"
IBitmapRenderTarget1_UUID := &IID{0x791e8298, 0x3ef3, 0x4230, {0x98, 0x80, 0xc9, 0xbd, 0xec, 0xc4, 0x20, 0x64}}
IBitmapRenderTarget1 :: struct #raw_union {
	#subtype idwritebitmaprendertarget: IBitmapRenderTarget,
	using idwritebitmaprendertarget1_vtable: ^IBitmapRenderTarget1_VTable,
}
IBitmapRenderTarget1_VTable :: struct {
	using idwritebitmaprendertarget_vtable: IBitmapRenderTarget_VTable,
	GetTextAntialiasMode: proc "system" (this: ^IBitmapRenderTarget1) -> TEXT_ANTIALIAS_MODE,
	SetTextAntialiasMode: proc "system" (this: ^IBitmapRenderTarget1, antialiasMode: TEXT_ANTIALIAS_MODE) -> HRESULT,
}


OPTICAL_ALIGNMENT :: enum i32 {
	NONE             = 0,
	NO_SIDE_BEARINGS = 1,
}

GRID_FIT_MODE :: enum i32 {
	DEFAULT  = 0,
	DISABLED = 1,
	ENABLED  = 2,
}

TEXT_METRICS1 :: struct {
	using _: TEXT_METRICS,
	heightIncludingTrailingWhitespace: f32,
}

ITextRenderer1_UUID_STRING :: "D3E0E934-22A0-427E-AAE4-7D9574B59DB1"
ITextRenderer1_UUID := &IID{0xD3E0E934, 0x22A0, 0x427E, {0xAA, 0xE4, 0x7D, 0x95, 0x74, 0xB5, 0x9D, 0xB1}}
ITextRenderer1 :: struct #raw_union {
	#subtype idwritetextrenderer: ITextRenderer,
	using idwritetextrenderer1_vtable: ^ITextRenderer1_VTable,
}
ITextRenderer1_VTable :: struct {
	using idwritetextrenderer_vtable: ITextRenderer_VTable,
	DrawGlyphRun2:      proc "system" (this: ^ITextRenderer1, clientDrawingContext: rawptr, baselineOriginX: f32, baselineOriginY: f32, orientationAngle: GLYPH_ORIENTATION_ANGLE, measuringMode: MEASURING_MODE, glyphRun: ^GLYPH_RUN, glyphRunDescription: ^GLYPH_RUN_DESCRIPTION, clientDrawingEffect: ^IUnknown) -> HRESULT,
	DrawUnderline2:     proc "system" (this: ^ITextRenderer1, clientDrawingContext: rawptr, baselineOriginX: f32, baselineOriginY: f32, orientationAngle: GLYPH_ORIENTATION_ANGLE, underline: ^UNDERLINE, clientDrawingEffect: ^IUnknown) -> HRESULT,
	DrawStrikethrough2: proc "system" (this: ^ITextRenderer1, clientDrawingContext: rawptr, baselineOriginX: f32, baselineOriginY: f32, orientationAngle: GLYPH_ORIENTATION_ANGLE, strikethrough: ^STRIKETHROUGH, clientDrawingEffect: ^IUnknown) -> HRESULT,
	DrawInlineObject2:  proc "system" (this: ^ITextRenderer1, clientDrawingContext: rawptr, originX: f32, originY: f32, orientationAngle: GLYPH_ORIENTATION_ANGLE, inlineObject: ^IInlineObject, isSideways: BOOL, isRightToLeft: BOOL, clientDrawingEffect: ^IUnknown) -> HRESULT,
}

ITextFormat1_UUID_STRING :: "5F174B49-0D8B-4CFB-8BCA-F1CCE9D06C67"
ITextFormat1_UUID := &IID{0x5F174B49, 0x0D8B, 0x4CFB, {0x8B, 0xCA, 0xF1, 0xCC, 0xE9, 0xD0, 0x6C, 0x67}}
ITextFormat1 :: struct #raw_union {
	#subtype idwritetextformat: ITextFormat,
	using idwritetextformat1_vtable: ^ITextFormat1_VTable,
}
ITextFormat1_VTable :: struct {
	using idwritetextformat_vtable: ITextFormat_VTable,
	SetVerticalGlyphOrientation: proc "system" (this: ^ITextFormat1, glyphOrientation: VERTICAL_GLYPH_ORIENTATION) -> HRESULT,
	GetVerticalGlyphOrientation: proc "system" (this: ^ITextFormat1) -> VERTICAL_GLYPH_ORIENTATION,
	SetLastLineWrapping:         proc "system" (this: ^ITextFormat1, isLastLineWrappingEnabled: BOOL) -> HRESULT,
	GetLastLineWrapping:         proc "system" (this: ^ITextFormat1) -> BOOL,
	SetOpticalAlignment:         proc "system" (this: ^ITextFormat1, opticalAlignment: OPTICAL_ALIGNMENT) -> HRESULT,
	GetOpticalAlignment:         proc "system" (this: ^ITextFormat1) -> OPTICAL_ALIGNMENT,
	SetFontFallback:             proc "system" (this: ^ITextFormat1, fontFallback: ^IFontFallback) -> HRESULT,
	GetFontFallback:             proc "system" (this: ^ITextFormat1, fontFallback: ^^IFontFallback) -> HRESULT,
}

ITextLayout2_UUID_STRING :: "1093C18F-8D5E-43F0-B064-0917311B525E"
ITextLayout2_UUID := &IID{0x1093C18F, 0x8D5E, 0x43F0, {0xB0, 0x64, 0x09, 0x17, 0x31, 0x1B, 0x52, 0x5E}}
ITextLayout2 :: struct #raw_union {
	#subtype idwritetextlayout1: ITextLayout1,
	using idwritetextlayout2_vtable: ^ITextLayout2_VTable,
}
ITextLayout2_VTable :: struct {
	using idwritetextlayout1_vtable: ITextLayout1_VTable,
	GetMetrics2:                 proc "system" (this: ^ITextLayout2, textMetrics: ^TEXT_METRICS1) -> HRESULT,
	SetVerticalGlyphOrientation: proc "system" (this: ^ITextLayout2, glyphOrientation: VERTICAL_GLYPH_ORIENTATION) -> HRESULT,
	GetVerticalGlyphOrientation: proc "system" (this: ^ITextLayout2) -> VERTICAL_GLYPH_ORIENTATION,
	SetLastLineWrapping:         proc "system" (this: ^ITextLayout2, isLastLineWrappingEnabled: BOOL) -> HRESULT,
	GetLastLineWrapping:         proc "system" (this: ^ITextLayout2) -> BOOL,
	SetOpticalAlignment:         proc "system" (this: ^ITextLayout2, opticalAlignment: OPTICAL_ALIGNMENT) -> HRESULT,
	GetOpticalAlignment:         proc "system" (this: ^ITextLayout2) -> OPTICAL_ALIGNMENT,
	SetFontFallback:             proc "system" (this: ^ITextLayout2, fontFallback: ^IFontFallback) -> HRESULT,
	GetFontFallback:             proc "system" (this: ^ITextLayout2, fontFallback: ^^IFontFallback) -> HRESULT,
}

ITextAnalyzer2_UUID_STRING :: "553A9FF3-5693-4DF7-B52B-74806F7F2EB9"
ITextAnalyzer2_UUID := &IID{0x553A9FF3, 0x5693, 0x4DF7, {0xB5, 0x2B, 0x74, 0x80, 0x6F, 0x7F, 0x2E, 0xB9}}
ITextAnalyzer2 :: struct #raw_union {
	#subtype idwritetextanalyzer1: ITextAnalyzer1,
	using idwritetextanalyzer2_vtable: ^ITextAnalyzer2_VTable,
}
ITextAnalyzer2_VTable :: struct {
	using idwritetextanalyzer1_vtable: ITextAnalyzer1_VTable,
	GetGlyphOrientationTransform2: proc "system" (this: ^ITextAnalyzer2, glyphOrientationAngle: GLYPH_ORIENTATION_ANGLE, isSideways: BOOL, originX: f32, originY: f32, transform: ^MATRIX) -> HRESULT,
	GetTypographicFeatures:        proc "system" (this: ^ITextAnalyzer2, fontFace: ^IFontFace, scriptAnalysis: SCRIPT_ANALYSIS, localeName: LPCWSTR, maxTagCount: u32, actualTagCount: ^u32, tags: [^]FONT_FEATURE_TAG) -> HRESULT,
	CheckTypographicFeature:       proc "system" (this: ^ITextAnalyzer2, fontFace: ^IFontFace, scriptAnalysis: SCRIPT_ANALYSIS, localeName: LPCWSTR, featureTag: FONT_FEATURE_TAG, glyphCount: u32, glyphIndices: [^]u16, featureApplies: [^]u8) -> HRESULT,
}

IFontFallback_UUID_STRING :: "EFA008F9-F7A1-48BF-B05C-F224713CC0FF"
IFontFallback_UUID := &IID{0xEFA008F9, 0xF7A1, 0x48BF, {0xB0, 0x5C, 0xF2, 0x24, 0x71, 0x3C, 0xC0, 0xFF}}
IFontFallback :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfallback_vtable: ^IFontFallback_VTable,
}
IFontFallback_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	MapCharacters: proc "system" (this: ^IFontFallback, analysisSource: ^ITextAnalysisSource, textPosition: u32, textLength: u32, baseFontCollection: ^IFontCollection, baseFamilyName: LPCWSTR, baseWeight: FONT_WEIGHT, baseStyle: FONT_STYLE, baseStretch: FONT_STRETCH, mappedLength: ^u32, mappedFont: ^^IFont, scale: ^f32) -> HRESULT,
}

IFontFallbackBuilder_UUID_STRING :: "FD882D06-8ABA-4FB8-B849-8BE8B73E14DE"
IFontFallbackBuilder_UUID := &IID{0xFD882D06, 0x8ABA, 0x4FB8, {0xB8, 0x49, 0x8B, 0xE8, 0xB7, 0x3E, 0x14, 0xDE}}
IFontFallbackBuilder :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfallbackbuilder_vtable: ^IFontFallbackBuilder_VTable,
}
IFontFallbackBuilder_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddMapping:         proc "system" (this: ^IFontFallbackBuilder, ranges: [^]UNICODE_RANGE, rangesCount: u32, targetFamilyNames: [^]LPCWSTR, targetFamilyNamesCount: u32, fontCollection: ^IFontCollection, localeName: LPCWSTR, baseFamilyName: LPCWSTR, scale: f32) -> HRESULT,
	AddMappings:        proc "system" (this: ^IFontFallbackBuilder, fontFallback: ^IFontFallback) -> HRESULT,
	CreateFontFallback: proc "system" (this: ^IFontFallbackBuilder, fontFallback: ^^IFontFallback) -> HRESULT,
}

COLOR_F :: D3DCOLORVALUE

IFont2_UUID_STRING :: "29748ed6-8c9c-4a6a-be0b-d912e8538944"
IFont2_UUID := &IID{0x29748ed6, 0x8c9c, 0x4a6a, {0xbe, 0x0b, 0xd9, 0x12, 0xe8, 0x53, 0x89, 0x44}}
IFont2 :: struct #raw_union {
	#subtype idwritefont1: IFont1,
	using idwritefont2_vtable: ^IFont2_VTable,
}
IFont2_VTable :: struct {
	using idwritefont1_vtable: IFont1_VTable,
	IsColorFont: proc "system" (this: ^IFont2) -> BOOL,
}

IFontFace2_UUID_STRING :: "d8b768ff-64bc-4e66-982b-ec8e87f693f7"
IFontFace2_UUID := &IID{0xd8b768ff, 0x64bc, 0x4e66, {0x98, 0x2b, 0xec, 0x8e, 0x87, 0xf6, 0x93, 0xf7}}
IFontFace2 :: struct #raw_union {
	#subtype idwritefontface1: IFontFace1,
	using idwritefontface2_vtable: ^IFontFace2_VTable,
}
IFontFace2_VTable :: struct {
	using idwritefontface1_vtable: IFontFace1_VTable,
	IsColorFont:                  proc "system" (this: ^IFontFace2) -> BOOL,
	GetColorPaletteCount:         proc "system" (this: ^IFontFace2) -> u32,
	GetPaletteEntryCount:         proc "system" (this: ^IFontFace2) -> u32,
	GetPaletteEntries:            proc "system" (this: ^IFontFace2, colorPaletteIndex: u32, firstEntryIndex: u32, entryCount: u32, paletteEntries: [^]COLOR_F) -> HRESULT,
	GetRecommendedRenderingMode3: proc "system" (this: ^IFontFace2, fontEmSize: f32, dpiX: f32, dpiY: f32, transform: ^MATRIX, isSideways: BOOL, outlineThreshold: OUTLINE_THRESHOLD, measuringMode: MEASURING_MODE, renderingParams: ^IRenderingParams, renderingMode: ^RENDERING_MODE, gridFitMode: ^GRID_FIT_MODE) -> HRESULT,
}

NO_PALETTE_INDEX :: 0xFFFF

COLOR_GLYPH_RUN :: struct {
	glyphRun:            GLYPH_RUN,
	glyphRunDescription: ^GLYPH_RUN_DESCRIPTION,
	baselineOriginX:     f32,
	baselineOriginY:     f32,
	runColor:            COLOR_F,
	paletteIndex:        u16,
}

IColorGlyphRunEnumerator_UUID_STRING :: "d31fbe17-f157-41a2-8d24-cb779e0560e8"
IColorGlyphRunEnumerator_UUID := &IID{0xd31fbe17, 0xf157, 0x41a2, {0x8d, 0x24, 0xcb, 0x77, 0x9e, 0x05, 0x60, 0xe8}}
IColorGlyphRunEnumerator :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritecolorglyphrunenumerator_vtable: ^IColorGlyphRunEnumerator_VTable,
}
IColorGlyphRunEnumerator_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	MoveNext:      proc "system" (this: ^IColorGlyphRunEnumerator, hasRun: ^BOOL) -> HRESULT,
	GetCurrentRun: proc "system" (this: ^IColorGlyphRunEnumerator, colorGlyphRun: ^^COLOR_GLYPH_RUN) -> HRESULT,
}

IRenderingParams2_UUID_STRING :: "F9D711C3-9777-40AE-87E8-3E5AF9BF0948"
IRenderingParams2_UUID := &IID{0xF9D711C3, 0x9777, 0x40AE, {0x87, 0xE8, 0x3E, 0x5A, 0xF9, 0xBF, 0x09, 0x48}}
IRenderingParams2 :: struct #raw_union {
	#subtype idwriterenderingparams1: IRenderingParams1,
	using idwriterenderingparams2_vtable: ^IRenderingParams2_VTable,
}
IRenderingParams2_VTable :: struct {
	using idwriterenderingparams1_vtable: IRenderingParams1_VTable,
	GetGridFitMode: proc "system" (this: ^IRenderingParams2) -> GRID_FIT_MODE,
}

IFactory2_UUID_STRING :: "0439fc60-ca44-4994-8dee-3a9af7b732ec"
IFactory2_UUID := &IID{0x0439fc60, 0xca44, 0x4994, {0x8d, 0xee, 0x3a, 0x9a, 0xf7, 0xb7, 0x32, 0xec}}
IFactory2 :: struct #raw_union {
	#subtype idwritefactory1: IFactory1,
	using idwritefactory2_vtable: ^IFactory2_VTable,
}
IFactory2_VTable :: struct {
	using idwritefactory1_vtable: IFactory1_VTable,
	GetSystemFontFallback:        proc "system" (this: ^IFactory2, fontFallback: ^^IFontFallback) -> HRESULT,
	CreateFontFallbackBuilder:    proc "system" (this: ^IFactory2, fontFallbackBuilder: ^^IFontFallbackBuilder) -> HRESULT,
	TranslateColorGlyphRun:       proc "system" (this: ^IFactory2, baselineOriginX: f32, baselineOriginY: f32, glyphRun: ^GLYPH_RUN, glyphRunDescription: ^GLYPH_RUN_DESCRIPTION, measuringMode: MEASURING_MODE, worldToDeviceTransform: ^MATRIX, colorPaletteIndex: u32, colorLayers: ^^IColorGlyphRunEnumerator) -> HRESULT,
	CreateCustomRenderingParams3: proc "system" (this: ^IFactory2, gamma: f32, enhancedContrast: f32, grayscaleEnhancedContrast: f32, clearTypeLevel: f32, pixelGeometry: PIXEL_GEOMETRY, renderingMode: RENDERING_MODE, gridFitMode: GRID_FIT_MODE, renderingParams: ^^IRenderingParams2) -> HRESULT,
	CreateGlyphRunAnalysis2:      proc "system" (this: ^IFactory2, glyphRun: ^GLYPH_RUN, transform: ^MATRIX, renderingMode: RENDERING_MODE, measuringMode: MEASURING_MODE, gridFitMode: GRID_FIT_MODE, antialiasMode: TEXT_ANTIALIAS_MODE, baselineOriginX: f32, baselineOriginY: f32, glyphRunAnalysis: ^^IGlyphRunAnalysis) -> HRESULT,
}


FONT_PROPERTY_ID :: enum i32 {
	NONE                             = 0,
	WEIGHT_STRETCH_STYLE_FAMILY_NAME = 1,
	TYPOGRAPHIC_FAMILY_NAME          = 2,
	WEIGHT_STRETCH_STYLE_FACE_NAME   = 3,
	FULL_NAME                        = 4,
	WIN32_FAMILY_NAME                = 5,
	POSTSCRIPT_NAME                  = 6,
	DESIGN_SCRIPT_LANGUAGE_TAG       = 7,
	SUPPORTED_SCRIPT_LANGUAGE_TAG    = 8,
	SEMANTIC_TAG                     = 9,
	WEIGHT                           = 10,
	STRETCH                          = 11,
	STYLE                            = 12,
	TYPOGRAPHIC_FACE_NAME            = 13,
	TOTAL                            = STYLE + 1,
	TOTAL_RS3                        = TYPOGRAPHIC_FACE_NAME + 1,
	PREFERRED_FAMILY_NAME            = TYPOGRAPHIC_FAMILY_NAME,
	FAMILY_NAME                      = WEIGHT_STRETCH_STYLE_FAMILY_NAME,
	FACE_NAME                        = WEIGHT_STRETCH_STYLE_FACE_NAME,
}

FONT_PROPERTY :: struct {
	propertyId:    FONT_PROPERTY_ID,
	propertyValue: LPCWSTR,
	localeName:    LPCWSTR,
}

LOCALITY :: enum i32 {
	REMOTE  = 0,
	PARTIAL = 1,
	LOCAL   = 2,
}

RENDERING_MODE1 :: enum i32 {
	DEFAULT                       = 0,
	ALIASED                       = 1,
	GDI_CLASSIC                   = 2,
	GDI_NATURAL                   = 3,
	NATURAL                       = 4,
	NATURAL_SYMMETRIC             = 5,
	OUTLINE                       = 6,
	NATURAL_SYMMETRIC_DOWNSAMPLED = 7,
}

IRenderingParams3_UUID_STRING :: "B7924BAA-391B-412A-8C5C-E44CC2D867DC"
IRenderingParams3_UUID := &IID{0xB7924BAA, 0x391B, 0x412A, {0x8C, 0x5C, 0xE4, 0x4C, 0xC2, 0xD8, 0x67, 0xDC}}
IRenderingParams3 :: struct #raw_union {
	#subtype idwriterenderingparams2: IRenderingParams2,
	using idwriterenderingparams3_vtable: ^IRenderingParams3_VTable,
}
IRenderingParams3_VTable :: struct {
	using idwriterenderingparams2_vtable: IRenderingParams2_VTable,
	GetRenderingMode1: proc "system" (this: ^IRenderingParams3) -> RENDERING_MODE1,
}

IFactory3_UUID_STRING :: "9A1B41C3-D3BB-466A-87FC-FE67556A3B65"
IFactory3_UUID := &IID{0x9A1B41C3, 0xD3BB, 0x466A, {0x87, 0xFC, 0xFE, 0x67, 0x55, 0x6A, 0x3B, 0x65}}
IFactory3 :: struct #raw_union {
	#subtype idwritefactory2: IFactory2,
	using idwritefactory3_vtable: ^IFactory3_VTable,
}
IFactory3_VTable :: struct {
	using idwritefactory2_vtable: IFactory2_VTable,
	CreateGlyphRunAnalysis3:         proc "system" (this: ^IFactory3, glyphRun: ^GLYPH_RUN, transform: ^MATRIX, renderingMode: RENDERING_MODE1, measuringMode: MEASURING_MODE, gridFitMode: GRID_FIT_MODE, antialiasMode: TEXT_ANTIALIAS_MODE, baselineOriginX: f32, baselineOriginY: f32, glyphRunAnalysis: ^^IGlyphRunAnalysis) -> HRESULT,
	CreateCustomRenderingParams4:    proc "system" (this: ^IFactory3, gamma: f32, enhancedContrast: f32, grayscaleEnhancedContrast: f32, clearTypeLevel: f32, pixelGeometry: PIXEL_GEOMETRY, renderingMode: RENDERING_MODE1, gridFitMode: GRID_FIT_MODE, renderingParams: ^^IRenderingParams3) -> HRESULT,
	CreateFontFaceReference:         proc "system" (this: ^IFactory3, fontFile: ^IFontFile, faceIndex: u32, fontSimulations: FONT_SIMULATIONS, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
	CreateFontFaceReference2:        proc "system" (this: ^IFactory3, filePath: LPCWSTR, lastWriteTime: ^FILETIME, faceIndex: u32, fontSimulations: FONT_SIMULATIONS, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
	GetSystemFontSet:                proc "system" (this: ^IFactory3, fontSet: ^^IFontSet) -> HRESULT,
	CreateFontSetBuilder:            proc "system" (this: ^IFactory3, fontSetBuilder: ^^IFontSetBuilder) -> HRESULT,
	CreateFontCollectionFromFontSet: proc "system" (this: ^IFactory3, fontSet: ^IFontSet, fontCollection: ^^IFontCollection1) -> HRESULT,
	GetSystemFontCollection2:        proc "system" (this: ^IFactory3, includeDownloadableFonts: BOOL, fontCollection: ^^IFontCollection1, checkForUpdates: BOOL) -> HRESULT,
	GetFontDownloadQueue:            proc "system" (this: ^IFactory3, fontDownloadQueue: ^^IFontDownloadQueue) -> HRESULT,
}

IFontSet_UUID_STRING :: "53585141-D9F8-4095-8321-D73CF6BD116B"
IFontSet_UUID := &IID{0x53585141, 0xD9F8, 0x4095, {0x83, 0x21, 0xD7, 0x3C, 0xF6, 0xBD, 0x11, 0x6B}}
IFontSet :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontset_vtable: ^IFontSet_VTable,
}
IFontSet_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetFontCount:               proc "system" (this: ^IFontSet) -> u32,
	GetFontFaceReference:       proc "system" (this: ^IFontSet, listIndex: u32, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
	FindFontFaceReference:      proc "system" (this: ^IFontSet, fontFaceReference: ^IFontFaceReference, listIndex: ^u32, exists: ^BOOL) -> HRESULT,
	FindFontFace:               proc "system" (this: ^IFontSet, fontFace: ^IFontFace, listIndex: ^u32, exists: ^BOOL) -> HRESULT,
	GetPropertyValues:          proc "system" (this: ^IFontSet, propertyID: FONT_PROPERTY_ID, values: ^^IStringList) -> HRESULT,
	GetPropertyValues2:         proc "system" (this: ^IFontSet, propertyID: FONT_PROPERTY_ID, preferredLocaleNames: LPCWSTR, values: ^^IStringList) -> HRESULT,
	GetPropertyValues3:         proc "system" (this: ^IFontSet, listIndex: u32, propertyId: FONT_PROPERTY_ID, exists: ^BOOL, values: ^^ILocalizedStrings) -> HRESULT,
	GetPropertyOccurrenceCount: proc "system" (this: ^IFontSet, property: ^FONT_PROPERTY, propertyOccurrenceCount: ^u32) -> HRESULT,
	GetMatchingFonts:           proc "system" (this: ^IFontSet, familyName: LPCWSTR, fontWeight: FONT_WEIGHT, fontStretch: FONT_STRETCH, fontStyle: FONT_STYLE, filteredSet: ^^IFontSet) -> HRESULT,
	GetMatchingFonts2:          proc "system" (this: ^IFontSet, properties: [^]FONT_PROPERTY, propertyCount: u32, filteredSet: ^^IFontSet) -> HRESULT,
}

IFontSetBuilder_UUID_STRING :: "2F642AFE-9C68-4F40-B8BE-457401AFCB3D"
IFontSetBuilder_UUID := &IID{0x2F642AFE, 0x9C68, 0x4F40, {0xB8, 0xBE, 0x45, 0x74, 0x01, 0xAF, 0xCB, 0x3D}}
IFontSetBuilder :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontsetbuilder_vtable: ^IFontSetBuilder_VTable,
}
IFontSetBuilder_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddFontFaceReference:  proc "system" (this: ^IFontSetBuilder, fontFaceReference: ^IFontFaceReference, properties: [^]FONT_PROPERTY, propertyCount: u32) -> HRESULT,
	AddFontFaceReference2: proc "system" (this: ^IFontSetBuilder, fontFaceReference: ^IFontFaceReference) -> HRESULT,
	AddFontSet:            proc "system" (this: ^IFontSetBuilder, fontSet: ^IFontSet) -> HRESULT,
	CreateFontSet:         proc "system" (this: ^IFontSetBuilder, fontSet: ^^IFontSet) -> HRESULT,
}

IFontCollection1_UUID_STRING :: "53585141-D9F8-4095-8321-D73CF6BD116C"
IFontCollection1_UUID := &IID{0x53585141, 0xD9F8, 0x4095, {0x83, 0x21, 0xD7, 0x3C, 0xF6, 0xBD, 0x11, 0x6C}}
IFontCollection1 :: struct #raw_union {
	#subtype idwritefontcollection: IFontCollection,
	using idwritefontcollection1_vtable: ^IFontCollection1_VTable,
}
IFontCollection1_VTable :: struct {
	using idwritefontcollection_vtable: IFontCollection_VTable,
	GetFontSet:     proc "system" (this: ^IFontCollection1, fontSet: ^^IFontSet) -> HRESULT,
	GetFontFamily2: proc "system" (this: ^IFontCollection1, index: u32, fontFamily: ^^IFontFamily1) -> HRESULT,
}

IFontFamily1_UUID_STRING :: "DA20D8EF-812A-4C43-9802-62EC4ABD7ADF"
IFontFamily1_UUID := &IID{0xDA20D8EF, 0x812A, 0x4C43, {0x98, 0x02, 0x62, 0xEC, 0x4A, 0xBD, 0x7A, 0xDF}}
IFontFamily1 :: struct #raw_union {
	#subtype idwritefontfamily: IFontFamily,
	using idwritefontfamily1_vtable: ^IFontFamily1_VTable,
}
IFontFamily1_VTable :: struct {
	using idwritefontfamily_vtable: IFontFamily_VTable,
	GetFontLocality:      proc "system" (this: ^IFontFamily1, listIndex: u32) -> LOCALITY,
	GetFont2:             proc "system" (this: ^IFontFamily1, listIndex: u32, font: ^^IFont3) -> HRESULT,
	GetFontFaceReference: proc "system" (this: ^IFontFamily1, listIndex: u32, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
}

IFontList1_UUID_STRING :: "DA20D8EF-812A-4C43-9802-62EC4ABD7ADE"
IFontList1_UUID := &IID{0xDA20D8EF, 0x812A, 0x4C43, {0x98, 0x02, 0x62, 0xEC, 0x4A, 0xBD, 0x7A, 0xDE}}
IFontList1 :: struct #raw_union {
	#subtype idwritefontlist: IFontList,
	using idwritefontlist1_vtable: ^IFontList1_VTable,
}
IFontList1_VTable :: struct {
	using idwritefontlist_vtable: IFontList_VTable,
	GetFontLocality:      proc "system" (this: ^IFontList1, listIndex: u32) -> LOCALITY,
	GetFont2:             proc "system" (this: ^IFontList1, listIndex: u32, font: ^^IFont3) -> HRESULT,
	GetFontFaceReference: proc "system" (this: ^IFontList1, listIndex: u32, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
}

IFontFaceReference_UUID_STRING :: "5E7FA7CA-DDE3-424C-89F0-9FCD6FED58CD"
IFontFaceReference_UUID := &IID{0x5E7FA7CA, 0xDDE3, 0x424C, {0x89, 0xF0, 0x9F, 0xCD, 0x6F, 0xED, 0x58, 0xCD}}
IFontFaceReference :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontfacereference_vtable: ^IFontFaceReference_VTable,
}
IFontFaceReference_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	CreateFontFace:                     proc "system" (this: ^IFontFaceReference, fontFace: ^^IFontFace3) -> HRESULT,
	CreateFontFaceWithSimulations:      proc "system" (this: ^IFontFaceReference, fontFaceSimulationFlags: FONT_SIMULATIONS, fontFace: ^^IFontFace3) -> HRESULT,
	Equals:                             proc "system" (this: ^IFontFaceReference, fontFaceReference: ^IFontFaceReference) -> BOOL,
	GetFontFaceIndex:                   proc "system" (this: ^IFontFaceReference) -> u32,
	GetSimulations:                     proc "system" (this: ^IFontFaceReference) -> FONT_SIMULATIONS,
	GetFontFile:                        proc "system" (this: ^IFontFaceReference, fontFile: ^^IFontFile) -> HRESULT,
	GetLocalFileSize:                   proc "system" (this: ^IFontFaceReference) -> u64,
	GetFileSize:                        proc "system" (this: ^IFontFaceReference) -> u64,
	GetFileTime:                        proc "system" (this: ^IFontFaceReference, lastWriteTime: ^FILETIME) -> HRESULT,
	GetLocality:                        proc "system" (this: ^IFontFaceReference) -> LOCALITY,
	EnqueueFontDownloadRequest:         proc "system" (this: ^IFontFaceReference) -> HRESULT,
	EnqueueCharacterDownloadRequest:    proc "system" (this: ^IFontFaceReference, characters: [^]WCHAR, characterCount: u32) -> HRESULT,
	EnqueueGlyphDownloadRequest:        proc "system" (this: ^IFontFaceReference, glyphIndices: [^]u16, glyphCount: u32) -> HRESULT,
	EnqueueFileFragmentDownloadRequest: proc "system" (this: ^IFontFaceReference, fileOffset: u64, fragmentSize: u64) -> HRESULT,
}

IFont3_UUID_STRING :: "29748ED6-8C9C-4A6A-BE0B-D912E8538944"
IFont3_UUID := &IID{0x29748ED6, 0x8C9C, 0x4A6A, {0xBE, 0x0B, 0xD9, 0x12, 0xE8, 0x53, 0x89, 0x44}}
IFont3 :: struct #raw_union {
	#subtype idwritefont2: IFont2,
	using idwritefont3_vtable: ^IFont3_VTable,
}
IFont3_VTable :: struct {
	using idwritefont2_vtable: IFont2_VTable,
	CreateFontFace2:      proc "system" (this: ^IFont3, fontFace: ^^IFontFace3) -> HRESULT,
	Equals:               proc "system" (this: ^IFont3, font: ^IFont) -> BOOL,
	GetFontFaceReference: proc "system" (this: ^IFont3, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
	HasCharacter2:        proc "system" (this: ^IFont3, unicodeValue: u32) -> BOOL,
	GetLocality:          proc "system" (this: ^IFont3) -> LOCALITY,
}

IFontFace3_UUID_STRING :: "D37D7598-09BE-4222-A236-2081341CC1F2"
IFontFace3_UUID := &IID{0xD37D7598, 0x09BE, 0x4222, {0xA2, 0x36, 0x20, 0x81, 0x34, 0x1C, 0xC1, 0xF2}}
IFontFace3 :: struct #raw_union {
	#subtype idwritefontface2: IFontFace2,
	using idwritefontface3_vtable: ^IFontFace3_VTable,
}
IFontFace3_VTable :: struct {
	using idwritefontface2_vtable: IFontFace2_VTable,
	GetFontFaceReference:         proc "system" (this: ^IFontFace3, fontFaceReference: ^^IFontFaceReference) -> HRESULT,
	GetPanose:                    proc "system" (this: ^IFontFace3, panose: ^PANOSE),
	GetWeight:                    proc "system" (this: ^IFontFace3) -> FONT_WEIGHT,
	GetStretch:                   proc "system" (this: ^IFontFace3) -> FONT_STRETCH,
	GetStyle:                     proc "system" (this: ^IFontFace3) -> FONT_STYLE,
	GetFamilyNames:               proc "system" (this: ^IFontFace3, names: ^^ILocalizedStrings) -> HRESULT,
	GetFaceNames:                 proc "system" (this: ^IFontFace3, names: ^^ILocalizedStrings) -> HRESULT,
	GetInformationalStrings:      proc "system" (this: ^IFontFace3, informationalStringID: INFORMATIONAL_STRING_ID, informationalStrings: ^^ILocalizedStrings, exists: ^BOOL) -> HRESULT,
	HasCharacter:                 proc "system" (this: ^IFontFace3, unicodeValue: u32) -> BOOL,
	GetRecommendedRenderingMode4: proc "system" (this: ^IFontFace3, fontEmSize: f32, dpiX: f32, dpiY: f32, transform: ^MATRIX, isSideways: BOOL, outlineThreshold: OUTLINE_THRESHOLD, measuringMode: MEASURING_MODE, renderingParams: ^IRenderingParams, renderingMode: ^RENDERING_MODE1, gridFitMode: ^GRID_FIT_MODE) -> HRESULT,
	IsCharacterLocal:             proc "system" (this: ^IFontFace3, unicodeValue: u32) -> BOOL,
	IsGlyphLocal:                 proc "system" (this: ^IFontFace3, glyphId: u16) -> BOOL,
	AreCharactersLocal:           proc "system" (this: ^IFontFace3, characters: [^]WCHAR, characterCount: u32, enqueueIfNotLocal: BOOL, isLocal: ^BOOL) -> HRESULT,
	AreGlyphsLocal:               proc "system" (this: ^IFontFace3, glyphIndices: [^]u16, glyphCount: u32, enqueueIfNotLocal: BOOL, isLocal: ^BOOL) -> HRESULT,
}

IStringList_UUID_STRING :: "CFEE3140-1157-47CA-8B85-31BFCF3F2D0E"
IStringList_UUID := &IID{0xCFEE3140, 0x1157, 0x47CA, {0x8B, 0x85, 0x31, 0xBF, 0xCF, 0x3F, 0x2D, 0x0E}}
IStringList :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritestringlist_vtable: ^IStringList_VTable,
}
IStringList_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetCount:            proc "system" (this: ^IStringList) -> u32,
	GetLocaleNameLength: proc "system" (this: ^IStringList, listIndex: u32, length: ^u32) -> HRESULT,
	GetLocaleName:       proc "system" (this: ^IStringList, listIndex: u32, localeName: [^]WCHAR, size: u32) -> HRESULT,
	GetStringLength:     proc "system" (this: ^IStringList, listIndex: u32, length: ^u32) -> HRESULT,
	GetString:           proc "system" (this: ^IStringList, listIndex: u32, stringBuffer: [^]WCHAR, stringBufferSize: u32) -> HRESULT,
}

IFontDownloadListener_UUID_STRING :: "B06FE5B9-43EC-4393-881B-DBE4DC72FDA7"
IFontDownloadListener_UUID := &IID{0xB06FE5B9, 0x43EC, 0x4393, {0x88, 0x1B, 0xDB, 0xE4, 0xDC, 0x72, 0xFD, 0xA7}}
IFontDownloadListener :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontdownloadlistener_vtable: ^IFontDownloadListener_VTable,
}
IFontDownloadListener_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	DownloadCompleted: proc "system" (this: ^IFontDownloadListener, downloadQueue: ^IFontDownloadQueue, pContext: ^IUnknown, downloadResult: HRESULT),
}

IFontDownloadQueue_UUID_STRING :: "B71E6052-5AEA-4FA3-832E-F60D431F7E91"
IFontDownloadQueue_UUID := &IID{0xB71E6052, 0x5AEA, 0x4FA3, {0x83, 0x2E, 0xF6, 0x0D, 0x43, 0x1F, 0x7E, 0x91}}
IFontDownloadQueue :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontdownloadqueue_vtable: ^IFontDownloadQueue_VTable,
}
IFontDownloadQueue_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	AddListener:        proc "system" (this: ^IFontDownloadQueue, listener: ^IFontDownloadListener, token: ^u32) -> HRESULT,
	RemoveListener:     proc "system" (this: ^IFontDownloadQueue, token: u32) -> HRESULT,
	IsEmpty:            proc "system" (this: ^IFontDownloadQueue) -> BOOL,
	BeginDownload:      proc "system" (this: ^IFontDownloadQueue, pContext: ^IUnknown) -> HRESULT,
	CancelDownload:     proc "system" (this: ^IFontDownloadQueue) -> HRESULT,
	GetGenerationCount: proc "system" (this: ^IFontDownloadQueue) -> u64,
}

IGdiInterop1_UUID_STRING :: "4556BE70-3ABD-4F70-90BE-421780A6F515"
IGdiInterop1_UUID := &IID{0x4556BE70, 0x3ABD, 0x4F70, {0x90, 0xBE, 0x42, 0x17, 0x80, 0xA6, 0xF5, 0x15}}
IGdiInterop1 :: struct #raw_union {
	#subtype idwritegdiinterop: IGdiInterop,
	using idwritegdiinterop1_vtable: ^IGdiInterop1_VTable,
}
IGdiInterop1_VTable :: struct {
	using idwritegdiinterop_vtable: IGdiInterop_VTable,
	CreateFontFromLOGFONT2:    proc "system" (this: ^IGdiInterop1, logFont: ^LOGFONTW, fontCollection: ^IFontCollection, font: ^^IFont) -> HRESULT,
	GetFontSignature:          proc "system" (this: ^IGdiInterop1, fontFace: ^IFontFace, fontSignature: ^FONTSIGNATURE) -> HRESULT,
	GetFontSignature2:         proc "system" (this: ^IGdiInterop1, font: ^IFont, fontSignature: ^FONTSIGNATURE) -> HRESULT,
	GetMatchingFontsByLOGFONT: proc "system" (this: ^IGdiInterop1, logFont: ^LOGFONTW, fontSet: ^IFontSet, filteredSet: ^^IFontSet) -> HRESULT,
}

LINE_METRICS1 :: struct {
	using _: LINE_METRICS,
	leadingBefore: f32,
	leadingAfter:  f32,
}

FONT_LINE_GAP_USAGE :: enum i32 {
	DEFAULT  = 0,
	DISABLED = 1,
	ENABLED  = 2,
}

LINE_SPACING :: struct {
	method:           LINE_SPACING_METHOD,
	height:           f32,
	baseline:         f32,
	leadingBefore:    f32,
	fontLineGapUsage: FONT_LINE_GAP_USAGE,
}

ITextFormat2_UUID_STRING :: "F67E0EDD-9E3D-4ECC-8C32-4183253DFE70"
ITextFormat2_UUID := &IID{0xF67E0EDD, 0x9E3D, 0x4ECC, {0x8C, 0x32, 0x41, 0x83, 0x25, 0x3D, 0xFE, 0x70}}
ITextFormat2 :: struct #raw_union {
	#subtype idwritetextformat1: ITextFormat1,
	using idwritetextformat2_vtable: ^ITextFormat2_VTable,
}
ITextFormat2_VTable :: struct {
	using idwritetextformat1_vtable: ITextFormat1_VTable,
	SetLineSpacing2: proc "system" (this: ^ITextFormat2, lineSpacingOptions: ^LINE_SPACING) -> HRESULT,
	GetLineSpacing2: proc "system" (this: ^ITextFormat2, lineSpacingOptions: ^LINE_SPACING) -> HRESULT,
}

ITextLayout3_UUID_STRING :: "07DDCD52-020E-4DE8-AC33-6C953D83F92D"
ITextLayout3_UUID := &IID{0x07DDCD52, 0x020E, 0x4DE8, {0xAC, 0x33, 0x6C, 0x95, 0x3D, 0x83, 0xF9, 0x2D}}
ITextLayout3 :: struct #raw_union {
	#subtype idwritetextlayout2: ITextLayout2,
	using idwritetextlayout3_vtable: ^ITextLayout3_VTable,
}
ITextLayout3_VTable :: struct {
	using idwritetextlayout2_vtable: ITextLayout2_VTable,
	InvalidateLayout: proc "system" (this: ^ITextLayout3) -> HRESULT,
	SetLineSpacing2:  proc "system" (this: ^ITextLayout3, lineSpacingOptions: ^LINE_SPACING) -> HRESULT,
	GetLineSpacing2:  proc "system" (this: ^ITextLayout3, lineSpacingOptions: ^LINE_SPACING) -> HRESULT,
	GetLineMetrics2:  proc "system" (this: ^ITextLayout3, lineMetrics: [^]LINE_METRICS1, maxLineCount: u32, actualLineCount: ^u32) -> HRESULT,
}


COLOR_GLYPH_RUN1 :: struct {
	using _: COLOR_GLYPH_RUN,
	glyphImageFormat: GLYPH_IMAGE_FORMATS,
	measuringMode:    MEASURING_MODE,
}

GLYPH_IMAGE_DATA :: struct {
	imageData:             rawptr,
	imageDataSize:         u32,
	uniqueDataId:          u32,
	pixelsPerEm:           u32,
	pixelSize:             D2D1_SIZE_U,
	horizontalLeftOrigin:  D2D1_POINT_2L,
	horizontalRightOrigin: D2D1_POINT_2L,
	verticalTopOrigin:     D2D1_POINT_2L,
	verticalBottomOrigin:  D2D1_POINT_2L,
}

IColorGlyphRunEnumerator1_UUID_STRING :: "7C5F86DA-C7A1-4F05-B8E1-55A179FE5A35"
IColorGlyphRunEnumerator1_UUID := &IID{0x7C5F86DA, 0xC7A1, 0x4F05, {0xB8, 0xE1, 0x55, 0xA1, 0x79, 0xFE, 0x5A, 0x35}}
IColorGlyphRunEnumerator1 :: struct #raw_union {
	#subtype idwritecolorglyphrunenumerator: IColorGlyphRunEnumerator,
	using idwritecolorglyphrunenumerator1_vtable: ^IColorGlyphRunEnumerator1_VTable,
}
IColorGlyphRunEnumerator1_VTable :: struct {
	using idwritecolorglyphrunenumerator_vtable: IColorGlyphRunEnumerator_VTable,
	GetCurrentRun2: proc "system" (this: ^IColorGlyphRunEnumerator1, colorGlyphRun: ^^COLOR_GLYPH_RUN1) -> HRESULT,
}

IFontFace4_UUID_STRING :: "27F2A904-4EB8-441D-9678-0563F53E3E2F"
IFontFace4_UUID := &IID{0x27F2A904, 0x4EB8, 0x441D, {0x96, 0x78, 0x05, 0x63, 0xF5, 0x3E, 0x3E, 0x2F}}
IFontFace4 :: struct #raw_union {
	#subtype idwritefontface3: IFontFace3,
	using idwritefontface4_vtable: ^IFontFace4_VTable,
}
IFontFace4_VTable :: struct {
	using idwritefontface3_vtable: IFontFace3_VTable,
	GetGlyphImageFormats:  proc "system" (this: ^IFontFace4, glyphId: u16, pixelsPerEmFirst: u32, pixelsPerEmLast: u32, glyphImageFormats: ^GLYPH_IMAGE_FORMATS) -> HRESULT,
	GetGlyphImageFormats2: proc "system" (this: ^IFontFace4) -> GLYPH_IMAGE_FORMATS,
	GetGlyphImageData:     proc "system" (this: ^IFontFace4, glyphId: u16, pixelsPerEm: u32, glyphImageFormat: GLYPH_IMAGE_FORMATS, glyphData: ^GLYPH_IMAGE_DATA, glyphDataContext: ^rawptr) -> HRESULT,
	ReleaseGlyphImageData: proc "system" (this: ^IFontFace4, glyphDataContext: rawptr),
}

IFactory4_UUID_STRING :: "4B0B5BD3-0797-4549-8AC5-FE915CC53856"
IFactory4_UUID := &IID{0x4B0B5BD3, 0x0797, 0x4549, {0x8A, 0xC5, 0xFE, 0x91, 0x5C, 0xC5, 0x38, 0x56}}
IFactory4 :: struct #raw_union {
	#subtype idwritefactory3: IFactory3,
	using idwritefactory4_vtable: ^IFactory4_VTable,
}
IFactory4_VTable :: struct {
	using idwritefactory3_vtable: IFactory3_VTable,
	TranslateColorGlyphRun2: proc "system" (this: ^IFactory4, baselineOrigin: D2D1_POINT_2F, glyphRun: ^GLYPH_RUN, glyphRunDescription: ^GLYPH_RUN_DESCRIPTION, desiredGlyphImageFormats: GLYPH_IMAGE_FORMATS, measuringMode: MEASURING_MODE, worldAndDpiTransform: ^MATRIX, colorPaletteIndex: u32, colorLayers: ^^IColorGlyphRunEnumerator1) -> HRESULT,
	ComputeGlyphOrigins:     proc "system" (this: ^IFactory4, glyphRun: ^GLYPH_RUN, baselineOrigin: D2D1_POINT_2F, glyphOrigins: [^]D2D1_POINT_2F) -> HRESULT,
	ComputeGlyphOrigins2:    proc "system" (this: ^IFactory4, glyphRun: ^GLYPH_RUN, measuringMode: MEASURING_MODE, baselineOrigin: D2D1_POINT_2F, worldAndDpiTransform: ^MATRIX, glyphOrigins: [^]D2D1_POINT_2F) -> HRESULT,
}


IFontSetBuilder1_UUID_STRING :: "3FF7715F-3CDC-4DC6-9B72-EC5621DCCAFD"
IFontSetBuilder1_UUID := &IID{0x3FF7715F, 0x3CDC, 0x4DC6, {0x9B, 0x72, 0xEC, 0x56, 0x21, 0xDC, 0xCA, 0xFD}}
IFontSetBuilder1 :: struct #raw_union {
	#subtype idwritefontsetbuilder: IFontSetBuilder,
	using idwritefontsetbuilder1_vtable: ^IFontSetBuilder1_VTable,
}
IFontSetBuilder1_VTable :: struct {
	using idwritefontsetbuilder_vtable: IFontSetBuilder_VTable,
	AddFontFile: proc "system" (this: ^IFontSetBuilder1, fontFile: ^IFontFile) -> HRESULT,
}

IAsyncResult_UUID_STRING :: "CE25F8FD-863B-4D13-9651-C1F88DC73FE2"
IAsyncResult_UUID := &IID{0xCE25F8FD, 0x863B, 0x4D13, {0x96, 0x51, 0xC1, 0xF8, 0x8D, 0xC7, 0x3F, 0xE2}}
IAsyncResult :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwriteasyncresult_vtable: ^IAsyncResult_VTable,
}
IAsyncResult_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetWaitHandle: proc "system" (this: ^IAsyncResult) -> HANDLE,
	GetResult:     proc "system" (this: ^IAsyncResult) -> HRESULT,
}

FILE_FRAGMENT :: struct {
	fileOffset:   u64,
	fragmentSize: u64,
}

IRemoteFontFileStream_UUID_STRING :: "4DB3757A-2C72-4ED9-B2B6-1ABABE1AFF9C"
IRemoteFontFileStream_UUID := &IID{0x4DB3757A, 0x2C72, 0x4ED9, {0xB2, 0xB6, 0x1A, 0xBA, 0xBE, 0x1A, 0xFF, 0x9C}}
IRemoteFontFileStream :: struct #raw_union {
	#subtype idwritefontfilestream: IFontFileStream,
	using idwriteremotefontfilestream_vtable: ^IRemoteFontFileStream_VTable,
}
IRemoteFontFileStream_VTable :: struct {
	using idwritefontfilestream_vtable: IFontFileStream_VTable,
	GetLocalFileSize:        proc "system" (this: ^IRemoteFontFileStream, localFileSize: ^u64) -> HRESULT,
	GetFileFragmentLocality: proc "system" (this: ^IRemoteFontFileStream, fileOffset: u64, fragmentSize: u64, isLocal: ^BOOL, partialSize: ^u64) -> HRESULT,
	GetLocality:             proc "system" (this: ^IRemoteFontFileStream) -> LOCALITY,
	BeginDownload:           proc "system" (this: ^IRemoteFontFileStream, downloadOperationID: ^UUID, fileFragments: [^]FILE_FRAGMENT, fragmentCount: u32, asyncResult: ^^IAsyncResult) -> HRESULT,
}

CONTAINER_TYPE :: enum i32 {
	UNKNOWN = 0,
	WOFF    = 1,
	WOFF2   = 2,
}

IRemoteFontFileLoader_UUID_STRING :: "68648C83-6EDE-46C0-AB46-20083A887FDE"
IRemoteFontFileLoader_UUID := &IID{0x68648C83, 0x6EDE, 0x46C0, {0xAB, 0x46, 0x20, 0x08, 0x3A, 0x88, 0x7F, 0xDE}}
IRemoteFontFileLoader :: struct #raw_union {
	#subtype idwritefontfileloader: IFontFileLoader,
	using idwriteremotefontfileloader_vtable: ^IRemoteFontFileLoader_VTable,
}
IRemoteFontFileLoader_VTable :: struct {
	using idwritefontfileloader_vtable: IFontFileLoader_VTable,
	CreateRemoteStreamFromKey:      proc "system" (this: ^IRemoteFontFileLoader, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, fontFileStream: ^^IRemoteFontFileStream) -> HRESULT,
	GetLocalityFromKey:             proc "system" (this: ^IRemoteFontFileLoader, fontFileReferenceKey: rawptr, fontFileReferenceKeySize: u32, locality: ^LOCALITY) -> HRESULT,
	CreateFontFileReferenceFromUrl: proc "system" (this: ^IRemoteFontFileLoader, factory: ^IFactory, baseUrl: LPCWSTR, fontFileUrl: LPCWSTR, fontFile: ^^IFontFile) -> HRESULT,
}

IInMemoryFontFileLoader_UUID_STRING :: "DC102F47-A12D-4B1C-822D-9E117E33043F"
IInMemoryFontFileLoader_UUID := &IID{0xDC102F47, 0xA12D, 0x4B1C, {0x82, 0x2D, 0x9E, 0x11, 0x7E, 0x33, 0x04, 0x3F}}
IInMemoryFontFileLoader :: struct #raw_union {
	#subtype idwritefontfileloader: IFontFileLoader,
	using idwriteinmemoryfontfileloader_vtable: ^IInMemoryFontFileLoader_VTable,
}
IInMemoryFontFileLoader_VTable :: struct {
	using idwritefontfileloader_vtable: IFontFileLoader_VTable,
	CreateInMemoryFontFileReference: proc "system" (this: ^IInMemoryFontFileLoader, factory: ^IFactory, fontData: rawptr, fontDataSize: u32, ownerObject: ^IUnknown, fontFile: ^^IFontFile) -> HRESULT,
	GetFileCount:                    proc "system" (this: ^IInMemoryFontFileLoader) -> u32,
}

IFactory5_UUID_STRING :: "958DB99A-BE2A-4F09-AF7D-65189803D1D3"
IFactory5_UUID := &IID{0x958DB99A, 0xBE2A, 0x4F09, {0xAF, 0x7D, 0x65, 0x18, 0x98, 0x03, 0xD1, 0xD3}}
IFactory5 :: struct #raw_union {
	#subtype idwritefactory4: IFactory4,
	using idwritefactory5_vtable: ^IFactory5_VTable,
}
IFactory5_VTable :: struct {
	using idwritefactory4_vtable: IFactory4_VTable,
	CreateFontSetBuilder2:        proc "system" (this: ^IFactory5, fontSetBuilder: ^^IFontSetBuilder1) -> HRESULT,
	CreateInMemoryFontFileLoader: proc "system" (this: ^IFactory5, newLoader: ^^IInMemoryFontFileLoader) -> HRESULT,
	CreateHttpFontFileLoader:     proc "system" (this: ^IFactory5, referrerUrl: LPCWSTR, extraHeaders: LPCWSTR, newLoader: ^^IRemoteFontFileLoader) -> HRESULT,
	AnalyzeContainerType:         proc "system" (this: ^IFactory5, fileData: rawptr, fileDataSize: u32) -> CONTAINER_TYPE,
	UnpackFontFile:               proc "system" (this: ^IFactory5, containerType: CONTAINER_TYPE, fileData: rawptr, fileDataSize: u32, unpackedFontStream: ^^IFontFileStream) -> HRESULT,
}


FONT_AXIS_TAG :: enum u32 {
	WEIGHT       = 0x74686777,
	WIDTH        = 0x68746477,
	SLANT        = 0x746E6C73,
	OPTICAL_SIZE = 0x7A73706F,
	ITALIC       = 0x6C617469,
}

STANDARD_FONT_AXIS_COUNT :: 5

FONT_AXIS_VALUE :: struct {
	axisTag: FONT_AXIS_TAG,
	value:   f32,
}

FONT_AXIS_RANGE :: struct {
	axisTag:  FONT_AXIS_TAG,
	minValue: f32,
	maxValue: f32,
}

FONT_FAMILY_MODEL :: enum i32 {
	TYPOGRAPHIC          = 0,
	WEIGHT_STRETCH_STYLE = 1,
}

AUTOMATIC_FONT_AXES :: distinct bit_set[AUTOMATIC_FONT_AXES_FLAG; u32]
AUTOMATIC_FONT_AXES_FLAG :: enum u32 {
	OPTICAL_SIZE = 0,
}

FONT_AXIS_ATTRIBUTES :: distinct bit_set[FONT_AXIS_ATTRIBUTES_FLAG; u32]
FONT_AXIS_ATTRIBUTES_FLAG :: enum u32 {
	VARIABLE = 0,
	HIDDEN   = 1,
}

IFactory6_UUID_STRING :: "F3744D80-21F7-42EB-B35D-995BC72FC223"
IFactory6_UUID := &IID{0xF3744D80, 0x21F7, 0x42EB, {0xB3, 0x5D, 0x99, 0x5B, 0xC7, 0x2F, 0xC2, 0x23}}
IFactory6 :: struct #raw_union {
	#subtype idwritefactory5: IFactory5,
	using idwritefactory6_vtable: ^IFactory6_VTable,
}
IFactory6_VTable :: struct {
	using idwritefactory5_vtable: IFactory5_VTable,
	CreateFontFaceReference3:         proc "system" (this: ^IFactory6, fontFile: ^IFontFile, faceIndex: u32, fontSimulations: FONT_SIMULATIONS, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, fontFaceReference: ^^IFontFaceReference1) -> HRESULT,
	CreateFontResource:               proc "system" (this: ^IFactory6, fontFile: ^IFontFile, faceIndex: u32, fontResource: ^^IFontResource) -> HRESULT,
	GetSystemFontSet2:                proc "system" (this: ^IFactory6, includeDownloadableFonts: BOOL, fontSet: ^^IFontSet1) -> HRESULT,
	GetSystemFontCollection3:         proc "system" (this: ^IFactory6, includeDownloadableFonts: BOOL, fontFamilyModel: FONT_FAMILY_MODEL, fontCollection: ^^IFontCollection2) -> HRESULT,
	CreateFontCollectionFromFontSet2: proc "system" (this: ^IFactory6, fontSet: ^IFontSet, fontFamilyModel: FONT_FAMILY_MODEL, fontCollection: ^^IFontCollection2) -> HRESULT,
	CreateFontSetBuilder3:            proc "system" (this: ^IFactory6, fontSetBuilder: ^^IFontSetBuilder2) -> HRESULT,
	CreateTextFormat2:                proc "system" (this: ^IFactory6, fontFamilyName: LPCWSTR, fontCollection: ^IFontCollection, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, fontSize: f32, localeName: LPCWSTR, textFormat: ^^ITextFormat3) -> HRESULT,
}

IFontFace5_UUID_STRING :: "98EFF3A5-B667-479A-B145-E2FA5B9FDC29"
IFontFace5_UUID := &IID{0x98EFF3A5, 0xB667, 0x479A, {0xB1, 0x45, 0xE2, 0xFA, 0x5B, 0x9F, 0xDC, 0x29}}
IFontFace5 :: struct #raw_union {
	#subtype idwritefontface4: IFontFace4,
	using idwritefontface5_vtable: ^IFontFace5_VTable,
}
IFontFace5_VTable :: struct {
	using idwritefontface4_vtable: IFontFace4_VTable,
	GetFontAxisValueCount: proc "system" (this: ^IFontFace5) -> u32,
	GetFontAxisValues:     proc "system" (this: ^IFontFace5, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32) -> HRESULT,
	HasVariations:         proc "system" (this: ^IFontFace5) -> BOOL,
	GetFontResource:       proc "system" (this: ^IFontFace5, fontResource: ^^IFontResource) -> HRESULT,
	Equals:                proc "system" (this: ^IFontFace5, fontFace: ^IFontFace) -> BOOL,
}

IFontResource_UUID_STRING :: "1F803A76-6871-48E8-987F-B975551C50F2"
IFontResource_UUID := &IID{0x1F803A76, 0x6871, 0x48E8, {0x98, 0x7F, 0xB9, 0x75, 0x55, 0x1C, 0x50, 0xF2}}
IFontResource :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritefontresource_vtable: ^IFontResource_VTable,
}
IFontResource_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	GetFontFile:              proc "system" (this: ^IFontResource, fontFile: ^^IFontFile) -> HRESULT,
	GetFontFaceIndex:         proc "system" (this: ^IFontResource) -> u32,
	GetFontAxisCount:         proc "system" (this: ^IFontResource) -> u32,
	GetDefaultFontAxisValues: proc "system" (this: ^IFontResource, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32) -> HRESULT,
	GetFontAxisRanges:        proc "system" (this: ^IFontResource, fontAxisRanges: [^]FONT_AXIS_RANGE, fontAxisRangeCount: u32) -> HRESULT,
	GetFontAxisAttributes:    proc "system" (this: ^IFontResource, axisIndex: u32) -> FONT_AXIS_ATTRIBUTES,
	GetAxisNames:             proc "system" (this: ^IFontResource, axisIndex: u32, names: ^^ILocalizedStrings) -> HRESULT,
	GetAxisValueNameCount:    proc "system" (this: ^IFontResource, axisIndex: u32) -> u32,
	GetAxisValueNames:        proc "system" (this: ^IFontResource, axisIndex: u32, axisValueIndex: u32, fontAxisRange: ^FONT_AXIS_RANGE, names: ^^ILocalizedStrings) -> HRESULT,
	HasVariations:            proc "system" (this: ^IFontResource) -> BOOL,
	CreateFontFace:           proc "system" (this: ^IFontResource, fontSimulations: FONT_SIMULATIONS, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, fontFace: ^^IFontFace5) -> HRESULT,
	CreateFontFaceReference:  proc "system" (this: ^IFontResource, fontSimulations: FONT_SIMULATIONS, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, fontFaceReference: ^^IFontFaceReference1) -> HRESULT,
}

IFontFaceReference1_UUID_STRING :: "C081FE77-2FD1-41AC-A5A3-34983C4BA61A"
IFontFaceReference1_UUID := &IID{0xC081FE77, 0x2FD1, 0x41AC, {0xA5, 0xA3, 0x34, 0x98, 0x3C, 0x4B, 0xA6, 0x1A}}
IFontFaceReference1 :: struct #raw_union {
	#subtype idwritefontfacereference: IFontFaceReference,
	using idwritefontfacereference1_vtable: ^IFontFaceReference1_VTable,
}
IFontFaceReference1_VTable :: struct {
	using idwritefontfacereference_vtable: IFontFaceReference_VTable,
	CreateFontFace2:       proc "system" (this: ^IFontFaceReference1, fontFace: ^^IFontFace5) -> HRESULT,
	GetFontAxisValueCount: proc "system" (this: ^IFontFaceReference1) -> u32,
	GetFontAxisValues:     proc "system" (this: ^IFontFaceReference1, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32) -> HRESULT,
}

IFontSetBuilder2_UUID_STRING :: "EE5BA612-B131-463C-8F4F-3189B9401E45"
IFontSetBuilder2_UUID := &IID{0xEE5BA612, 0xB131, 0x463C, {0x8F, 0x4F, 0x31, 0x89, 0xB9, 0x40, 0x1E, 0x45}}
IFontSetBuilder2 :: struct #raw_union {
	#subtype idwritefontsetbuilder1: IFontSetBuilder1,
	using idwritefontsetbuilder2_vtable: ^IFontSetBuilder2_VTable,
}
IFontSetBuilder2_VTable :: struct {
	using idwritefontsetbuilder1_vtable: IFontSetBuilder1_VTable,
	AddFont:      proc "system" (this: ^IFontSetBuilder2, fontFile: ^IFontFile, fontFaceIndex: u32, fontSimulations: FONT_SIMULATIONS, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, fontAxisRanges: [^]FONT_AXIS_RANGE, fontAxisRangeCount: u32, properties: [^]FONT_PROPERTY, propertyCount: u32) -> HRESULT,
	AddFontFile2: proc "system" (this: ^IFontSetBuilder2, filePath: LPCWSTR) -> HRESULT,
}

IFontSet1_UUID_STRING :: "7E9FDA85-6C92-4053-BC47-7AE3530DB4D3"
IFontSet1_UUID := &IID{0x7E9FDA85, 0x6C92, 0x4053, {0xBC, 0x47, 0x7A, 0xE3, 0x53, 0x0D, 0xB4, 0xD3}}
IFontSet1 :: struct #raw_union {
	#subtype idwritefontset: IFontSet,
	using idwritefontset1_vtable: ^IFontSet1_VTable,
}
IFontSet1_VTable :: struct {
	using idwritefontset_vtable: IFontSet_VTable,
	GetMatchingFonts3:       proc "system" (this: ^IFontSet1, fontProperty: ^FONT_PROPERTY, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, matchingFonts: ^^IFontSet1) -> HRESULT,
	GetFirstFontResources:   proc "system" (this: ^IFontSet1, filteredFontSet: ^^IFontSet1) -> HRESULT,
	GetFilteredFonts:        proc "system" (this: ^IFontSet1, indices: [^]u32, indexCount: u32, filteredFontSet: ^^IFontSet1) -> HRESULT,
	GetFilteredFonts2:       proc "system" (this: ^IFontSet1, fontAxisRanges: [^]FONT_AXIS_RANGE, fontAxisRangeCount: u32, selectAnyRange: BOOL, filteredFontSet: ^^IFontSet1) -> HRESULT,
	GetFilteredFonts3:       proc "system" (this: ^IFontSet1, properties: [^]FONT_PROPERTY, propertyCount: u32, selectAnyProperty: BOOL, filteredFontSet: ^^IFontSet1) -> HRESULT,
	GetFilteredFontIndices:  proc "system" (this: ^IFontSet1, fontAxisRanges: [^]FONT_AXIS_RANGE, fontAxisRangeCount: u32, selectAnyRange: BOOL, indices: [^]u32, maxIndexCount: u32, actualIndexCount: ^u32) -> HRESULT,
	GetFilteredFontIndices2: proc "system" (this: ^IFontSet1, properties: [^]FONT_PROPERTY, propertyCount: u32, selectAnyProperty: BOOL, indices: [^]u32, maxIndexCount: u32, actualIndexCount: ^u32) -> HRESULT,
	GetFontAxisRanges:       proc "system" (this: ^IFontSet1, listIndex: u32, fontAxisRanges: [^]FONT_AXIS_RANGE, maxFontAxisRangeCount: u32, actualFontAxisRangeCount: ^u32) -> HRESULT,
	GetFontAxisRanges2:      proc "system" (this: ^IFontSet1, fontAxisRanges: [^]FONT_AXIS_RANGE, maxFontAxisRangeCount: u32, actualFontAxisRangeCount: ^u32) -> HRESULT,
	GetFontFaceReference2:   proc "system" (this: ^IFontSet1, listIndex: u32, fontFaceReference: ^^IFontFaceReference1) -> HRESULT,
	CreateFontResource:      proc "system" (this: ^IFontSet1, listIndex: u32, fontResource: ^^IFontResource) -> HRESULT,
	CreateFontFace:          proc "system" (this: ^IFontSet1, listIndex: u32, fontFace: ^^IFontFace5) -> HRESULT,
	GetFontLocality:         proc "system" (this: ^IFontSet1, listIndex: u32) -> LOCALITY,
}

IFontList2_UUID_STRING :: "C0763A34-77AF-445A-B735-08C37B0A5BF5"
IFontList2_UUID := &IID{0xC0763A34, 0x77AF, 0x445A, {0xB7, 0x35, 0x08, 0xC3, 0x7B, 0x0A, 0x5B, 0xF5}}
IFontList2 :: struct #raw_union {
	#subtype idwritefontlist1: IFontList1,
	using idwritefontlist2_vtable: ^IFontList2_VTable,
}
IFontList2_VTable :: struct {
	using idwritefontlist1_vtable: IFontList1_VTable,
	GetFontSet: proc "system" (this: ^IFontList2, fontSet: ^^IFontSet1) -> HRESULT,
}

IFontFamily2_UUID_STRING :: "3ED49E77-A398-4261-B9CF-C126C2131EF3"
IFontFamily2_UUID := &IID{0x3ED49E77, 0xA398, 0x4261, {0xB9, 0xCF, 0xC1, 0x26, 0xC2, 0x13, 0x1E, 0xF3}}
IFontFamily2 :: struct #raw_union {
	#subtype idwritefontfamily1: IFontFamily1,
	using idwritefontfamily2_vtable: ^IFontFamily2_VTable,
}
IFontFamily2_VTable :: struct {
	using idwritefontfamily1_vtable: IFontFamily1_VTable,
	GetMatchingFonts2: proc "system" (this: ^IFontFamily2, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, matchingFonts: ^^IFontList2) -> HRESULT,
	GetFontSet:        proc "system" (this: ^IFontFamily2, fontSet: ^^IFontSet1) -> HRESULT,
}

IFontCollection2_UUID_STRING :: "514039C6-4617-4064-BF8B-92EA83E506E0"
IFontCollection2_UUID := &IID{0x514039C6, 0x4617, 0x4064, {0xBF, 0x8B, 0x92, 0xEA, 0x83, 0xE5, 0x06, 0xE0}}
IFontCollection2 :: struct #raw_union {
	#subtype idwritefontcollection1: IFontCollection1,
	using idwritefontcollection2_vtable: ^IFontCollection2_VTable,
}
IFontCollection2_VTable :: struct {
	using idwritefontcollection1_vtable: IFontCollection1_VTable,
	GetFontFamily3:     proc "system" (this: ^IFontCollection2, index: u32, fontFamily: ^^IFontFamily2) -> HRESULT,
	GetMatchingFonts:   proc "system" (this: ^IFontCollection2, familyName: LPCWSTR, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, fontList: ^^IFontList2) -> HRESULT,
	GetFontFamilyModel: proc "system" (this: ^IFontCollection2) -> FONT_FAMILY_MODEL,
	GetFontSet2:        proc "system" (this: ^IFontCollection2, fontSet: ^^IFontSet1) -> HRESULT,
}

ITextLayout4_UUID_STRING :: "05A9BF42-223F-4441-B5FB-8263685F55E9"
ITextLayout4_UUID := &IID{0x05A9BF42, 0x223F, 0x4441, {0xB5, 0xFB, 0x82, 0x63, 0x68, 0x5F, 0x55, 0xE9}}
ITextLayout4 :: struct #raw_union {
	#subtype idwritetextlayout3: ITextLayout3,
	using idwritetextlayout4_vtable: ^ITextLayout4_VTable,
}
ITextLayout4_VTable :: struct {
	using idwritetextlayout3_vtable: ITextLayout3_VTable,
	SetFontAxisValues:     proc "system" (this: ^ITextLayout4, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, textRange: TEXT_RANGE) -> HRESULT,
	GetFontAxisValueCount: proc "system" (this: ^ITextLayout4, currentPosition: u32) -> u32,
	GetFontAxisValues:     proc "system" (this: ^ITextLayout4, currentPosition: u32, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, textRange: ^TEXT_RANGE) -> HRESULT,
	GetAutomaticFontAxes:  proc "system" (this: ^ITextLayout4) -> AUTOMATIC_FONT_AXES,
	SetAutomaticFontAxes:  proc "system" (this: ^ITextLayout4, automaticFontAxes: AUTOMATIC_FONT_AXES) -> HRESULT,
}

ITextFormat3_UUID_STRING :: "6D3B5641-E550-430D-A85B-B7BF48A93427"
ITextFormat3_UUID := &IID{0x6D3B5641, 0xE550, 0x430D, {0xA8, 0x5B, 0xB7, 0xBF, 0x48, 0xA9, 0x34, 0x27}}
ITextFormat3 :: struct #raw_union {
	#subtype idwritetextformat2: ITextFormat2,
	using idwritetextformat3_vtable: ^ITextFormat3_VTable,
}
ITextFormat3_VTable :: struct {
	using idwritetextformat2_vtable: ITextFormat2_VTable,
	SetFontAxisValues:     proc "system" (this: ^ITextFormat3, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32) -> HRESULT,
	GetFontAxisValueCount: proc "system" (this: ^ITextFormat3) -> u32,
	GetFontAxisValues:     proc "system" (this: ^ITextFormat3, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32) -> HRESULT,
	GetAutomaticFontAxes:  proc "system" (this: ^ITextFormat3) -> AUTOMATIC_FONT_AXES,
	SetAutomaticFontAxes:  proc "system" (this: ^ITextFormat3, automaticFontAxes: AUTOMATIC_FONT_AXES) -> HRESULT,
}

IFontFallback1_UUID_STRING :: "2397599D-DD0D-4681-BD6A-F4F31EAADE77"
IFontFallback1_UUID := &IID{0x2397599D, 0xDD0D, 0x4681, {0xBD, 0x6A, 0xF4, 0xF3, 0x1E, 0xAA, 0xDE, 0x77}}
IFontFallback1 :: struct #raw_union {
	#subtype idwritefontfallback: IFontFallback,
	using idwritefontfallback1_vtable: ^IFontFallback1_VTable,
}
IFontFallback1_VTable :: struct {
	using idwritefontfallback_vtable: IFontFallback_VTable,
	MapCharacters2: proc "system" (this: ^IFontFallback1, analysisSource: ^ITextAnalysisSource, textPosition: u32, textLength: u32, baseFontCollection: ^IFontCollection, baseFamilyName: LPCWSTR, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, mappedLength: ^u32, scale: ^f32, mappedFontFace: ^^IFontFace5) -> HRESULT,
}


IFontSet2_UUID_STRING :: "DC7EAD19-E54C-43AF-B2DA-4E2B79BA3F7F"
IFontSet2_UUID := &IID{0xDC7EAD19, 0xE54C, 0x43AF, {0xB2, 0xDA, 0x4E, 0x2B, 0x79, 0xBA, 0x3F, 0x7F}}
IFontSet2 :: struct #raw_union {
	#subtype idwritefontset1: IFontSet1,
	using idwritefontset2_vtable: ^IFontSet2_VTable,
}
IFontSet2_VTable :: struct {
	using idwritefontset1_vtable: IFontSet1_VTable,
	GetExpirationEvent: proc "system" (this: ^IFontSet2) -> HANDLE,
}

IFontCollection3_UUID_STRING :: "A4D055A6-F9E3-4E25-93B7-9E309F3AF8E9"
IFontCollection3_UUID := &IID{0xA4D055A6, 0xF9E3, 0x4E25, {0x93, 0xB7, 0x9E, 0x30, 0x9F, 0x3A, 0xF8, 0xE9}}
IFontCollection3 :: struct #raw_union {
	#subtype idwritefontcollection2: IFontCollection2,
	using idwritefontcollection3_vtable: ^IFontCollection3_VTable,
}
IFontCollection3_VTable :: struct {
	using idwritefontcollection2_vtable: IFontCollection2_VTable,
	GetExpirationEvent: proc "system" (this: ^IFontCollection3) -> HANDLE,
}

IFactory7_UUID_STRING :: "35D0E0B3-9076-4D2E-A016-A91B568A06B4"
IFactory7_UUID := &IID{0x35D0E0B3, 0x9076, 0x4D2E, {0xA0, 0x16, 0xA9, 0x1B, 0x56, 0x8A, 0x06, 0xB4}}
IFactory7 :: struct #raw_union {
	#subtype idwritefactory6: IFactory6,
	using idwritefactory7_vtable: ^IFactory7_VTable,
}
IFactory7_VTable :: struct {
	using idwritefactory6_vtable: IFactory6_VTable,
	GetSystemFontSet3:        proc "system" (this: ^IFactory7, includeDownloadableFonts: BOOL, fontSet: ^^IFontSet2) -> HRESULT,
	GetSystemFontCollection4: proc "system" (this: ^IFactory7, includeDownloadableFonts: BOOL, fontFamilyModel: FONT_FAMILY_MODEL, fontCollection: ^^IFontCollection3) -> HRESULT,
}


FONT_SOURCE_TYPE :: enum i32 {
	UNKNOWN              = 0,
	PER_MACHINE          = 1,
	PER_USER             = 2,
	APPX_PACKAGE         = 3,
	REMOTE_FONT_PROVIDER = 4,
}

IFontSet3_UUID_STRING :: "7C073EF2-A7F4-4045-8C32-8AB8AE640F90"
IFontSet3_UUID := &IID{0x7C073EF2, 0xA7F4, 0x4045, {0x8C, 0x32, 0x8A, 0xB8, 0xAE, 0x64, 0x0F, 0x90}}
IFontSet3 :: struct #raw_union {
	#subtype idwritefontset2: IFontSet2,
	using idwritefontset3_vtable: ^IFontSet3_VTable,
}
IFontSet3_VTable :: struct {
	using idwritefontset2_vtable: IFontSet2_VTable,
	GetFontSourceType:       proc "system" (this: ^IFontSet3, fontIndex: u32) -> FONT_SOURCE_TYPE,
	GetFontSourceNameLength: proc "system" (this: ^IFontSet3, listIndex: u32) -> u32,
	GetFontSourceName:       proc "system" (this: ^IFontSet3, listIndex: u32, stringBuffer: [^]WCHAR, stringBufferSize: u32) -> HRESULT,
}


IFontFace6_UUID_STRING :: "C4B1FE1B-6E84-47D5-B54C-A597981B06AD"
IFontFace6_UUID := &IID{0xC4B1FE1B, 0x6E84, 0x47D5, {0xB5, 0x4C, 0xA5, 0x97, 0x98, 0x1B, 0x06, 0xAD}}
IFontFace6 :: struct #raw_union {
	#subtype idwritefontface5: IFontFace5,
	using idwritefontface6_vtable: ^IFontFace6_VTable,
}
IFontFace6_VTable :: struct {
	using idwritefontface5_vtable: IFontFace5_VTable,
	GetFamilyNames2: proc "system" (this: ^IFontFace6, fontFamilyModel: FONT_FAMILY_MODEL, names: ^^ILocalizedStrings) -> HRESULT,
	GetFaceNames2:   proc "system" (this: ^IFontFace6, fontFamilyModel: FONT_FAMILY_MODEL, names: ^^ILocalizedStrings) -> HRESULT,
}


IFontSet4_UUID_STRING :: "EEC175FC-BEA9-4C86-8B53-CCBDD7DF0C82"
IFontSet4_UUID := &IID{0xEEC175FC, 0xBEA9, 0x4C86, {0x8B, 0x53, 0xCC, 0xBD, 0xD7, 0xDF, 0x0C, 0x82}}
IFontSet4 :: struct #raw_union {
	#subtype idwritefontset3: IFontSet3,
	using idwritefontset4_vtable: ^IFontSet4_VTable,
}
IFontSet4_VTable :: struct {
	using idwritefontset3_vtable: IFontSet3_VTable,
	ConvertWeightStretchStyleToFontAxisValues: proc "system" (this: ^IFontSet4, inputAxisValues: [^]FONT_AXIS_VALUE, inputAxisCount: u32, fontWeight: FONT_WEIGHT, fontStretch: FONT_STRETCH, fontStyle: FONT_STYLE, fontSize: f32, outputAxisValues: [^]FONT_AXIS_VALUE) -> u32,
	GetMatchingFonts4:                         proc "system" (this: ^IFontSet4, familyName: LPCWSTR, fontAxisValues: [^]FONT_AXIS_VALUE, fontAxisValueCount: u32, allowedSimulations: FONT_SIMULATIONS, matchingFonts: ^^IFontSet4) -> HRESULT,
}


BITMAP_DATA_BGRA32 :: struct {
	width:  u32,
	height: u32,
	pixels: [^]u32,
}

IBitmapRenderTarget2_UUID_STRING :: "C553A742-FC01-44DA-A66E-B8B9ED6C3995"
IBitmapRenderTarget2_UUID := &IID{0xC553A742, 0xFC01, 0x44DA, {0xA6, 0x6E, 0xB8, 0xB9, 0xED, 0x6C, 0x39, 0x95}}
IBitmapRenderTarget2 :: struct #raw_union {
	#subtype idwritebitmaprendertarget1: IBitmapRenderTarget1,
	using idwritebitmaprendertarget2_vtable: ^IBitmapRenderTarget2_VTable,
}
IBitmapRenderTarget2_VTable :: struct {
	using idwritebitmaprendertarget1_vtable: IBitmapRenderTarget1_VTable,
	GetBitmapData: proc "system" (this: ^IBitmapRenderTarget2, bitmapData: ^BITMAP_DATA_BGRA32) -> HRESULT,
}

PAINT_FEATURE_LEVEL :: enum i32 {
	NONE    = 0,
	COLR_V0 = 1,
	COLR_V1 = 2,
}

PAINT_ATTRIBUTES :: distinct bit_set[PAINT_ATTRIBUTES_FLAG; u32]
PAINT_ATTRIBUTES_FLAG :: enum u32 {
	USES_PALETTE    = 0,
	USES_TEXT_COLOR = 1,
}

PAINT_COLOR :: struct {
	value:             COLOR_F,
	paletteEntryIndex: u16,
	alphaMultiplier:   f32,
	colorAttributes:   PAINT_ATTRIBUTES,
}

COLOR_COMPOSITE_MODE :: enum i32 {
	CLEAR          = 0,
	SRC            = 1,
	DEST           = 2,
	SRC_OVER       = 3,
	DEST_OVER      = 4,
	SRC_IN         = 5,
	DEST_IN        = 6,
	SRC_OUT        = 7,
	DEST_OUT       = 8,
	SRC_ATOP       = 9,
	DEST_ATOP      = 10,
	XOR            = 11,
	PLUS           = 12,
	SCREEN         = 13,
	OVERLAY        = 14,
	DARKEN         = 15,
	LIGHTEN        = 16,
	COLOR_DODGE    = 17,
	COLOR_BURN     = 18,
	HARD_LIGHT     = 19,
	SOFT_LIGHT     = 20,
	DIFFERENCE     = 21,
	EXCLUSION      = 22,
	MULTIPLY       = 23,
	HSL_HUE        = 24,
	HSL_SATURATION = 25,
	HSL_COLOR      = 26,
	HSL_LUMINOSITY = 27,
}

PAINT_TYPE :: enum i32 {
	NONE            = 0,
	LAYERS          = 1,
	SOLID_GLYPH     = 2,
	SOLID           = 3,
	LINEAR_GRADIENT = 4,
	RADIAL_GRADIENT = 5,
	SWEEP_GRADIENT  = 6,
	GLYPH           = 7,
	COLOR_GLYPH     = 8,
	TRANSFORM       = 9,
	COMPOSITE       = 10,
}

PAINT_ELEMENT :: struct {
	paintType: PAINT_TYPE,
	paint: struct #raw_union {
		layers: struct {
			childCount: u32,
		},
		solidGlyph: struct {
			glyphIndex: u32,
			color:      PAINT_COLOR,
		},
		solid: PAINT_COLOR,
		linearGradient: struct {
			extendMode:        u32,
			gradientStopCount: u32,
			x0:                f32,
			y0:                f32,
			x1:                f32,
			y1:                f32,
			x2:                f32,
			y2:                f32,
		},
		radialGradient: struct {
			extendMode:        u32,
			gradientStopCount: u32,
			x0:                f32,
			y0:                f32,
			radius0:           f32,
			x1:                f32,
			y1:                f32,
			radius1:           f32,
		},
		sweepGradient: struct {
			extendMode:        u32,
			gradientStopCount: u32,
			centerX:           f32,
			centerY:           f32,
			startAngle:        f32,
			endAngle:          f32,
		},
		glyph: struct {
			glyphIndex: u32,
		},
		colorGlyph: struct {
			glyphIndex: u32,
			clipBox:    D2D_RECT_F,
		},
		transform: MATRIX,
		composite: struct {
			mode: COLOR_COMPOSITE_MODE,
		},
	},
}

IPaintReader_UUID_STRING :: "8128E912-3B97-42A5-AB6C-24AAD3A86E54"
IPaintReader_UUID := &IID{0x8128E912, 0x3B97, 0x42A5, {0xAB, 0x6C, 0x24, 0xAA, 0xD3, 0xA8, 0x6E, 0x54}}
IPaintReader :: struct #raw_union {
	#subtype iunknown: IUnknown,
	using idwritepaintreader_vtable: ^IPaintReader_VTable,
}
IPaintReader_VTable :: struct {
	using iunknown_vtable: IUnknown_VTable,
	SetCurrentGlyph:       proc "system" (this: ^IPaintReader, glyphIndex: u32, paintElement: ^PAINT_ELEMENT, structSize: u32, clipBox: ^D2D_RECT_F, glyphAttributes: ^PAINT_ATTRIBUTES) -> HRESULT,
	SetTextColor:          proc "system" (this: ^IPaintReader, textColor: ^COLOR_F) -> HRESULT,
	SetColorPaletteIndex:  proc "system" (this: ^IPaintReader, colorPaletteIndex: u32) -> HRESULT,
	SetCustomColorPalette: proc "system" (this: ^IPaintReader, paletteEntries: [^]COLOR_F, paletteEntryCount: u32) -> HRESULT,
	MoveToFirstChild:      proc "system" (this: ^IPaintReader, paintElement: ^PAINT_ELEMENT, structSize: u32) -> HRESULT,
	MoveToNextSibling:     proc "system" (this: ^IPaintReader, paintElement: ^PAINT_ELEMENT, structSize: u32) -> HRESULT,
	MoveToParent:          proc "system" (this: ^IPaintReader) -> HRESULT,
	GetGradientStops:      proc "system" (this: ^IPaintReader, firstGradientStopIndex: u32, gradientStopCount: u32, gradientStops: [^]D2D1_GRADIENT_STOP) -> HRESULT,
	GetGradientStopColors: proc "system" (this: ^IPaintReader, firstGradientStopIndex: u32, gradientStopCount: u32, gradientStopColors: [^]PAINT_COLOR) -> HRESULT,
}

IFontFace7_UUID_STRING :: "3945B85B-BC95-40F7-B72C-8B73BFC7E13B"
IFontFace7_UUID := &IID{0x3945B85B, 0xBC95, 0x40F7, {0xB7, 0x2C, 0x8B, 0x73, 0xBF, 0xC7, 0xE1, 0x3B}}
IFontFace7 :: struct #raw_union {
	#subtype idwritefontface6: IFontFace6,
	using idwritefontface7_vtable: ^IFontFace7_VTable,
}
IFontFace7_VTable :: struct {
	using idwritefontface6_vtable: IFontFace6_VTable,
	GetPaintFeatureLevel: proc "system" (this: ^IFontFace7, glyphImageFormat: GLYPH_IMAGE_FORMATS) -> PAINT_FEATURE_LEVEL,
	CreatePaintReader:    proc "system" (this: ^IFontFace7, glyphImageFormat: GLYPH_IMAGE_FORMATS, paintFeatureLevel: PAINT_FEATURE_LEVEL, paintReader: ^^IPaintReader) -> HRESULT,
}

IFactory8_UUID_STRING :: "EE0A7FB5-DEF4-4C23-A454-C9C7DC878398"
IFactory8_UUID := &IID{0xEE0A7FB5, 0xDEF4, 0x4C23, {0xA4, 0x54, 0xC9, 0xC7, 0xDC, 0x87, 0x83, 0x98}}
IFactory8 :: struct #raw_union {
	#subtype idwritefactory7: IFactory7,
	using idwritefactory8_vtable: ^IFactory8_VTable,
}
IFactory8_VTable :: struct {
	using idwritefactory7_vtable: IFactory7_VTable,
	TranslateColorGlyphRun3: proc "system" (this: ^IFactory8, baselineOrigin: D2D1_POINT_2F, glyphRun: ^GLYPH_RUN, glyphRunDescription: ^GLYPH_RUN_DESCRIPTION, desiredGlyphImageFormats: GLYPH_IMAGE_FORMATS, paintFeatureLevel: PAINT_FEATURE_LEVEL, measuringMode: MEASURING_MODE, worldAndDpiTransform: ^MATRIX, colorPaletteIndex: u32, colorEnumerator: ^^IColorGlyphRunEnumerator1) -> HRESULT,
}

IBitmapRenderTarget3_UUID_STRING :: "AEEC37DB-C337-40F1-8E2A-9A41B167B238"
IBitmapRenderTarget3_UUID := &IID{0xAEEC37DB, 0xC337, 0x40F1, {0x8E, 0x2A, 0x9A, 0x41, 0xB1, 0x67, 0xB2, 0x38}}
IBitmapRenderTarget3 :: struct #raw_union {
	#subtype idwritebitmaprendertarget2: IBitmapRenderTarget2,
	using idwritebitmaprendertarget3_vtable: ^IBitmapRenderTarget3_VTable,
}
IBitmapRenderTarget3_VTable :: struct {
	using idwritebitmaprendertarget2_vtable: IBitmapRenderTarget2_VTable,
	GetPaintFeatureLevel:         proc "system" (this: ^IBitmapRenderTarget3) -> PAINT_FEATURE_LEVEL,
	DrawPaintGlyphRun:            proc "system" (this: ^IBitmapRenderTarget3, baselineOriginX: f32, baselineOriginY: f32, measuringMode: MEASURING_MODE, glyphRun: ^GLYPH_RUN, glyphImageFormat: GLYPH_IMAGE_FORMATS, textColor: COLORREF, colorPaletteIndex: u32, blackBoxRect: ^RECT) -> HRESULT,
	DrawGlyphRunWithColorSupport: proc "system" (this: ^IBitmapRenderTarget3, baselineOriginX: f32, baselineOriginY: f32, measuringMode: MEASURING_MODE, glyphRun: ^GLYPH_RUN, renderingParams: ^IRenderingParams, textColor: COLORREF, colorPaletteIndex: u32, blackBoxRect: ^RECT) -> HRESULT,
}


FILEFORMAT               :: HRESULT(-2003283968) //0x88985000
UNEXPECTED               :: HRESULT(-2003283967) //0x88985001
NOFONT                   :: HRESULT(-2003283966) //0x88985002
FILENOTFOUND             :: HRESULT(-2003283965) //0x88985003
FILEACCESS               :: HRESULT(-2003283964) //0x88985004
FONTCOLLECTIONOBSOLETE   :: HRESULT(-2003283963) //0x88985005
ALREADYREGISTERED        :: HRESULT(-2003283962) //0x88985006
CACHEFORMAT              :: HRESULT(-2003283961) //0x88985007
CACHEVERSION             :: HRESULT(-2003283960) //0x88985008
UNSUPPORTEDOPERATION     :: HRESULT(-2003283959) //0x88985009
TEXTRENDERERINCOMPATIBLE :: HRESULT(-2003283958) //0x8898500A
FLOWDIRECTIONCONFLICTS   :: HRESULT(-2003283957) //0x8898500B
NOCOLOR                  :: HRESULT(-2003283956) //0x8898500C
REMOTEFONT               :: HRESULT(-2003283955) //0x8898500D
DOWNLOADCANCELLED        :: HRESULT(-2003283954) //0x8898500E
DOWNLOADFAILED           :: HRESULT(-2003283953) //0x8898500F
TOOMANYDOWNLOADS         :: HRESULT(-2003283952) //0x88985010
