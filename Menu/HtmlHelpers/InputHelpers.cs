using System.Text;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Menu.HtmlHelpers
{
    public static class InputHelpers
    {
        public static MvcHtmlString ImageUpload(this HtmlHelper html, string name, string datacontent, string source, string loadingImgSrc)
        {
            TagBuilder outerDiv = new TagBuilder("div");
            outerDiv.AddCssClass("pull-left upload-img-wrapper");
            TagBuilder label = new TagBuilder("label");
            label.AddCssClass("upload-img");
            label.MergeAttribute("data-content", datacontent);

            TagBuilder image = new TagBuilder("img");
            image.AddCssClass("img-responsive thumbnail");
            image.MergeAttribute("src", source);
            image.MergeAttribute("width", "100%");
            //image.MergeAttribute("height", "150");

            TagBuilder loading = new TagBuilder("img");
            loading.MergeAttribute("id", "loading");
            loading.AddCssClass("img-responsive");
            loading.MergeAttribute("src", loadingImgSrc);
            loading.MergeAttribute("style","display: none;");

            MvcHtmlString textbox = InputExtensions.TextBox(html, name, source, new { type = "file", style = "display:none", accept="image/*" });

            StringBuilder htmlBuilder = new StringBuilder();
            htmlBuilder.Append(label.ToString(TagRenderMode.StartTag));
            htmlBuilder.Append(image.ToString(TagRenderMode.Normal));
            htmlBuilder.Append(loading.ToString(TagRenderMode.Normal));
            htmlBuilder.Append(label.ToString(TagRenderMode.EndTag));
            htmlBuilder.Append(textbox.ToHtmlString());
            outerDiv.InnerHtml = htmlBuilder.ToString();

            return MvcHtmlString.Create(outerDiv.ToString(TagRenderMode.Normal));
        }
    }
}