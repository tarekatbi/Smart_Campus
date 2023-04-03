import {
  Column,
  Entity,
  BaseEntity,
  CreateDateColumn,
  UpdateDateColumn,
  PrimaryGeneratedColumn,
  OneToMany,
} from "typeorm";
import { Textbook } from "./Textbook";

export enum InstructorRank {
  PROFESSOR = 0,
  ASSOCIATE_PROFESSOR = 1,
  DECTOR = 2,
}

@Entity("instructor")
export class Instructor extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false })
  first_name: string;

  @Column({ nullable: false, unique: true })
  last_name: string;

  @Column({ nullable: false, unique: true })
  email: string;

  @Column({ nullable: false, unique: true })
  phone_number: number;

  @Column({ nullable: false })
  field: string;

  @Column({
    nullable: false,
    type: "enum",
    enum: InstructorRank,
    default: InstructorRank.ASSOCIATE_PROFESSOR,
  })
  rank: InstructorRank;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;
}
