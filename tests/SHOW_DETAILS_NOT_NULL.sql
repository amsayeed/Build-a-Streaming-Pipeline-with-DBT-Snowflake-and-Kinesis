{{ config(
    tags=[var('TAG_TEST')]
) }}

SELECT * FROM {{ ref('MOVIES_SERIES_SHARE') }} WHERE GENRES IS NULL
