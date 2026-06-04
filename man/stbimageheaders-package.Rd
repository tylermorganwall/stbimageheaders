\name{stbimageheaders-package}
\alias{stbimageheaders}
\alias{stbimageheaders-package}
\docType{package}
\title{'stb' Image C/C++ Header Files}
\description{
Provides selected image-related C/C++ header files from stb.
}
\details{
To use these headers from another R package, add this to DESCRIPTION:
\preformatted{
LinkingTo: stbimageheaders
}
and include the headers in C or C++ code with:
\preformatted{
#include <stbimageheaders/stb_image.h>
#include <stbimageheaders/stb_image_resize2.h>
#include <stbimageheaders/stb_image_write.h>
}

In exactly one translation unit, define the implementation macro before
including each implementation header:
\preformatted{
#define STB_IMAGE_IMPLEMENTATION
#include <stbimageheaders/stb_image.h>

#define STB_IMAGE_RESIZE_IMPLEMENTATION
#include <stbimageheaders/stb_image_resize2.h>

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <stbimageheaders/stb_image_write.h>
}
}
\keyword{package}
