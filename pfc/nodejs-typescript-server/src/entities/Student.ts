import {
  Column,
  Entity,
  BaseEntity,
  PrimaryColumn,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
} from "typeorm";
/**
 * Student Entity
 */
@Entity("students")
export class Student extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  first_name: string;
  @Column()
  last_name: string;

  @Column()
  field: string;

  @Column({ nullable: false })
  birth_date: Date;

  @Column({ unique: true, nullable: false })
  email: string;

  @Column({ unique: true })
  phone_number: number;

  @Column({ nullable: false, unique: true })
  matricule_bac: string;

  @Column({ nullable: false, unique: true })
  cle_secrete: string;

  @CreateDateColumn()
  created_at: Date;
  @UpdateDateColumn()
  updated_at: Date;
}
