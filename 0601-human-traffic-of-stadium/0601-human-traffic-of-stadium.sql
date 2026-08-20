# Write your MySQL query statement below
with numbered as(
select id,visit_date,people,
       id-Row_number()over(order by id) AS group_id
from Stadium
where people>=100
)
SELECT id, visit_date, people
FROM numbered
WHERE group_id IN (
    SELECT group_id
    FROM numbered
    GROUP BY group_id
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date ASC;