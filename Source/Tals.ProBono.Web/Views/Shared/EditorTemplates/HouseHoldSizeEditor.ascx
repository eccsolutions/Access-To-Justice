<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<int>" %>
<%@ Import Namespace="System.Collections.ObjectModel" %>
<div class="editor-field">
        <%: Html.DropDownListFor(model => model,new Collection<SelectListItem>()
            {
                new SelectListItem()
                {
                    Text = "1 Person: Yourself",
                    Value="1"
                },
                new SelectListItem()
                {
                    Text = "2 People: Yourself and 1 Other",
                    Value="2"
                },
                new SelectListItem()
                {
                    Text = "3 People: Yourself and 2 Others",
                    Value="3"
                },
                new SelectListItem()
                {
                    Text = "4 People: Yourself and 3 Others",
                    Value="4"
                },
                new SelectListItem()
                {
                    Text = "5 People: Yourself and 4 Others",
                    Value="5"
                },
                new SelectListItem()
                {
                    Text = "6 People: Yourself and 5 Others",
                    Value="6"
                }
                ,
                new SelectListItem()
                {
                    Text = "7 People: Yourself and 6 Others",
                    Value="7"
                }
                ,
                new SelectListItem()
                {
                    Text = "8 People: Yourself and 7 Others",
                    Value="8"
                }
                ,
                new SelectListItem()
                {
                    Text = "9 People: Yourself and 8 Others",
                    Value="9"
                }
                ,
                new SelectListItem()
                {
                    Text = "10 People: Yourself and 9 Others",
                    Value="10"
                }
                ,
                new SelectListItem()
                {
                    Text = "11 People: Yourself and 10 Others",
                    Value="11"
                }
                ,
                new SelectListItem()
                {
                    Text = "12 People: Yourself and 11 Others",
                    Value="12"
                }
                ,
                new SelectListItem()
                {
                    Text = "13 People: Yourself and 12 Others",
                    Value="13"
                }
                ,
                new SelectListItem()
                {
                    Text = "14 People: Yourself and 13 Others",
                    Value="14"
                }
                ,
                new SelectListItem()
                {
                    Text = "15 People: Yourself and 14 Others",
                    Value="15"
                }
            },"Please select an answer") %>
    </div>