# Conformance
This repository contains test bitstreams and reference decoded images for testing conformance of JPEG XL decoders.
It can also be useful to test applications with JPEG XL support.

The following table gives a rough overview of some of the coding tools and features that are being tested with each test case:

| test case  	| what it tests	|
|---	|---	|
| alpha_triangle  	|  Modular mode, alpha channel, 9-bit |
| animation_icos4D  |  VarDCT mode, alpha channel, animation |
| animation_newtons_cradle | Modular mode, Palette, animation |
| bench_oriented_BRG | Container, VarDCT mode, JPEG reconstruction, Orientation, ICC profile |
| bike | VarDCT mode |
| grayscale_public_university | Modular mode, Squeeze, Grayscale |
| sunset_logo | Modular mode, RCT, 10-bit, Orientation, two layers (alpha blending) |
