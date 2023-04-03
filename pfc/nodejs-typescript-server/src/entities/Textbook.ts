import {
  Column,
  Entity,
  BaseEntity,
  CreateDateColumn,
  UpdateDateColumn,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinTable,
  OneToMany,
} from "typeorm";
import { Instructor } from "./Instructor";
import { Rating } from "./Rating";
import { Reservation } from "./Reservation";

@Entity("textbook")
export class Textbook extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false, default: "" })
  title: string;

  @Column("simple-array")
  author: string[];

  @Column({ nullable: false })
  cover_image_link: string;

  @Column("text", { nullable: true })
  desc: string;

  @Column({ nullable: false })
  field: string;

  @Column({ nullable: false, default: 1 })
  nb_copies: number;

  @Column({ nullable: false })
  page_count: number;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @Column("simple-array")
  categories: string[];

  // 1:M relationship between a User and a Reservation
  @OneToMany(() => Reservation, (reservation) => reservation.textbooks, {
    nullable: false,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinTable()
  reservations: Reservation[];
}
