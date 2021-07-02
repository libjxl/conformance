# Conformance
This repository contains test bitstreams and reference decoded images for testing conformance of JPEG XL decoders.
It can also be useful to test applications with JPEG XL support.

The following table gives a rough overview of some of the coding tools and features that are being tested with each test case:

| test case  	| what it tests	|
|---	|---	|
| alpha_nonpremultiplied | Modular mode, alpha channel, 12-bit |
| alpha_premultiplied | VarDCT mode, premultiplied alpha channel, 12-bit color, 16-bit alpha |
| alpha_triangle  |  Modular mode, alpha channel, 9-bit |
| animation_icos4D  |  VarDCT mode, alpha channel, animation |
| animation_newtons_cradle | Modular mode, Palette, animation |
| animation_spline | Splines, animation |
| bench_oriented_BRG | Container, VarDCT mode, JPEG reconstruction, Orientation, ICC profile |
| bicycles | Modular mode, Squeeze, XYB |
| bike | VarDCT mode |
| blendmodes | Modular mode, various blend modes, 12-bit |
| cafe | Container, VarDCT mode, JPEG reconstruction, chroma upsampling |
| cmyk_layers | Modular mode, CMYK (kBlack channel), layers, large ICC profile |
| delta_palette | Modular mode, Palette with delta entries |
| grayscale | VarDCT mode, Grayscale ICC profile |
| grayscale_jpeg | Container, VarDCT mode, JPEG reconstruction, Grayscale |
| grayscale_public_university | Modular mode, Squeeze, Grayscale |
| lossless_pfm | Modular mode, lossless 32-bit float |
| lz77_flower | Modular mode, lz77 |
| patches | VarDCT mode, Patches |
| patches_lossless | Modular mode, Patches |
| progressive | VarDCT mode, LF frame (Modular + Squeeze), TOC permutation, HF passes |
| spot | Modular mode, two spot colors, two layers, 16-bit ProPhoto |
| sunset_logo | Modular mode, RCT, 10-bit, Orientation, two layers |
| upsampling | VarDCT mode, alpha channel, upsampling |