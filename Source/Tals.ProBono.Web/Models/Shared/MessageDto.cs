using Tals.ProBono.Web.Enums;

namespace Tals.ProBono.Web.Models.Shared
{
    public class MessageDto
    {
        public MessageTypes Type { get; set; }

        public string Text { get; set; }

        public MessageDto(string messageText, MessageTypes messageType)
        {
            this.Text = messageText;
            this.Type = messageType;

        }

        public static MessageDto CreateSuccessMessage(string message)
        {
            return new MessageDto(message, MessageTypes.Success);
        }

        public static MessageDto CreateErrorMessage(string message)
        {
            return new MessageDto(message, MessageTypes.Error);
        }

        public static MessageDto CreateWarningMessage(string message)
        {
            return new MessageDto(message, MessageTypes.Warning);
        }
    }
}