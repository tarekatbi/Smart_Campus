import {
  Column,
  Entity,
  BaseEntity,
  CreateDateColumn,
  UpdateDateColumn,
  PrimaryGeneratedColumn,
  ManyToOne,
  ManyToMany,
  JoinTable,
} from "typeorm";
import { Textbook } from "./Textbook";
import { User } from "./User";

@Entity("reservation")
export class Reservation extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  // @Column()
  // textbook_id: number;

  //1:M relationship between the student and the textbooks
  @ManyToOne((type) => Textbook, (txt) => txt.reservations, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinTable({ name: "textbook_id" })
  textbooks: Textbook;

  //1:M relationship between the student and the textbooks
  @ManyToOne((type) => User, (user) => user.reservations, {
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinTable({ name: "user_id" })
  user: User;
}
