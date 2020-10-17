https://leetcode.com/problems/friendly-movies-streamed-last-month/

SELECT DISTINCT title
FROM TVProgram tv
LEFT JOIN Content content
ON tv.content_id = content.content_id
WHERE Kids_content = 'Y' AND content_type = 'Movies' AND program_date LIKE '2020-06%'