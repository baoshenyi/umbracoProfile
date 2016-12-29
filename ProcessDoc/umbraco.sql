-- Warning! The maximum key length is 900 bytes. The index 'IX_umbracoAccessRule' has maximum length of 1036 bytes. For some combination of large values, the insert/update operation will fail.
-- Script Date: 12/28/2016 8:25 AM  - ErikEJ.SqlCeScripting version 3.5.2.64
-- Database information:
-- Locale Identifier: 1033
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: umbraco.sdf
-- ServerVersion: 4.0.8876.1
-- DatabaseSize: 1.938 MB
-- SpaceAvailable: 3.998 GB
-- Created: 12/28/2016 7:59 AM

-- User Table information:
-- Number of tables: 46
-- cmsContent: 17 row(s)
-- cmsContentType: 9 row(s)
-- cmsContentType2ContentType: 0 row(s)
-- cmsContentTypeAllowedContentType: 6 row(s)
-- cmsContentVersion: 34 row(s)
-- cmsContentXml: 17 row(s)
-- cmsDataType: 27 row(s)
-- cmsDataTypePreValues: 18 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocument: 34 row(s)
-- cmsDocumentType: 5 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 0 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 0 row(s)
-- cmsPreviewXml: 34 row(s)
-- cmsPropertyData: 54 row(s)
-- cmsPropertyType: 26 row(s)
-- cmsPropertyTypeGroup: 10 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTask: 0 row(s)
-- cmsTaskType: 1 row(s)
-- cmsTemplate: 5 row(s)
-- umbracoAccess: 0 row(s)
-- umbracoAccessRule: 0 row(s)
-- umbracoCacheInstruction: 0 row(s)
-- umbracoDeployChecksum: 0 row(s)
-- umbracoDeployDependency: 0 row(s)
-- umbracoDomains: 0 row(s)
-- umbracoExternalLogin: 0 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLog: 17 row(s)
-- umbracoMigration: 1 row(s)
-- umbracoNode: 62 row(s)
-- umbracoRedirectUrl: 0 row(s)
-- umbracoRelation: 0 row(s)
-- umbracoRelationType: 2 row(s)
-- umbracoServer: 1 row(s)
-- umbracoUser: 1 row(s)
-- umbracoUser2app: 7 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2NodePermission: 0 row(s)
-- umbracoUserType: 4 row(s)

