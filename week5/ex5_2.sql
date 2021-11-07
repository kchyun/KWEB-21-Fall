# 1. ID가 11인 노선을 예매한 모든 승객의 ID(id), 이름(name), 좌석 번호(seat_number)를 좌석 번호의 오름차순으로 조회
select users.id, name, seat_number 
from tickets join users join trains 
on tickets.user = users.id and tickets.train = trains.id 
where trains.id = 11
order by seat_number ASC;

# 2. 각 사용자의 ID(id), 이름(name), 탑승 열차 수(trains_count), 총 거리(total_distance)를 총 거리의 내림차순으로 상위 6명만 조회
select users.id, users.name, count(train) as trains_count, sum(distance)/10 as total_distance
from tickets join trains join users on tickets.train = trains.id and tickets.user = users.id
group by users.id
order by total_distance DESC, users.name limit 6;

# 3. 각 노선의 ID(id), 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 여행 시간(travel_time)을 여행 시간의 내림차순으로 상위 6개만 조회
select trains.id, types.name as type, src.name as stc_stn, dst.name as dst_stn, Timediff(arrival, departure) as travel_time
from trains
    inner join stations as src on trains.source = src.id
    inner join stations as dst on trains.destination = dst.id
    join types on trains.type = types.id
order by travel_time DESC limit 6;

# 4. 각 노선의 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 출발 시각(departure), 도착 시각(arrival), 운임(fare; 원 단위)을 출발 시각의 오름차순으로 모두 조회
select types.name as type, src.name as stc_stn, dst.name as dst_stn, departure, arrival, round(fare_rate * `distance`/1000,-2) as fare
from trains
    inner join stations as src on trains.source = src.id
    inner join stations as dst on trains.destination = dst.id
    join types on trains.type = types.id
order by departure ASC;

# 5. 각 노선의 ID(id), 열차 종류(type), 출발역(src_stn), 도착역(dst_stn), 예매된 좌석 수(occupied), 최대 좌석수(maximum)를 노선의 ID의 오름차순으로 모두 조회 (예매한 사용자가 없는 노선은 제외)
select trains.id, types.name as type, src.name as stc_stn, dst.name as dst_stn, count(tickets.id) as occupied, types.max_seats as maximum
from trains
    inner join stations as src on trains.source = src.id
    inner join stations as dst on trains.destination = dst.id
    join types on trains.type = types.id
    join tickets on tickets.train = trains.id
group by trains.id
order by trains.id ASC;

