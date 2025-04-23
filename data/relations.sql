-- PGPASSWORD=gnobisP psql -h localhost -p 5432 -U relations_users -d relations
DROP TABLE IF EXISTS raw_matches;
CREATE TABLE raw_matches (
    gameid VARCHAR(50),
    datacompleteness VARCHAR(15), -- Testar cast quando tiver incerindo dados no python
    url VARCHAR(255),
    league VARCHAR(50),
    year INT,
    split VARCHAR(20),
    playoffs BOOLEAN, --POSTGRESQL não aceita 0 e 1 como booleanos, se der merda, voutar aqui
    date TIMESTAMP,  -- Se incluir horário usar TIMESTAMP
    game INT, -- Se der merda tentar VARCHAR
    patch VARCHAR(20),
    participantid INT, -- Se der merda tentar VARCHAR - players: (1,2,3,4,5,6,7,8,9,10)teams: (100,200)
    side VARCHAR(10),  -- Blue or RED...can be boolean...but is this necessary?
    position VARCHAR(4),  -- top, jg, mif, sup, adc and team
    playername VARCHAR(30),  -- teams don't have
    playerid VARCHAR(50),  -- teams don't have
    teamname VARCHAR(30),
    teamid VARCHAR(70),
    champion VARCHAR(50), -- only payers have
    ban1 VARCHAR(50),  -- only teams have
    ban2 VARCHAR(50),  -- only teams have
    ban3 VARCHAR(50),  -- only teams have
    ban4 VARCHAR(50),  -- only teams have
    ban5 VARCHAR(50),  -- only teams have
    pick1 VARCHAR(50),  -- only teams have
    pick2 VARCHAR(50),  -- only teams have
    pick3 VARCHAR(50),  -- only teams have
    pick4 VARCHAR(50),  -- only teams have
    pick5 VARCHAR(50),  -- only teams have
    gamelength INT,  -- tempo da partida em segundos
    result VARCHAR(20), -- bolean 1 venceu 0 perdeu
    kills INT,-- para times é total de kills do time, para players quantidade de kills daquele player
    deaths INT, -- para times é total de kills do time, para players quantidade de kills daquele player
    assists INT, -- para times é total de kills do time, para players quantidade de kills daquele player
    teamkills INT, -- tanto time quanto players tem
    teamdeaths INT, -- tanto time quanto players tem
    doublekills INT, -- não consta? somente partidas completas
    triplekills INT,-- não consta?
    quadrakills INT,-- não consta?
    pentakills INT,-- não consta?
    firstblood BOOLEAN, -- Obteve Fb ou não
    firstbloodkill VARCHAR(50),
    firstbloodassist VARCHAR(50),
    firstbloodvictim VARCHAR(50),
    team_kpm NUMERIC,  -- Não é inteiro mantido como NUMERIC
    ckpm NUMERIC,       -- Não é inteiro mantido como NUMERIC
    firstdragon BOOLEAN,
    dragons INT,
    opp_dragons INT,
    elementaldrakes VARCHAR(100),  -- Ex: "Infernal,Mountain"
    opp_elementaldrakes VARCHAR(100),
    infernals INT,
    mountains INT,
    clouds INT,
    oceans INT,
    chemtechs INT,
    hextechs INT,
    dragons_type_unknown INT,
    elders INT,
    opp_elders INT,
    firstherald BOOLEAN,
    heralds INT,
    opp_heralds INT,
    void_grubs INT,
    opp_void_grubs INT,
    firstbaron BOOLEAN,
    barons INT,
    opp_barons INT,
    firsttower BOOLEAN,
    towers INT,
    opp_towers INT,
    firstmidtower BOOLEAN,
    firsttothreetowers BOOLEAN,
    turretplates INT,
    opp_turretplates INT,
    inhibitors INT,
    opp_inhibitors INT,
    damagetochampions INT,
    dpm NUMERIC,        -- Não é inteiro
    damageshare NUMERIC, -- Não é inteiro
    damagetakenperminute NUMERIC,
    damagemitigatedperminute NUMERIC,
    wardsplaced INT,
    wpm NUMERIC,        -- Não é inteiro
    wardskilled INT,
    wcpm NUMERIC,       -- Não é inteiro
    controlwardsbought INT,
    visionscore INT,
    vspm NUMERIC,       -- Não é inteiro
    totalgold INT,
    earnedgold INT,
    earned_gpm NUMERIC, -- Não é inteiro
    earnedgoldshare NUMERIC,
    goldspent INT,
    gspd NUMERIC,
    gpr NUMERIC,
    total_cs INT,
    minionkills INT,
    monsterkills INT,
    monsterkillsownjungle INT,
    monsterkillsenemyjungle INT,
    cspm NUMERIC,       -- Não é inteiro
    goldat10 INT,
    xpat10 INT,
    csat10 INT,
    opp_goldat10 INT,
    opp_xpat10 INT,
    opp_csat10 INT,
    golddiffat10 INT,
    xpdiffat10 INT,
    csdiffat10 INT,
    killsat10 INT,
    assistsat10 INT,
    deathsat10 INT,
    opp_killsat10 INT,
    opp_assistsat10 INT,
    opp_deathsat10 INT,
    goldat15 INT,
    xpat15 INT,
    csat15 INT,
    opp_goldat15 INT,
    opp_xpat15 INT,
    opp_csat15 INT,
    golddiffat15 INT,
    xpdiffat15 INT,
    csdiffat15 INT,
    killsat15 INT,
    assistsat15 INT,
    deathsat15 INT,
    opp_killsat15 INT,
    opp_assistsat15 INT,
    opp_deathsat15 INT,
    goldat20 INT,
    xpat20 INT,
    csat20 INT,
    opp_goldat20 INT,
    opp_xpat20 INT,
    opp_csat20 INT,
    golddiffat20 INT,
    xpdiffat20 INT,
    csdiffat20 INT,
    killsat20 INT,
    assistsat20 INT,
    deathsat20 INT,
    opp_killsat20 INT,
    opp_assistsat20 INT,
    opp_deathsat20 INT,
    goldat25 INT,
    xpat25 INT,
    csat25 INT,
    opp_goldat25 INT,
    opp_xpat25 INT,
    opp_csat25 INT,
    golddiffat25 INT,
    xpdiffat25 INT,
    csdiffat25 INT,
    killsat25 INT,
    assistsat25 INT,
    deathsat25 INT,
    opp_killsat25 INT,
    opp_assistsat25 INT,
    opp_deathsat25 INT
);

