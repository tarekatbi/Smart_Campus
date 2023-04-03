import {
  Column,
  Entity,
  OneToOne,
  PrimaryGeneratedColumn,
  BaseEntity,
  CreateDateColumn,
  UpdateDateColumn,
  JoinColumn,
  OneToMany,
  JoinTable,
} from "typeorm";
import { Rating } from "./Rating";
import { Reservation } from "./Reservation";
import { Student } from "./Student";

@Entity("users")
export class User extends BaseEntity {
  //every user row will have a unique id value (autoincremented)
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  matricule: string;

  @Column({ unique: true })
  matricule_bac: string;

  @Column({ unique: true })
  password: string;

  @Column({ unique: true })
  cle_secrete: string;

  //automatically add created_at & updated_at columns
  @CreateDateColumn()
  created_at: Date;
  @UpdateDateColumn()
  updated_at: Date;

  // 1:M relationship between a User and a Rating
  @OneToMany(() => Rating, (rating) => rating.user, {
    nullable: false,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinTable()
  ratings: Rating[];

  // 1:M relationship between a User and a Reservation
  @OneToMany(() => Reservation, (reservation) => reservation.user, {
    nullable: false,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinTable()
  reservations: Reservation[];

  //every user account must belong to one and only one student
  @OneToOne(() => Student, {
    cascade: true,
    nullable: false,
    onDelete: "CASCADE",
  })
  @JoinColumn()
  student_id: Student;
}
