CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  date_of_birth date NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  atmitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(100) NOT NULL
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  PRIMARY KEY id,
);