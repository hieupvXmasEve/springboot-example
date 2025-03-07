package com.hieupv.example.student;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class StudentService {
    private final StudentRepository repository;
    private final StudentMapper studentMapper;

    public StudentService(StudentRepository repository, StudentMapper studentMapper) {
        this.repository = repository;
        this.studentMapper = studentMapper;
    }

    public StudentResponseDto saveStudent(StudentDto dto) {
        var student = studentMapper.toStudent(dto);
        var savedStudent = repository.save(student);
        return studentMapper.toResponseDto(savedStudent);
    }

    public List<StudentResponseDto> findAllStudent() {
        return repository.findAll().stream().map(studentMapper::toResponseDto).collect(Collectors.toList());
    }

    public StudentResponseDto findById(Integer id) {
        return repository.findById(id).map(studentMapper::toResponseDto).orElse(null);
    }

    public List<StudentResponseDto> findStudentsByName(String name) {
        return repository.findAllByFirstnameContaining(name).stream().map(studentMapper::toResponseDto).collect(Collectors.toList());
    }

    public void deleteStudent(Integer id) {
        repository.deleteById(id);
    }
}
