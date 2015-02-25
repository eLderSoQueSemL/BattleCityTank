-- Importando a biblioteca storyboard para o jogo
local storyboard = require("storyboard")
-- Criando uma nova cena
local scene = storyboard.newScene()
-- Importando a biblioteca para manipulacao de banco de dados
require("sqlite3")

--local spinIt

------------------- Declarando Audio -----------------------
local tijolo = audio.loadSound("snd/tijolo.wav")
local concreto = audio.loadSound("snd/concreto.wav")
local inimigo_atingido = audio.loadSound("snd/inimigo_atingido.wav")
local fenix_atingida = audio.loadSound("snd/fenix_atingida.mp3")
local player_atingido = audio.loadSound("snd/player_atingido.wav")
local tiro = audio.loadSound("snd/tiro.wav")

-- Preenchendo a cena
function scene:createScene(e)
	local view = self.view

	system.activate("multitouch")

	WIDTH = display.contentWidth
	HEIGHT = display.contentHeight

	tilemap = 
	{
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	}

	tilemap_image = 
	{
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil},
		{ nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil}
	}

	------------------------------------- Declarando Fenix -----------------------------------------------

	local fenix = nil

	------------------------------------- Declarando Variaveis de Controle ----------------------------------------

	morreu = false
	gameOver = false
	vidas = 3
	score = 0
	quantidade_inimigos = 8
	id_tilemap = 0
	inimigos_eleminidados = 0
	inimigo_tela = 0
	inimigos_criados = 0
	inimigos_criados_fase = 0--4

	------------------------------------- Declarando Tabelas Dinamicas -----------------------------------

	projeteis_player = {}
	inimigos = {}
	projeteis_inimigo = {}
	inimigos_draw = {}

	---------------------------- Carregando Tilemap ------------------------------------
	-- Variavel que indica a fonte do arquivos de tilemap
	local tilemapPath

	function prepara_tilemap()
		local str = ""
		-- Selecionando tilemaps
		if(id_tilemap == 1)
		then
			str = "tilemap/data01.dat"
		elseif(id_tilemap == 2)
		then
			str = "tilemap/data02.dat"
		elseif(id_tilemap == 3)
		then
			str = "tilemap/data03.dat"
		end -- FIM IF
		-- Atualizando qual tilemap será carregado
		tilemapPath = system.pathForFile( str, system.ResourceDirectory )
	end -- FIM FUNCAO

	function carrega_tilemap()
		linhas = 1
		-- Abrindo o arquivo com permissão de leitura
		local file = io.open( tilemapPath, "r" )
		if (file)
		then
			-- Lendo todos os caracteres do arquivo como string
			local contents = file:read( "*a" )
			aux = 0
			-- Lendo o arquivo linha por linha
			for line in io.lines(tilemapPath) do
				-- For para ler cada coluna da linha
				for i=1,30 do
					-- Recuperando o numero presente na coluna
					str = line:sub(aux, aux+1)
					tile = nil
					if(str == " 1")
					then
						-- Preenchendo tilemap para indicar que a posicao nao esta vazia
						tilemap[linhas][i] = 1
						-- Inserindo imagem do tijolo na posicao do tilemap
						tile = display.newImage( "img/tijolo.png" )
						-- Reposicionando a imagem
						tile.y = (linhas - 1) * 16 + tile.width / 2 -- colunas
						tile.x = (i - 1) * 16 + tile.height / 2-- linhas
					elseif (str == " 2")
					then
						-- Preenchendo tilemap para indicar que a posicao nao esta vazia	
						tilemap[linhas][i] = 2
						-- Inserindo imagem do concreto na posicao do tilemap
						tile = display.newImage( "img/concreto.png" )
						-- Reposicionando a imagem
						tile.y = (linhas - 1) * 16 + tile.width / 2 -- colunas
						tile.x = (i - 1) * 16 + tile.height / 2-- linhas
					elseif (str == " 3")
					then
						-- Inserindo imagem da fenix na posicao do tilemap
						tile = display.newImage( "img/fenix.fw.png" )
						-- Reposicionando a imagem
						tile.y = (linhas - 1) * 16 + tile.width / 2 -- colunas
						tile.x = (i - 1) * 16 + tile.height / 2-- linhas
						-- Atualizando fenix
						fenix = tile
					end
					-- Armazenando a referencia para a imagem inserida na cena
					tilemap_image[linhas][i] = tile
					if(tile ~= nil)
					then
						-- inserindo sprite na cena para ser
						-- removida ao final de sua execucao
						view:insert(tile)
					end
					aux = aux+3
				end
				aux = 0
				linhas = linhas + 1
			end -- FIM FOR
			-- Fechando o arquivo
			io.close( file )
		end -- FIM IF
	end -- FIM FUNCAO

	-------------------- Declarando Sprite Inimigos -----------------------
	local inimigoSheetData = {
		width = 16, height = 16,
		numFrames = 12,
		sheetContentWidth = 48, sheetContentHeight = 64
	}

	local inimigoSheet = graphics.newImageSheet("img/inimigo.png", inimigoSheetData)	

	local inimigoSequenceData = {
		{name = "up", start = 1, count = 3, time = 1000},
		{name = "right", start = 4, count = 3, time = 1000},
		{name = "left", start = 7, count = 3, time = 1000},
		{name = "down", start = 10, count = 3, time = 1000}
	}

	------------------------------------- Declarando Player ------------------------------------------------

	local playerSheetData = {
		-- Definindo o tamanho de cada sprite na animação
		width = 16, height = 16,
		-- Definindo a quantidade de sprites que a imagem contem
		numFrames = 12,
		-- Definindo a largura e altura da animação
		sheetContentWidth = 48, sheetContentHeight = 64
	}

	local playerSheet = graphics.newImageSheet("img/player.png", playerSheetData)	

	local playerSequenceData = {
		{name = "up", start = 1, count = 3, time = 1000},
		{name = "right", start = 4, count = 3, time = 1000},
		{name = "left", start = 7, count = 3, time = 1000},
		{name = "down", start = 10, count = 3, time = 1000}
	}

	player = display.newSprite(playerSheet, playerSequenceData)
	player.x = 256 + player.width / 2
	player.y = 304 + player.height / 2
	player.init_x = player.x
	player.init_y = player.y
	player:setSequence( "up" )
	player:play( )

	player.speedX = 0
	player.speedY = 0
	player.speed = 0.03
	player.fire = 0

	view:insert(player)

	------------------------- Controle ----------------------
	esquerda = display.newImage("img/controle.png")
	esquerda.x = 16
	esquerda.y = 276
	esquerda:setFillColor(0, 0, 255)
	esquerda:rotate( 270 )

	cima = display.newImage("img/controle.png")
	cima.x = 48
	cima.y = 250
	cima:setFillColor(0, 0, 255)


	baixo = display.newImage("img/controle.png")
	baixo.x = 48
	baixo.y = 300
	baixo:setFillColor(0, 0, 255)
	baixo:rotate(180)

	direita = display.newImage("img/controle.png")
	direita.x = 76
	direita.y = 276
	direita:setFillColor(0, 0, 255)
	direita:rotate( 90 )

	tiro = display.newImage("img/botao.png")
	tiro.x = 448
	tiro.y = 288

	-- Indica a direção que o player anda
	direction_move = 0
	-- Indica qual a direção do tiro do player
	direction_fire = -2

	function left(  )
		direction_move = -1
	end

	function right(  )
		direction_move = 1
	end

	function up(  )
		direction_move = -2
	end

	function down(  )
		direction_move = 2
	end

	-- Inserindo controles de jogo na view
	view:insert(esquerda)
	view:insert(direita)
	view:insert(cima)
	view:insert(baixo)
	view:insert(tiro)

	-------------------	Declarando Labels -----------------------------
	-- Declarando label vida
	vidasText = display.newText( "Vidas: " .. vidas, 5, 5, native.systemFont, 10)
	-- Alterando a âncora do label
	vidasText.anchorX = 0
	vidasText.anchorY = 0.1
	-- Alterando cor do texto
	vidasText:setFillColor( 255, 255, 0 )

	scoreText = display.newText( "Pontos: " .. score, 5, 20, native.systemFont, 10)
	scoreText.anchorX = 0
	scoreText.anchorY = 0.1
	scoreText:setFillColor( 255, 255, 0 )

	view:insert(vidasText)
	view:insert(scoreText)

	--------------------------- Atualiza Labels --------------------------------------
	function update_labels()
		-- Alterando o atributo text dos labels
		vidasText.text = "Vidas: " .. vidas
		scoreText.text = "Pontos: " .. score
	end -- FIM FUNCAO

	---------------------------- Funçoes para desnhar inimigos ---------------------------
	function desenha_inimigos()
		local _x = 8
		local _y = 35
		
		for i=1,quantidade_inimigos do
			-- Declarando sprite
			local inimigo = display.newImage("img/inimigo_draw.png")
			-- Alterando âncora[centro da imagem] do objeto
			inimigo.anchorX = 0
			inimigo.anchorY = 0
			-- Reposicionando objeto
			inimigo.x = _x
			inimigo.y = _y
			-- Inserindo objeto na tabela
			table.insert( inimigos_draw, inimigo )
			-- Inserindo inimigo na view
			view:insert(inimigo)
			_x = _x + 21
			-- Definindo layout em 4 colunas
			if(	(i % 4) == 0)
			then
				_x = 8
				_y = _y + 20
			end
		end -- FIM FOR
	end -- FIM FUNCAO

	function apaga_inimigos()
		for k,v in pairs(inimigos_draw) do
			-- Removendo inimigo da cena
			v:removeSelf( )
			-- Removendo inimigo da cena
			table.remove( inimigos_draw, k )
			-- Parando repetição
			break
		end -- FIM FOR
	end -- FIM FUNCAO

	function criar_inimigos()
	 	-- Criando sprite do Inimigo
		inimigo = display.newSprite(inimigoSheet, inimigoSequenceData)
		inimigo:setSequence("down")
		inimigo.speedX = 0
		inimigo.speedY = 0
		inimigo.speed = 0.025

		-- Gerando 3 posições aleatorias para reposicionar os inimigos
		local temp = math.random(3)
		if(temp == 1) 
		then -- criando inimigo na coluna 9
			inimigo.x = 128 + inimigo.width / 2
			inimigo.y = inimigo.height / 2
		elseif(temp == 2) 
		then -- criando inimigo na coluna 19
			inimigo.x = 288 + inimigo.width / 2
			inimigo.y = inimigo.height / 2
		else -- criando inimigo na coluna 29
			inimigo.x = 448 + inimigo.width / 2
			inimigo.y = inimigo.height / 2
		end
		inimigo.speedY = inimigo.speed
		-- Inserindo inimigos na tabela
		table.insert( inimigos, inimigo )
		-- Inserindo inimigo na view
		view:insert(inimigo)
	end -- FIM FUCAO

	function move_inimigo()
		for k,v in pairs(inimigos) do
			-- Encotrando a âncora[Centro da imagem] do objeto
			inimigoWidth = v.width / 2
			inimigoHeight = v.height / 2

			-- Verificando se o inimigo está apenas
			-- uma linha e coluna do tilemap
			modx = math.floor((v.x - inimigoWidth) % 16)
			mody = math.floor((v.y - inimigoHeight) % 16)

			if(modx == 0 and mody == 0)
			then
				-- Encontrando a linha e coluna que o inimigo esta
				linha = math.floor((v.y + v.height) / 16)
				coluna = math.floor((v.x + v.width) / 16)
				checa_colisao_tilemap(v, linha, coluna)
			end
			-- Movendo Inimigos
			v.x = v.x + v.speedX * deltaTime
			v.y = v.y + v.speedY * deltaTime
		end -- FIM FOR
	end -- FIM FUCAO

	function checa_colisao_tilemap(v, linha, coluna)
		-- Inimigo anda na vertical
		if (v.speedY ~= 0)
		then
			if(v.speedY > 0) -- inimigo andava para baixo
			then
				-- Verificando se a proxima linha e coluna esta livre
				-- Caso contrario altera a direção do inimigo
				if(linha < 20 and tilemap[linha + 1][coluna] > 0)
				then
					-- Alterando a direção do inimigo
					inimigo_direction(v, 0, 1)
				end
			else -- inimigo andava para cima
				if(linha > 1 and tilemap[linha - 1][coluna] > 0)
				then
					inimigo_direction(v, 0, -1)
				end
			end
		-- Inimigo anda na horizontal
		else
			if(v.speedX > 0) -- inimigo anda para direita
			then
				if(coluna < 30 and tilemap[linha][coluna + 1] > 0)
				then
					inimigo_direction(v, 1, 0)
				end
			else -- inimigo anda para esquerda
				if(coluna > 1 and tilemap[linha][coluna - 1] > 0)
				then
					inimigo_direction(v, -1, 0)
				end
			end -- FIM IF - ELSE
		end -- FIM IF
		-- Apos checar as colisões, cria tiro para inimigos
		inimigo_criar_tiro(v)
	end	

	function inimigo_altera_direcao(inimigo, vx, vy, sequence)
		inimigo:setSequence( sequence )
		inimigo:play( )
		inimigo.speedX = vx
		inimigo.speedY = vy
	end -- FIM FUNCAO
	
	function reposiciona_inimigos()
		for k,v in pairs(inimigos) do
			-- Encontrando a âncora[centro da imagem] do objeto
			inimigoWidth = v.width / 2
			inimigoHeight = v.height / 2
	 		-- Verificando se os inimigos saem a esquerda da cena
			if(v.x < inimigoWidth)
			then
				v.x = inimigoWidth
				inimigo_direction(v, -1, 0)
			-- Verificando se os inimigos saem a direita da cena
			elseif(v.x > (WIDTH - inimigoWidth))
			then
				v.x = WIDTH - inimigoWidth
				inimigo_direction(v, 1, 0)
			end
			-- Verificando se os inimigos saem por cima da cena
			if(v.y < inimigoHeight)
			then
				v.y = inimigoHeight
				inimigo_direction(v, 0, -1)
			-- Verificando se os inimigos saem por baixo da cena
			elseif(v.y > (HEIGHT - inimigoHeight))
			then
				v.y = HEIGHT - inimigoHeight
				inimigo_direction(v, 0, 1)
			end
		end
	end -- FIM FUNCAO

	function inimigo_direction(v, x, y)
		-- Gerando nova direção do inimigo
		direcao = math.random(3)
		-- Verificando se o inimigo andava na horizontal
		if(x ~= 0 and y == 0)
		then
			if(direcao == 1) -- inimigo andara para cima
			then
				-- Alterando a direção para inimigo andar para cima
				inimigo_altera_direcao(v, 0, -v.speed, "up")
			elseif(direcao == 2) -- Inimigo andava na horizontal
			then
				if(x > 0) -- inimigo andava para direita
				then
					-- Alterando a direção para inimigo andar para esquerda
					inimigo_altera_direcao(v, -v.speed, 0, "left")
				else -- Alterando a direção para inimigo andar para direita
					inimigo_altera_direcao(v, v.speed, 0, "right")
				end
			else -- inimigo andara para baixo
				-- Alterando a direção para inimigo andar para baixo
				inimigo_altera_direcao(v, 0, v.speed, "down")
			end
		-- Inimigo andava na vertical
		else
			if(direcao == 1) -- Inimigo andava na vertical.
			then
				if(y > 0) -- Verificando se inimigo andava para baixo
				then
					-- Alterando a direção para inimigo andar para cima
					inimigo_altera_direcao(v, 0, -v.speed, "up")
				else -- Inimigo andava para cima
					-- Alterando a direção para inimigo andar para baixo
					inimigo_altera_direcao(v, 0, v.speed, "down")
				end
			elseif(direcao == 2) -- inimigo anda para direita
			then
				-- Alterando a direção para inimigo andar para direita
				inimigo_altera_direcao(v, v.speed, 0, "right")
			else -- inimigo anda para esquerda
				-- Alterando a direção para inimigo andar para esquerda
				inimigo_altera_direcao(v, -v.speed, 0, "left")
			end
		end
	end -- FIM FUNCAO

	------------------------- Criando tiros para inimigos --------------------------------
	function inimigo_criar_tiro(v)
		local aux = math.random(10)
		if (aux == 1) 
		then
			-- Declarando imagem do tiro do inimigo
			projetil = display.newImage( "img/inimigo_projetil.png")
			projetil.speedX = 0
			projetil.speedY = 0
			projetil.speed = 0.035

			-- Inimigo atira para direita
			if(v.speedX > 0)
			then
				projetil.speedX = projetil.speed
				projetil.speedY = 0
				projetil.x = v.x + (v.width / 2)
				projetil.y = v.y
			-- Inimigo atira para esquerda
			elseif(v.speedX < 0)
			then
				projetil.speedX = -projetil.speed
				projetil.speedY = 0
				projetil.x = v.x - (v.width / 2)
				projetil.y = v.y
			-- Inimigo atira para baixo
			elseif(v.speedY > 0)
			then
				projetil.speedX = 0
				projetil.speedY = projetil.speed
				projetil.x = v.x
				projetil.y = v.y + (v.height / 2)
			-- Inimigo atira para cima
			else
				projetil.speedX = 0
				projetil.speedY = -projetil.speed
				projetil.x = v.x
				projetil.y = v.y - (v.height / 2)
			end
			-- Inserindo projetil inimigo na tabela
			table.insert( projeteis_inimigo, projetil )
			-- Inserindo projetil na view
			view:insert(projetil)
			-- Reproduzindo som de tiro
			audio.play(tiro)
		end -- FIM IF
	end -- FIM FUNCAO

	------------------------ Movendo Tiros Inimigos ----------------------------
	function inimigo_mover_tiro()
		for k,v in pairs(projeteis_inimigo) do
			-- Verificando se o projetil esta sob apenas uma posição do tilemap
			modx_projetil = math.floor(v.x % 8)
			mody_projetil = math.floor(v.y % 8)

			local is_delete = false

			if(modx_projetil == 0 and mody_projetil == 0)
			then
				-- Recuperando em qual linha e coluna o projetil esta
				c = math.floor((v.x + v.width) / 16)
				l = math.floor((v.y + v.height) / 16)
				is_delete = checa_colisao_projetil_tilemap(projeteis_inimigo, k, v, l, c)
			end -- FIM IF MOD PROJETIL

			-- movendo projetil inimigo
			v.x = v.x + v.speedX * deltaTime 
			v.y = v.y + v.speedY * deltaTime

			-- Se projetil nao colidiu com algum bloco do tilemap, verifica se ele saiu da cena
			if(not is_delete)
			then
				destroi_projetil(k, v, projeteis_inimigo)
			end
		end -- FIM FOR
	end -- FIM FUNCAO

	------------------------------ Funcoes para controlar o player --------------------------
	function move_player()
		-- Recuperando a âncora[Centro da imagem] do objeto 
		playerWidth = player.width / 2
		playerHeight = player.height / 2

		-- Verificando se o player está sob apenas uma posição da matriz
		modx = math.floor((player.x - playerWidth) % 16)
		mody = math.floor((player.y - playerHeight) % 16)

		if(modx == 0 and mody == 0)
		then
			-- Parando o player em uma posição exata na matriz
			player.speedX = 0
			player.speedY = 0

			-- Encontrando em qual linha e coluna o player está
			linha = math.floor((player.y + player.height) / 16)
			coluna = math.floor((player.x + player.width) / 16)

			-- verificando se tocou controle para direita
			if(direction_move == 1)
			then
				-- Verificando se a proxima linha e coluna esta livre
				-- Caso contrario altera a direção do inimigo
				if(tilemap[linha][coluna + 1] == 0)
				then
					player.speedX = player.speed
				else
					player.speedX = 0
				end
				player:setSequence( "right" )
				direction_fire = 1
			-- verificando se tocou controle para esquerda
			elseif(direction_move == -1)
			then
				if(tilemap[linha][coluna - 1] == 0)
				then
					player.speedX = -player.speed
				else
					player.speedX = 0
				end
				player:setSequence( "left" )
				direction_fire = -1
			-- verificando se tocou controle para baixo
			elseif(direction_move == 2)
			then
				if(linha < 20 and tilemap[linha + 1][coluna] == 0)
				then
					player.speedY = player.speed
				else
					player.speedY = 0
				end
				player:setSequence( "down" )
				direction_fire = 2
			-- verificando se tocou controle para cima
			elseif(direction_move == -2)
			then
				if(linha > 1 and tilemap[linha - 1][coluna] == 0)
				then
					player.speedY = -player.speed
				else
					player.speedY = 0
				end
				player:setSequence( "up" )
				direction_fire = -2
			end
			direction_move = 0
			player:play( )
		end -- FIM IF MOD

		-- movendo player
		player.x = player.x + player.speedX * deltaTime
		player.y = player.y + player.speedY * deltaTime
	end -- FIM FUNCAO

	function reposiciona_player()
		-- Recuperando a âncora[Centro da imagem] do objeto 
		playerWidth = player.width / 2
		playerHeight = player.height / 2

		-- Evitando que o player saia da tela na horizontal esquerda
		if(player.x < playerWidth)
		then
			player.x = playerWidth
		-- Evitando que o player saia da tela na horizontal direita
		elseif(player.x > (WIDTH - playerWidth))
		then
			player.x = WIDTH - playerWidth
		end

		-- Evitando que o player saia da tela na vertical superior
		if(player.y < playerHeight)
		then
			player.y = playerHeight
		-- Evitando que o player saia da tela na vertical inferior
		elseif(player.y > (HEIGHT - playerHeight))
		then
			player.y = HEIGHT - playerHeight
		end
	end -- FIM FUNCAO

	function player_destrava_tiro()
		player.fire = 0
	end -- FIM FUNCAO

	--------------------------------- Criando tiro do Jogador --------------------------------------
	function player_criar_tiro()
		if(player.fire == 0)
		then
			-- Declarando imagem de tiro
			projetil = display.newImage("img/player_projetil.png")
			projetil.speedX = 0
			projetil.speedY = 0
			projetil.speed = 0.03

			if(direction_fire == 1) 
			then -- atirar para direita
				projetil.speedX = projetil.speed
				projetil.speedY = 0
				projetil.x = player.x + (player.width / 2)
				projetil.y = player.y				
			elseif(direction_fire == -1) 
			then -- atirar para esquerda
				projetil.speedX = -projetil.speed
				projetil.speedY = 0
				projetil.x = player.x - (player.width / 2)
				projetil.y = player.y				
			elseif(direction_fire == 2) 
			then -- atirar para baixo
				projetil.speedY = projetil.speed
				projetil.speedX = 0
				projetil.x = player.x
				projetil.y = player.y + (player.height / 2)
			else -- atirar para cima
				projetil.speedY = -projetil.speed
				projetil.speedX = 0
				projetil.x = player.x
				projetil.y = player.y - (player.height / 2)
			end
			-- atributo do player que restringe a quantidade de projeteis
			player.fire = 1
			-- Inserindo projetil na tabela
			table.insert( projeteis_player, projetil )
			-- Reproduzindo som de tiro
			audio.play(tiro)
			-- Inserindo projetil na view
			view:insert(projetil)
		end
	end -- FIM FUNCAO

	----------------------- tiro do jogador ------------------------
	function player_atirar()
		for k,v in pairs(projeteis_player) do
			-- Recuperando a âncora[centro da imagem] do objeto
			modx_projetil = math.floor(v.x % 8)
			mody_projetil = math.floor(v.y % 8)

			--Verificando se o projetil está sob apenas uma posição da matriz
			if(modx_projetil == 0 and mody_projetil == 0)
			then
				-- Encontrando a linha e coluna qeu o player esta
				c = math.floor((v.x + v.width) / 16)
				l = math.floor((v.y + v.height) / 16)
				-- Checando colisão com tilemap
				checa_colisao_projetil_tilemap(projeteis_player, k, v, l, c)
			end -- FIM IF MOD PROJETIL

			-- movendo projetil player
			v.x = v.x + v.speedX * deltaTime 
			v.y = v.y + v.speedY * deltaTime

			-- Destruindo projetil ao sair da cena
			destroi_projetil(k, v, projeteis_player)
		end -- FIM FOR	
	end -- FIM FUNCAO

	------------------------------ Checagens de Colisão ----------------------------------------
	------------------------------- Checando Colisao entre projeteis do jogador e Fenix ---------------------------------
	function checa_colisao_projeteis_player_fenix()
		if(not gameOver)
		then
			for k,v in pairs(projeteis_player) do
				-- Verificando se existe colisao
				if(hasCollided(fenix, v))
				then
					-- Removendo projetil da cena
					v:removeSelf( )
					-- Removendo projetil da tabela
					table.remove( projeteis_player, k )
					-- Checando se ocorreu gameover
					checa_gameover()
				end
			end -- FIM FOR
		end -- FIM IF
	end -- FIM FUNCAO

	------------------------------ Checando colisao do Jogador e fenix com os inimigos ------------------------------
	function checa_colisao_inimigo(obj, isFenix)
		if(not gameOver)
		then
			if(not morreu)
			then
				for k,v in pairs(inimigos) do
					-- Verificando se existe colisao
					if (hasCollided(obj, v))
					then
						-- Checando se ocorreu gameover
						checa_gameover()
						-- Checa se o objeto que colidiu com o inimigo eh a fenix
						if(isFenix)
						then
							-- Removendo inimigo que colide com a fenix
							v:removeSelf( )
							-- Removendo inimigo da tabela
							table.remove( inimigos, k )
						end
					end
				end -- FIM FOR
			end -- FIM IF
		end -- FIM IF
	end -- FIM FUNCAO

	-------------------------- Checando colisao do projeteis do inimigo com jogador e fenix -----------------------------------
	function checa_colisao_inimigo_projeteis(obj)
		if(not gameOver)
		then
			for k,v in pairs(projeteis_inimigo) do
				if(not morreu)
				then
					-- Verificando se existe colisao
					if(hasCollided(obj, v))
					then
						if(obj == player)
						then
							-- Reproduzindo som caso player seja atingido por
							-- um inimigo/projetil
							audio.play(player_atingido)
						end
						-- Removendo projetil ao colidir
						v:removeSelf( )
						-- Removendo projetil
						table.remove( projeteis_inimigo, k )
						-- Checando se ocorreu gameover
						checa_gameover()		
					end -- FIM IF
				end -- FIM IF
			end -- FIM FOR
		end -- FIM IF
	end -- FIM FUNCAO

	-------------------------------- Checando colisao do projeteis do jogador com os inimigos --------------------------------------
	function checa_colisao_tabelas(tabela1, tabela2, isInimigo)
		if(not gameOver)
		then
			local colidiu = false
			for k1,v1 in pairs(tabela1) do 
				for k2,v2 in pairs(tabela2) do
					-- Verificando se existe colisao
					if (hasCollided(v1, v2)) 
					then
						colidiu = true
						-- Removendo inimigo/projetil da cena 
						v2:removeSelf( )
						-- Removendo inimigo/projetil atingido da tabela
						table.remove( tabela2, k2 )
						if(isInimigo)
						then
							-- Incrementando pontos quando um inimigo eh destruido
							score = score + 10
							-- Reproduzindo som quando inimigo for
							-- atingido por um projetil do player
							audio.play(inimigo_atingido)
							-- Apagando um inimigo desenhado quando um inimigo do player for atingido
							apaga_inimigos()
							-- Indicando que um inimigo foi destruido, assim outra será criado
							inimigo_tela = inimigo_tela -1
							-- Atualizando variavel de controle para checar
							-- se o player destruiu todos os inimigos
							inimigos_eleminidados = inimigos_eleminidados + 1
						end -- FIM IF
					end -- FIM IF
				end -- FIM FOR
				if(colidiu)
				then
					-- Removendo projetil da cena
					v1:removeSelf( )
					-- Removendo projetil do player ao atingir inimigo/player
					table.remove( tabela1, k1 )
				end
			end -- FIM FOR
		end -- FIM IF
	end -- FIM FUNCAO

	------------------------------ Funções Genericas -------------------------------------------
	function checa_colisao_projetil_tilemap(tabela, k, v, l, c)
		-- Checando se projetil o que anda para direita
		-- colide com um objeto tijolo no tilemap
		if(v.speedX > 0 and c < 31 and tilemap[l][c] > 0)
		then
			remove_projetil(tabela, k, v, l, c)
			return true
		-- Checando se projetil o que anda para esquerda
		-- colide com um objeto tijolo no tilemap
		elseif(v.speedX < 0 and c > 0 and tilemap[l][c] > 0)
		then
			remove_projetil(tabela, k, v, l, c)
			return true
		-- Checando se projetil o que anda para baixo
		-- colide com um objeto tijolo no tilemap
		elseif(v.speedY > 0 and l < 21 and tilemap[l][c] > 0)
		then
			remove_projetil(tabela, k, v, l, c)
			return true
		-- Checando se projetil o que anda para cima
		-- colide com um objeto tijolo no tilemap
		elseif(v.speedY < 0 and l > 0 and tilemap[l][c] > 0)
		then
			remove_projetil(tabela, k, v, l, c)
			return true
		end -- IF
		return false
	end -- FIM FUNCAO

	--------------------------- Checagem de Colisao por Retangulo --------------------------------
	function hasCollided( obj1, obj2)
		if(not gameOver)
		then
		   	if ( obj1 == nil ) then -- Verificando o objeto1 existe
		    	return false
		   	end
		   	if ( obj2 == nil ) then -- Verificando o objeto2 existe
		    	return false
		   	end
				   	
			-- Verificando se o obj1 colide a esquerda do obj2
		   	local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
		   	-- Verificando se o obj1 colide a direita do obj2
		   	local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
		   	-- Verificando se o obj1 colide em cima do obj2
		   	local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
		   	-- Verificando se o obj1 colide em baixo do obj2
		   	local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

		   	return (left or right) and (up or down)	  	
	   	end -- FIM IF
	end	--  FIM CHECAGEM COLISAO	

	function destroi_projetil( k, v, tabela )
		_width = v.width / 2
		_height = v.height / 2

		--verificando se o projetil está saia a direita
		if(v.x > (WIDTH + _width) and v.speedX > 0)
		then
		   	v:removeSelf( )
		   	table.remove( tabela, k )
		--verificando se o projetil está saia a esquerda
		elseif(v.x < - _width and v.speedX < 0)
		then
		  	v:removeSelf( )
		   	table.remove( tabela, k )
		end
					
		--verificando se o projetil está saia a cima
		if(v.y > (HEIGHT + _height) and v.speedY > 0)
		then
		  	v:removeSelf( )
		   	table.remove( tabela, k )
		--verificando se o projetil está saia a baixo
		elseif(v.y < - _height and v.speedY < 0)
		then
		  	v:removeSelf( )
		   	table.remove( tabela, k )
		end -- FIM IF
	end -- FIM FUNCAO

	----------------- Removendo projetil em caso de colisão ----------------
	function remove_projetil(tabela, k, v, l, c)
		-- Checando projetil colide com um tijolo do tilemap
		if(tilemap[l][c] == 1)
		then
			-- Atualizando tilemap para indicar que a posição está vazia
			tilemap[l][c] = 0
			-- Removendo sprite de tijolo da cena e da coordenada da tabela
			tilemap_image[l][c]:removeSelf( )
			tilemap_image[l][c] = nil
			-- Reproduzindo som quando objeto do tilemap eh atingido
			audio.play(tijolo)
		else
			-- Reproduzindo som quando objeto do tilemap eh atingido
			audio.play(concreto)
		end
		-- Removendo projetil da cena
		v:removeSelf( )
		-- Removendo projetil da tabela
		table.remove( tabela, k )
	end -- FIM FUNCAO

