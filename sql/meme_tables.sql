CREATE TABLE reddit_memes(
    meme_id serial PRIMARY KEY
   	, post_id varchar(255)
    , meme_title varchar(255)
    , post_url varchar(255)
    , meme_plink varchar(255)
    , post_time varchar(255)
    , sub_reddit varchar(255)
    , image_text varchar(255)
    , posted_by varchar(255)
    , rscore integer
    , upvote_ratio float
    , nsfw_flag bool
    , time_of_index timestamp default current_timestamp
    , meme_format varchar(255)
)