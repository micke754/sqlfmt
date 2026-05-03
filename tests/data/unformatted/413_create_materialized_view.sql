create or replace materialized view analytics_dev.reporting.mv_region_lookup
tblproperties (
    'delta.columnMapping.mode'='name'
) as(
    select distinct
        rg.region_key,
            rg.geo_group as `Geo Group`,
        rg.region_code as `Region Code`,
        rg.region_name as `Region Name`,
            rg.subregion_code as `Subregion Code`,
        rg.subregion_name as `Subregion Name`,
        upper(rg.geo_group) as geo_group_upper
    from analytics_dev.staging.dim_region as rg
    where rg.geo_group is not null

    union distinct
    select
        '-1' as region_key,
        'Unknown' as `Geo Group`,
        '-1' as `Region Code`,
        'Unknown' as `Region Name`,
        '-1' as `Subregion Code`,
        'Unknown' as `Subregion Name`,
        'UNKNOWN' as geo_group_upper

    union distinct
    select
        '-2' as region_key,
        'Missing' as `Geo Group`,
        '-2' as `Region Code`,
        'Missing' as `Region Name`,
        '-2' as `Subregion Code`,
        'Missing' as `Subregion Name`,
        'MISSING' as geo_group_upper
);
)))))__SQLFMT_OUTPUT__(((((
create or replace materialized view analytics_dev.reporting.mv_region_lookup
tblproperties ('delta.columnMapping.mode' = 'name')
as
    (
        select distinct
            rg.region_key,
            rg.geo_group as `Geo Group`,
            rg.region_code as `Region Code`,
            rg.region_name as `Region Name`,
            rg.subregion_code as `Subregion Code`,
            rg.subregion_name as `Subregion Name`,
            upper(rg.geo_group) as geo_group_upper
        from analytics_dev.staging.dim_region as rg
        where rg.geo_group is not null

        union distinct
        select
            '-1' as region_key,
            'Unknown' as `Geo Group`,
            '-1' as `Region Code`,
            'Unknown' as `Region Name`,
            '-1' as `Subregion Code`,
            'Unknown' as `Subregion Name`,
            'UNKNOWN' as geo_group_upper

        union distinct
        select
            '-2' as region_key,
            'Missing' as `Geo Group`,
            '-2' as `Region Code`,
            'Missing' as `Region Name`,
            '-2' as `Subregion Code`,
            'Missing' as `Subregion Name`,
            'MISSING' as geo_group_upper
    )
;
