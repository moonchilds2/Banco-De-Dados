SELECT* FROM aluno;
SELECT * FROM curso;

SELECT 
	aluno.nome AS "Aluno",
	curso.nome AS "Curso"
FROM aluno 
JOIN aluno_curso ON aluno.id = aluno_curso.aluno_id
JOIN curso ON curso.id = aluno_curso.curso_id;



