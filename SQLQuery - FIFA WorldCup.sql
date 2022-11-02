SELECT *
FROM PortfolioProject2..players
ORDER BY 1,2

SELECT surname,team, position
FROM PortfolioProject2..players
ORDER BY 1,2


--Let's play with the midfielders position

SELECT DISTINCT surname
FROM PortfolioProject2..players
WHERE position = 'midfielder'

SELECT COUNT(DISTINCT surname) AS Total_midfielders
FROM PortfolioProject2..players
WHERE position = 'midfielder'

-- We have 226 midfielders

SELECT AVG(minutes) AS Average_minutes_by_Midfielders
FROM PortfolioProject2..players
WHERE position = 'midfielder'

--Average = 191.56 minutes played by midfielders

SELECT COUNT(DISTINCT team) AS Total_teams
FROM PortfolioProject2..players

--We have 32 Teams

SELECT surname, MAX(minutes) AS Maximum_minutes
FROM PortfolioProject2..players 
GROUP BY surname
ORDER BY MAX(minutes) DESC


SELECT DISTINCT team, position, COUNT(position) AS Total_positions
FROM PortfolioProject2..players
GROUP BY team, position
ORDER BY team, position ASC

--Let's change the 4 positions into Rows using the Pivot function

SELECT team, [defender], [forward], [goalkeeper], [midfielder]
FROM
(SELECT team, position
FROM PortfolioProject2..players) AS Source_Table
PIVOT
(COUNT(position)
FOR
[Position] IN ([defender], [forward], [goalkeeper],[midfielder]))
AS Pivot_Table

--Let's join the Player's table with the Teams table


SELECT surname,P.team, position, ranking, minutes, games
FROM PortfolioProject2..Players AS P
JOIN PortfolioProject2..Teams AS T
ON P.team = t.team
ORDER BY ranking ASC