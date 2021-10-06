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

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount FLOAT,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_histories_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
  PRIMARY KEY(id)
);

CREATE TABLE treatment(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  type VARCHAR(35), 
  name VARCHAR(35)
);

CREATE TABLE treatments(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  medical_history_id INT,
  treatment_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY(treatment_id) REFERENCES treatment(id)
);

CREATE TABLE  invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_prices FLOAT NOT NULL,
  quantity INT NOT NULL,
  total_price FLOAT NOT NULL,
  invoice_id INT NOT NULL,
  treatment_id INT NOT NULL,
  FOREIGN KEY (invoice_id) REFERENCES invoice(id), 
  FOREIGN KEY (treatment_id) REFERENCES treatment(id),
  PRIMARY KEY (id)
);
