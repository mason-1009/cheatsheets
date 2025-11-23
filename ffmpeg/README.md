# `ffmpeg`

> Talk is cheap, send patches. - @FFmpeg, Twitter

---

## Read File Information

Retrieve information about a video:

```bash
ffprobe video.mp4
```

Retrieve information about an audio file:

```bash
ffprobe music.mp3
```

## Transcode Video

Transcode a video to `h264` format using the `libx264` encoder with a `1M`
video bitrate, while copying the encoded audio:

```bash
ffmpeg -i video.mp4 -c:v libx264 -b:v 1M -c:a copy output_video.mp4
```

Encode a video using `libx264` using the *Constant Rate Factor* (CRF) feature
of the encoder:

```bash
ffmpeg -i video.mp4 -c:v libx264 -crf 45 -c:a copy output_video.mp4
```

CRF values range from `0` (lossless) to `51` (worst quality possible), with
`23` as the default. Documentation regards values of `17` or `18` to be
"visually lossless or nearly so."

`libx264` also supports named presets:

```bash
ffmpeg -i video.mp4 -c:v libx264 -preset slow -c:a copy output_video.mp4
```

`libx264` defines the following presets:

| Preset      | Description           |
| ---         | ---                   |
| `ultrafast` | Fastest               |
| `superfast` | ...                   |
| `veryfast`  | ...                   |
| `faster`    | ...                   |
| `fast`      | ...                   |
| `medium`    | Default               |
| `slow`      | ...                   |
| `slower`    | ...                   |
| `veryslow`  | Slowest useful preset |
| `placebo`   | Useless               |

## Copy Video to Different Containers

Copy the already-encoded video, audio, and subtitles from an `mp4` container to
an `mkv` container:

```bash
ffmpeg -i video.mp4 -c:v copy -c:a copy -c:s copy video.mkv
```

## Extract Subtitles

Extract subtitles from an `mp4` video and write them to an `srt` file. `ffmpeg`
will automatically determine what it should do from output filename extensions:

```bash
ffmpeg -i video.mp4 subtitles.srt
```
