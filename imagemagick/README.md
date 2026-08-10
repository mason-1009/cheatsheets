# ImageMagick

> ImageMagick is a free, open-source software suite, used for
> editing and manipulating digital images. It can be used to
> create, edit, compose, or convert bitmap images, and
> supports a wide range of file formats, including JPEG, PNG,
> GIF, TIFF, and Ultra HDR. - ImageMagick Documentation

---

## Flipping

**Note:** All examples assume an image (of a Pelican) in the current directory
called `pelican.jpg`.

Flip an image **vertically**:

```bash
magick pelican.jpg -flip flipped.jpg
```

Flip an image **horizontally**:

```bash
magick pelican.jpg -flop flopped.jpg
```

Rotate an image by 90 degrees (**clockwise**):

```bash
magick pelican.jpg -rotate 90 rotated.jpg
```

Resize an image such that the longest side is 500 pixels:

```bash
magick pelican.jpg -resize 500 resized.jpg
```

## Convert Images

Convert a JPEG to a lower-quality JPEG:

```bash
magick pelican.jpg -quality 30 deep_fried.jpg
```

## Dealing with Animated GIFs

Get the first frame from the GIF and convert it to a PNG:

```bash
magick 'running.gif[0]' first_frame.png
```

Get multiple frames from the GIF:

```bash
magick 'running.gif[0-5]' frame.png
```

This creates the following files: `frame-0.png`, `frame-1.png`, `frame-2.png`,
`frame-3.png`, `frame-4.png`, and `frame-5.png`.
