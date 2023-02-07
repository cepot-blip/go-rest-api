CREATE TABLE "users" (
    "id" serial NOT NULL,
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "posts" (
    "id" serial NOT NULL,
    "title" varchar(255) NOT NULL,
    "body" text NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "comments" (
    "id" serial NOT NULL,
    "body" text NOT NULL,
    "user_id" integer NOT NULL,
    "post_id" integer NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "likes" (
    "id" serial NOT NULL,
    "user_id" integer NOT NULL,
    "post_id" integer NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "follows" (
    "id" serial NOT NULL,
    "follower_id" integer NOT NULL,
    "followed_id" integer NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "messages" (
    "id" serial NOT NULL,
    "body" text NOT NULL,
    "sender_id" integer NOT NULL,
    "receiver_id" integer NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "notifications" (
    "id" serial NOT NULL,
    "body" text NOT NULL,
    "user_id" integer NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "user_sessions" (
    "id" serial NOT NULL,
    "user_id" integer NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "user_tokens" (
    "id" serial NOT NULL,
    "user_id" integer NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" timestamp NOT NULL,
    "updated_at" timestamp NOT NULL,
    PRIMARY KEY ("id")
);

ALTER TABLE "users" ADD CONSTRAINT "users_email_key" UNIQUE ("email");
ALTER TABLE "posts" ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "comments" ADD CONSTRAINT "comments_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts" ("id");
ALTER TABLE "likes" ADD CONSTRAINT "likes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id");
ALTER TABLE "likes" ADD CONSTRAINT "likes_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts" ("id");
ALTER TABLE "follows" ADD CONSTRAINT "follows_follower_id_fkey" FOREIGN KEY ("follower_id") REFERENCES "users" ("id");
ALTER TABLE "follows" ADD CONSTRAINT "follows_followed_id_fkey" FOREIGN KEY ("followed_id") REFERENCES "users" ("id");

CREATE INDEX ON "posts" ("user_id");
CREATE INDEX ON "comments" ("user_id");
CREATE INDEX ON "comments" ("post_id");
CREATE INDEX ON "likes" ("user_id");
CREATE INDEX ON "likes" ("post_id");
CREATE INDEX ON "follows" ("follower_id");
CREATE INDEX ON "follows" ("followed_id");

COMMENT ON COLUMN "users"."id" IS 'Unique identifier for the user';
COMMENT ON COLUMN "users"."name" IS 'Name of the user';
COMMENT ON COLUMN "users"."email" IS 'Email of the user';
COMMENT ON COLUMN "users"."password" IS 'Password of the user';
COMMENT ON COLUMN "users"."created_at" IS 'Timestamp when the user was created';
COMMENT ON COLUMN "users"."updated_at" IS 'Timestamp when the user was updated';

COMMENT ON COLUMN "posts"."id" IS 'Unique identifier for the post';
COMMENT ON COLUMN "posts"."title" IS 'Title of the post';
COMMENT ON COLUMN "posts"."body" IS 'Body of the post';
COMMENT ON COLUMN "posts"."user_id" IS 'User who created the post';
COMMENT ON COLUMN "posts"."created_at" IS 'Timestamp when the post was created';
COMMENT ON COLUMN "posts"."updated_at" IS 'Timestamp when the post was updated';

COMMENT ON COLUMN "comments"."id" IS 'Unique identifier for the comment';
COMMENT ON COLUMN "comments"."body" IS 'Body of the comment';
COMMENT ON COLUMN "comments"."user_id" IS 'User who created the comment';
COMMENT ON COLUMN "comments"."post_id" IS 'Post to which the comment belongs';
COMMENT ON COLUMN "comments"."created_at" IS 'Timestamp when the comment was created';
COMMENT ON COLUMN "comments"."updated_at" IS 'Timestamp when the comment was updated';

COMMENT ON COLUMN "likes"."id" IS 'Unique identifier for the like';
COMMENT ON COLUMN "likes"."user_id" IS 'User who created the like';
COMMENT ON COLUMN "likes"."post_id" IS 'Post to which the like belongs';
COMMENT ON COLUMN "likes"."created_at" IS 'Timestamp when the like was created';
COMMENT ON COLUMN "likes"."updated_at" IS 'Timestamp when the like was updated';

COMMENT ON COLUMN "follows"."id" IS 'Unique identifier for the follow';
COMMENT ON COLUMN "follows"."follower_id" IS 'User who created the follow';
COMMENT ON COLUMN "follows"."followed_id" IS 'User to which the follow belongs';
COMMENT ON COLUMN "follows"."created_at" IS 'Timestamp when the follow was created';
COMMENT ON COLUMN "follows"."updated_at" IS 'Timestamp when the follow was updated';

COMMENT ON COLUMN "messages"."id" IS 'Unique identifier for the message';
COMMENT ON COLUMN "messages"."body" IS 'Body of the message';
COMMENT ON COLUMN "messages"."sender_id" IS 'User who created the message';
COMMENT ON COLUMN "messages"."receiver_id" IS 'User to which the message belongs';
COMMENT ON COLUMN "messages"."created_at" IS 'Timestamp when the message was created';
COMMENT ON COLUMN "messages"."updated_at" IS 'Timestamp when the message was updated';

COMMENT ON COLUMN "notifications"."id" IS 'Unique identifier for the notification';
COMMENT ON COLUMN "notifications"."body" IS 'Body of the notification';
COMMENT ON COLUMN "notifications"."user_id" IS 'User to which the notification belongs';
COMMENT ON COLUMN "notifications"."created_at" IS 'Timestamp when the notification was created';
COMMENT ON COLUMN "notifications"."updated_at" IS 'Timestamp when the notification was updated';

COMMENT ON COLUMN "user_sessions"."id" IS 'Unique identifier for the user session';
COMMENT ON COLUMN "user_sessions"."user_id" IS 'User to which the session belongs';

COMMENT ON COLUMN "user_tokens"."id" IS 'Unique identifier for the user token';
COMMENT ON COLUMN "user_tokens"."user_id" IS 'User to which the token belongs';
COMMENT ON COLUMN "user_tokens"."token" IS 'Token of the user';

COMMENT ON TABLE "users" IS 'Users table';
COMMENT ON TABLE "posts" IS 'Posts table';
COMMENT ON TABLE "comments" IS 'Comments table';
COMMENT ON TABLE "likes" IS 'Likes table';
COMMENT ON TABLE "follows" IS 'Follows table';
COMMENT ON TABLE "messages" IS 'Messages table';
COMMENT ON TABLE "notifications" IS 'Notifications table';
COMMENT ON TABLE "user_sessions" IS 'User sessions table';
COMMENT ON TABLE "user_tokens" IS 'User tokens table';





