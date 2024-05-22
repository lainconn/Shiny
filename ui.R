library(shiny)
library(bslib)
library(bsicons)
library(shinyjs)
library(readxl)

#tbl_1 <- as.data.frame(read_excel("C:\\Users\\playf\\Downloads\\tbl_1.xlsx"))


ui <- page_sidebar(
    window_title = "BankEase",
    title = tags$span(
        bs_icon("bank"), tags$b(" BankEase"), class = "title"
    ),
    useShinyjs(),
    tags$style(HTML("
    .fluid_class {
        border-bottom: 2px solid #F2F2F2;
    }
    .column_wrap {
        border: 1px solid;
    }
    .title {
        font-size: 20px;
    }
    .card_row_1 {
        padding-left: 50px;
        font-weight: 200;
    }
    .card_row_2 {
        padding-left: 50px;
        font-weight: bold;
        padding-right: 50px;
    }
    .card_row_3 {
        padding-left: 50px;
        font-weight: bold;
    }
    .main-card {
        height: 1000px;
    }
    .custom-card-header {
        font-size: 13px;
        padding-left: 30px;
        font-weight: bold;
        overflow: hidden;
    }
    .custom-card-body {
      padding: 10px;
      margin-bottom: 10px;
      margin-top: 10px;
    }
    .button  {
        padding-left: 18px;
        padding-right: 50px;
        font-size: 14px;
    }
    .custom-card-header-3 {
        padding-left: 0px;
        padding-right: 0px;
    }
    .custom-card-header-4 {
        padding-left: 10px;
    }
    .custom-card-header-5 {
        padding-left: 10px;
    }
    .custom-card-header-6 {
        padding-left: 0px;
    }
    .custom-card-header-7 {
        padding-right: 5px;
    }
    .nav_item_custom {
      margin-top: 15px;
    }
    .nav-pills .nav-item {
    margin-bottom: 10px;
    }
    .nav-pills .nav-link {
      cursor: pointer;
    }
    .nav-pills .nav-link.active {
      background-color: #F2F2F2;
      color : grey;
    }
  ")),
    sidebar = sidebar(
        title = tags$div(
            "Главная",
            style = "color:#027bc6; font-weight:500"
        ),
        width = 260,
        navset_pill_list(
            id = "nav_pills",
            widths = c(10, 12),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("person"),
                        "Пользователю"
                    )
                ),
                value = "Пользователю"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("file text"),
                        "Поддержка"
                    )
                ),
                value = "Поддержка"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("star"),
                        "О нас"
                    )
                ),
                value = "О нас"
            ),
            well = FALSE,
            nav_spacer(),
            nav_item(
                tags$div(
                    "Юридические лица",
                    style = "color:#027bc6; font-weight:500"
                ),
                class = "nav_item_custom"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("cart"),
                        "Кредиты"
                    )
                ),
                value = "Кредиты"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("box"),
                        "Депозиты"
                    )
                ),
                value = "Депозиты"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("search"),
                        "Расширенный фильтр"
                    )
                ),
                value = "Расширенный фильтр"
            ),
            nav_spacer(),
            nav_item(
                tags$div(
                    "Физические лица",
                    style = "color:#027bc6; font-weight:500"
                ),
                class = "nav_item_custom"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("cart"),
                        "Кредиты"
                    )
                ),
                value = "Кредиты_Физ"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("box"),
                        "Депозиты"
                    )
                ),
                value = "Депозиты_Физ"
            ),
            nav_panel(
                title = tags$div(
                    tags$span(
                        bs_icon("search"),
                        "Расширенный фильтр"
                    )
                ),
                value = "Расширенный фильтр_Физ"
            )
        )
    ),
    card(
        card_header(
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                tags$span(
                    "Юридические лица",
                    bs_icon("arrow-right"),
                    "Кредиты"
                )
            )
        ),
        navset_tab(
            id = "main-card",
            nav_panel(
                title = "Все",
                card_body(
            class = "custom-card-header",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                fluidRow(
                    column(2, "БАНК"),
                    column(2, "КРЕДИТ"),
                    column(2, "ПРОЦЕНТНАЯ СТАВКА", class = "custom-card-header-3"),
                    column(2, "СУММА", class = "custom-card-header-4"),
                    column(2, "СРОК", class = "custom-card-header-5"),
                    column(2, "ОБЕСПЕЧЕНИЕ", class = "custom-card-header-6")
                )
            )
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box",
                    label = fluidRow(
                        column(2, "Белагропромбанк", class = "custom-card-header-7"),
                        column(2, "ММБ-стартап-инвест"),
                        column(2, "от 11,61%"),
                        column(2, "от 1 000 руб."),
                        column(2, "до 60 мес."),
                        column(2, "Поручители \n Залог")
                    )
                )
            ),
            uiOutput("tbl_1")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_1",
                    label = fluidRow(
                        column(2, "Сбербанк"),
                        column(2, "Бизнес-Экспресс"),
                        column(2, "по согласованию"),
                        column(2, "до 600 000 руб."),
                        column(2, "до 24 мес."),
                        column(2, "Поручители \bЗалог")
                    )
                )
            ),
            uiOutput("tbl_2")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_2",
                    label = fluidRow(
                        column(2, "Цептер Банк"),
                        column(2, "Кредитование юрлиц"),
                        column(2, "от 11,61%"),
                        column(2, "до 1 000 000 руб."),
                        column(2, "до 12 мес."),
                        column(2, "Поручители \bЗалог")
                    )
                )
            ),
            uiOutput("tbl_3")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_3",
                    label = fluidRow(
                        column(2, "Беларусбанк"),
                        column(2, "Овердрафт"),
                        column(2, "11,61%"),
                        column(2, "до 600 000 руб."),
                        column(2, "до 60 мес."),
                        column(2, "Залог")
                    )
                )
            ),
            uiOutput("tbl_4")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_4",
                    label = fluidRow(
                        column(2, "Приорбанк"),
                        column(2, "Овердрафт для малого бизнеса"),
                        column(2, "11%"),
                        column(2, "до 174 000 руб."),
                        column(2, "до 18 мес."),
                        column(2, "Поручители")
                    )
                )
            ),
            uiOutput("tbl_5")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_5",
                    label = fluidRow(
                        column(2, "МТБанк"),
                        column(2, "Инвестиционный"),
                        column(2, "по согласованию"),
                        column(2, "от 1 000 руб."),
                        column(2, "до 84 мес."),
                        column(2, "Поручители \bЗалог")
                    )
                )
            ),
            uiOutput("tbl_6")
        )
    ),
                nav_panel(
                title = "Избранное"
                ),
                nav_panel(
                title = "Для малого бизнеса",
                card_body(
            class = "custom-card-header",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                fluidRow(
                    column(2, "БАНК"),
                    column(2, "КРЕДИТ"),
                    column(2, "ПРОЦЕНТНАЯ СТАВКА", class = "custom-card-header-3"),
                    column(2, "СУММА", class = "custom-card-header-4"),
                    column(2, "СРОК", class = "custom-card-header-5"),
                    column(2, "ОБЕСПЕЧЕНИЕ", class = "custom-card-header-6")
                )
            )
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_6",
                    label = fluidRow(
                        column(2, "Cбербанк", class = "custom-card-header-7"),
                        column(2, "Кредит за 2 часа"),
                        column(2, "по согласованию"),
                        column(2, "до 600 000 руб."),
                        column(2, "до 60 мес."),
                        column(2, "Поручители")
                    )
                )
            ),
            uiOutput("tbl_10")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_7",
                    label = fluidRow(
                        column(2, "Банк ВТБ"),
                        column(2, "Актив Плюс"),
                        column(2, "по согласованию"),
                        column(2, "до 200 000 руб."),
                        column(2, "до 60 мес."),
                        column(2, "Поручители")
                    )
                )
            ),
            uiOutput("tbl_2")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_8",
                    label = fluidRow(
                        column(2, "Приорбанк"),
                        column(2, "Овердрафт"),
                        column(2, "11%"),
                        column(2, "до 174 000 руб."),
                        column(2, "до 18 мес."),
                        column(2, "Поручители")
                    )
                )
            ),
            uiOutput("tbl_3")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_9",
                    label = fluidRow(
                        column(2, "Беларусбанк"),
                        column(2, "Бизнес-Бриллиант"),
                        column(2, "от 5,5%"),
                        column(2, "до 1 000 000 руб."),
                        column(2, "до 84 мес."),
                        column(2, "Поручители \bЗалог")
                    )
                )
            ),
            uiOutput("tbl_4")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_10",
                    label = fluidRow(
                        column(2, "Альфа Банк"),
                        column(2, "Для расчетов с партнерами"),
                        column(2, "0,00001%"),
                        column(2, "до 100 000 руб."),
                        column(2, "до 24 мес."),
                        column(2, "Не требуется")
                    )
                )
            ),
            uiOutput("tbl_alpha")
        ),
        card_body(
            class = "custom-card-body",
            conditionalPanel(
                "input.nav_pills === 'Кредиты'",
                actionButton(
                    width = "auto",
                    class = "button",
                    inputId = "value_box_11",
                    label = fluidRow(
                        column(2, "БСБ Банк"),
                        column(2, "Инвестиционный"),
                        column(2, "по согласованию"),
                        column(2, "до 100 000 руб."),
                        column(2, "до 36 мес."),
                        column(2, "Поручители")
                    )
                )
            ),
            uiOutput("tbl_6")
        )
                ),
                nav_panel(
                title = "Для крупного бизнеса"
                )
)
)
)