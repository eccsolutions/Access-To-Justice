using System;
using System.Linq;
using System.Text.RegularExpressions;
using CodeKicker.BBCode;
using Tals.ProBono.Domain.Abstract;
using Tals.ProBono.Domain.Entities;

namespace Tals.ProBono.Domain.Services
{
    public class ParseServices
    {
        readonly IUnitOfWork _unitOfWork;

        public ParseServices(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public string GetTextOnly(string text)
        {
            string pattern = @"\[(.|\n)*?\]";
            return Regex.Replace(text, pattern, string.Empty);
        }

        /// <summary>
        /// HTML encodes a string then parses BB codes.
        /// </summary>
        /// <param name="text">The string to HTML encode anad BB code parse</param>
        /// <returns></returns>
        public string ParseBBCodeText(string text)
        {
            var tags = _unitOfWork.BbCodeRepository.Get().Select(GetTag).ToList();
            var parser = new BBCodeParser(ErrorMode.ErrorFree, null, tags);
            var result = parser.ToHtml(text);
            result = result.Replace(Environment.NewLine, "<br />");

            return result;
        }

        private BBTag GetTag(BBCodeItem bbCode)
        {
            var expression = new Regex(@"\{(\s*?.*?)\}");
            var matches = expression.Matches(bbCode.BeginTag);
            var attributes = (from Match match in matches where match.Value != "{content}" select new BBAttribute(match.Value.Replace("{", string.Empty).Replace("}", string.Empty), "")).ToList();

            return new BBTag(bbCode.Tag, bbCode.BeginTag, bbCode.EndTag ?? string.Empty, bbCode.AutoRenderContent,
                             bbCode.RequireClosingTag, attributes.ToArray());

            //if(attributes.Count == 0 && bbCode.BeginTag.Contains("${content}"))
            //    return new BBTag(bbCode.Tag, bbCode.BeginTag, bbCode.EndTag ?? string.Empty, false, false);
            //else if(attributes.Count > 0)
            //    return new BBTag(bbCode.Tag, bbCode.BeginTag, bbCode.EndTag ?? string.Empty, true, false, attributes.ToArray());

            //return new BBTag(bbCode.Tag, bbCode.BeginTag, bbCode.EndTag ?? string.Empty, true, false); 
        }
    }
}
