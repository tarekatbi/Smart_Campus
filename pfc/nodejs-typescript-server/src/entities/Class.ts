import {
  Column,
  Entity,
  BaseEntity,
  PrimaryColumn,
  CreateDateColumn,
  UpdateDateColumn,
  OneToOne,
  JoinColumn,
} from "typeorm";
import { Instructor } from "./Instructor";
import { PointOfInterest } from "./Point_of_interest";

@Entity("class")
export class Class extends BaseEntity {
  @PrimaryColumn()
  id: number;

  @Column({ nullable: false })
  type: string;

  @Column({ nullable: false })
  //automatically add when the lecture was created by the admin
  @CreateDateColumn()
  added_on: Date;
  @UpdateDateColumn()
  updated_at: Date;

  //create one to one relationship with the lecture and the POI
  @OneToOne(() => PointOfInterest, {
    nullable: false,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinColumn()
  location_of_lecture: PointOfInterest;

  //1:1 relationship between class and the instructor
  @OneToOne(() => Instructor, {
    nullable: false,
    onDelete: "CASCADE",
    onUpdate: "CASCADE",
  })
  @JoinColumn()
  class_instructor: Instructor;
}
