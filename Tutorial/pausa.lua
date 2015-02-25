local storyboard = require("storyboard")
local scene = storyboard.newScene()

local spinIt

local HEIGHT = display.contentHeight
local WIDTH = display.contentWidth

function scene:createScene(e)
	local view = self.view

	local fasePath = system.pathForFile( "progresso.txt", system.ResourceDirectory )

	local file = io.open( fasePath, "r" )
	if file then
		-- lendo todos os caracteres como string
		local contents = file:read( "*a" )
		io.close( file )
		aux = 0
		-- Lendo arquivo linha por linha
		for line in io.lines(fasePath) do
			-- Filtrando string
			index = string.find( line, "=" )
			-- Encontrando valor da variavel
			str = string.sub(line, index+1)
			if(aux == 0)
			then
				-- Convertendo string para numerico
				quantidade_inimigos = tonumber(str)
			elseif(aux == 1)
			then
				inimigos_criados_fase = tonumber(str)
			elseif(aux == 2)
			then
				vidas = tonumber(str)
			elseif(aux == 3)
			then
				score = tonumber(str)
			elseif(aux == 4)
			then
				id_tilemap = tonumber(str)
			end
			aux = aux+1
		end -- FIM FOR
	end -- FIM IF

	------------------ Desenhando inimigo -----------------
	inimigo1 = display.newImage("img/inimigo_draw.png")
	inimigo1.y = 100
	inimigo1.x = 140

	------------------ Declarando Labels ------------------
	last_level = display.newText( "Fase " .. (id_tilemap-1), 0, 0, native.systemFont, 24)
	last_level.x = WIDTH * 0.5
	last_level.y = HEIGHT * 0.2

	last_inimigoText = display.newText( "Inimigos Eliminados: " .. (quantidade_inimigos-4), 0, 0, native.systemFont, 16)
	last_inimigoText.x = WIDTH * 0.5
	last_inimigoText.y = 100

	------------- Inserindo labels na view ---------------
	view:insert(inimigo1)
	view:insert(last_level)
	view:insert(last_inimigoText)

	if(id_tilemap  < quantidade_tilemaps)
	then
		------------------ Desenhando inimigo -----------------
		inimigo2 = display.newImage("img/inimigo_draw.png")
		inimigo2.y = 180
		inimigo2.x = 140

		------------------ Declarando Labels ------------------
		next_level = display.newText( "Fase " .. id_tilemap, 0, 0, native.systemFont, 24)
		next_level.x = WIDTH * 0.5
		next_level.y = HEIGHT * 0.45

		next_inimigoText = display.newText( "Total de Inimigos: " .. quantidade_inimigos, 0, 0, native.systemFont, 16)
		next_inimigoText.x = WIDTH * 0.5
		next_inimigoText.y = 180

		------------- Inserindo labels na view ---------------
		view:insert(inimigo2)
		view:insert(next_level)
		view:insert(next_inimigoText)
	end

	continuar = display.newText( "Continuar", 0, 0, native.systemFont, 32)
	continuar:setFillColor( 255, 255, 255)
	continuar.x = WIDTH * 0.5
	continuar.y = HEIGHT * 0.85

	------------------------- Gravando Variaveis Controle para proxima fase -----------------------------------
	function escrever_arquivo()
		local file = io.open( fasePath, "w" )
		file:write("quantidade_inimigos=8\n")
		file:write("inimigo_criado_fase=4\n")
		file:write("vidas=3\n")
		file:write("score=0\n")
		file:write("tilemap=1\n")
		file:write("quantidade_tilemaps=3\n")
		io.close( file )
	end -- FIM FUNCAO

	-- Inserindo label na view
	view:insert(continuar)
	
	function continuar:tap(e)
		local str = nil
		if(id_tilemap > quantidade_tilemaps)
		then
			str = "fim"
			-- Reiniciando o jogo
			escrever_arquivo()
		else
			str = "jogo"
		end
		storyboard.gotoScene(str)
	end
	continuar:addEventListener( "tap", continuar)

end -- FIM CREATE SCENE

function scene:enterScene(e)
end

function scene:exitScene(e)
	Runtime:removeEventListener( "enterFrame", spinIt )
	storyboard.removeScene( "pausa" )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene;