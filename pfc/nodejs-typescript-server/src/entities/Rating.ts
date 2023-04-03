import {
  BaseEntity,
  Column,
  Entity,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Textbook } from "./Textbook";
import { User } from "./User";

@Entity("ratings")
export class Rating extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  rating: number;

  @ManyToOne(() => User, (user) => user.ratings, {
    eager: true,
    nullable: true,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  }) //assiging values to the rating
  @JoinTable()
  user: User;

  @ManyToOne(() => Textbook, {
    eager: true,
    nullable: false,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinColumn()
  textbooks: Textbook;
}
