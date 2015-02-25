-- -- Importando a biblioteca storyboard para o jogo
local storyboard = require("storyboard")
-- Criando uma nova cena
local scene = storyboard.newScene()

--local spinIt

-- Recuperando altura do dispositivo
local HEIGHT = display.contentHeight
-- Recuperando largura do disposito
local WIDTH = display.contentWidth

-- Preenchendo a cena
function scene:createScene(e)
	-- Recuperando view[cena de jogo]
	local view = self.view
	-- Declarando imagem de fundo
	local background = display.newImage("img/tank01.png")
	-- Reposicionando imagem de fundo
	background.y = HEIGHT * 0.5
	background.x = WIDTH * 0.5

	-- Criando labels para iniciar o jogo
	local iniciar = display.newText( "Play", 0, 0, native.systemFont, 32)
	iniciar:setFillColor( 0, 0, 255)
	iniciar.x = WIDTH * 0.2
	iniciar.y = HEIGHT * 0.4

	-- Criando labels para sair do jogo
	local sair = display.newText( "Exit", 0, 0, native.systemFont, 32)
	sair:setFillColor( 0, 0, 255)
	sair.x = WIDTH * 0.2
	sair.y = HEIGHT * 0.4 + 100

	-- Funcao para transitar para proxima cena
	function iniciar:tap(e)
		-- Indica que a proxima cena a ser carregada
		storyboard.gotoScene("jogo");
	end
	-- Associando listener ao label iniciar
	iniciar:addEventListener( "tap", iniciar)

	-- Funcao para transitar para proxima cena
	function sair:tap(e)
		-- Indica que a proxima cena a ser carregada
		native.requestExit();
	end
	-- Associando listener ao label sair
	sair:addEventListener( "tap", sair)

	-- Inserindo objetos na cena para serem removidos junto com a cena atual
	view:insert( background)
	view:insert( iniciar)
	view:insert( sair)
end -- FIM 

function scene:enterScene(e)
end

function scene:exitScene(e)
	-- Removendo a cena atual
	--Runtime:removeEventListener( "enterFrame", spinIt )
	storyboard.removeScene( "inicio" )
end

-- Associando listeners as funcoes do storyboard
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

-- Retornando a cena recem criada
return scene;
