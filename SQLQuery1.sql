select * from Question
SELECT  q.id , q.content , q.answer , q.opt1 ,q.opt2, q.opt3, q.opt4, q.created , q.subjectId 
From Question q where q.status ='Active' and q.subjectId = 1 and q.content like '%a%'
ORDER BY q.id 
OFFSET 0 ROWS 
FETCH NEXT 6 ROWS ONLY

SELECT  COUNT(q.id)
From Question q where q.status ='Active' and q.subjectId = 1 and q.content like '%a%'
