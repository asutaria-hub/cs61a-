import zlib, base64
exec(zlib.decompress(base64.b64decode('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')))
# Created by pyminifier (https://github.com/liftoff/pyminifier)
