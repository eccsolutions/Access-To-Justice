-- Creating table 'Audits'
CREATE TABLE [dbo].[Audits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QuestionId] int  NOT NULL,
    [AuditType] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [AuditDate] datetime  NOT NULL
);
GO
-- Creating primary key on [Id] in table 'Audits'
ALTER TABLE [dbo].[Audits]
ADD CONSTRAINT [PK_Audits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO
-- Creating foreign key on [QuestionId] in table 'Audits'
ALTER TABLE [dbo].[Audits]
ADD CONSTRAINT [FK_QuestionAudit]
    FOREIGN KEY ([QuestionId])
    REFERENCES [dbo].[Questions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
-- Creating non-clustered index for FOREIGN KEY 'FK_QuestionAudit'
CREATE INDEX [IX_FK_QuestionAudit]
ON [dbo].[Audits]
    ([QuestionId]);
GO