--------------------------- Funçoes para GameOver -------------------------------------------

	------------------- Chencando Fim de Jogo ----------------------
	---------------------- Reposicionar jogador ao Morrer --------------------------
	function reiniciar_player()
		-- Alterando variavel para desabilitar colisao de retangulo
		morreu = true
		-- Reposicionado player para posicao original na cena
		player.x = player.init_x
		player.y = player.init_y
		-- Resetando sequencia do player
		player:setSequence( "up" )
		player:play()
		-- Resetando direcao do projetil [atira para cima]
		direction_tiro = -2
	end -- FIM FUNCAO

	----------------------- Evitar que o jogador ao nascer colida com inimigos -------------------------
	function habilita_colisao_retangulo()
		morreu = false
	end -- FIM FUCAO

	function checa_gameover()
		-- Verificando a quantidade de vidas
		if(vidas > 0)
		then
			-- Reproduzindo som quano fenix for atingida por
			-- um inimigo/projetil
			audio.play(fenix_atingida)
			vidas = vidas - 1
			-- Recria a proteção em caso de danos
			cria_protecao_fenix()
			-- Reposicona o player ao lado da proteção da fenix
			reiniciar_player()
			-- Desabilitando colisao de retangulo do player
			timer.performWithDelay(3000, habilita_colisao_retangulo, 1)
		else
			-- Indica que o jogo acabou
			gameOver = true
		end
	end -- FIM FUNCAO

	-------------------------------- Fim de Jogo ----------------------------
	function game_over()
		parar_funcoes()
		escrever_arquivo(true)
		gameOverText.isVisible = true
		okGameOverText.isVisible = true
	end -- FIM FUNCAO

	function parar_funcoes()
		-- Parando GameLoop
		Runtime:removeEventListener( "enterFrame", onEveryFrame )
		-- Parando controles direcionais
		cima:removeEventListener( "tap", up )
		baixo:removeEventListener( "tap", down )
		esquerda:removeEventListener( "tap", left )
		direita:removeEventListener( "tap", right )
		-- Parando tiro do player
		tiro:removeEventListener( "tap", player_criar_tiro )
		-- Parando funçao programada
		timer.cancel( ID_destrava_tiro )
		-- Gravando pontuacao do usuario no banco de dados
		salveScore()
	end -- FIM FUNCAO

	function cria_protecao_fenix()
		-- Linha onde inicia a protecao da fenix
        local linha = 19
        -- Coluna onde inicia a protecao da fenix
        local coluna = 18
        for i=1,6 do
        	-- Checa se a protecao da fenix esta danificada
        	if(tilemap[linha][coluna] == 0 and i ~= 5)
	        then
	        	-- Criando sprite tijolo
	        	local tijolo = display.newImage("img/tijolo.png")
	        	-- Reposicionando sprite do tijolo
				tijolo.y = (linha - 1) * 16 + tijolo.width / 2 -- colunas
				tijolo.x = (coluna - 1) * 16 + tijolo.height / 2-- linhas 

				-- Guardando refenecia do sprite do tijolo
				tilemap_image[linha][coluna] = tijolo
				-- Indicando que a posição da matriz[linha][coluna] possui um objeto
				tilemap[linha][coluna] = 1
				view:insert(tijolo)
	      	end -- FIM IF
	      	coluna = coluna + 1
	      	-- Pulando para a proxima linha de protecao da fenix
	      	if(i == 3)
	      	then
	      		coluna = 18
	      		linha = 20
	      	end -- FIM IF
        end  -- FIM FOR
	end -- FIM FUNCAO

	------------------------------- Proxima Fase ----------------------------
	function level_up()
		if(quantidade_inimigos == inimigos_eleminidados)
		then
			parar_funcoes()
			escrever_arquivo(false)
			levelUpText.isVisible = true
			okLevelUpText.isVisible = true
		end -- FIM IF
	end -- FIM FUNCAO

	----------------------------- Checando quantidade de Inimigos na Cena --------------------------------
	function checa_quantidade_inimigos()
		print( "inimigos_tela " .. inimigo_tela .. "\n")
		print( "inimigos_criado_fase " .. inimigos_criados_fase .. "\n")
		print( "inimigos_criados " .. inimigos_criados .. "\n")
		print( "quantidade_inimigos " .. quantidade_inimigos .. "\n")
		if((inimigo_tela < inimigos_criados_fase) and (inimigos_criados < quantidade_inimigos))
		then
			inimigos_criados = inimigos_criados + 1
			inimigo_tela = inimigo_tela + 1
			criar_inimigos()
		end -- FIM IF
	end -- FIM FUNCAO


	local fasePath = system.pathForFile( "progresso.txt", system.ResourceDirectory )
	--------------------------------- Carrega Variaveis de Controle --------------------------------
	function ler_arquivo()
		local file = io.open( fasePath, "r" )
		if file then
			-- read all contents of file into a string
			local contents = file:read( "*a" )
			io.close( file )
			aux = 0
			for line in io.lines(fasePath) do -- FOR PARA LER ARQUIVO
				index = string.find( line, "=" )
				str = string.sub(line, index+1)
				if(aux == 0)
				then
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
	end -- FIM FUNCAO

	------------------------- Gravando Variaveis Controle para proxima fase -----------------------------------
	function escrever_arquivo(isGameOver)
		local file = io.open( fasePath, "w" )
		if(not isGameOver)
		then
			file:write("quantidade_inimigos=" .. (quantidade_inimigos+4) .. "\n")
			file:write("inimigo_criado_fase=" .. (inimigos_criados_fase+2) .. "\n")
			file:write("vidas=" .. vidas .. "\n")
			file:write("score=" .. score .. "\n")
			file:write("tilemap=" .. (id_tilemap+1) .. "\n")
		else
			file:write("quantidade_inimigos=8\n")
			file:write("inimigo_criado_fase=4\n")
			file:write("vidas=3\n")
			file:write("score=0\n")
			file:write("tilemap=1\n")
		end
		file:write("quantidade_tilemaps=3\n")
		io.close( file )
	end -- FIM FUNCAO

	------------------------------------- Salvando Pontuação ---------------------------
	function salveScore()
		-- Tabela para armazenar a pontuacao
		pos = {}
		pos[0] = 0
		pos[1] = 0
		pos[2] = 0
		-- Tabela para armazanar o id de cada pontuacao[facilita atulizar os pontos]
		id = {}
		id[0] = 0
		id[1] = 0
		id[2] = 0

		local count = 0;
		-- 
		-- Indicando o local onde esta a base de dados
		path = system.pathForFile("data.db", system.DocumentsDirectory)
		-- Abrindo a base de dados
		banco = sqlite3.open( path )  

		-- SQL para criar a tabela caso ela nao exista
		local table = 
		"CREATE TABLE IF NOT EXISTS battle_city_score (id INTEGER PRIMARY KEY, content INTEGER[255])"
		banco:exec(table)
		-- SQL para listar as pontuacoes em ordem decrescente
		local sqlSelect = "SELECT * FROM battle_city_score ORDER BY content DESC"
		-- SQL para inserir pontuacao caso uma posicao da tabela esteja vazia
		local sqlInsert = [[INSERT INTO battle_city_score VALUES (NULL, ']] .. score .. [['); ]]	

		for row in banco:nrows(sqlSelect) do
			count = count + 1;		
		end

		-- Caso a variavel count seja menor 3, uma posicao da tabela esta vazia
		if(count < 3) then
			banco:exec( sqlInsert )
		else
			local i = 0;
			-- Executando SQl select para recuperar os dados[possivel atualizacao]	
			for row in banco:nrows(sqlSelect) do
				pos[i] =  tonumber(row.content);
				id[i] = row.id;
				i = i+1;
			end
			-- Verificando se eh necessario atualizar ranking de pontuacao
			if(score > pos[0]) then
				banco:exec([[UPDATE battle_city_score SET content=']] .. score .. [[' WHERE Id=]] .. id[0])
				banco:exec([[UPDATE battle_city_score SET content=']] .. pos[0] .. [[' WHERE Id=]] .. id[1])
				banco:exec([[UPDATE battle_city_score SET content=']] .. pos[1] .. [[' WHERE Id=]] .. id[2])
			elseif(score > pos[1]) then
				banco:exec([[UPDATE battle_city_score SET content=']] .. score .. [[' WHERE Id=]] .. id[1])
				banco:exec([[UPDATE battle_city_score SET content=']] .. pos[1] .. [[' WHERE Id=]] .. id[2])
			elseif(score > pos[2]) then
				banco:exec([[UPDATE battle_city_score SET content=']] .. score .. [[' WHERE Id=]] .. id[2])
			end
		end
		-- Fechando conexao com banco de dados
		banco:close()
	end -- FIM SALVE SCORE

	--------------------------- Game Loop ------------------------
	deltaTime = 0
	previousTime = 0

	function onEveryFrame( event )
		deltaTime = event.time - previousTime
		previousTime = event.time

		if(not gameOver)
		then
			-- Movendo player
			move_player()

			-- Movendo projeteis do player
			player_atirar()

			-- Evitando que player saia da cena
			reposiciona_player()

			-- Movendo Inimigos
			move_inimigo()

			-- Evitando que inimigos saiam da cena
			reposiciona_inimigos()

			-- Movendo projeteis dos inimigos
			inimigo_mover_tiro()

			-- Checando se os projeteis do player atingem a fenix
			checa_colisao_projeteis_player_fenix()

			-- Checando se player/fenix colide com inimigos
			checa_colisao_inimigo(player, false)
			checa_colisao_inimigo(fenix, true)

			-- Checando se os projeteis inimigos atigem player/fenix
			checa_colisao_inimigo_projeteis(player)
			checa_colisao_inimigo_projeteis(fenix)

			-- Checando se os projeteis player colidem com projeteis inimigos
			checa_colisao_tabelas(projeteis_player, projeteis_inimigo, false)

			-- Checando se os projeteis player colidem com inimigos
			checa_colisao_tabelas(projeteis_player, inimigos, true)

			-- Atualizando Labels 
			update_labels()

			-- Checando o total de inimigos na cena
			checa_quantidade_inimigos()

			-- Checando se o jogador passou de fase
			level_up()
		else
			game_over()
		end
	end -- FIM FUNCAO 

