local storyboard = require("storyboard")
local scene = storyboard.newScene()
local facebookScore = 0
require("sqlite3")

local spinIt

local HEIGHT = display.contentHeight
local WIDTH = display.contentWidth

function scene:createScene(e)
	-- Recuperando view[cena de jogo]
	local view = self.view

	local background = display.newImage("img/tank01.png")
	background.y = HEIGHT * 0.5
	background.x = WIDTH * 0.5

	------------------------------------------- LABEL -------------------------------------------
	local play = display.newText( "Play Again ", 80, 150, native.systemFont, 28)
	play:setFillColor( 255, 0, 0)

	local menu = display.newText( "Main Menu", 80, 220, native.systemFont, 28)
	menu:setFillColor( 255, 0, 0)

	local label = display.newText( "Rank Score", 400, 80, native.systemFont, 28)
	label:setFillColor( 255, 0, 0)

	local pontuacao1 = display.newText("0", 400, 120, native.systemFont, 24)
	pontuacao1:setFillColor( 255, 0, 0)

	local pontuacao2 = display.newText( "0", 400, 170, native.systemFont, 24)
	pontuacao2:setFillColor( 255, 0, 0)

	local pontuacao3 = display.newText( "0", 400, 220, native.systemFont, 24)
	pontuacao3:setFillColor( 255, 0, 0)

	-- Funcao para transitar para proxima cena
	function play:tap(e)
		-- Indica qual a proxima cena a ser carregada
		storyboard.gotoScene( "jogo")
	end
	-- Associando listener ao label play
	play:addEventListener( "tap", play)

	-- Funcao para transitar para proxima cena
	function menu:tap(e)
		-- Indica qual a proxima cena a ser carregada
		storyboard.gotoScene( "inicio")
	end
	-- Associando listener ao label play
	menu:addEventListener( "tap", menu)

	------------------------------------------- LABEL -------------------------------------------
	------------------------------------------- SHOW SCORE -------------------------------------------
	-- Criando tabela para armazenar a pontuacao do usuario
	local pos = {}
	pos[0] = 0
	pos[1] = 0
	pos[2] = 0
	local i = 0;
	-- Indicando o local onde esta a base de dados
	path = system.pathForFile("data.db", system.DocumentsDirectory)
	-- Abrindo a base de dados
	banco = sqlite3.open( path )  
	-- Executando SQL para listar as pontuacoes em ordem decrescente
	for row in banco:nrows("SELECT * FROM battle_city_score ORDER BY content DESC") do
		pos[i] = tonumber(row.content)
		i = i+1;
	end
	-- Atualizando labels
	pontuacao1.text = pos[0];
	pontuacao2.text = pos[1];
	pontuacao3.text = pos[2];
	-- Fechando base de dados
	banco:close()

	------------------------- Inserindo labels na cena ---------------------

	view:insert( background)
	view:insert( play)
	view:insert( menu)
	view:insert( label)
	view:insert( pontuacao1)
	view:insert( pontuacao2)
	view:insert( pontuacao3)
end

function scene:enterScene(e)
end

function scene:exitScene(e)
	storyboard.removeScene( "fim" )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

return scene;
