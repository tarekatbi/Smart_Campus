import e, { Request } from "express";

export const assertUser = (req: Request): boolean => {
  const { matricule, matricule_bac, password, cle_secrete } = req.body;
  if (+matricule && +matricule) return true;
  return false;
};

export const assertStudent = (
  original_key: string,
  passed_key: string
): boolean => {
  if (original_key === passed_key) return true;
  return false;
};
