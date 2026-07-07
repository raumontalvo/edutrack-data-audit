-- Query 1: Intro to Python enrollments
SELECT
  student_name,
  student_email,
  completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';
-- Query 2: Potential dropouts
SELECT
    *
FROM enrollments
WHERE completion_percentage < 10;
-- Query 3: Enrollments with missing instructor
SELECT
    *
FROM enrollments
WHERE instructor IS NULL;
-- Query 4: Top 5 not passed by completion percentage
SELECT
    student_name,
    student_email,
    course_title,
    completion_percentage,
    passed
FROM enrollments
WHERE passed = FALSE
ORDER BY completion_percentage DESC
LIMIT 5;
-- Query 5: Enrollments created in the last year (2025)
SELECT *
FROM enrollments
WHERE enrollment_date >= '2025-01-01'
ORDER BY enrollment_date DESC;
-- Query 6: Insert missing enrollment
INSERT INTO enrollments (
    id,
    student_id,
    student_name,
    student_email,
    course_id,
    course_title,
    category,
    enrollment_date,
    completion_percentage,
    passed,
    monthly_fee_paid,
    instructor
)
VALUES (
    18,
    3,
    'Lucia Fernandes',
    'lucia.fernandes@student.edutrack.com',
    5,
    'Advanced Python',
    'Programming',
    '2025-04-01',
    0,
    FALSE,
    69.99,
    'Carlos Vega'
);
-- Query 7: Update NULL instructors
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;

-- Query 8: Delete test account enrollments
DELETE FROM enrollments
WHERE student_email LIKE '%@test.com';
-- Query 9: Count enrollments by category
SELECT
    category,
    COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY category;
-- Query 10: Average completion percentage by course
SELECT
    course_title,
    AVG(completion_percentage) AS average_completion
FROM enrollments
GROUP BY course_title
ORDER BY average_completion ASC;

-- Query 11: Courses with more than 3 enrollments
SELECT
    course_title,
    COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;

-- Query 12: Total revenue by category
SELECT
    category,
    SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;