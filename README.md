# stbimageheaders

Provides selected image-related stb C/C++ headers for use by R packages
through LinkingTo.

Included headers:

* stb_image.h
* stb_image_resize2.h
* stb_image_write.h

`stb_image_resize.h` is not included because upstream has moved the v1
resize header to the deprecated directory. Downstream packages should use
`stb_image_resize2.h`.

## Use from another R package

Add this to DESCRIPTION:

```text
LinkingTo: stbimageheaders
```

Include the headers with package-qualified paths:

```c
#include <stbimageheaders/stb_image.h>
#include <stbimageheaders/stb_image_resize2.h>
#include <stbimageheaders/stb_image_write.h>
```

In exactly one translation unit, define implementation macros before
including the corresponding headers:

```c
#define STB_IMAGE_IMPLEMENTATION
#include <stbimageheaders/stb_image.h>

#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include <stbimageheaders/stb_image_resize2.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stbimageheaders/stb_image_write.h>
```

Do not define implementation macros in headers included by multiple
translation units.

## Migrating from stb_image_resize.h to stb_image_resize2.h

The v2 resize API is not a pure filename replacement. Common simple-API
migrations are:

```c
/* Old v1 API */
ok = stbir_resize_uint8(input, in_w, in_h, 0,
                        output, out_w, out_h, 0,
                        num_channels);

/* New v2 API */
out_ptr = stbir_resize_uint8_linear(input, in_w, in_h, 0,
                                    output, out_w, out_h, 0,
                                    (stbir_pixel_layout) num_channels);
ok = out_ptr != NULL;
```

```c
/* Old v1 API */
ok = stbir_resize_float(input, in_w, in_h, 0,
                        output, out_w, out_h, 0,
                        num_channels);

/* New v2 API */
out_ptr = stbir_resize_float_linear(input, in_w, in_h, 0,
                                    output, out_w, out_h, 0,
                                    (stbir_pixel_layout) num_channels);
ok = out_ptr != NULL;
```

For four-channel data that should not be interpreted as alpha, prefer
`STBIR_4CHANNEL` instead of `(stbir_pixel_layout) 4`.

## License

The upstream stb headers offer a choice between the MIT license and a
public-domain dedication. This R package elects the MIT license alternative.
The complete upstream license text is preserved in each header.
