import { Rating } from "../entities/Rating";
import { Textbook } from "../entities/Textbook";
import { User } from "../entities/User";
import { getRepository, In, MoreThan, MoreThanOrEqual, Not } from "typeorm";

interface IUserRating {
  rating: number;
  textbook_id: number;
  textbook_title: string;
}
interface ISet {
  user_id: number;
  data: IUserRating[];
}
interface IJacc {
  jacc_sim: number;
  user_one_id: number;
  user_two: number;
  textbook_ids: number[];
}
/**
 * Memory-based recommender systeme class with its necessary methods.
 */
export default class Recommender {
  constructor() {}

  /**
   * Find the similar users who rated the textbooks better or similarly to the rating of user x.
   * @param rating_array
   * @returns
   */
  public async findSimilarRatings(rating_array: Rating[], target_user: User) {
    try {
      let similarities: number[] = [];
      let recommended_textbooks: ISet[] = [];

      //fetching for similar users
      for (let index = 0; index < rating_array.length; index++) {
        const fetched_rating = rating_array[index];
        const similars: Rating[] | undefined = await getRepository(Rating).find(
          {
            where: {
              rating: MoreThanOrEqual(fetched_rating.rating),
              textbooks: fetched_rating.textbooks,
              user: { id: Not(target_user.id) },
            },
          }
        );
        similars.forEach((sim) => {
          similarities.push(sim.user.id);
        });
      }

      for (let i = 0; i < similarities.length; i++) {
        const similar = similarities[i];
        const data = await getRepository(Rating).find({
          where: { user: { id: similar } },
        });
        const data_array: IUserRating[] = [];
        for (let j = 0; j < data.length; j++) {
          const d = data[j];
          data_array.push({
            textbook_id: d.textbooks.id,
            rating: d.rating,
            textbook_title: d.textbooks.title,
          } as IUserRating);
        }
        recommended_textbooks.push({
          user_id: similar,
          data: [...data_array],
        });
      }

      return recommended_textbooks;
    } catch (error) {
      console.log(error);
      return undefined;
    }
  }

  /**
   * Function which calculates the user's similarities using jaccard similarity.
   * @param users
   */
  public jaccard_similarity(users: ISet[]) {
    let jacc_sim: IJacc[] = [];
    for (let i = 0; i < users.length; i++) {
      const user_one = users[i];
      for (let j = i + 1; j < users.length; j++) {
        const user_two = users[j];

        //calculating the intersection set between the users
        let interesection = user_one.data.filter((x) =>
          user_two.data.some((y) => y.textbook_title === x.textbook_title)
        );

        let merged_arrays = user_one.data.concat(user_two.data);

        //calculating the union of the sets
        let unique_set = [
          ...new Set(merged_arrays.map((item) => item.textbook_id)),
        ];
        jacc_sim.push({
          jacc_sim: interesection.length / unique_set.length,
          user_one_id: user_one.user_id,
          user_two: user_two.user_id,
          textbook_ids: unique_set,
        } as IJacc);
      }
    }
    return jacc_sim.sort((a, b) => b.jacc_sim - a.jacc_sim);
  }

  public clean_data(recs: IJacc[]) {
    const final_unique_recs: number[] = [];
    const set_final = new Set(recs.sort((a, b) => b.jacc_sim - a.jacc_sim));
    set_final.forEach((s) => {
      console.log(
        ` User ${s.user_one_id} & User ${s.user_two} = ${s.jacc_sim}`
      );
    });
    for (let i = 0; i < recs.length; i++) {
      const element = recs[i];
      final_unique_recs.push(...element.textbook_ids);
    }
    return new Set(final_unique_recs);
  }

  /**
   * Returns all the books rated by the user
   * @param user_id : User ID : number
   */
  public async collaborative_filtering(user_id: number) {
    try {
      const user: User | undefined = await getRepository(User).findOne({
        where: { id: user_id },
        relations: ["ratings"],
      });

      const user_ratings: Rating[] | undefined = user?.ratings.filter(
        (rate) => rate.rating >= 3
      );

      //find users whose rating to best_rates are similar to input users rating.
      const similar_ratings: ISet[] | undefined = await this.findSimilarRatings(
        user_ratings!,
        user!
      );
      const recommendations: IJacc[] = this.jaccard_similarity(
        similar_ratings!
      );

      return this.clean_data(recommendations);
    } catch (error) {
      console.error(error);
    }
  }
}
