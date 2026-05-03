from functools import partial

from sqlfmt import actions
from sqlfmt.rule import Rule
from sqlfmt.rules.common import CREATE_MATERIALIZED_VIEW, group
from sqlfmt.rules.core import CORE
from sqlfmt.tokens import TokenType

MATERIALIZED_VIEW = [
    *CORE,
    Rule(
        name="materialized_view_as",
        priority=1100,
        pattern=group(
            r"as",
        )
        + group(r"\W", r"$"),
        action=partial(
            actions.handle_reserved_keyword,
            action=actions.handle_ddl_as,
        ),
    ),
    Rule(
        name="unterm_keyword",
        priority=1300,
        pattern=group(
            CREATE_MATERIALIZED_VIEW,
            r"tblproperties",
            r"partitioned\s+by",
            r"cluster\s+by",
            r"comment",
        )
        + group(r"\W", r"$"),
        action=partial(
            actions.handle_reserved_keyword,
            action=partial(
                actions.add_node_to_buffer, token_type=TokenType.UNTERM_KEYWORD
            ),
        ),
    ),
]