end -- FIM CREATE SCENE

function scene:enterScene(e)
	-- Recuperando a cena de jogo
	local view = self.view
	-- Indica qual tilemap será carregado
	ler_arquivo()

	-- Selecionando tilemap
	prepara_tilemap()
	-- Carregando tilemap
	carrega_tilemap()

	------------------------------- Declarando Labels para GAMEOVER --------------------------------------------
	gameOverText = display.newText( "Fim de Jogo", WIDTH * 0.5, HEIGHT * 0.5 - 50, native.systemFont, 24)
	gameOverText:setFillColor( 255, 255, 0 )
	gameOverText.isVisible = false

	levelUpText = display.newText( "Fase " .. id_tilemap .. " Completa!", WIDTH * 0.5, HEIGHT * 0.5 - 50, native.systemFont, 24)
	levelUpText:setFillColor( 255, 255, 0 )
	levelUpText.isVisible = false

	scoreFinalText = display.newText( "Pontos ", WIDTH * 0.5, HEIGHT * 0.5, native.systemFont, 24)
	scoreFinalText:setFillColor( 255, 255, 0 )
	scoreFinalText.isVisible = false

	okGameOverText = display.newText( "OK", WIDTH * 0.5, HEIGHT * 0.5 + 50, native.systemFont, 24)
	okGameOverText:setFillColor( 255, 255, 0 )
	okGameOverText.isVisible = false

	okLevelUpText = display.newText( "OK", WIDTH * 0.5, HEIGHT * 0.5 + 50, native.systemFont, 24)
	okLevelUpText:setFillColor( 255, 255, 0 )
	okLevelUpText.isVisible = false

	-- Inserindo labels na view
	view:insert(gameOverText)
	view:insert(levelUpText)
	view:insert(scoreFinalText)
	view:insert(okGameOverText)
	view:insert(okLevelUpText)

	function okGameOverText:tap( e )
		-- Indica qual sera a proxima cena a ser carregada
		storyboard.gotoScene( "fim" )
	end -- FIM FUNCAO
	-- Associando listener a labels okGameOverText
	okGameOverText:addEventListener("tap", okGameOverText)

	function okLevelUpText:tap( e )
		-- Indica qual sera a proxima cena a ser carregada
		storyboard.gotoScene( "pausa" )
	end -- FIM FUNCAO
	-- Associando listener a labels okLevelUpText
	okLevelUpText:addEventListener( "tap", okLevelUpText)

	---------------------------- Funcoes programadas --------------------------------
	--ID_qtd_inimigo = timer.performWithDelay( 2000, checa_quantidade_inimigos, -1 )
	ID_destrava_tiro = timer.performWithDelay( 2000, player_destrava_tiro, -1)
	timer.performWithDelay( 1, desenha_inimigos, 1)

	---------------------------- Funcoes listeners ----------------------
	cima:addEventListener("tap", up)
	baixo:addEventListener("tap", down)
	esquerda:addEventListener("tap", left)
	direita:addEventListener("tap", right)
	tiro:addEventListener( "tap", player_criar_tiro )

	Runtime:addEventListener( "enterFrame", onEveryFrame )

end -- FIM ENTER SECENE

function scene:exitScene(e)
	-- Parando execucao da cena
	--Runtime:removeEventListener( "enterFrame", spinIt )
	-- Removendo a cena atual
	storyboard.removeScene( "jogo" )
end

-- Associando listeners as funcoes do storyboard
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )

-- Retornando a cena recem criada
return scene;
