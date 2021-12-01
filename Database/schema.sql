DROP DATABASE IF EXISTS mou;
CREATE DATABASE mou;
use mou;

create table user(
                     user_id varchar(36)not null primary key,
                     email varchar(50),
                     password varchar(250),
                     first_name varchar(30),
                     last_name varchar(30),
                     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                     token varchar(300),
                     role_id varchar(36)
);

create table role(
                     role_id varchar(36) not null primary key,
                     role_name varchar(30)
);

create table user_role(
                          user_id varchar(36) not null primary key,
                          role_id varchar(36),
                          foreign key (role_id) references role(role_id) ON DELETE CASCADE
);

create table new_user(
                         email varchar(50) not null primary key,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         confirmation_token varchar(50),
                         role_id varchar (36),
                         created_user varchar (36),
                         foreign key (role_id) references role(role_id) ON DELETE CASCADE
);

create table reset_passwords(
                         email varchar(50) not null primary key,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         confirmation_token varchar(50)
);

create table mou(
                          mou_id varchar(36) not null primary key,
                          name varchar(300),
                          file_no varchar(20),
                          agreement_no varchar(20),
                          funding_agent varchar(300),
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          created_user varchar(36),
                          start_date DATE,
                          signing_date DATE,
                          expiring_date DATE,
                          grant_period varchar(36),
                          remarks varchar(500),
                          foreign key (created_user) references user(user_id)
);

create table application_type (
                           application_type_id varchar(36) not null primary key,
                           application_type_name varchar(36)
);

create table mou_application_type (
                          mou_id varchar(36) not null primary key,
                          application_type_id varchar(36),
                          foreign key (application_type_id) references application_type(application_type_id)  ON DELETE CASCADE
);

create table stage (
                           stage_id varchar(36) not null primary key,
                           stage_name varchar(36)
);

create table mou_stage (
                          mou_id varchar(36) not null primary key,
                          stage_id varchar(36),
                          foreign key (stage_id) references stage(stage_id)  ON DELETE CASCADE
);

create table country (
                           country_code varchar(5) not null primary key,
                           country_name varchar(36)
);

create table university (
                           university_code varchar(36) not null primary key,
                           university_name varchar(100),
                           contact_no varchar(15),
                           contact_email varchar(50),
                           contact_info varchar(250)
);

create table country_university (
                           university_code varchar(36) not null primary key,
                           country_code varchar(5),
                           foreign key (country_code) references country(country_code)  ON DELETE CASCADE
);

create table mou_university (
                          mou_id varchar(36) not null primary key,
                          university_code varchar(36),
                          foreign key (university_code) references university(university_code)  ON DELETE CASCADE
);

create table faculty (
                          faculty_id varchar(36) not null primary key,
                          name varchar(36),
                          email varchar(36),
                          phone_number varchar(16)
);

create table mou_faculty(
                       mou_id varchar(36) not null primary key,
                       faculty_id varchar(36),
                       foreign key (faculty_id) references faculty(faculty_id)  ON DELETE CASCADE
);

create table coordinator(
                       coordinator_id varchar(36) not null primary key,
                       coordinator_name varchar(36),
                       coordinator_phone_num varchar(36),
                       coordinator_email varchar(36)
);

create table mou_coordinators(
                        mou_id varchar(36) not null primary key,
                        coordinator_one varchar(36),
                        coordinator_two varchar(36),
                        coordinator_three varchar(36),
                        coordinator_four varchar(36),
                        coordinator_foreign varchar(36),
                        foreign key (coordinator_one) references coordinator(coordinator_id)  ON DELETE CASCADE,
                        foreign key (coordinator_two) references coordinator(coordinator_id)  ON DELETE CASCADE,
                        foreign key (coordinator_three) references coordinator(coordinator_id)  ON DELETE CASCADE,
                        foreign key (coordinator_four) references coordinator(coordinator_id)  ON DELETE CASCADE,
                        foreign key (coordinator_foreign) references coordinator(coordinator_id)  ON DELETE CASCADE
);



create table activity (
                            activity_id varchar(36) not null primary key,
                            mou_id varchar(36),
                            stage_id varchar(36),
                            responsible_person varchar(36),
                            comment varchar(100),
                            date_of_activity DATE,
                            foreign key (mou_id) references mou(mou_id) ON DELETE CASCADE,
                            foreign key (stage_id) references stage(stage_id) ON DELETE CASCADE,
                            foreign key (responsible_person) references user(user_id) ON DELETE CASCADE
);