SELECT * FROM raw_matches WHERE gameid = '10660-10660_game_1';

'''
-- Tabela principal de jogos
CREATE TABLE Game (
    gameid VARCHAR(255) PRIMARY KEY,
    league VARCHAR(255),
    year INT,
    split VARCHAR(255),
    playoffs BOOLEAN,
    date DATE,
    patch VARCHAR(255),
    gamelength INT,
    result VARCHAR(255),
    url VARCHAR(255),
    datacompleteness BOOLEAN
);

-- Tabela de times
CREATE TABLE Team (
    teamid VARCHAR(255) PRIMARY KEY,
    teamname VARCHAR(255)
);

-- Tabela de campeões
CREATE TABLE Champion (
    championid VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255)
);

-- Tabela de jogadores
CREATE TABLE Player (
    playerid VARCHAR(255) PRIMARY KEY,
    playername VARCHAR(255)

);

-- Relação entre times e jogos
CREATE TABLE TeamInGame (
    team_in_game_id VARCHAR(255) PRIMARY KEY,
    gameid VARCHAR(255) NOT NULL,
    teamid VARCHAR(255) NOT NULL,
    side VARCHAR(255),
    result BOOLEAN,
    dragons INT,
    opp_dragons INT,
    barons INT,
    opp_barons INT,
    towers INT,
    opp_towers INT,
    firstdragon BOOLEAN,
    firstherald BOOLEAN,
    firstbaron BOOLEAN,
    firsttower BOOLEAN,
    FOREIGN KEY (gameid) REFERENCES Game(gameid),
    FOREIGN KEY (teamid) REFERENCES Team(teamid)
);

-- Tabela de bans
CREATE TABLE Ban (
    banid VARCHAR(255) PRIMARY KEY,
    gameid VARCHAR(255) NOT NULL,
    teamid VARCHAR(255) NOT NULL,
    championid VARCHAR(255) NOT NULL,
    ban_order INT,
    FOREIGN KEY (gameid) REFERENCES Game(gameid),
    FOREIGN KEY (teamid) REFERENCES Team(teamid),
    FOREIGN KEY (championid) REFERENCES Champion(championid)
);

-- Tabela de picks
CREATE TABLE Pick (
    pickid VARCHAR(255) PRIMARY KEY,
    gameid VARCHAR(255) NOT NULL,
    teamid VARCHAR(255) NOT NULL,
    championid VARCHAR(255) NOT NULL,
    pick_order INT,
    FOREIGN KEY (gameid) REFERENCES Game(gameid),
    FOREIGN KEY (teamid) REFERENCES Team(teamid),
    FOREIGN KEY (championid) REFERENCES Champion(championid)
);

-- Tabela de participantes
CREATE TABLE Participant (
    participantid VARCHAR(255) PRIMARY KEY,
    gameid VARCHAR(255) NOT NULL,
    team_in_game_id VARCHAR(255) NOT NULL,
    playerid VARCHAR(255) NOT NULL,
    championid VARCHAR(255) NOT NULL,
    position VARCHAR(255),
    kills INT,
    deaths INT,
    assists INT,
    totalgold INT,
    damagetochampions INT,
    wardsplaced INT,
    FOREIGN KEY (gameid) REFERENCES Game(gameid),
    FOREIGN KEY (team_in_game_id) REFERENCES TeamInGame(team_in_game_id),
    FOREIGN KEY (playerid) REFERENCES Player(playerid),
    FOREIGN KEY (championid) REFERENCES Champion(championid)
);

-- Estatísticas temporais dos participantes
CREATE TABLE ParticipantTimeStats (
    statid VARCHAR(255) PRIMARY KEY,
    participantid VARCHAR(255) NOT NULL,
    time_mark INT,
    gold INT,
    xp INT,
    cs INT,
    opp_gold INT,
    opp_xp INT,
    opp_cs INT,
    kills INT,
    deaths INT,
    assists INT,
    FOREIGN KEY (participantid) REFERENCES Participant(participantid)
);

-- Objetivos do jogo
CREATE TABLE GameObjective (
    objectiveid VARCHAR(255) PRIMARY KEY,
    gameid VARCHAR(255) NOT NULL,
    teamid VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    count INT,
    FOREIGN KEY (gameid) REFERENCES Game(gameid),
    FOREIGN KEY (teamid) REFERENCES Team(teamid)
);
'''