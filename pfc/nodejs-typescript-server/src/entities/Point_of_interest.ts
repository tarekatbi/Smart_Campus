import {
  Column,
  Entity,
  BaseEntity,
  CreateDateColumn,
  UpdateDateColumn,
  PrimaryGeneratedColumn,
} from "typeorm";

@Entity("point_of_interest")
export class PointOfInterest extends BaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false, unique: true })
  titre: string;

  @Column({ nullable: false, type: "double" })
  longitude: number;

  @Column({ nullable: false, type: "double" })
  latitude: number;

  @Column("simple-array")
  details: string[];

  @Column({ default: "" })
  icon: string;

  @Column("simple-array")
  cover: string[];

  @Column()
  floors: boolean;

  @Column()
  contact_info: string;
  @CreateDateColumn()
  added_on: Date;
  @UpdateDateColumn()
  updated_at: Date;
}
