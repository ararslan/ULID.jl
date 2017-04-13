__precompile__()

module ULID

export ulid

# Crockford's base-32 encoding
const _ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
const _BASE = 32

@inline function prng()
    return rand(RandomDevice(), UInt16) / 0xFFFF
end

function encodetime(now, n)
    # now should be in milliseconds-since-epoch
    s = Vector{Char}(n)
    @inbounds for i = n:-1:1
        m = now % _BASE
        s[i] = _ENCODING[m+1]
        now = (now - m) ÷ _BASE
    end
    return String(s)
end

function encoderandom(n)
    s = Vector{Char}(n)
    @inbounds for i = n:-1:1
        r = floor(Int, _BASE * prng()) + 1
        s[i] = _ENCODING[r]
    end
    return String(s)
end

"""
    ulid()

Generate a Universally Unique Lexicographically Sortable Identifier
(ULID) as a string.
"""
function ulid()
    now = trunc(Int, Base.Dates.datetime2unix(Base.Dates.now()) * 1000)
    return encodetime(now, 10) * encoderandom(16)
end

end # module
