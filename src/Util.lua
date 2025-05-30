function GenerateQuads(atlas, tilewidth, tileheight)
    local sheetWidthSegments = math.floor(atlas:getWidth() / tilewidth)
    local sheetHeightSegments = math.floor(atlas:getHeight() / tileheight)

    local sheetCounter = 1
    local spriteSheet = {}

    for y = 0, sheetHeightSegments do
        for x = 0, sheetWidthSegments do
            spriteSheet[sheetCounter] =
                love.graphics.newQuad(x*tilewidth, y*tileheight, tilewidth, tileheight, atlas:getDimensions())
            sheetCounter = sheetCounter + 1
        end
    end
    return spriteSheet
end

function table.slice(tbl, first, last, step)
    local sliced = {}

    for i=first or 1, last or #tbl, step or 1 do
        sliced[#sliced+1] = tbl[i]
    end
    return sliced
end

function GenerateBasicPikmin(atlas)
    local x = 0
    local y = 0

    local pikminQuads = {}

    local atlasWidth, atlasHeight = atlas:getDimensions()

    for i = 1, 7 do
        pikminQuads[i] = love.graphics.newQuad(x, y, 63, 96, atlasWidth, atlasHeight)
        x = x + 63
    end

    return pikminQuads
end

function GenerateFlowers(atlas)
    local x = 0
    local y = 0

    local flowerQuads = {}

    local atlasWidth, atlasHeight = atlas:getDimensions()

    for i = 1, 7 do
        flowerQuads[i] = love.graphics.newQuad(x, y, 42, 42, atlasWidth, atlasHeight)
        x = x + 42
    end

    return flowerQuads
end

function GenerateDecor(atlas)
    local x = 0
    local y = 0

    local decorQuads = {}

    local atlasWidth, atlasHeight = atlas:getDimensions()

    for i = 1, 7 do
        decorQuads[i] = love.graphics.newQuad(x, y, 63, 96, atlasWidth, atlasHeight)
        x = x + 63
    end

    return decorQuads
end

