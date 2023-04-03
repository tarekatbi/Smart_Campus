import session from "express-session";
import { Session } from "../entities/Session";
import { TypeormStore } from "typeorm-store";
import { getConnection } from "typeorm";

export function createSession(): any {
  //create session
  const connection = getConnection();
  const repository = connection.getRepository(Session);
  const store: session.Store = new TypeormStore({
    repository,
    expirationInterval: 600,
    ttl: 7200,
    clearExpired: true,
  });
  return session({
    secret: "secret",
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
      httpOnly: false, // key
      // maxAge: null,
      // path: '/',
      // secure: false,
      maxAge: 1800000,
    },
  });
}
