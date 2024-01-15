-- 1)Retrieve all stations in the "East" region?
select StationName from Stations
where Location = 'East';

--2)List all shows hosted by "Vrajesh Hirjee"?
select ShowID, ShowName from Shows S
join Hosts H on S.HostID = H.HostID
where HostName ='Vrajesh Hirjee';

-- 3)Count the number of awards each show has won?
select S.ShowName, COUNT(A.AwardID) as No_of_Awards from Awards A
join Shows S On A.ShowID = S.ShowID
group by S.ShowName;



-- 4)Find shows that have partnerships with "Spotify"?

select s.showName , p.PartnerName from Shows s
join ShowPartnerships sp on s.ShowID =sp.ShowID
join Partnerships p on sp.PartnershipID = p.PartnershipID
where p.PartnerName ='Spotify';

-- 5)Retrieve hosts who joined before 2010?

select HostID,HostName,JoinDate from HOSTS
where YEAR(JoinDate) < '2010';

-- 6 List the shows and their launch dates in descending order of launch date?

select ShowName , Launchdate from Shows
order by LaunchDate desc;



--7)Find the total count of shows for each host?

select HostName, Sum(ShowCount)as total from HOSTS
Group by HostName 
order by total desc;


-- 8)Show the online presence platforms with their links?

select PlatformName, Link from OnlinePresence;


-- 9Retrieve the stations in the "South" region launched after 2010?

select StationName, Location,LaunchDate from Stations
where Location ='South' and YEAR(LaunchDate) <'2010';


-- 10 Rank hosts based on the number of shows they have hosted?
select HostName, ShowCount,
DENSE_RANK() over (order by ShowCount desc) as Hostrank from HOSTS;











