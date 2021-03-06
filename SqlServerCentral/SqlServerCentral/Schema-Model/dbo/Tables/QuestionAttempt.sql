CREATE TABLE [dbo].[QuestionAttempt]
(
[AttemptID] [int] NOT NULL IDENTITY(1, 1),
[QuestionID] [int] NOT NULL,
[UserID] [int] NOT NULL,
[SubmittedDate] [datetime] NOT NULL,
[WasCorrect] [bit] NOT NULL
)
GO
ALTER TABLE [dbo].[QuestionAttempt] ADD CONSTRAINT [PK_QuestionAttempt] PRIMARY KEY CLUSTERED  ([AttemptID])
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_QuestionAttemptUnique] ON [dbo].[QuestionAttempt] ([QuestionID], [UserID])
GO
CREATE NONCLUSTERED INDEX [ssc_142] ON [dbo].[QuestionAttempt] ([QuestionID], [WasCorrect]) INCLUDE ([AttemptID], [SubmittedDate], [UserID])
GO
CREATE NONCLUSTERED INDEX [ssc_67] ON [dbo].[QuestionAttempt] ([UserID], [QuestionID])
GO
CREATE NONCLUSTERED INDEX [ssc_2875] ON [dbo].[QuestionAttempt] ([UserID], [WasCorrect])
GO
CREATE NONCLUSTERED INDEX [sssc_wascorrect] ON [dbo].[QuestionAttempt] ([WasCorrect]) INCLUDE ([QuestionID])
GO
ALTER TABLE [dbo].[QuestionAttempt] ADD CONSTRAINT [FK_QuestionAttempt_Questions] FOREIGN KEY ([QuestionID]) REFERENCES [dbo].[Questions] ([ContentItemID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[QuestionAttempt] ADD CONSTRAINT [FK_QuestionAttempt_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[Users] ([UserID]) ON DELETE CASCADE
GO
GRANT SELECT ON  [dbo].[QuestionAttempt] TO [ssc_webapplication]
GO
GRANT INSERT ON  [dbo].[QuestionAttempt] TO [ssc_webapplication]
GO
GRANT DELETE ON  [dbo].[QuestionAttempt] TO [ssc_webapplication]
GO
GRANT UPDATE ON  [dbo].[QuestionAttempt] TO [ssc_webapplication]
GO