CREATE TABLE [umbracoUserType] (
  [id] int IDENTITY (5,1) NOT NULL
, [userTypeAlias] nvarchar(50) NULL
, [userTypeName] nvarchar(255) NOT NULL
, [userTypeDefaultPermissions] nvarchar(50) NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int IDENTITY (1,1) NOT NULL
, [userDisabled] bit DEFAULT ('0') NOT NULL
, [userNoConsole] bit DEFAULT ('0') NOT NULL
, [userType] int NOT NULL
, [startStructureID] int NOT NULL
, [startMediaID] int NULL
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(500) NOT NULL
, [userEmail] nvarchar(255) NOT NULL
, [userLanguage] nvarchar(10) NULL
, [securityStampToken] nvarchar(255) NULL
, [failedLoginAttempts] int NULL
, [lastLockoutDate] datetime NULL
, [lastPasswordChangeDate] datetime NULL
, [lastLoginDate] datetime NULL
);
GO
CREATE TABLE [umbracoUser2app] (
  [user] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int IDENTITY (2,1) NOT NULL
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime DEFAULT (GETDATE()) NOT NULL
, [lastNotifiedDate] datetime NOT NULL
, [isActive] bit NOT NULL
, [isMaster] bit NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int IDENTITY (3,1) NOT NULL
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoRedirectUrl] (
  [id] uniqueidentifier NOT NULL
, [contentKey] uniqueidentifier NOT NULL
, [createDateUtc] datetime NOT NULL
, [url] nvarchar(255) NOT NULL
, [urlHash] nvarchar(40) NOT NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int IDENTITY (1080,1) NOT NULL
, [trashed] bit DEFAULT ('0') NOT NULL
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier DEFAULT (NEWID()) NOT NULL
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime DEFAULT (GETDATE()) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodePermission] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int IDENTITY (1,1) NOT NULL
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime DEFAULT (GETDATE()) NOT NULL
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoMigration] (
  [id] int IDENTITY (100,1) NOT NULL
, [name] nvarchar(255) NOT NULL
, [createDate] datetime DEFAULT (GETDATE()) NOT NULL
, [version] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int IDENTITY (18,1) NOT NULL
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime DEFAULT (GETDATE()) NOT NULL
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int IDENTITY (2,1) NOT NULL
, [languageISOCode] nvarchar(10) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoExternalLogin] (
  [id] int IDENTITY (1,1) NOT NULL
, [userId] int NOT NULL
, [loginProvider] nvarchar(4000) NOT NULL
, [providerKey] nvarchar(4000) NOT NULL
, [createDate] datetime DEFAULT (GETDATE()) NOT NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int IDENTITY (1,1) NOT NULL
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoDeployChecksum] (
  [id] int IDENTITY (1,1) NOT NULL
, [entityType] nvarchar(32) NOT NULL
, [entityGuid] uniqueidentifier NULL
, [entityPath] nvarchar(256) NULL
, [localChecksum] nvarchar(32) NOT NULL
, [compositeChecksum] nvarchar(32) NULL
);
GO
CREATE TABLE [umbracoDeployDependency] (
  [sourceId] int NOT NULL
, [targetId] int NOT NULL
, [mode] int NOT NULL
);
GO
CREATE TABLE [umbracoCacheInstruction] (
  [id] int IDENTITY (1,1) NOT NULL
, [utcStamp] datetime NOT NULL
, [jsonInstruction] ntext NOT NULL
, [originated] nvarchar(500) NOT NULL
);
GO
CREATE TABLE [umbracoAccess] (
  [id] uniqueidentifier NOT NULL
, [nodeId] int NOT NULL
, [loginNodeId] int NOT NULL
, [noAccessNodeId] int NOT NULL
, [createDate] datetime DEFAULT (GETDATE()) NOT NULL
, [updateDate] datetime DEFAULT (GETDATE()) NOT NULL
);
GO
CREATE TABLE [umbracoAccessRule] (
  [id] uniqueidentifier NOT NULL
, [accessId] uniqueidentifier NOT NULL
, [ruleValue] nvarchar(255) NOT NULL
, [ruleType] nvarchar(255) NOT NULL
, [createDate] datetime DEFAULT (GETDATE()) NOT NULL
, [updateDate] datetime DEFAULT (GETDATE()) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int IDENTITY (6,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int IDENTITY (2,1) NOT NULL
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit DEFAULT ('0') NOT NULL
, [id] int IDENTITY (1,1) NOT NULL
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime DEFAULT (GETDATE()) NOT NULL
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int IDENTITY (1,1) NOT NULL
, [tag] nvarchar(200) NULL
, [ParentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int IDENTITY (18,1) NOT NULL
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
, [uniqueID] uniqueidentifier DEFAULT (NEWID()) NOT NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int IDENTITY (60,1) NOT NULL
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [sortOrder] int DEFAULT ('0') NOT NULL
, [mandatory] bit DEFAULT ('0') NOT NULL
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
, [UniqueID] uniqueidentifier DEFAULT (NEWID()) NOT NULL
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
, [propertyTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int IDENTITY (55,1) NOT NULL
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDecimal] numeric(38,6) NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int IDENTITY (1,1) NOT NULL
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit DEFAULT ('0') NOT NULL
, [viewOnProfile] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) DEFAULT ('''') NOT NULL
, [LoginName] nvarchar(1000) DEFAULT ('''') NOT NULL
, [Password] nvarchar(1000) DEFAULT ('''') NOT NULL
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int IDENTITY (1,1) NOT NULL
, [macroUseInEditor] bit DEFAULT ('0') NOT NULL
, [macroRefreshRate] int DEFAULT ('0') NOT NULL
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit DEFAULT ('1') NOT NULL
, [macroCachePersonalized] bit DEFAULT ('0') NOT NULL
, [macroDontRender] bit DEFAULT ('0') NOT NULL
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int IDENTITY (1,1) NOT NULL
, [editorAlias] nvarchar(255) NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int DEFAULT ('0') NOT NULL
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int IDENTITY (1,1) NOT NULL
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime DEFAULT (GETDATE()) NOT NULL
, [templateId] int NULL
, [newest] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int IDENTITY (1,1) NOT NULL
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NULL
, [key] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int IDENTITY (12,1) NOT NULL
, [datatypeNodeId] int NOT NULL
, [value] ntext NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int IDENTITY (33,1) NOT NULL
, [nodeId] int NOT NULL
, [propertyEditorAlias] nvarchar(255) NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int IDENTITY (35,1) NOT NULL
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime DEFAULT (GETDATE()) NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int IDENTITY (540,1) NOT NULL
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) DEFAULT ('folder.png') NOT NULL
, [description] nvarchar(1500) NULL
, [isContainer] bit DEFAULT ('0') NOT NULL
, [allowAtRoot] bit DEFAULT ('0') NOT NULL
);
GO
CREATE TABLE [cmsContent] (
  [pk] int IDENTITY (18,1) NOT NULL
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
SET IDENTITY_INSERT [umbracoUserType] ON;
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (
1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F7');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (
2,N'writer',N'Writer',N'CAH:F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (
3,N'editor',N'Editors',N'CADMOSKTPUZ:5F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (
4,N'translator',N'Translator',N'AF');
GO
SET IDENTITY_INSERT [umbracoUserType] OFF;
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userType],[startStructureID],[startMediaID],[userName],[userLogin],[userPassword],[userEmail],[userLanguage],[securityStampToken],[failedLoginAttempts],[lastLockoutDate],[lastPasswordChangeDate],[lastLoginDate]) VALUES (
0,0,0,1,-1,-1,N'Bobydo Inc.',N'baoshenyi@hotmail.com',N'QFhjgX6GLr5kKQSP6IivvEDCsY4=',N'baoshenyi@hotmail.com',N'en',N'ec0291d2-12ed-4ce0-9d70-179be32ab020',NULL,NULL,{ts '2016-12-28 07:40:21.700'},{ts '2016-12-28 07:40:21.263'});
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'content');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'developer');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'forms');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'media');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'member');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'settings');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (
0,N'users');
GO
SET IDENTITY_INSERT [umbracoServer] ON;
GO
INSERT INTO [umbracoServer] ([id],[address],[computerName],[registeredDate],[lastNotifiedDate],[isActive],[isMaster]) VALUES (
1,N'http://www.bobydo.com:80/umbraco',N'DESKTOP-BAPHJTM//LM/W3SVC/2/ROOT',{ts '2016-12-28 07:42:06.147'},{ts '2016-12-28 07:59:02.967'},1,1);
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
1,1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
INSERT INTO [umbracoRelationType] ([id],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (
2,0,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Parent Document On Delete',N'relateParentDocumentOnDelete');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-331,0,-1,0,1,N'-1,-331',-1,'0af5e610-a310-4b6f-925f-e928d5416af7',N'LOCK: Servers','87a9f1ff-b1e4-4a25-babb-465a4a47ec41',{ts '2016-12-28 07:40:12.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-97,0,-1,0,1,N'-1,-97',2,'aa2c52a0-ce87-4e65-a47c-7df09358585d',N'List View - Members','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-96,0,-1,0,1,N'-1,-96',2,'3a0156c4-3b8c-4803-bdc1-6871faa83fff',N'List View - Media','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-95,0,-1,0,1,N'-1,-95',2,'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4',N'List View - Content','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-92,0,-1,0,1,N'-1,-92',35,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-90,0,-1,0,1,N'-1,-90',34,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-89,0,-1,0,1,N'-1,-89',33,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textarea','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-88,0,-1,0,1,N'-1,-88',32,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-87,0,-1,0,1,N'-1,-87',4,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-51,0,-1,0,1,N'-1,-51',2,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-49,0,-1,0,1,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2016-12-28 07:40:12.677'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1031,0,-1,0,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1032,0,-1,0,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1033,0,-1,0,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1034,0,-1,0,1,N'-1,1034',2,'a6857c73-d6e9-480c-b6e6-f15f6ad11125',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1035,0,-1,0,1,N'-1,1035',2,'93929b9a-93a2-4e2a-b239-d99334440a59',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1036,0,-1,0,1,N'-1,1036',2,'2b24165f-9782-4aa3-b459-1de4a4d21f60',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1040,0,-1,0,1,N'-1,1040',2,'21e798da-e06e-4eda-a511-ed257f78d4fa',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.710'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1043,0,-1,0,1,N'-1,1043',2,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1044,0,-1,0,1,N'-1,1044',0,'d59be02f-1df9-4228-aa1e-01917d806cda',N'Member','9b5416fb-e72f-45a9-a07b-5a9a2709ce43',{ts '2016-12-28 07:40:12.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1045,0,-1,0,1,N'-1,1045',2,'7e3962cc-ce20-4ffc-b661-5897a894ba7e',N'Multiple Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:12.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1050,0,-1,0,1,N'-1,1050',24,'a3785f08-73d5-406b-855f-8e52805c22e2',N'Grid Blogpost','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:52.550'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1051,0,-1,0,1,N'-1,1051',25,'bc957e81-2cdc-4fe3-bab2-ca4110cdff68',N'Grid FrontPage','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:52.617'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1052,0,-1,0,1,N'-1,1052',26,'21944c98-8e32-4475-807d-61a60c1ab070',N'Grid TextPage','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2016-12-28 07:40:52.617'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1053,0,-1,NULL,1,N'-1,1053',0,'32a6f480-7f72-49ee-bb55-82da98d59f23',N'Master','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2016-12-28 07:40:54.150'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1054,0,1053,NULL,1,N'-1,1053,1054',0,'0c893b5e-520b-457b-9ae7-3a0670529237',N'Blog Overview','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2016-12-28 07:40:54.167'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1055,0,1053,NULL,1,N'-1,1053,1055',0,'67183030-3e34-4019-8b28-50cd5eae13d1',N'Blog Post','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2016-12-28 07:40:54.203'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1056,0,1053,NULL,1,N'-1,1053,1056',0,'2ddd967a-72a3-499a-9a66-cf537ee6c5d5',N'Home','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2016-12-28 07:40:54.207'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1057,0,1053,NULL,1,N'-1,1053,1057',0,'e9755c34-1157-4fd7-beb1-cbbc2036e7ea',N'Text page','6fbde604-4178-42ce-a10b-8a2600a2f07d',{ts '2016-12-28 07:40:54.220'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1058,0,-1,0,1,N'-1,1058',0,'26bd3b41-8e19-44e1-8205-e274ea79eca2',N'Blog Post','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2016-12-28 07:40:55.083'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1059,0,-1,0,1,N'-1,1059',1,'d05f1887-ee9c-4f04-a23e-8e616bd133ae',N'Blog Post Repository','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2016-12-28 07:40:55.153'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1060,0,-1,0,1,N'-1,1060',2,'03cbbd82-946e-4086-be62-9824b05573d3',N'Home','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2016-12-28 07:40:55.167'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1061,0,-1,0,1,N'-1,1061',3,'14786abf-6e70-499c-9a5e-b6dfafbe9f14',N'Landing Page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2016-12-28 07:40:55.183'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1062,0,-1,0,1,N'-1,1062',4,'a3a8f622-fed4-4437-946d-a755225fcfd4',N'Text Page','a2cb7800-f571-4787-9638-bc48539a0efb',{ts '2016-12-28 07:40:55.207'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1063,0,-1,0,1,N'-1,1063',0,'73ed06d3-2078-4f99-bf6a-cf44cf1c3310',N'Home','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.687'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1064,0,1063,0,2,N'-1,1063,1064',0,'b71f0352-8fcc-49a3-b60d-57b2b583a90e',N'Learn','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.840'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1065,0,1064,0,3,N'-1,1063,1064,1065',0,'64ed7c35-02ec-4f20-815a-ef4e4c19200a',N'The starter kit','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.857'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1066,0,1064,0,3,N'-1,1063,1064,1066',1,'34d464ff-ec04-49fa-af4f-fb87f0cb09e4',N'Basics','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.857'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1067,0,1064,0,3,N'-1,1063,1064,1067',2,'3e63c302-9a21-492f-840a-e67bc61a60a3',N'Masterclasses','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.870'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1068,0,1063,0,2,N'-1,1063,1068',1,'cdc7aee4-f00b-48ea-bc57-00729599c773',N'Explore','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.887'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1069,0,1068,0,3,N'-1,1063,1068,1069',0,'15fce72e-cfba-432f-9956-04041058db0d',N'Our Umbraco','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1070,0,1068,0,3,N'-1,1063,1068,1070',1,'a0fa7372-fc4a-495b-bb51-0306a7342392',N'Codegarden','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.907'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1071,0,1068,0,3,N'-1,1063,1068,1071',2,'bc662a34-ab76-44f1-84c9-1d38abae8ccb',N'Meetup groups','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.923'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1072,0,1063,0,2,N'-1,1063,1072',2,'54a6c4f4-457a-4c92-ba64-2518af8b0b7b',N'Extend','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.940'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1073,0,1072,0,3,N'-1,1063,1072,1073',0,'9d423274-dedc-498e-b535-9809922ba1af',N'Umbraco Forms','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.957'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1074,0,1072,0,3,N'-1,1063,1072,1074',1,'02602f14-4456-47af-98bd-20c08be5e34e',N'Package repository','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.970'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1075,0,1063,0,2,N'-1,1063,1075',3,'0d54a134-624c-4fd8-91e3-555f87982c8b',N'Blog','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.987'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1076,0,1075,0,3,N'-1,1063,1075,1076',0,'565c7d29-f394-411d-874b-c7f4c6d8d0e1',N'Tall trees have deep roots','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:57.987'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1077,0,1075,0,3,N'-1,1063,1075,1077',1,'3da29b01-22f4-4425-86b8-a4b9f810e92e',N'Different Flowers Make a Bouquet','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:58.007'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1078,0,1075,0,3,N'-1,1063,1075,1078',2,'a84479f5-6a02-4a99-ad7b-1bd786c6077d',N'Only the curious have something to find','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:58.023'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (
1079,0,1063,0,2,N'-1,1063,1079',4,'dfc7d719-a34e-42b9-a46f-d93e36e50597',N'Contact','c66ba18e-eaf3-4cff-8a22-41b16d66a972',{ts '2016-12-28 07:40:58.040'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoMigration] ON;
GO
INSERT INTO [umbracoMigration] ([id],[name],[createDate],[version]) VALUES (
1,N'Umbraco',{ts '2016-12-28 07:40:20.247'},N'7.5.6');
GO
SET IDENTITY_INSERT [umbracoMigration] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
1,0,-1,{ts '2016-12-28 07:40:52.780'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
2,0,-1,{ts '2016-12-28 07:40:53.937'},N'Save',N'Save DataTypeDefinition performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
3,0,-1,{ts '2016-12-28 07:40:54.367'},N'Save',N'Save Template performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
4,0,-1,{ts '2016-12-28 07:40:55.383'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
5,0,-1,{ts '2016-12-28 07:40:56.153'},N'Save',N'Save ContentTypes performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
6,0,-1,{ts '2016-12-28 07:40:56.287'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
7,0,-1,{ts '2016-12-28 07:40:56.423'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
8,0,-1,{ts '2016-12-28 07:40:56.557'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
9,0,-1,{ts '2016-12-28 07:40:56.707'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
10,0,-1,{ts '2016-12-28 07:40:56.807'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
11,0,-1,{ts '2016-12-28 07:40:57.007'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
12,0,-1,{ts '2016-12-28 07:40:57.123'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
13,0,-1,{ts '2016-12-28 07:40:57.240'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
14,0,-1,{ts '2016-12-28 07:40:57.357'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
15,0,-1,{ts '2016-12-28 07:40:57.487'},N'Save',N'Save Stylesheet performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
16,0,-1,{ts '2016-12-28 07:40:58.270'},N'Save',N'Bulk Save content performed by user');
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (
17,0,1063,{ts '2016-12-28 07:40:59.340'},N'Publish',N'Publish with Children performed by user');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (
1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoExternalLogin] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [umbracoDeployChecksum] OFF;
GO
SET IDENTITY_INSERT [umbracoCacheInstruction] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] ON;
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (
1,1053,N'Master',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = null;
	var home = @CurrentPage.Site();
}

<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- Meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="@CurrentPage.siteDescription">

    <title>@CurrentPage.Name | @CurrentPage._siteTitle</title>
	
	<!-- Fonts -->
	<link href="//fonts.googleapis.com/css?family=Merriweather:400,700,300,900" rel="stylesheet" type="text/css">
	<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css">
	
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/fanoe.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn''t work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <header>
      <div class="container">
        <div class="row">
          <div class="col-xs-8 col-sm-12 col-md-4">
			<a href="@home.Url">
            	<div class="brand" style="background-image:url(''@(home.SiteLogo)?height=65&width=205&bgcolor=000'')"></div>
			</a>
          </div>
          <div class="col-sm-12 col-md-8">
            <nav>
			  
              @{ Html.RenderPartial("MainNavigation"); }

            </nav>
          </div>
        </div>
      </div>

      <div id="toggle" class="toggle">
        <a href="#" class="cross"><span></span></a>
      </div>
    </header>
	
    @RenderBody()

    <footer class="field dark">
      <div class="container">
        <div class="row">
			
		  @{ Html.RenderPartial("BottomNavigation"); }

        </div>
      </div>
    </footer>
    
    <!-- Javascripts -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
	<script src="/scripts/fanoe.js"></script>
  </body>
</html>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (
2,1054,N'BlogOverview',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

<div role="content">

	<section class="light blogarchive equalizer">
		<div class="container">

			<div class="row">
				@foreach(var post in CurrentPage.Children) 
				{
					<div class="col-sm-6">
						<div class="content equal">
							<a href="@post.Url">
								<div class="date">@post.CreateDate.ToLongDateString()</div>
								<h2>@post.Name</h2>		
								<p>@Umbraco.Truncate(post.Introduction, 240, true)</p>
							</a>
						</div>
					</div>
				}
			</div>
		</div>
	</section>

</div>');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (
3,1055,N'BlogPost',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (
4,1056,N'Home',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")');
GO
INSERT INTO [cmsTemplate] ([pk],[nodeId],[alias],[design]) VALUES (
5,1057,N'TextPage',N'@inherits Umbraco.Web.Mvc.UmbracoTemplatePage
@{
    Layout = "Master.cshtml";
}

@CurrentPage.GetGridHtml("content", "fanoe")');
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (
1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
3,1032,N'Image',1,'79ed4d07-254a-42cf-8fa9-ebe1c116a596');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
4,1033,N'File',1,'50899f9c-023a-4466-b623-aba9049885fe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
5,1031,N'Contents',1,'79995fa2-63ee-453c-a29b-2e66f324cdbe');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
11,1044,N'Membership',1,'0756729d-d665-46e3-b84a-37aceaa614f8');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
12,1058,N'Content',2,'e5932c37-7171-43c6-88b0-ad9c5a0e03f3');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
13,1058,N'Introduction',1,'a6808cda-074f-4a2c-a78a-c5ee23b45cb0');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
14,1060,N'Site',2,'5869af0e-e179-47e5-97c1-3e1217e56e43');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
15,1060,N'Content',1,'b61b2a34-43aa-472d-8b68-4b6bfb97e64a');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
16,1061,N'Content',0,'e789c54b-0985-4c38-b303-ae09cbfd9e17');
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[contenttypeNodeId],[text],[sortorder],[uniqueID]) VALUES (
17,1062,N'Content',0,'e5d020cf-0343-4273-9a74-852249b560ae');
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
6,1043,1032,3,N'umbracoFile',N'Upload image',0,0,NULL,NULL,'00000006-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
7,-92,1032,3,N'umbracoWidth',N'Width',0,0,NULL,NULL,'00000007-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
8,-92,1032,3,N'umbracoHeight',N'Height',0,0,NULL,NULL,'00000008-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
9,-92,1032,3,N'umbracoBytes',N'Size',0,0,NULL,NULL,'00000009-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
10,-92,1032,3,N'umbracoExtension',N'Type',0,0,NULL,NULL,'0000000a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
24,-90,1033,4,N'umbracoFile',N'Upload file',0,0,NULL,NULL,'00000018-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
25,-92,1033,4,N'umbracoExtension',N'Type',0,0,NULL,NULL,'00000019-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
26,-92,1033,4,N'umbracoBytes',N'Size',0,0,NULL,NULL,'0000001a-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
27,-96,1031,5,N'contents',N'Contents:',0,0,NULL,NULL,'0000001b-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
28,-89,1044,11,N'umbracoMemberComments',N'Comments',0,0,NULL,NULL,'0000001c-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
29,-92,1044,11,N'umbracoMemberFailedPasswordAttempts',N'Failed Password Attempts',1,0,NULL,NULL,'0000001d-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
30,-49,1044,11,N'umbracoMemberApproved',N'Is Approved',2,0,NULL,NULL,'0000001e-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
31,-49,1044,11,N'umbracoMemberLockedOut',N'Is Locked Out',3,0,NULL,NULL,'0000001f-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
32,-92,1044,11,N'umbracoMemberLastLockoutDate',N'Last Lockout Date',4,0,NULL,NULL,'00000020-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
33,-92,1044,11,N'umbracoMemberLastLogin',N'Last Login Date',5,0,NULL,NULL,'00000021-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
34,-92,1044,11,N'umbracoMemberLastPasswordChangeDate',N'Last Password Change Date',6,0,NULL,NULL,'00000022-0000-0000-0000-000000000000');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
50,1050,1058,12,N'content',N'Content',0,0,N'',N'','d5d82fd8-6683-4dab-9656-37077b897ab2');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
51,-89,1058,13,N'introduction',N'Introduction',0,0,N'',N'','31b8b02f-d636-43cc-8627-483801e5e21d');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
52,-49,1059,NULL,N'umbracoNaviHide',N'Hide in bottom navigation?',0,0,N'',N'','3854a3ea-edd2-444d-a865-ebe09e529a9f');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
53,-89,1060,14,N'siteDescription',N'Site Description',0,0,N'',N'','d47a1582-3881-471d-98c9-09f17862412c');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
54,-88,1060,14,N'siteTitle',N'Site Title',1,0,N'',N'','5338af29-2c63-436f-a1f4-f11a390c3612');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
55,-90,1060,14,N'siteLogo',N'Site Logo',2,0,N'',N'','71c58394-a43f-4bb3-a419-13b2229f2aed');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
56,1051,1060,15,N'content',N'Content',0,0,N'',N'','b7ec3094-b5d3-4723-81d4-410fd1ce05e9');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
57,-49,1061,NULL,N'umbracoNaviHide',N'Hide in bottom navigation?',0,0,N'',N'','f5bf2334-7bcb-4392-b323-6dd402196dd5');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
58,1052,1061,16,N'content',N'Content',0,0,N'',N'','16306cd2-15f8-4bd3-a27b-36c6eb5dda15');
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[sortOrder],[mandatory],[validationRegExp],[Description],[UniqueID]) VALUES (
59,1052,1062,17,N'content',N'Content',0,0,N'',N'','1e83ae2b-a647-46d7-9c04-a240f2707f91');
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyData] ON;
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
1,1063,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',53,NULL,NULL,NULL,NULL,N'This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
2,1063,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',54,NULL,NULL,NULL,N'Fanoe - Umbraco Starter Kit',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
3,1063,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',55,NULL,NULL,NULL,N'/media/1042/logo.jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
4,1063,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',56,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
5,1064,'2e8f2dc5-4109-457d-ae25-7d9f01a0ede0',57,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
6,1064,'2e8f2dc5-4109-457d-ae25-7d9f01a0ede0',58,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
7,1065,'cb0d0dd6-72d9-4894-8c84-ac222ece835e',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
8,1066,'0e82a0cb-1f42-455e-9a80-ba571ef20f17',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
9,1067,'cea910db-8bc4-4d98-bd3b-d861465d3225',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
10,1068,'cb8282ec-917d-4cf5-9ac4-39758b2c8320',57,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
11,1068,'cb8282ec-917d-4cf5-9ac4-39758b2c8320',58,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
12,1069,'5c026a55-84ea-4efa-9db3-4905ddb73c58',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
13,1070,'bf94e949-6f17-4e23-ba65-582c61b74711',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
14,1071,'ddd9a5df-bd5b-4d2b-9f06-da7d5c2f91dd',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
15,1072,'e8efcb32-efa4-45dd-8233-caec365b6467',57,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
16,1072,'e8efcb32-efa4-45dd-8233-caec365b6467',58,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
17,1073,'a9d5aa8f-e863-414a-b63a-39ce37965a9c',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
18,1074,'eff37eb1-b7bd-481e-85a4-73fd0e8d30b3',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
19,1075,'7ed491d9-94c8-41fd-a8eb-aa3ef04dea1c',52,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
20,1076,'af9e4828-2b89-4e06-8e6a-9073b95a3460',50,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
21,1076,'af9e4828-2b89-4e06-8e6a-9073b95a3460',51,NULL,NULL,NULL,NULL,N'You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
22,1077,'11239355-cb8b-40d7-b511-3ca7ff056fe1',50,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
23,1077,'11239355-cb8b-40d7-b511-3ca7ff056fe1',51,NULL,NULL,NULL,NULL,N'It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
24,1078,'0ce27371-c73f-44e2-8174-b410afd8c695',50,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
25,1078,'0ce27371-c73f-44e2-8174-b410afd8c695',51,NULL,NULL,NULL,NULL,N'A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
26,1079,'020a002d-9c22-4cae-82d9-7422be6f63bb',57,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
27,1079,'020a002d-9c22-4cae-82d9-7422be6f63bb',58,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
28,1063,'1dbee246-81d6-4e4b-ba75-8a963e260a87',53,NULL,NULL,NULL,NULL,N'This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
29,1063,'1dbee246-81d6-4e4b-ba75-8a963e260a87',55,NULL,NULL,NULL,N'/media/1042/logo.jpg',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
30,1063,'1dbee246-81d6-4e4b-ba75-8a963e260a87',54,NULL,NULL,NULL,N'Fanoe - Umbraco Starter Kit',NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
31,1063,'1dbee246-81d6-4e4b-ba75-8a963e260a87',56,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
32,1064,'fe7ad66f-dfd0-4052-a675-0ae5ac561533',57,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
33,1064,'fe7ad66f-dfd0-4052-a675-0ae5ac561533',58,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
34,1068,'a26b139e-96f9-4c4a-a31c-057a508cbb0d',57,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
35,1068,'a26b139e-96f9-4c4a-a31c-057a508cbb0d',58,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
36,1072,'988cfa1f-e59a-4543-adc7-d193cce93a4b',57,0,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
37,1072,'988cfa1f-e59a-4543-adc7-d193cce93a4b',58,NULL,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
38,1075,'3029dcb8-17fc-4ab1-ba07-931cff9256b3',52,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
39,1079,'469891c5-f454-4bc2-b2ee-15775428e107',57,1,NULL,NULL,NULL,NULL);
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
40,1079,'469891c5-f454-4bc2-b2ee-15775428e107',58,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
41,1076,'505f8c8d-5ff0-4fe8-a522-68ade6de5ea1',50,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
42,1076,'505f8c8d-5ff0-4fe8-a522-68ade6de5ea1',51,NULL,NULL,NULL,NULL,N'You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
43,1073,'de23a7b8-c88d-411a-b7b5-425019f88444',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
44,1069,'0d69c07e-5813-4a5f-830c-ceeaf5411609',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
45,1065,'a58f40c3-4bb2-4564-be8d-aef064a3fb79',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
46,1077,'66285052-e56c-405c-9263-ecad779f7b9b',50,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
47,1077,'66285052-e56c-405c-9263-ecad779f7b9b',51,NULL,NULL,NULL,NULL,N'It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
48,1074,'3a8718c8-2582-47f1-a1f7-eb27ad441ca8',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
49,1070,'215123ee-9e67-4233-9994-ccfcc71d88a2',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
50,1066,'cd256c99-82c7-414b-b1ea-e781c3c61272',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
51,1078,'ae4753ea-820d-496b-b600-72d5b3ad71cf',50,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
52,1078,'ae4753ea-820d-496b-b600-72d5b3ad71cf',51,NULL,NULL,NULL,NULL,N'A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
53,1071,'583264a2-7971-42df-9938-77f65fd58383',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}');
GO
INSERT INTO [cmsPropertyData] ([id],[contentNodeId],[versionId],[propertytypeid],[dataInt],[dataDecimal],[dataDate],[dataNvarchar],[dataNtext]) VALUES (
54,1067,'702a6fe5-a3d5-451b-86fc-632b15e2bdb8',59,NULL,NULL,NULL,NULL,N'{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}');
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1063,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',{ts '2016-12-28 07:40:57.740'},N'<Home id="1063" key="73ed06d3-2078-4f99-bf6a-cf44cf1c3310" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Home" urlName="home" path="-1,1063" isDoc="" nodeType="1060" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1056" nodeTypeAlias="Home"><siteDescription><![CDATA[This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!]]></siteDescription><siteTitle><![CDATA[Fanoe - Umbraco Starter Kit]]></siteTitle><siteLogo><![CDATA[/media/1042/logo.jpg]]></siteLogo><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}]]></content></Home>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1063,'1dbee246-81d6-4e4b-ba75-8a963e260a87',{ts '2016-12-28 07:40:58.810'},N'<Home id="1063" key="73ed06d3-2078-4f99-bf6a-cf44cf1c3310" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Home" urlName="home" path="-1,1063" isDoc="" nodeType="1060" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1056" nodeTypeAlias="Home"><siteDescription><![CDATA[This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!]]></siteDescription><siteLogo><![CDATA[/media/1042/logo.jpg]]></siteLogo><siteTitle><![CDATA[Fanoe - Umbraco Starter Kit]]></siteTitle><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}]]></content></Home>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1064,'fe7ad66f-dfd0-4052-a675-0ae5ac561533',{ts '2016-12-28 07:40:58.823'},N'<LandingPage id="1064" key="b71f0352-8fcc-49a3-b60d-57b2b583a90e" parentID="1063" level="2" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Learn" urlName="learn" path="-1,1063,1064" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1064,'2e8f2dc5-4109-457d-ae25-7d9f01a0ede0',{ts '2016-12-28 07:40:57.857'},N'<LandingPage id="1064" key="b71f0352-8fcc-49a3-b60d-57b2b583a90e" parentID="1063" level="2" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Learn" urlName="learn" path="-1,1063,1064" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1065,'cb0d0dd6-72d9-4894-8c84-ac222ece835e',{ts '2016-12-28 07:40:57.857'},N'<TextPage id="1065" key="64ed7c35-02ec-4f20-815a-ef4e4c19200a" parentID="1064" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="The starter kit" urlName="the-starter-kit" path="-1,1063,1064,1065" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1065,'a58f40c3-4bb2-4564-be8d-aef064a3fb79',{ts '2016-12-28 07:40:58.927'},N'<TextPage id="1065" key="64ed7c35-02ec-4f20-815a-ef4e4c19200a" parentID="1064" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="The starter kit" urlName="the-starter-kit" path="-1,1063,1064,1065" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1066,'0e82a0cb-1f42-455e-9a80-ba571ef20f17',{ts '2016-12-28 07:40:57.870'},N'<TextPage id="1066" key="34d464ff-ec04-49fa-af4f-fb87f0cb09e4" parentID="1064" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Basics" urlName="basics" path="-1,1063,1064,1066" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1066,'cd256c99-82c7-414b-b1ea-e781c3c61272',{ts '2016-12-28 07:40:58.973'},N'<TextPage id="1066" key="34d464ff-ec04-49fa-af4f-fb87f0cb09e4" parentID="1064" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Basics" urlName="basics" path="-1,1063,1064,1066" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1067,'702a6fe5-a3d5-451b-86fc-632b15e2bdb8',{ts '2016-12-28 07:40:59.027'},N'<TextPage id="1067" key="3e63c302-9a21-492f-840a-e67bc61a60a3" parentID="1064" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:59" nodeName="Masterclasses" urlName="masterclasses" path="-1,1063,1064,1067" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1067,'cea910db-8bc4-4d98-bd3b-d861465d3225',{ts '2016-12-28 07:40:57.887'},N'<TextPage id="1067" key="3e63c302-9a21-492f-840a-e67bc61a60a3" parentID="1064" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Masterclasses" urlName="masterclasses" path="-1,1063,1064,1067" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1068,'a26b139e-96f9-4c4a-a31c-057a508cbb0d',{ts '2016-12-28 07:40:58.840'},N'<LandingPage id="1068" key="cdc7aee4-f00b-48ea-bc57-00729599c773" parentID="1063" level="2" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Explore" urlName="explore" path="-1,1063,1068" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1068,'cb8282ec-917d-4cf5-9ac4-39758b2c8320',{ts '2016-12-28 07:40:57.907'},N'<LandingPage id="1068" key="cdc7aee4-f00b-48ea-bc57-00729599c773" parentID="1063" level="2" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Explore" urlName="explore" path="-1,1063,1068" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1069,'5c026a55-84ea-4efa-9db3-4905ddb73c58',{ts '2016-12-28 07:40:57.907'},N'<TextPage id="1069" key="15fce72e-cfba-432f-9956-04041058db0d" parentID="1068" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Our Umbraco" urlName="our-umbraco" path="-1,1063,1068,1069" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1069,'0d69c07e-5813-4a5f-830c-ceeaf5411609',{ts '2016-12-28 07:40:58.910'},N'<TextPage id="1069" key="15fce72e-cfba-432f-9956-04041058db0d" parentID="1068" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Our Umbraco" urlName="our-umbraco" path="-1,1063,1068,1069" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1070,'bf94e949-6f17-4e23-ba65-582c61b74711',{ts '2016-12-28 07:40:57.923'},N'<TextPage id="1070" key="a0fa7372-fc4a-495b-bb51-0306a7342392" parentID="1068" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Codegarden" urlName="codegarden" path="-1,1063,1068,1070" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1070,'215123ee-9e67-4233-9994-ccfcc71d88a2',{ts '2016-12-28 07:40:58.973'},N'<TextPage id="1070" key="a0fa7372-fc4a-495b-bb51-0306a7342392" parentID="1068" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Codegarden" urlName="codegarden" path="-1,1063,1068,1070" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1071,'583264a2-7971-42df-9938-77f65fd58383',{ts '2016-12-28 07:40:59.010'},N'<TextPage id="1071" key="bc662a34-ab76-44f1-84c9-1d38abae8ccb" parentID="1068" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:59" nodeName="Meetup groups" urlName="meetup-groups" path="-1,1063,1068,1071" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1071,'ddd9a5df-bd5b-4d2b-9f06-da7d5c2f91dd',{ts '2016-12-28 07:40:57.940'},N'<TextPage id="1071" key="bc662a34-ab76-44f1-84c9-1d38abae8ccb" parentID="1068" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Meetup groups" urlName="meetup-groups" path="-1,1063,1068,1071" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1072,'e8efcb32-efa4-45dd-8233-caec365b6467',{ts '2016-12-28 07:40:57.957'},N'<LandingPage id="1072" key="54a6c4f4-457a-4c92-ba64-2518af8b0b7b" parentID="1063" level="2" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Extend" urlName="extend" path="-1,1063,1072" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1072,'988cfa1f-e59a-4543-adc7-d193cce93a4b',{ts '2016-12-28 07:40:58.857'},N'<LandingPage id="1072" key="54a6c4f4-457a-4c92-ba64-2518af8b0b7b" parentID="1063" level="2" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Extend" urlName="extend" path="-1,1063,1072" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1073,'a9d5aa8f-e863-414a-b63a-39ce37965a9c',{ts '2016-12-28 07:40:57.970'},N'<TextPage id="1073" key="9d423274-dedc-498e-b535-9809922ba1af" parentID="1072" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Umbraco Forms" urlName="umbraco-forms" path="-1,1063,1072,1073" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1073,'de23a7b8-c88d-411a-b7b5-425019f88444',{ts '2016-12-28 07:40:58.910'},N'<TextPage id="1073" key="9d423274-dedc-498e-b535-9809922ba1af" parentID="1072" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Umbraco Forms" urlName="umbraco-forms" path="-1,1063,1072,1073" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1074,'eff37eb1-b7bd-481e-85a4-73fd0e8d30b3',{ts '2016-12-28 07:40:57.970'},N'<TextPage id="1074" key="02602f14-4456-47af-98bd-20c08be5e34e" parentID="1072" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Package repository" urlName="package-repository" path="-1,1063,1072,1074" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1074,'3a8718c8-2582-47f1-a1f7-eb27ad441ca8',{ts '2016-12-28 07:40:58.957'},N'<TextPage id="1074" key="02602f14-4456-47af-98bd-20c08be5e34e" parentID="1072" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Package repository" urlName="package-repository" path="-1,1063,1072,1074" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1075,'3029dcb8-17fc-4ab1-ba07-931cff9256b3',{ts '2016-12-28 07:40:58.857'},N'<BlogPostRepository id="1075" key="0d54a134-624c-4fd8-91e3-555f87982c8b" parentID="1063" level="2" creatorID="0" sortOrder="3" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Blog" urlName="blog" path="-1,1063,1075" isDoc="" nodeType="1059" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1054" nodeTypeAlias="BlogPostRepository"><umbracoNaviHide>1</umbracoNaviHide></BlogPostRepository>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1075,'7ed491d9-94c8-41fd-a8eb-aa3ef04dea1c',{ts '2016-12-28 07:40:57.987'},N'<BlogPostRepository id="1075" key="0d54a134-624c-4fd8-91e3-555f87982c8b" parentID="1063" level="2" creatorID="0" sortOrder="3" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Blog" urlName="blog" path="-1,1063,1075" isDoc="" nodeType="1059" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1054" nodeTypeAlias="BlogPostRepository"><umbracoNaviHide>1</umbracoNaviHide></BlogPostRepository>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1076,'505f8c8d-5ff0-4fe8-a522-68ade6de5ea1',{ts '2016-12-28 07:40:58.887'},N'<BlogPost id="1076" key="565c7d29-f394-411d-874b-c7f4c6d8d0e1" parentID="1075" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Tall trees have deep roots" urlName="tall-trees-have-deep-roots" path="-1,1063,1075,1076" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1076,'af9e4828-2b89-4e06-8e6a-9073b95a3460',{ts '2016-12-28 07:40:58.007'},N'<BlogPost id="1076" key="565c7d29-f394-411d-874b-c7f4c6d8d0e1" parentID="1075" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:57" nodeName="Tall trees have deep roots" urlName="tall-trees-have-deep-roots" path="-1,1063,1075,1076" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1077,'11239355-cb8b-40d7-b511-3ca7ff056fe1',{ts '2016-12-28 07:40:58.023'},N'<BlogPost id="1077" key="3da29b01-22f4-4425-86b8-a4b9f810e92e" parentID="1075" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Different Flowers Make a Bouquet" urlName="different-flowers-make-a-bouquet" path="-1,1063,1075,1077" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1077,'66285052-e56c-405c-9263-ecad779f7b9b',{ts '2016-12-28 07:40:58.940'},N'<BlogPost id="1077" key="3da29b01-22f4-4425-86b8-a4b9f810e92e" parentID="1075" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Different Flowers Make a Bouquet" urlName="different-flowers-make-a-bouquet" path="-1,1063,1075,1077" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1078,'ae4753ea-820d-496b-b600-72d5b3ad71cf',{ts '2016-12-28 07:40:58.987'},N'<BlogPost id="1078" key="a84479f5-6a02-4a99-ad7b-1bd786c6077d" parentID="1075" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Only the curious have something to find" urlName="only-the-curious-have-something-to-find" path="-1,1063,1075,1078" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1078,'0ce27371-c73f-44e2-8174-b410afd8c695',{ts '2016-12-28 07:40:58.040'},N'<BlogPost id="1078" key="a84479f5-6a02-4a99-ad7b-1bd786c6077d" parentID="1075" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Only the curious have something to find" urlName="only-the-curious-have-something-to-find" path="-1,1063,1075,1078" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1079,'469891c5-f454-4bc2-b2ee-15775428e107',{ts '2016-12-28 07:40:58.870'},N'<LandingPage id="1079" key="dfc7d719-a34e-42b9-a46f-d93e36e50597" parentID="1063" level="2" creatorID="0" sortOrder="4" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Contact" urlName="contact" path="-1,1063,1079" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>');
GO
INSERT INTO [cmsPreviewXml] ([nodeId],[versionId],[timestamp],[xml]) VALUES (
1079,'020a002d-9c22-4cae-82d9-7422be6f63bb',{ts '2016-12-28 07:40:58.040'},N'<LandingPage id="1079" key="dfc7d719-a34e-42b9-a46f-d93e36e50597" parentID="1063" level="2" creatorID="0" sortOrder="4" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Contact" urlName="contact" path="-1,1063,1079" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>');
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1058,1055,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1059,1054,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1060,1056,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1061,1057,1);
GO
INSERT INTO [cmsDocumentType] ([contentTypeNodeId],[templateNodeId],[IsDefault]) VALUES (
1062,1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1068,1,0,'a26b139e-96f9-4c4a-a31c-057a508cbb0d',N'Explore',NULL,NULL,{ts '2016-12-28 07:40:58.823'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1064,1,0,'fe7ad66f-dfd0-4052-a675-0ae5ac561533',N'Learn',NULL,NULL,{ts '2016-12-28 07:40:58.810'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1063,0,0,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',N'Home',NULL,NULL,{ts '2016-12-28 07:40:57.687'},1056,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1079,1,0,'469891c5-f454-4bc2-b2ee-15775428e107',N'Contact',NULL,NULL,{ts '2016-12-28 07:40:58.857'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1068,0,0,'cb8282ec-917d-4cf5-9ac4-39758b2c8320',N'Explore',NULL,NULL,{ts '2016-12-28 07:40:57.887'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1073,0,0,'a9d5aa8f-e863-414a-b63a-39ce37965a9c',N'Umbraco Forms',NULL,NULL,{ts '2016-12-28 07:40:57.957'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1077,0,0,'11239355-cb8b-40d7-b511-3ca7ff056fe1',N'Different Flowers Make a Bouquet',NULL,NULL,{ts '2016-12-28 07:40:58.007'},1055,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1073,1,0,'de23a7b8-c88d-411a-b7b5-425019f88444',N'Umbraco Forms',NULL,NULL,{ts '2016-12-28 07:40:58.887'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1069,0,0,'5c026a55-84ea-4efa-9db3-4905ddb73c58',N'Our Umbraco',NULL,NULL,{ts '2016-12-28 07:40:57.907'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1070,0,0,'bf94e949-6f17-4e23-ba65-582c61b74711',N'Codegarden',NULL,NULL,{ts '2016-12-28 07:40:57.907'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1067,1,0,'702a6fe5-a3d5-451b-86fc-632b15e2bdb8',N'Masterclasses',NULL,NULL,{ts '2016-12-28 07:40:59.010'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1076,1,0,'505f8c8d-5ff0-4fe8-a522-68ade6de5ea1',N'Tall trees have deep roots',NULL,NULL,{ts '2016-12-28 07:40:58.870'},1055,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1078,1,0,'ae4753ea-820d-496b-b600-72d5b3ad71cf',N'Only the curious have something to find',NULL,NULL,{ts '2016-12-28 07:40:58.987'},1055,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1074,0,0,'eff37eb1-b7bd-481e-85a4-73fd0e8d30b3',N'Package repository',NULL,NULL,{ts '2016-12-28 07:40:57.970'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1079,0,0,'020a002d-9c22-4cae-82d9-7422be6f63bb',N'Contact',NULL,NULL,{ts '2016-12-28 07:40:58.040'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1071,1,0,'583264a2-7971-42df-9938-77f65fd58383',N'Meetup groups',NULL,NULL,{ts '2016-12-28 07:40:59.003'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1064,0,0,'2e8f2dc5-4109-457d-ae25-7d9f01a0ede0',N'Learn',NULL,NULL,{ts '2016-12-28 07:40:57.840'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1063,1,0,'1dbee246-81d6-4e4b-ba75-8a963e260a87',N'Home',NULL,NULL,{ts '2016-12-28 07:40:58.770'},1056,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1076,0,0,'af9e4828-2b89-4e06-8e6a-9073b95a3460',N'Tall trees have deep roots',NULL,NULL,{ts '2016-12-28 07:40:57.987'},1055,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1075,1,0,'3029dcb8-17fc-4ab1-ba07-931cff9256b3',N'Blog',NULL,NULL,{ts '2016-12-28 07:40:58.857'},1054,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1075,0,0,'7ed491d9-94c8-41fd-a8eb-aa3ef04dea1c',N'Blog',NULL,NULL,{ts '2016-12-28 07:40:57.987'},1054,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1065,0,0,'cb0d0dd6-72d9-4894-8c84-ac222ece835e',N'The starter kit',NULL,NULL,{ts '2016-12-28 07:40:57.857'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1065,1,0,'a58f40c3-4bb2-4564-be8d-aef064a3fb79',N'The starter kit',NULL,NULL,{ts '2016-12-28 07:40:58.910'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1078,0,0,'0ce27371-c73f-44e2-8174-b410afd8c695',N'Only the curious have something to find',NULL,NULL,{ts '2016-12-28 07:40:58.023'},1055,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1066,0,0,'0e82a0cb-1f42-455e-9a80-ba571ef20f17',N'Basics',NULL,NULL,{ts '2016-12-28 07:40:57.857'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1072,0,0,'e8efcb32-efa4-45dd-8233-caec365b6467',N'Extend',NULL,NULL,{ts '2016-12-28 07:40:57.940'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1070,1,0,'215123ee-9e67-4233-9994-ccfcc71d88a2',N'Codegarden',NULL,NULL,{ts '2016-12-28 07:40:58.957'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1069,1,0,'0d69c07e-5813-4a5f-830c-ceeaf5411609',N'Our Umbraco',NULL,NULL,{ts '2016-12-28 07:40:58.910'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1072,1,0,'988cfa1f-e59a-4543-adc7-d193cce93a4b',N'Extend',NULL,NULL,{ts '2016-12-28 07:40:58.840'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1067,0,0,'cea910db-8bc4-4d98-bd3b-d861465d3225',N'Masterclasses',NULL,NULL,{ts '2016-12-28 07:40:57.870'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1071,0,0,'ddd9a5df-bd5b-4d2b-9f06-da7d5c2f91dd',N'Meetup groups',NULL,NULL,{ts '2016-12-28 07:40:57.923'},1057,0);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1066,1,0,'cd256c99-82c7-414b-b1ea-e781c3c61272',N'Basics',NULL,NULL,{ts '2016-12-28 07:40:58.973'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1074,1,0,'3a8718c8-2582-47f1-a1f7-eb27ad441ca8',N'Package repository',NULL,NULL,{ts '2016-12-28 07:40:58.940'},1057,1);
GO
INSERT INTO [cmsDocument] ([nodeId],[published],[documentUser],[versionId],[text],[releaseDate],[expireDate],[updateDate],[templateId],[newest]) VALUES (
1077,1,0,'66285052-e56c-405c-9263-ecad779f7b9b',N'Different Flowers Make a Bouquet',NULL,NULL,{ts '2016-12-28 07:40:58.927'},1055,1);
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-9,-96,N'[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]',5,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-8,-96,N'[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}]',4,N'layouts');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-7,-96,N'desc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-6,-96,N'updateDate',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-5,-96,N'100',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-4,-97,N'[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]',4,N'includeProperties');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-3,-97,N'asc',3,N'orderDirection');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-2,-97,N'username',2,N'orderBy');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
-1,-97,N'10',1,N'pageSize');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
4,1041,N'default',0,N'group');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
5,1045,N'1',0,N'multiPicker');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
6,1050,N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})",
      "applyTo": "row"
    }
  ],
  "config": [
    {
      "label": "Background color",
      "description": "Choose background color",
      "key": "class",
      "view": "radiobuttonlist",
      "applyTo": "row",
      "prevalues": [
        "light",
        "dark",
        "yellow",
        "blue",
        "purple",
        "full",
        "full triangle"
      ]
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Article",
      "areas": [
        {
          "grid": 3,
          "allowAll": false,
          "allowed": [
            "media_round",
            "paragraph"
          ]
        },
        {
          "grid": 1,
          "allowAll": false,
          "allowed": []
        },
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "abstract",
            "paragraph",
            "rte",
            "headline"
          ]
        }
      ]
    },
    {
      "name": "Banner",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "rte",
            "banner_headline",
            "headline",
            "abstract",
            "paragraph",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Image wide",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_wide_cropped",
            "media_wide"
          ]
        }
      ]
    },
    {
      "name": "Article full width",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_text_right",
            "headline",
            "abstract",
            "paragraph",
            "quote",
            "media",
            "code",
            "rte",
            "embed",
            "headline_centered"
          ]
        }
      ]
    },
    {
      "name": "Article two col",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "headline",
            "quote"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "abstract",
            "media",
            "code",
            "quote",
            "paragraph"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "quote",
            "code",
            "media",
            "paragraph"
          ]
        }
      ]
    }
  ]
}',1,N'items');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
7,1050,N'{
  "toolbar": [
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "bullist",
    "numlist",
    "link"
  ],
  "stylesheets": [
    "rte"
  ],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',2,N'rte');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
8,1051,N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})",
      "applyTo": "row"
    },
    {
      "label": "Add spacing",
      "description": "Add spacing under element",
      "key": "margin-bottom",
      "view": "textstring"
    }
  ],
  "config": [
    {
      "label": "Background color",
      "description": "Choose background color",
      "key": "class",
      "view": "radiobuttonlist",
      "applyTo": "row",
      "prevalues": [
        "light",
        "dark",
        "yellow",
        "blue",
        "purple",
        "full",
        "full triangle"
      ]
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Banner",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "rte",
            "banner_headline",
            "banner_tagline"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media"
          ]
        }
      ]
    },
    {
      "name": "Full width content",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Two column",
      "areas": [
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        },
        {
          "grid": 6,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Three column",
      "areas": [
        {
          "grid": 4
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "headline",
            "headline_centered",
            "paragraph",
            "media_round"
          ]
        },
        {
          "grid": 4
        }
      ]
    },
    {
      "name": "40/60",
      "areas": [
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        },
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "60/40",
      "areas": [
        {
          "grid": 8,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round",
            "quote"
          ]
        },
        {
          "grid": 4,
          "allowAll": false,
          "allowed": [
            "rte",
            "media",
            "media_round"
          ]
        }
      ]
    },
    {
      "name": "Full width image",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_wide_cropped",
            "media_wide"
          ]
        }
      ]
    }
  ]
}',1,N'items');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
9,1051,N'{
  "toolbar": [
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "alignright",
    "bullist",
    "numlist",
    "link"
  ],
  "stylesheets": [
    "rte"
  ],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',2,N'rte');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
10,1052,N'{
  "styles": [
    {
      "label": "Set a background image",
      "description": "Set a row background",
      "key": "background-image",
      "view": "imagepicker",
      "modifier": "url({0})",
      "applyTo": "row"
    }
  ],
  "config": [
    {
      "label": "Background color",
      "description": "Choose background color",
      "key": "class",
      "view": "radiobuttonlist",
      "applyTo": "row",
      "prevalues": [
        "light",
        "dark",
        "yellow",
        "blue",
        "purple",
        "full",
        "full triangle"
      ]
    }
  ],
  "columns": 12,
  "templates": [
    {
      "name": "1 column layout",
      "sections": [
        {
          "grid": 12
        }
      ]
    }
  ],
  "layouts": [
    {
      "name": "Headline",
      "areas": [
        {
          "grid": 12,
          "editors": [
            "headline"
          ]
        }
      ]
    },
    {
      "name": "Article",
      "areas": [
        {
          "grid": 4
        },
        {
          "grid": 8
        }
      ]
    },
    {
      "name": "Wide image",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "media_wide",
            "media_wide_cropped"
          ]
        }
      ]
    },
    {
      "name": "Image w. text",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "banner_headline",
            "rte",
            "quote"
          ]
        }
      ]
    },
    {
      "name": "Article Wide",
      "areas": [
        {
          "grid": 12,
          "allowAll": false,
          "allowed": [
            "headline",
            "abstract",
            "code",
            "quote",
            "embed",
            "media",
            "media_text_right",
            "rte",
            "paragraph"
          ]
        }
      ]
    }
  ]
}',1,N'items');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (
11,1052,N'{
  "toolbar": [
    "styleselect",
    "bold",
    "italic",
    "alignleft",
    "aligncenter",
    "bullist",
    "numlist",
    "link"
  ],
  "stylesheets": [
    "rte"
  ],
  "dimensions": {
    "height": 500
  },
  "maxImageSize": 500
}',2,N'rte');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
-28,-97,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
-27,-96,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
-26,-95,N'Umbraco.ListView',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
1,-49,N'Umbraco.TrueFalse',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
2,-51,N'Umbraco.Integer',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
3,-87,N'Umbraco.TinyMCEv3',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
4,-88,N'Umbraco.Textbox',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
5,-89,N'Umbraco.TextboxMultiple',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
6,-90,N'Umbraco.UploadField',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
7,-92,N'Umbraco.NoEdit',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
8,-36,N'Umbraco.DateTime',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
9,-37,N'Umbraco.ColorPickerAlias',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
11,-39,N'Umbraco.DropDownMultiple',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
12,-40,N'Umbraco.RadioButtonList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
13,-41,N'Umbraco.Date',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
14,-42,N'Umbraco.DropDown',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
15,-43,N'Umbraco.CheckBoxList',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
16,1034,N'Umbraco.ContentPickerAlias',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
17,1035,N'Umbraco.MultipleMediaPicker',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
18,1036,N'Umbraco.MemberPicker',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
21,1040,N'Umbraco.RelatedLinks',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
22,1041,N'Umbraco.Tags',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
24,1043,N'Umbraco.ImageCropper',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
25,1045,N'Umbraco.MultipleMediaPicker',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
30,1050,N'Umbraco.Grid',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
31,1051,N'Umbraco.Grid',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[propertyEditorAlias],[dbType]) VALUES (
32,1052,N'Umbraco.Grid',N'Ntext');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1063,N'<Home id="1063" key="73ed06d3-2078-4f99-bf6a-cf44cf1c3310" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Home" urlName="home" path="-1,1063" isDoc="" nodeType="1060" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1056" nodeTypeAlias="Home"><siteDescription><![CDATA[This is an official Umbraco Starter kit. It shows of the newest features in Umbraco and is the perfect place to start for newcomers.. Everything is made to be taken apart. It''s your own little playground. Enjoy!]]></siteDescription><siteLogo><![CDATA[/media/1042/logo.jpg]]></siteLogo><siteTitle><![CDATA[Fanoe - Umbraco Starter Kit]]></siteTitle><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "config": {},
              "styles": {
                "margin-bottom": "60px"
              },
              "controls": [
                {
                  "value": "Welcome to Fanoe",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "This is the new default starter kit for Umbraco, we enjoy building things that not only look great, but also work great.",
                  "editor": {
                    "name": "Banner Tagline",
                    "alias": "banner_tagline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 25px; line-height: 35px; font-weight: normal; text-align:center",
                      "markup": "<h2 style=''font-weight: 100; font-size: 40px;text-align:center''>#value#</h2>"
                    }
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>The starter kit</h2>\n<p>Congratulations on getting up and running with the “Fanoe” starter kit. It''s a great way to get to know the Grid datatype.</p>\n<p><a href=\"/{localLink:1078}\" title=\"The starter kit\">Learn about the starter kit →</a><a href=\"/{localLink:1078}\" title=\"The Starterkit\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Learn the basics</h2>\n<p>To get started on the right foot make sure to check out our documentation - from tutorials to API reference.</p>\n<p><a href=\"/{localLink:1079}\" title=\"Basics\">Off to the docs →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 4,
              "allowAll": false,
              "allowed": [
                "rte",
                "media"
              ],
              "controls": [
                {
                  "value": "<h2>Master classes</h2>\n<p>The best way to learn Umbraco is through the Master classes that’s running every month in most regions.</p>\n<p><a href=\"/{localLink:1080}\" title=\"Masterclasses\">Learn about the masterclasses →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1044/14441035391_7ee1d0d166_h_darken.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d28a05da-2404-c1e7-6265-01b07fc5f722"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Umbraco Forms</h1>\n<p>With our add-on product Umbraco Forms it’s a breeze to create any type of form you can imagine.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1>Package repository</h1>\n<p>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "5362ea7d-e729-078b-e717-a1e7aa69fd4b"
        },
        {
          "name": "Full width image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1127,
                    "image": "/media/1046/14386124825_d43f359900_h_cropped.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "953b3802-6b4f-20ed-66f9-9a855e9afdd4"
        },
        {
          "name": "Two column",
          "areas": [
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Sharing is caring</h2>\n<p>Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            },
            {
              "grid": 6,
              "allowAll": false,
              "allowed": [
                "rte",
                "media",
                "media_round",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h2>Born global, loving local</h2>\n<p>If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community. You can do just that through the many local user groups and meetups</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "29cac0ff-d8e9-605b-9e7b-6809dce55edd"
        },
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "banner_tagline"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">CodeGarden</h1>\n<h5 style=\"text-align: center;\">Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0093bd05-735a-9623-8509-28085818745c"
        }
      ]
    }
  ]
}]]></content></Home>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1064,N'<LandingPage id="1064" key="b71f0352-8fcc-49a3-b60d-57b2b583a90e" parentID="1063" level="2" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Learn" urlName="learn" path="-1,1063,1064" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1065,N'<TextPage id="1065" key="64ed7c35-02ec-4f20-815a-ef4e4c19200a" parentID="1064" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="The starter kit" urlName="the-starter-kit" path="-1,1063,1064,1065" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Fanø",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Fanø is a Danish island in the North Sea off the coast of southwestern Denmark, and is the very northernmost of the Danish Wadden Sea Islands. Fanø municipality is the municipality that covers the island and its seat is the town of Nordby.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1012/fanoe-denmark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "789b4b02-6a1e-bbff-9435-939d83f6e895"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 dir=\"ltr\"><span><span>How is this starter kit made?</span></span></h1>\n<p dir=\"ltr\"><span>Congratulations on getting up and running with Umbraco and the “Fanoe” starter kit. The idea with this starter kit is to let you explore some of the simple things Umbraco can do for a typical content powered website using “The Grid” feature.</span></p>\n<p><span>To get the most out of this starter kit and get started on the right foot, make sure to watch the “Grid” tutorial on Umbraco.TV which will take you through how the entire starter kit was made. From implementing the HTML mockups in Umbraco and using the powerful features in the Grid to give maximum freedom and flexibility for editors - without compromising the design.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f0013b7-f55e-cdd9-6ed9-7ad2f8696157"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "While walking around on Fanø, you will notice that almost all traditional houses have a little window above the front door with a model boat.\nThis is a very traditional good luck charm for the men away at sea. The economy of the island was almost entirely based on fishing and every family home has the model boat to ensure the safe return of sailors",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "3bd5271f-c171-8435-ba19-00008abd3af5"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1066,N'<TextPage id="1066" key="34d464ff-ec04-49fa-af4f-fb87f0cb09e4" parentID="1064" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Basics" urlName="basics" path="-1,1063,1064,1066" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Learn the basics",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">While we recommend everyone to get an Umbraco.TV subscription to learn the ins and outs of Umbraco, maybe you prefer a more traditional tutorial or detailed technical documentation.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1047/9027509991_ff12bd87e4_b_small_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "97df8f64-dc98-40a9-e5f3-ac065983d6bd"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Create a basic website in Umbraco</h1>\n<p style=\"text-align: center;\">At Our Umbraco you’ll find both and we definitely recommend reading the guide on <a href=\"http://our.umbraco.org/documentation/Using-Umbraco/Creating-Basic-Site/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">creating a basic website in Umbraco</a><a href=\"#\" target=\"_blank\" title=\"Create a basic website in Umbraco\"><br /></a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "purple"
          },
          "id": "070e60ae-26d9-a277-5b04-97a52f73e34d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Sharpen those Razor skills</span></h2>\n<p dir=\"ltr\"><span>Umbraco uses Razor - a templating engine from Microsoft - as the main way to generate pages. If you’ve never used it before and in particular if you’ve never used ASP.NET before, It might seem a little daunting, but fear not. The template editor in the back office provides snippets and a Query Builder to get you up to speed.</span></p>\n<p dir=\"ltr\"><span>Once you know the basics, it’s also nice to know that there’s <a href=\"http://our.umbraco.org/projects/developer-tools/umbraco-v6-mvc-razor-cheatsheets/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">cheat sheets</a> covering the most common methods - ready to print out for office decoration.</span></p>\n<h2 dir=\"ltr\"><span>Extend with the API</span></h2>\n<p dir=\"ltr\"><span>If you want to extend Umbraco even further, you can use our .NET API to programmatically create Content, Media, Members and anything else that’s possible through the back office. For a quick start, <a href=\"http://umbraco.com/follow-us/blog-archive/2013/1/22/introducing-contentservice-aka-the-v6-api/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">you can follow this tutorial</a></span><span> and for full reference, don’t miss <a href=\"http://our.umbraco.org/documentation/reference/Management-v6/Services/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">the thorough documentation on Our</a>.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "16f56cd2-374c-8c6c-c91c-7d65b8b264cd"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1067,N'<TextPage id="1067" key="3e63c302-9a21-492f-840a-e67bc61a60a3" parentID="1064" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:59" nodeName="Masterclasses" urlName="masterclasses" path="-1,1063,1064,1067" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Masterclasses",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">The best and fastest way to learn Umbraco is through the official Master classes that are running every month in most regions.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1022/9686845888_e2d216ce81_b_dark_small.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2d34e33a-a1ef-04d5-9445-e1f1633bc362"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h3 style=\"text-align: center;\">The masterclasses are ran by either the Umbraco HQ or by the most experienced community heroes and use thoroughly tested materials to ensure you’ll return as a fully skilled Umbraco craftsperson.</h3>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "blue"
          },
          "id": "5312fa7b-3d5c-e9c0-4d0c-f6ae5d73e168"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Get it right from the beginning</span></h2>\n<p dir=\"ltr\"><span>While Umbraco is a simple tool, it’s important that you use it the right way. The Level 1 master class is designed to make sure that any Web Developer - also with no previous ASP.NET knowledge - can create advanced multi-lingual sites by the end of the course.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Become an expert</span></h2>\n<p dir=\"ltr\"><span>Once you know the basics, you can step up your game by attending the Level 2 master class. While the first masterclass is focused on implementing a site, this Masterclass will teach you how the .net APIs work and how to integrate and extend Umbraco. Whether that’s creating content programmatically or integrating a third party e-commerce engine or CRM.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Worth the investment</span></h2>\n<p dir=\"ltr\"><span>All attendees at the official Umbraco Masterclasses receive a certification which is the best way to make yourself noticed in the Umbraco ecosystem. So whether you’re looking to move up in the ranks of your company or are a free agent, you shouldn’t be doing Umbraco without becoming certified. The investment will come back many times, so make sure to <a href=\"http://umbraco.com/products/training/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\" target=\"_blank\" title=\"Masterclasses\">keep an eye out for a Masterclass near you</a>.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "a3ddf743-1622-7eec-6ea4-08caef854559"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1068,N'<LandingPage id="1068" key="cdc7aee4-f00b-48ea-bc57-00729599c773" parentID="1063" level="2" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Explore" urlName="explore" path="-1,1063,1068" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1069,N'<TextPage id="1069" key="15fce72e-cfba-432f-9956-04041058db0d" parentID="1068" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Our Umbraco" urlName="our-umbraco" path="-1,1063,1068,1069" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Sharing is caring",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">Our Umbraco is our community hub, bringing together over a hundred thousand people every month sharing knowledge in the forum, documentation, blogs, packages and much more.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1048/sharingiscaring_cropped.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0efee164-ea45-3657-66c2-04db5cbdcd37"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>Get help</h2>\n<p>If you’re stuck in your Umbraco project, the friendly forum is the place to visit. We take pride in keeping a friendly atmosphere in our forums despite the rapid growth of the project, so remember that the easier and friendlier you ask the more likely you are to get a quality reply.</p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Karma<br /></span></h2>\n<p dir=\"ltr\">On “Our” we have a virtual currency called “Karma” - think of it as likes worth counting. When you give people help, they can appreciate this by giving you a virtual high five. In addition to the joy of knowing that your help meant something, you also get karma points and while money doesn’t buy you happiness, a little bit of karma can. </p>\n<p dir=\"ltr\"><span>In other words, don’t forget to say thanks - it doesn’t cost you anything!</span></p>\n<p dir=\"ltr\"> </p>\n<h2 dir=\"ltr\"><span>Give back<br /></span></h2>\n<p dir=\"ltr\">Once you’ve become better at Umbraco, remember to set aside a little bit of time to be the help you got. It’ll keep the snowball effect rolling and by pulling together as a community, it doesn’t take much effort from everybody to make Umbraco community the best in the industry when it comes to get a fast and friendly quality response.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "0e64a81c-519d-ed35-7e28-35e2d441a044"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.54,
                      "top": 0.34082397003745318
                    },
                    "id": 1130,
                    "image": "/media/1049/9027510123_92a91b5cf4_b_dark.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "1efceb16-6a36-e18b-905a-b372c3d8b5e1"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1070,N'<TextPage id="1070" key="a0fa7372-fc4a-495b-bb51-0306a7342392" parentID="1068" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Codegarden" urlName="codegarden" path="-1,1063,1068,1070" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "CodeGarden",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>Every year in June, around 500 Umbracians gather in Denmark for our annual conference “CodeGarden”.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1014/9017002308_81dfd2c1d5_b_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d851bdc5-cb0c-e982-a1aa-f1cdda3e39c0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Well, it used to be a conference</span></h2>\n<p dir=\"ltr\"><span>but today we like to think of it more as a “festival”. Lasting three days from early mornings to late evenings, it’s packed with a combination of learning everything about Umbraco to the who’s who in the community in a laid back atmosphere where you’ll feel at home.</span></p>\n<h2 dir=\"ltr\"><span>Great sessions</span></h2>\n<p dir=\"ltr\"><span>At Umbraco you’ll find sessions that’ll take your skills to the next level. From large-scale implementation to highly specialized sites, you really shouldn’t miss out on the opportunity to learn from those who have come before you.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "afbe6cbd-a903-1c91-4d7e-fafa73515de6"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5056179775280899
                    },
                    "id": 1123,
                    "image": "/media/1015/14257753719_2c02b94030_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1015%2F14257753719_2c02b94030_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "4bbedf99-360e-905c-2bd3-71b458ab4647"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "In raw numbers, Codegarden is: 500+ attendees, 3 packed days, 20+ sessions, 26 passionate speakers, 3 workshops, 1 keynote, a hack room, 2 rounds of bingo and 3563 cups of fair trade coffee",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "6bfba7ba-f732-8193-3d38-2980e262142d"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Influence the project</span></h2>\n<p dir=\"ltr\"><span>Aside from the regular sessions and workshops CodeGarden also provides a unique approach to conferencing. It is called Open Space Technology and is all about networking, problem solving. This means you are not just limited to the scheduled topics but can put your own passions on the agenda and influence the future of the project.</span></p>\n<h2 dir=\"ltr\"><span>Loads of fun</span></h2>\n<p dir=\"ltr\"><span>In the community we value having a great time, so CodeGarden evenings are packed with social events. From canal tours of Copenhagen (with free beer and champagne) to evening parties and the infamous Umbraco bingo and dinner which can’t be described in words.</span></p>\n<h2 dir=\"ltr\"><span>Get your ticket</span></h2>\n<p><span>CodeGarden always ends up selling out, so make sure to reserve your ticket. The earlier you order the cheaper it is and if you’re on a stretch budget there’s a big chance that a friendly local Umbracian will have a couch to spare.<br /></span></p>\n<p><span><a href=\"http://umbraco.com/cg15/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Buy ticket for Codegarden</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "edebcf94-a4b1-fec5-5bc6-f8f677b03b16"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.605,
                      "top": 0.33333333333333331
                    },
                    "id": 1124,
                    "image": "/media/1016/14435759945_a2c58e9ed6_h.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1016%2F14435759945_a2c58e9ed6_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "96ec2067-0a50-459a-4d95-714b5b8ac4b6"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1071,N'<TextPage id="1071" key="bc662a34-ab76-44f1-84c9-1d38abae8ccb" parentID="1068" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:59" nodeName="Meetup groups" urlName="meetup-groups" path="-1,1063,1068,1071" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Born global, loving local",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">If you can’t make it to CodeGarden, that doesn’t mean you have to miss the chance of hanging out with the Umbraco community and finally - if you can’t come to the community, why not have the community come to you by starting a local user group?</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1017/14359779226_df7329d607_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "3dd3ea61-c394-5ce1-91d8-93f4a41b0dc0"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco Meetups</span></h2>\n<p dir=\"ltr\"><span>From London to New York, from Denmark in the north to Australia in the south - there’s local Umbraco User groups all over the world that <a href=\"http://our.umbraco.org/events/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">arrange regular meetups</a>. The format is usually a laid back atmosphere where people share their knowledge and new people are always welcome. So make sure to <a href=\"http://umbraco.meetup.com/\">check out Meetup.com for a local group</a> and if you’re not lucky, why not start one - it’s not that hard.</span></p>\n<p> </p>\n<h2 dir=\"ltr\"><span>Local Festivals</span></h2>\n<p dir=\"ltr\"><span>Inspired by CodeGarden, there’s more and more annual local Umbraco events. Originated from the community in the United Kingdom, there’s “Umbraco Festivals” going on in many countries around the world. These are one day events packed with sessions that often combine advanced Umbraco topics with discussing how local awareness can be improved. And as they are driven by the community and often sponsored by local Umbraco partners, they’re usually very inexpensive events to attend.</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "3f2b5540-7c52-4631-3877-6be5f61f6a12"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49583333333333335,
                      "top": 0.53
                    },
                    "id": 1126,
                    "image": "/media/1018/10818851674_e375a8751e_b.jpg",
                    "thumbnail": "/umbraco/backoffice/UmbracoApi/Images/GetBigThumbnail?originalImagePath=%2Fmedia%2F1018%2F10818851674_e375a8751e_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "102d5bec-3fb5-4d1a-cd9f-2baeeb5cdc44"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1072,N'<LandingPage id="1072" key="54a6c4f4-457a-4c92-ba64-2518af8b0b7b" parentID="1063" level="2" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Extend" urlName="extend" path="-1,1063,1072" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>0</umbracoNaviHide></LandingPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1073,N'<TextPage id="1073" key="9d423274-dedc-498e-b535-9809922ba1af" parentID="1072" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Umbraco Forms" urlName="umbraco-forms" path="-1,1063,1072,1073" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Umbraco forms",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">With our add-on product Umbraco Forms it’s a breeze to create anything from simple contact forms to advanced questionnaires.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1023/form-bg.png)"
          },
          "config": {
            "class": "light"
          },
          "id": "0a170745-ecbd-f642-0e5c-8475e6fae812"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">You won''t need to write a single line of code.</h1>\n<p style=\"text-align: center;\">Instead, you can create, edit and administer your form via a user interface that is a fully integrated part of Umbraco.</p>\n<p style=\"text-align: center;\"> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "<iframe src=\"//player.vimeo.com/video/110229004\" width=\"360\" height=\"203\" frameborder=\"0\" title=\"Form installer intro\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>",
                  "editor": {
                    "name": "Embed",
                    "alias": "embed",
                    "view": "embed",
                    "render": "/App_Plugins/Grid/Editors/Render/embed_videowrapper.cshtml",
                    "icon": "icon-movie-alt"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "17022257-5f35-360f-8cec-f574221fc457"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h1>Why does Umbraco Forms cost money?</h1>\n<p>At the Umbraco HQ we employ 15 full-time employees to ensure that the core is of the highest quality and constantly evolves. As we believe in keeping great ideas sustainable, we’ve never taken outside investment, but solely rely on income from products that enhance - but don’t limit - the open source core. We believe this is the best, long term solution and we hope you agree.</p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "190b7767-6b42-cd23-1d01-ad7e2ff24a6d"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1074,N'<TextPage id="1074" key="02602f14-4456-47af-98bd-20c08be5e34e" parentID="1072" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Package repository" urlName="package-repository" path="-1,1063,1072,1074" isDoc="" nodeType="1062" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="TextPage"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Package repository",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\"><span>At Our Umbraco you’ll find hundreds of free packages made and maintained by the community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1024/14448232381_8f994d2adc_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "0fc8f95c-1db8-6d29-788c-58a23c47634a"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Swim in the ocean of packages</span></h2>\n<p dir=\"ltr\"><span>From complete e-commerce platforms to integration with 3rd party services such as MailChimp and YouTube to developer tools that’ll boost your productivity.</span></p>\n<p dir=\"ltr\"><span>While you can download the packages on Our, you can also browse and install them directly from within the backoffice - called the “Package Repository” (yes, we should find a sexier name!). Those packages are filtered to ensure they’ll work with your Umbraco installation (based on version) and only packages that have been approved by at least 15 community people make the cut.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "9bc7883d-fd02-84d2-a790-9e0174b22e77"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "If you like the package, make sure to give it a high five.",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "yellow"
          },
          "id": "a01e8642-d4a9-30d4-d8ef-ae31a0f7f83e"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1120,
                    "image": "/media/1038/screen-shot-2014-12-01-at-121327.png",
                    "paragraph": "Once you’ve installed a package, make sure to give feedback. Whether the install was successful or not, it’ll help the next person trying to give it a go. At Our Umbraco you can report compatibility with a few simple clicks.",
                    "headline": "Give feedback"
                  },
                  "editor": {
                    "name": "Image w/ text right",
                    "alias": "media_text_right",
                    "view": "/App_Plugins/Grid/Editors/Views/media_with_description.html",
                    "render": "/App_Plugins/Grid/Editors/Render/media_text_right.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "96916694-116a-637c-2319-a5b077e80bd9"
        }
      ]
    }
  ]
}]]></content></TextPage>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1075,N'<BlogPostRepository id="1075" key="0d54a134-624c-4fd8-91e3-555f87982c8b" parentID="1063" level="2" creatorID="0" sortOrder="3" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Blog" urlName="blog" path="-1,1063,1075" isDoc="" nodeType="1059" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1054" nodeTypeAlias="BlogPostRepository"><umbracoNaviHide>1</umbracoNaviHide></BlogPostRepository>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1076,N'<BlogPost id="1076" key="565c7d29-f394-411d-874b-c7f4c6d8d0e1" parentID="1075" level="3" creatorID="0" sortOrder="0" createDate="2016-12-28T07:40:57" updateDate="2016-12-28T07:40:58" nodeName="Tall trees have deep roots" urlName="tall-trees-have-deep-roots" path="-1,1063,1075,1076" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\" dir=\"ltr\"><span>Tall trees have deep roots</span></h1>\n<h5 style=\"text-align: center;\" dir=\"ltr\"><span>You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.</span></h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1028/14435732345_c9f5b48dfa_h_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "2bd04b6a-0561-05c8-aa48-7ee47fde287f"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>The origins of the roots</span></h2>\n<p dir=\"ltr\"><span>date back to 2003 where the first version of Umbraco saw its light. Back then nobody could predict what it would become and especially not Niels Hartvig who simply designed and built Umbraco as a tool to quickly produce sites for his freelance clients and make sure they had a user-friendly way of updating it.</span></p>\n<p dir=\"ltr\"><span>But in 2004 he decided to open source the work and with help of friends Kasper Bumbech and Anders Pollas with whom he shared office space, the first version of Umbraco as open source saw the light of the day on February 16th 2005.</span></p>\n<p><span>In the early days, the community was purely virtual and since it was the days before Facebook and Twitter, the early adopters communicated through a Yahoo Mailinglist. From the seeds of talking Umbraco via email, the idea of an Umbraco conference surfaced and in March 2005, <a href=\"https://groups.yahoo.com/neo/groups/umbraco/conversations/messages/195\" target=\"_blank\" title=\"Codegarden was born\">CodeGarden was born…</a></span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "7a2e4652-8523-3ade-053d-f7873c9c8020"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1108,
                    "image": "/media/1027/14434411872_8e663d6de0_h.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "5fc9f47f-3ac1-4627-df26-2922b584e288"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Since v1 of CodeGarden in 2005</span></h2>\n<p dir=\"ltr\"><span>thousands of people have attended what is considered a must experience event for any “Umbracian”; it’s where everything Umbraco comes to life. From seeing the latest progress, sharing knowledge with fellow community members, having memorable times in the wonderful city of Copenhagen and returning energized with new knowledge and inspiration.</span></p>\n<p dir=\"ltr\"><span>But more than anything, it’s the special vibe that has always been a keystone in everything that surrounds Umbraco. As coined by Hudson Maul back in 2006 - it’s “The Friendly CMS”.</span></p>\n<h2 dir=\"ltr\"><br /><br /></h2>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "84b00350-7168-7858-0b37-e452f05d7664"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[You may think of Umbraco solely as the piece of software that runs the website you’re currently viewing. But like impressive trees, it would be nothing without the roots that bring it to life - and in the case of Umbraco, it’s our community.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1077,N'<BlogPost id="1077" key="3da29b01-22f4-4425-86b8-a4b9f810e92e" parentID="1075" level="3" creatorID="0" sortOrder="1" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Different Flowers Make a Bouquet" urlName="different-flowers-make-a-bouquet" path="-1,1063,1075,1077" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Banner",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "rte",
                "banner_headline",
                "headline",
                "abstract",
                "paragraph",
                "quote"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: center;\">Different Flowers Make a Bouquet</h1>\n<h5 style=\"text-align: center;\">It may only take two to tango, but a party worth remembering is a completely different story.</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1031/9026528992_d38fbc2e28_o_dark.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "63d1f52a-a6be-2459-a337-22f97cdb15bb"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h2 dir=\"ltr\"><span>Umbraco is a huge family </span></h2>\n<p dir=\"ltr\"><span>including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.</span></p>\n<p dir=\"ltr\"><span>Without diversity, status quo becomes king. At Umbraco we don’t believe in the status quo. We believe it’s the sum of our differences - whether designer, developer or editor, whether nationality, religion or gender, heck, whether Apple or PC - that it’s the nutrition for moving forward.</span></p>\n<p dir=\"ltr\"><span>When you open your eyes for the qualities in other people, you open up an astounding opportunity to learn. Our world - and our differences - is a buffet of eye-opening knowledge just waiting for you. So make sure to treat everyone friendly and with the highest respect. Don''t be the judge.</span></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "light"
          },
          "id": "8e82e5c1-8583-3d32-2742-c02b96060643"
        },
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.5,
                      "top": 0.5
                    },
                    "id": 1113,
                    "image": "/media/1032/9039247947_e15a9d8850_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide",
                    "alias": "media_wide",
                    "view": "media",
                    "render": "/App_Plugins/Grid/Editors/Render/media_wide.cshtml",
                    "icon": "icon-picture"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "d8ceaabf-535b-16db-e4ae-522fc0555846"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[It may only take two to tango, but a party worth remembering is a completely different story. Including its share of drunk uncles, scary mothers in-law, supercilious grandfathers and loud kids. Yet, while some may prefer sticking to their own class, it’s exactly the diversity that makes us great.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1078,N'<BlogPost id="1078" key="a84479f5-6a02-4a99-ad7b-1bd786c6077d" parentID="1075" level="3" creatorID="0" sortOrder="2" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Only the curious have something to find" urlName="only-the-curious-have-something-to-find" path="-1,1063,1075,1078" isDoc="" nodeType="1058" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1055" nodeTypeAlias="BlogPost"><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide_cropped",
                "media_wide"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.49514563106796117,
                      "top": 0.19
                    },
                    "id": 1115,
                    "image": "/media/1033/whole-earth-catalog.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full"
          },
          "id": "ec390b52-0259-8b7f-fc86-56374ea6ca63"
        },
        {
          "name": "Article full width",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_text_right",
                "headline",
                "abstract",
                "paragraph",
                "quote",
                "media",
                "code",
                "rte",
                "embed",
                "headline_centered"
              ],
              "controls": [
                {
                  "value": "<h1 style=\"text-align: left;\" dir=\"ltr\"><span>Only the curious have something to find</span></h1>\n<p>A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.</p>\n<p dir=\"ltr\"><span>Yet, we all dream about - and need - a little adventure every now and then. At the Umbraco community we praise those who dare to play and take risks. At the many Umbraco events around the world, brave people share their ideas through opinionated talks and at Our Umbraco courageous coders share their packages that extend the feature set of Umbraco.</span></p>\n<p dir=\"ltr\"><span>You should as well. After all, what do you </span><span>really</span><span> have to lose? Nothing compared to what you have to gain: becoming a better craftsperson, inspiring others and the satisfaction of seeing the download number of your work increase week after week. If we don’t strive for moving forward - whether professionals or amateurs - then what’s the point?</span></p>\n<p> </p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                },
                {
                  "value": "“Once you stop learning, you start dying”\n- Albert Einstein",
                  "editor": {
                    "name": "Quote",
                    "alias": "quote",
                    "view": "textstring",
                    "icon": "icon-quote",
                    "config": {
                      "style": "border-left: 3px solid #ccc; padding: 10px; color: #ccc; font-family: serif; font-variant: italic; font-size: 18px",
                      "markup": "<blockquote>#value#</blockquote>"
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "bdc66e02-87e6-7aa6-34a8-c0e5f834af79"
        }
      ]
    }
  ]
}]]></content><introduction><![CDATA[A Danish comedy duo once said that “adults are just kids gone insane” and maybe it’s not all wrong. Somewhere between the confused teenage years and growing up as responsible adults we do tend to go a little mad. We forget to play, to experiment, to risk.]]></introduction></BlogPost>');
GO
INSERT INTO [cmsContentXml] ([nodeId],[xml]) VALUES (
1079,N'<LandingPage id="1079" key="dfc7d719-a34e-42b9-a46f-d93e36e50597" parentID="1063" level="2" creatorID="0" sortOrder="4" createDate="2016-12-28T07:40:58" updateDate="2016-12-28T07:40:58" nodeName="Contact" urlName="contact" path="-1,1063,1079" isDoc="" nodeType="1061" creatorName="Bobydo Inc." writerName="Bobydo Inc." writerID="0" template="1057" nodeTypeAlias="LandingPage"><umbracoNaviHide>1</umbracoNaviHide><content><![CDATA[{
  "name": "1 column layout",
  "sections": [
    {
      "grid": 12,
      "rows": [
        {
          "name": "Image w. text",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "banner_headline",
                "rte",
                "quote"
              ],
              "controls": [
                {
                  "value": "Contact",
                  "editor": {
                    "name": "Banner Headline",
                    "alias": "banner_headline",
                    "view": "textstring",
                    "icon": "icon-coin",
                    "config": {
                      "style": "font-size: 36px; line-height: 45px; font-weight: bold; text-align:center",
                      "markup": "<h1 style=''font-size:62px;text-align:center''>#value#</h1>"
                    }
                  }
                },
                {
                  "value": "<h5 style=\"text-align: center;\">From volunteers to experts to core team. You can reach us all and we''re a friendly bunch that love to talk Umbraco</h5>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {
            "background-image": "url(/media/1036/1912289_753997844648209_7099291360101379579_o.jpg)"
          },
          "config": {
            "class": "dark"
          },
          "id": "d827c464-3074-0ddf-f57f-0fdc73a7c1ea"
        },
        {
          "name": "Article Wide",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "headline",
                "abstract",
                "code",
                "quote",
                "embed",
                "media",
                "media_text_right",
                "rte",
                "paragraph"
              ],
              "controls": [
                {
                  "value": "<h2>The forum</h2>\n<p>For questions on how to use Umbraco, the forum section on Our Umbraco is the best place to start.</p>\n<p><a href=\"http://our.umbraco.org/forum/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Go to the forum →</a></p>\n<p> </p>\n<h2>Getting help</h2>\n<p>For getting help with implementing Umbraco, look at our list of Certified Umbraco partners</p>\n<p><a href=\"http://umbraco.com/certified-partners/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">List of Certified Umbraco Partners →</a></p>\n<p> </p>\n<h2><span>Get in touch</span></h2>\n<p><span>For enquiries on professional support and bug fixing warranty, get in touch with the Umbraco HQ</span></p>\n<p><a href=\"http://umbraco.com/contact/?utm_source=core&amp;utm_medium=starterkit&amp;utm_content=topic-link&amp;utm_campaign=fanoe\">Umbraco HQ →</a></p>",
                  "editor": {
                    "name": "Rich text editor",
                    "alias": "rte",
                    "view": "rte",
                    "icon": "icon-article"
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "dark"
          },
          "id": "0ac7fdc7-fd78-c735-33a3-7bc4c335f978"
        },
        {
          "name": "Wide image",
          "areas": [
            {
              "grid": 12,
              "allowAll": false,
              "allowed": [
                "media_wide",
                "media_wide_cropped"
              ],
              "controls": [
                {
                  "value": {
                    "focalPoint": {
                      "left": 0.4825,
                      "top": 0.6067415730337079
                    },
                    "id": 1119,
                    "image": "/media/1037/9015601712_72e44263e4_b.jpg"
                  },
                  "editor": {
                    "name": "Image wide cropped",
                    "alias": "media_wide_cropped",
                    "view": "media",
                    "render": "media",
                    "icon": "icon-picture",
                    "config": {
                      "size": {
                        "width": 1920,
                        "height": 700
                      }
                    }
                  }
                }
              ]
            }
          ],
          "styles": {},
          "config": {
            "class": "full triangle"
          },
          "id": "9e6631ec-ae55-1949-94ae-dc232e421489"
        }
      ]
    }
  ]
}]]></content></LandingPage>');
GO
SET IDENTITY_INSERT [cmsContentVersion] ON;
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
1,1063,'2edf7d1f-55e5-4a4e-8b52-0ba77a233d94',{ts '2016-12-28 07:40:57.687'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
2,1064,'2e8f2dc5-4109-457d-ae25-7d9f01a0ede0',{ts '2016-12-28 07:40:57.840'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
3,1065,'cb0d0dd6-72d9-4894-8c84-ac222ece835e',{ts '2016-12-28 07:40:57.857'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
4,1066,'0e82a0cb-1f42-455e-9a80-ba571ef20f17',{ts '2016-12-28 07:40:57.857'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
5,1067,'cea910db-8bc4-4d98-bd3b-d861465d3225',{ts '2016-12-28 07:40:57.870'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
6,1068,'cb8282ec-917d-4cf5-9ac4-39758b2c8320',{ts '2016-12-28 07:40:57.887'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
7,1069,'5c026a55-84ea-4efa-9db3-4905ddb73c58',{ts '2016-12-28 07:40:57.907'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
8,1070,'bf94e949-6f17-4e23-ba65-582c61b74711',{ts '2016-12-28 07:40:57.907'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
9,1071,'ddd9a5df-bd5b-4d2b-9f06-da7d5c2f91dd',{ts '2016-12-28 07:40:57.923'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
10,1072,'e8efcb32-efa4-45dd-8233-caec365b6467',{ts '2016-12-28 07:40:57.940'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
11,1073,'a9d5aa8f-e863-414a-b63a-39ce37965a9c',{ts '2016-12-28 07:40:57.957'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
12,1074,'eff37eb1-b7bd-481e-85a4-73fd0e8d30b3',{ts '2016-12-28 07:40:57.970'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
13,1075,'7ed491d9-94c8-41fd-a8eb-aa3ef04dea1c',{ts '2016-12-28 07:40:57.987'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
14,1076,'af9e4828-2b89-4e06-8e6a-9073b95a3460',{ts '2016-12-28 07:40:57.987'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
15,1077,'11239355-cb8b-40d7-b511-3ca7ff056fe1',{ts '2016-12-28 07:40:58.007'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
16,1078,'0ce27371-c73f-44e2-8174-b410afd8c695',{ts '2016-12-28 07:40:58.023'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
17,1079,'020a002d-9c22-4cae-82d9-7422be6f63bb',{ts '2016-12-28 07:40:58.040'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
18,1063,'1dbee246-81d6-4e4b-ba75-8a963e260a87',{ts '2016-12-28 07:40:58.770'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
19,1064,'fe7ad66f-dfd0-4052-a675-0ae5ac561533',{ts '2016-12-28 07:40:58.810'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
20,1068,'a26b139e-96f9-4c4a-a31c-057a508cbb0d',{ts '2016-12-28 07:40:58.823'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
21,1072,'988cfa1f-e59a-4543-adc7-d193cce93a4b',{ts '2016-12-28 07:40:58.840'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
22,1075,'3029dcb8-17fc-4ab1-ba07-931cff9256b3',{ts '2016-12-28 07:40:58.857'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
23,1079,'469891c5-f454-4bc2-b2ee-15775428e107',{ts '2016-12-28 07:40:58.857'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
24,1076,'505f8c8d-5ff0-4fe8-a522-68ade6de5ea1',{ts '2016-12-28 07:40:58.870'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
25,1073,'de23a7b8-c88d-411a-b7b5-425019f88444',{ts '2016-12-28 07:40:58.887'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
26,1069,'0d69c07e-5813-4a5f-830c-ceeaf5411609',{ts '2016-12-28 07:40:58.910'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
27,1065,'a58f40c3-4bb2-4564-be8d-aef064a3fb79',{ts '2016-12-28 07:40:58.910'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
28,1077,'66285052-e56c-405c-9263-ecad779f7b9b',{ts '2016-12-28 07:40:58.927'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
29,1074,'3a8718c8-2582-47f1-a1f7-eb27ad441ca8',{ts '2016-12-28 07:40:58.940'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
30,1070,'215123ee-9e67-4233-9994-ccfcc71d88a2',{ts '2016-12-28 07:40:58.957'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
31,1066,'cd256c99-82c7-414b-b1ea-e781c3c61272',{ts '2016-12-28 07:40:58.973'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
32,1078,'ae4753ea-820d-496b-b600-72d5b3ad71cf',{ts '2016-12-28 07:40:58.987'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
33,1071,'583264a2-7971-42df-9938-77f65fd58383',{ts '2016-12-28 07:40:59.003'});
GO
INSERT INTO [cmsContentVersion] ([id],[ContentId],[VersionId],[VersionDate]) VALUES (
34,1067,'702a6fe5-a3d5-451b-86fc-632b15e2bdb8',{ts '2016-12-28 07:40:59.010'});
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1031,1033,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1059,1058,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1060,1061,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (
1061,1062,0);
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
531,1044,N'Member',N'icon-user',N'icon-user',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
532,1031,N'Folder',N'icon-folder',N'icon-folder',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
533,1032,N'Image',N'icon-picture',N'icon-picture',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
534,1033,N'File',N'icon-document',N'icon-document',NULL,0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
535,1058,N'BlogPost',N'icon-edit',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
536,1059,N'BlogPostRepository',N'.sprTreeFolder',N'folder.png',N'',1,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
537,1060,N'Home',N'icon-home',N'folder.png',N'',0,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
538,1061,N'LandingPage',N'icon-stamp',N'folder.png',N'',0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (
539,1062,N'TextPage',N'icon-document',N'folder.png',N'',0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
SET IDENTITY_INSERT [cmsContent] ON;
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
1,1063,1060);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
2,1064,1061);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
3,1065,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
4,1066,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
5,1067,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
6,1068,1061);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
7,1069,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
8,1070,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
9,1071,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
10,1072,1061);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
11,1073,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
12,1074,1062);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
13,1075,1059);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
14,1076,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
15,1077,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
16,1078,1058);
GO
INSERT INTO [cmsContent] ([pk],[nodeId],[contentType]) VALUES (
17,1079,1061);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
ALTER TABLE [umbracoUserType] ADD CONSTRAINT [PK_umbracoUserType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [PK_user2app] PRIMARY KEY ([user],[app]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY ([userId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoMigration] ADD CONSTRAINT [PK_umbracoMigration] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoExternalLogin] ADD CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_umbracoDomains] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDeployChecksum] ADD CONSTRAINT [PK_umbracoDeployChecksum] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoDeployDependency] ADD CONSTRAINT [PK_umbracoDeployDependency] PRIMARY KEY ([sourceId],[targetId]);
GO
ALTER TABLE [umbracoCacheInstruction] ADD CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [PK_umbracoAccess] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[propertyTypeId],[tagId]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPreviewXml] ADD CONSTRAINT [PK_cmsContentPreviewXml] PRIMARY KEY ([nodeId],[versionId]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [IX_computerName] UNIQUE ([computerName]);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
ALTER TABLE [umbracoRedirectUrl] ADD CONSTRAINT [IX_umbracoRedirectUrl] UNIQUE ([urlHash],[contentKey],[createDateUtc]);
GO
CREATE INDEX [IX_umbracoNodeObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNodeParentId] ON [umbracoNode] ([parentID] ASC);
GO
CREATE INDEX [IX_umbracoNodeTrashed] ON [umbracoNode] ([trashed] ASC);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [IX_umbracoNodeUniqueID] UNIQUE ([uniqueID]);
GO
ALTER TABLE [umbracoMigration] ADD CONSTRAINT [IX_umbracoMigration] UNIQUE ([name],[version]);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [IX_umbracoLanguage_languageISOCode] UNIQUE ([languageISOCode]);
GO
ALTER TABLE [umbracoDeployChecksum] ADD CONSTRAINT [IX_umbracoDeployChecksum] UNIQUE ([entityType],[entityGuid],[entityPath]);
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [IX_umbracoAccess_nodeId] UNIQUE ([nodeId]);
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [IX_umbracoAccessRule] UNIQUE ([ruleValue],[ruleType],[accessId]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [IX_cmsTemplate_nodeId] UNIQUE ([nodeId]);
GO
CREATE INDEX [IX_cmsTaskType_alias] ON [cmsTaskType] ([alias] ASC);
GO
CREATE INDEX [IX_cmsTags] ON [cmsTags] ([tag] ASC,[group] ASC);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [IX_cmsPropertyTypeGroupUniqueID] UNIQUE ([uniqueID]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [IX_cmsPropertyTypeUniqueID] UNIQUE ([UniqueID]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [IX_cmsPropertyData_1] UNIQUE ([contentNodeId],[versionId],[propertytypeid]);
GO
CREATE INDEX [IX_cmsPropertyData_2] ON [cmsPropertyData] ([versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_3] ON [cmsPropertyData] ([propertytypeid] ASC);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [IX_cmsMacroPropertyAlias] UNIQUE ([macroAlias]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [IX_cmsMacroProperty_Alias] UNIQUE ([macro],[macroPropertyAlias]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [IX_cmsDocument] UNIQUE ([nodeId],[versionId]);
GO
CREATE INDEX [IX_cmsDocument_newest] ON [cmsDocument] ([newest] ASC);
GO
CREATE INDEX [IX_cmsDocument_published] ON [cmsDocument] ([published] ASC);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [IX_cmsDictionary_id] UNIQUE ([id]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [IX_cmsDataType_nodeId] UNIQUE ([nodeId]);
GO
CREATE INDEX [IX_cmsContentVersion_ContentId] ON [cmsContentVersion] ([ContentId] ASC);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [IX_cmsContentVersion_VersionId] UNIQUE ([VersionId]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [IX_cmsContentType] UNIQUE ([nodeId]);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [IX_cmsContent] UNIQUE ([nodeId]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY ([userType]) REFERENCES [umbracoUserType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY ([user]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDeployDependency] ADD CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id1] FOREIGN KEY ([sourceId]) REFERENCES [umbracoDeployChecksum]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDeployDependency] ADD CONSTRAINT [FK_umbracoDeployDependency_umbracoDeployChecksum_id2] FOREIGN KEY ([targetId]) REFERENCES [umbracoDeployChecksum]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccess] ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoAccessRule] ADD CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY ([accessId]) REFERENCES [umbracoAccess]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY ([parentUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY ([ParentId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY ([propertyTypeId]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertytypeid]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY ([languageId]) REFERENCES [umbracoLanguage]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

