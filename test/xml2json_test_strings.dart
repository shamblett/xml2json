/*
 * Packge : xml2json
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/09/2013
 * Copyright :  S.Hamblett@OSCF
 */

/* General XML test Strings */

String rubbishXmlString = '<?xml 6666fsfsffsfsfsfsfsf>>>>>>> 9999999';

/* General testing XML strings from http://www.ibm.com/developerworks/library/x-xml2jsonphp */
String goodXmlString =
    '<?xml version="1.0" encoding="UTF-8"?><contacts><contact id="1"><name>John Doe</name><phone>123-"456"-7890</phone><address><street>123 JFKStreet</street><city>Any Town</city><state>Any State</state><zipCode>12345</zipCode></address></contact></contacts>';
String goodXmlStringJson =
    '{"contacts" : {"contact" : {"@attributes" : {"id" : "1"}, "name" : "John Doe", "phone" : "123-\\"456\\"-7890", "address" : {"street" : "123 JFK Street", "city" : "Any Town", "state" : "Any State", "zipCode" : "12345"}}}}';

/* CMIS Atom feed */
String cmisAtomXmlString =
    '<?xml version=\'1.0\' encoding=\'UTF-8\'?><app:service xmlns:app="http://www.w3.org/2007/app" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:cmis="http://docs.oasis-open.org/ns/cmis/core/200908/" xmlns:cmisra="http://docs.oasis-open.org/ns/cmis/restatom/200908/"><app:workspace><atom:title>bb212ecb-122d-47ea-b5c1-128affb9cd8f</atom:title><app:collection href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/children?id=workspace%3A%2F%2FSpacesStore%2F67f87d00-a2cd-4668-9644-d7a130435045"><cmisra:collectionType>root</cmisra:collectionType><atom:title type="text">Root Collection</atom:title><app:accept>application/atom+xml;type=entry</app:accept><app:accept>application/cmisatom+xml</app:accept></app:collection><app:collection href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/types"><cmisra:collectionType>types</cmisra:collectionType><atom:title type="text">Types Collection</atom:title><app:accept></app:accept></app:collection><app:collection href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/query"><cmisra:collectionType>query</cmisra:collectionType><atom:title type="text">Query Collection</atom:title><app:accept>application/cmisquery+xml</app:accept></app:collection><app:collection href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/checkedout"><cmisra:collectionType>checkedout</cmisra:collectionType><atom:title type="text">Checked Out Collection</atom:title><app:accept>application/cmisatom+xml</app:accept></app:collection><app:collection href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/unfiled"><cmisra:collectionType>unfiled</cmisra:collectionType><atom:title type="text">Unfiled Collection</atom:title><app:accept>application/cmisatom+xml</app:accept></app:collection><cmisra:repositoryInfo xmlns:ns3="http://docs.oasis-open.org/ns/cmis/messaging/200908/"><cmis:repositoryId>bb212ecb-122d-47ea-b5c1-128affb9cd8f</cmis:repositoryId><cmis:repositoryName>Main Repository</cmis:repositoryName><cmis:repositoryDescription>Main Repository</cmis:repositoryDescription><cmis:vendorName>Alfresco</cmis:vendorName><cmis:productName>Alfresco Repository (contentUrl=|mimetype=|size=0|encoding=|locale=en_US_|id=120)</cmis:productName><cmis:productVersion>4.2.0 (@build-number@)</cmis:productVersion><cmis:rootFolderId>workspace://SpacesStore/67f87d00-a2cd-4668-9644-d7a130435045</cmis:rootFolderId><cmis:capabilities><cmis:capabilityACL>manage</cmis:capabilityACL><cmis:capabilityAllVersionsSearchable>false</cmis:capabilityAllVersionsSearchable><cmis:capabilityChanges>none</cmis:capabilityChanges><cmis:capabilityContentStreamUpdatability>anytime</cmis:capabilityContentStreamUpdatability><cmis:capabilityGetDescendants>true</cmis:capabilityGetDescendants><cmis:capabilityGetFolderTree>true</cmis:capabilityGetFolderTree><cmis:capabilityMultifiling>true</cmis:capabilityMultifiling><cmis:capabilityPWCSearchable>false</cmis:capabilityPWCSearchable><cmis:capabilityPWCUpdatable>true</cmis:capabilityPWCUpdatable><cmis:capabilityQuery>bothcombined</cmis:capabilityQuery><cmis:capabilityRenditions>read</cmis:capabilityRenditions><cmis:capabilityUnfiling>false</cmis:capabilityUnfiling><cmis:capabilityVersionSpecificFiling>false</cmis:capabilityVersionSpecificFiling><cmis:capabilityJoin>none</cmis:capabilityJoin></cmis:capabilities><cmis:aclCapability><cmis:supportedPermissions>both</cmis:supportedPermissions><cmis:propagation>propagate</cmis:propagation><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}cmobject.Coordinator</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}cmobject.Coordinator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}cmobject.Collaborator</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}cmobject.Collaborator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}folder.Collaborator</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}folder.Collaborator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/site/1.0}site.SiteManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/site/1.0}site.SiteManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.CreateAssociations</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.CreateAssociations</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.FullControl</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.FullControl</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}content.Editor</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}content.Editor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Write</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.Write</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}folder.Contributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}folder.Contributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteAssociations</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.DeleteAssociations</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}folder.Editor</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}folder.Editor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.LinkChildren</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.LinkChildren</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}folder.Consumer</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}folder.Consumer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/site/1.0}site.SiteContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/site/1.0}site.SiteContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/site/1.0}site.SiteConsumer</cmis:permission><cmis:description>{http://www.alfresco.org/model/site/1.0}site.SiteConsumer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}content.Collaborator</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}content.Collaborator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}content.Coordinator</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}content.Coordinator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.WriteProperties</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.WriteProperties</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadAssociations</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.ReadAssociations</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}cmobject.Editor</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}cmobject.Editor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ChangePermissions</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.ChangePermissions</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredcontent.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}content.Consumer</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}content.Consumer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadChildren</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.ReadChildren</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Read</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.Read</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentPublisher</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentPublisher</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadPermissions</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.ReadPermissions</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.CreateChildren</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.CreateChildren</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmlayeredfolder.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteChildren</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.DeleteChildren</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}cmobject.Consumer</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}cmobject.Consumer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.AddChildren</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.AddChildren</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}folder.Coordinator</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}folder.Coordinator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}cmobject.Contributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}cmobject.Contributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteNode</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.DeleteNode</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmfolder.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentContributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmappmodel/1.0}webfolder.ContentContributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Flatten</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.Flatten</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/content/1.0}content.Contributor</cmis:permission><cmis:description>{http://www.alfresco.org/model/content/1.0}content.Contributor</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplaincontent.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentManager</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmcontent.ContentManager</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentReviewer</cmis:permission><cmis:description>{http://www.alfresco.org/model/wcmmodel/1.0}avmplainfolder.ContentReviewer</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/site/1.0}site.SiteCollaborator</cmis:permission><cmis:description>{http://www.alfresco.org/model/site/1.0}site.SiteCollaborator</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Delete</cmis:permission><cmis:description>{http://www.alfresco.org/model/system/1.0}base.Delete</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>{http://www.alfresco.org/model/security/1.0}All.All</cmis:permission><cmis:description>{http://www.alfresco.org/model/security/1.0}All.All</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>cmis:read</cmis:permission><cmis:description>CMIS Read</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>cmis:write</cmis:permission><cmis:description>CMIS Write</cmis:description></cmis:permissions><cmis:permissions><cmis:permission>cmis:all</cmis:permission><cmis:description>CMIS All</cmis:description></cmis:permissions><cmis:mapping><cmis:key>canViewContent.Object</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadContent</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canDelete.Object</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteNode</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemoveFromFolder.Object</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteNode</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetAllVersions.VersionSeries</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddPolicy.Policy</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCreateFolder.Folder</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.CreateChildren</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemovePolicy.Object</cmis:key><cmis:permission>cmis:write</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetACL.Object</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadPermissions</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCreateDocument.Folder</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.CreateChildren</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canMove.Target</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.CreateChildren</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetProperties.Object</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canApplyACL.Object</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ChangePermissions</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddToFolder.Object</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canUpdateProperties.Object</cmis:key><cmis:permission>cmis:write</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.WriteProperties</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canRemovePolicy.Policy</cmis:key><cmis:permission>cmis:read</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetDescendents.Folder</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadChildren</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddToFolder.Folder</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.CreateChildren</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetChildren.Folder</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadChildren</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canSetContent.Document</cmis:key><cmis:permission>cmis:write</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.WriteContent</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCheckin.Document</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/content/1.0}lockable.CheckIn</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canAddPolicy.Object</cmis:key><cmis:permission>cmis:write</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.Write</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetParents.Folder</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetAppliedPolicies.Object</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canGetFolderParent.Object</cmis:key><cmis:permission>cmis:read</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.ReadProperties</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canDeleteTree.Folder</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteNode</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCheckout.Document</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/content/1.0}lockable.CheckOut</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canCancelCheckout.Document</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/content/1.0}lockable.CancelCheckOut</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canMove.Object</cmis:key><cmis:permission>cmis:all</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.DeleteNode</cmis:permission></cmis:mapping><cmis:mapping><cmis:key>canDeleteContent.Document</cmis:key><cmis:permission>cmis:write</cmis:permission><cmis:permission>{http://www.alfresco.org/model/system/1.0}base.WriteContent</cmis:permission></cmis:mapping></cmis:aclCapability><cmis:cmisVersionSupported>1.0</cmis:cmisVersionSupported><cmis:changesIncomplete>true</cmis:changesIncomplete><cmis:changesOnType>cmis:document</cmis:changesOnType><cmis:changesOnType>cmis:folder</cmis:changesOnType><cmis:principalAnonymous>guest</cmis:principalAnonymous><cmis:principalAnyone>GROUP_EVERYONE</cmis:principalAnyone></cmisra:repositoryInfo><atom:link rel="http://docs.oasis-open.org/ns/cmis/link/200908/typedescendants" href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/typedesc" type="application/atom+xml;type=feed" /><atom:link rel="http://docs.oasis-open.org/ns/cmis/link/200908/foldertree" href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/foldertree?id=workspace%3A%2F%2FSpacesStore%2F67f87d00-a2cd-4668-9644-d7a130435045" type="application/cmistree+xml" /><atom:link rel="http://docs.oasis-open.org/ns/cmis/link/200908/rootdescendants" href="http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/descendants?id=workspace%3A%2F%2FSpacesStore%2F67f87d00-a2cd-4668-9644-d7a130435045" type="application/cmistree+xml" cmisra:id="workspace://SpacesStore/67f87d00-a2cd-4668-9644-d7a130435045" /><cmisra:uritemplate><cmisra:template>http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/id?id={id}&amp;filter={filter}&amp;includeAllowableActions={includeAllowableActions}&amp;includeACL={includeACL}&amp;includePolicyIds={includePolicyIds}&amp;includeRelationships={includeRelationships}&amp;renditionFilter={renditionFilter}</cmisra:template><cmisra:type>objectbyid</cmisra:type><cmisra:mediatype>application/atom+xml;type=entry</cmisra:mediatype></cmisra:uritemplate><cmisra:uritemplate><cmisra:template>http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/path?path={path}&amp;filter={filter}&amp;includeAllowableActions={includeAllowableActions}&amp;includeACL={includeACL}&amp;includePolicyIds={includePolicyIds}&amp;includeRelationships={includeRelationships}&amp;renditionFilter={renditionFilter}</cmisra:template><cmisra:type>objectbypath</cmisra:type><cmisra:mediatype>application/atom+xml;type=entry</cmisra:mediatype></cmisra:uritemplate><cmisra:uritemplate><cmisra:template>http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/type?id={id}</cmisra:template><cmisra:type>typebyid</cmisra:type><cmisra:mediatype>application/atom+xml;type=entry</cmisra:mediatype></cmisra:uritemplate><cmisra:uritemplate><cmisra:template>http://cmis.alfresco.com/cmisatom/bb212ecb-122d-47ea-b5c1-128affb9cd8f/query?q={q}&amp;searchAllVersions={searchAllVersions}&amp;includeAllowableActions={includeAllowableActions}&amp;includeRelationships={includeRelationships}&amp;maxItems={maxItems}&amp;skipCount={skipCount}</cmisra:template><cmisra:type>query</cmisra:type><cmisra:mediatype>application/atom+xml;type=feed</cmisra:mediatype></cmisra:uritemplate></app:workspace></app:service>';

/* Transformer test string */
String complexXmlTestString =
    '<?xml-stylesheet type="text/xsl" href="xml2json.xslt"?>'
    '<reports xmlns="http://www.w3.org/2005/Atom" '
    'xmlns:georss="http://www.georss.org/georss">'
    '<![CDATA[This is cdata with "quotes"]]>'
    '<entry>'
    '<id>tag:open311.sfgov.org,2010-04-15:/dev/V1/reports/637619.xml</id>'
    '<title>A large tree branch is blocking the road</title>'
    '<updated>2010-04-13T18:30:02-05:00</updated>'
    '<link rel="self" href="http://open311.sfgov.org/dev/V1/reports/637619.xml"/>'
    '<author><name>John Doe</name></author>'
    '<georss:point>40.7111 -73.9565</georss:point>'
    '<category label="Damaged tree" term="tree-damage" scheme="https://open311.sfgov.org/dev/V1/categories/006.xml">006</category>'
    '<content type="xml" xmlns="http://open311.org/spec/georeport-v1">'
    '<report_id>637619</report_id>'
    '<address>1600 Market St, San Francisco, CA 94103</address>'
    '<description>A large tree branch is blocking the road</description>'
    '<status>created</status>'
    '<status_notes />'
    '<![CDATA[This is more cdata]]>'
    '<policy>The City will inspect and require the responsible party to correct within 24 hours  &/or issue a Correction Notice or Notice of Violation of the Public Works Code</policy>'
    '</content>'
    '</entry>'
    '<entry>'
    '<id>tag:open311.sfgov.org,2011-04-15:/dev/V1/reports/637620.xml</id>'
    '<title>A large tree branch is blocking the road</title>'
    '<updated>2010-04-13T18:30:02-05:00</updated>'
    '<link rel="self" href="http://open311.sfgov.org/dev/V1/reports/637620.xml"/>'
    '<author><name>John Doe</name></author>'
    '<georss:point>40.7111 -73.9565</georss:point>'
    '<category label="Damaged tree" term="tree-damage" scheme="https://open311.sfgov.org/dev/V1/categories/006.xml">006</category>'
    '<content type="xml" xmlns="http://open311.org/spec/georeport-v1">'
    '<report_id>637620</report_id>'
    '<address>56 Market St, San Francisco, CA 94103</address>'
    '<description>A large tree branch is blocking the road</description>'
    '<status>created</status>'
    '<status_notes />'
    '<policy>The City will inspect and require the responsible party to correct within 24 hours and/or issue a Correction Notice or Notice of Violation of the Public Works Code</policy>'
    '</content>'
    '</entry>'
    '<entry>'
    '<id>tag:open311.sfgov.org,2012-04-15:/dev/V1/reports/637621.xml</id>'
    '<title>A large tree branch is blocking the road</title>'
    '<updated>2010-04-13T18:30:02-05:00</updated>'
    '<link rel="self" href="http://open311.sfgov.org/dev/V1/reports/637621.xml"/>'
    '<author><name>John Doe</name></author>'
    '<georss:point>40.7111 -73.9565</georss:point>'
    '<category label="Damaged tree" term="tree-damage" scheme="https://open311.sfgov.org/dev/V1/categories/006.xml">006</category>'
    '<content type="xml" xmlns="http://open311.org/spec/georeport-v1">'
    '<report_id>637621</report_id>'
    '<address>1800 Market St, San Francisco, CA 94103</address>'
    '<description>A large tree branch is blocking the road</description>'
    '<status>created</status>'
    '<status_notes />'
    '<policy>The City will inspect and require the responsible party to correct within 24 hours and/or issue a Correction Notice or Notice of Violation of the Public Works Code</policy>'
    '</content>'
    '</entry>'
    '</reports>';

/* Badgerfish simple test check string */
String badgerfishSimpleJsonCheckString =
    '{ "contacts": { "contact": { "@id": "1", "name": { "\$": "John Doe" }, "phone": { "\$": "123-\\"456\\"-7890" }, "address": { "street": { "\$": "123 JFKStreet" }, "city": { "\$": "Any Town" }, "state": { "\$": "Any State" }, "zipCode": { "\$": "12345" } } } } }';

/* Badgerfish complex test check string from http://wiki.open311.org/index.php?title=JSON_and_XML_Conversion*/
String badgerfishComplexJsonCheckString =
    '{'
    '"reports": {'
    '"@xmlns": [{'
    '"\$": "http://www.w3.org/2005/Atom"},'
    '{"georss": "http://www.georss.org/georss"'
    '}],'
    '"__cdata" : "This is cdata with \\"quotes\\"",'
    '"entry": [{'
    '"id": {'
    '"\$": "tag:open311.sfgov.org,2010-04-15:/dev/V1/reports/637619.xml"'
    '},'
    '"title": {'
    '"\$": "A large tree branch is blocking the road"'
    '},'
    '"updated": {'
    '"\$": "2010-04-13T18:30:02-05:00"'
    '},'
    '"link": {'
    '"@rel": "self",'
    '"@href": "http://open311.sfgov.org/dev/V1/reports/637619.xml"'
    '},'
    '"author": {'
    '"name": {'
    '"\$": "John Doe"'
    '}'
    '},'
    '"georss:point": {'
    '"\$": "40.7111 -73.9565"'
    '},'
    '"category": {'
    '"@label": "Damaged tree",'
    '"@term": "tree-damage",'
    '"@scheme": "https://open311.sfgov.org/dev/V1/categories/006.xml",'
    '"\$": "006"'
    '},'
    '"content": {'
    '"@type": "xml",'
    '"@xmlns": [{'
    '"\$": "http://open311.org/spec/georeport-v1"'
    '}],'
    '"report_id": {'
    '"\$": "637619"'
    '},'
    '"address": {'
    '"\$": "1600 Market St, San Francisco, CA 94103"'
    '},'
    '"description": {'
    '"\$": "A large tree branch is blocking the road"'
    '},'
    '"status": {'
    '"\$": "created"'
    '},'
    '"status_notes": {},'
    '"__cdata" : "This is more cdata",'
    '"policy": {'
    '"\$": "The City will inspect and require the responsible party to correct within 24 hours &/or issue a Correction Notice or Notice of Violation of the Public Works Code"'
    '}'
    '}'
    '},'
    '{'
    '"id": {'
    '"\$": "tag:open311.sfgov.org,2011-04-15:/dev/V1/reports/637620.xml"'
    '},'
    '"title": {'
    '"\$": "A large tree branch is blocking the road"'
    '},'
    '"updated": {'
    '"\$": "2010-04-13T18:30:02-05:00"'
    '},'
    '"link": {'
    '"@rel": "self",'
    '"@href": "http://open311.sfgov.org/dev/V1/reports/637620.xml"'
    '},'
    '"author": {'
    '"name": {'
    '"\$": "John Doe"'
    '}'
    '},'
    '"georss:point": {'
    '"\$": "40.7111 -73.9565"'
    '},'
    '"category": {'
    '"@label": "Damaged tree",'
    '"@term": "tree-damage",'
    '"@scheme": "https://open311.sfgov.org/dev/V1/categories/006.xml",'
    '"\$": "006"'
    '},'
    '"content": {'
    '"@type": "xml",'
    '"@xmlns": [{'
    '"\$": "http://open311.org/spec/georeport-v1"'
    '}],'
    '"report_id": {'
    '"\$": "637620"'
    '},'
    '"address": {'
    '"\$": "56 Market St, San Francisco, CA 94103"'
    '},'
    '"description": {'
    '"\$": "A large tree branch is blocking the road"'
    '},'
    '"status": {'
    '"\$": "created"'
    '},'
    '"status_notes": {},'
    '"policy": {'
    '"\$": "The City will inspect and require the responsible party to correct within 24 hours and/or issue a Correction Notice or Notice of Violation of the Public Works Code"'
    '}'
    '}'
    '},'
    '{'
    '"id": {'
    '"\$": "tag:open311.sfgov.org,2012-04-15:/dev/V1/reports/637621.xml"'
    '},'
    '"title": {'
    '"\$": "A large tree branch is blocking the road"'
    '},'
    '"updated": {'
    '"\$": "2010-04-13T18:30:02-05:00"'
    '},'
    '"link": {'
    '"@rel": "self",'
    '"@href": "http://open311.sfgov.org/dev/V1/reports/637621.xml"'
    '},'
    '"author": {'
    '"name": {'
    '"\$": "John Doe"'
    '}'
    '},'
    '"georss:point": {'
    '"\$": "40.7111 -73.9565"'
    '},'
    '"category": {'
    '"@label": "Damaged tree",'
    '"@term": "tree-damage",'
    '"@scheme": "https://open311.sfgov.org/dev/V1/categories/006.xml",'
    '"\$": "006"'
    '},'
    '"content": {'
    '"@type": "xml",'
    '"@xmlns": [{'
    '"\$": "http://open311.org/spec/georeport-v1"'
    '}],'
    '"report_id": {'
    '"\$": "637621"'
    '},'
    '"address": {'
    '"\$": "1800 Market St, San Francisco, CA 94103"'
    '},'
    '"description": {'
    '"\$": "A large tree branch is blocking the road"'
    '},'
    '"status": {'
    '"\$": "created"'
    '},'
    '"status_notes": {},'
    '"policy": {'
    '"\$": "The City will inspect and require the responsible party to correct within 24 hours and/or issue a Correction Notice or Notice of Violation of the Public Works Code"'
    '}'
    '}'
    '}]'
    '}'
    '}';

/* Parker simple test check string */
String parkerSimpleJsonCheckString =
    '{"contacts": {"contact": {"name": "John Doe", "phone": "123-\\"456\\"-7890", "address": {"street": "123 JFKStreet", "city": "Any Town", "state": "Any State", "zipCode": "12345"}}}}';

/* Parker complex test check string from http://wiki.open311.org/index.php?title=JSON_and_XML_Conversion*/
String parkerComplexJsonCheckString =
    '{'
    '"reports": "This is cdata with \\"quotes\\"", "entry":'
    '[{'
    '"id":"tag:open311.sfgov.org,2010-04-15:/dev/V1/reports/637619.xml",'
    '"title":"A large tree branch is blocking the road",'
    '"updated":"2010-04-13T18:30:02-05:00",'
    '"link":null,'
    '"author":{'
    '"name":"John Doe"'
    '},'
    '"georss:point":"40.7111 -73.9565",'
    '"category":"006",'
    '"content":{'
    '"report_id":"637619",'
    '"address":"1600 Market St, San Francisco, CA 94103",'
    '"description":"A large tree branch is blocking the road",'
    '"status":"created",'
    '"status_notes":null,'
    '"policy":"The City will inspect and require the responsible party to correct within 24 hours &/or issue a Correction Notice or Notice of Violation of the Public Works Code"'
    '}'
    '},'
    '{'
    '"id":"tag:open311.sfgov.org,2011-04-15:/dev/V1/reports/637620.xml",'
    '"title":"A large tree branch is blocking the road",'
    '"updated":"2010-04-13T18:30:02-05:00",'
    '"link":null,'
    '"author":{'
    '"name":"John Doe"'
    '},'
    '"georss:point":"40.7111 -73.9565",'
    '"category":"006",'
    '"content":{'
    '"report_id":"637620",'
    '"address":"56 Market St, San Francisco, CA 94103",'
    '"description":"A large tree branch is blocking the road",'
    '"status":"created",'
    '"status_notes":null,'
    '"policy":"The City will inspect and require the responsible party to correct within 24 hours and/or issue a Correction Notice or Notice of Violation of the Public Works Code"'
    '}'
    '},'
    '{'
    '"id":"tag:open311.sfgov.org,2012-04-15:/dev/V1/reports/637621.xml",'
    '"title":"A large tree branch is blocking the road",'
    '"updated":"2010-04-13T18:30:02-05:00",'
    '"link":null,'
    '"author":{'
    '"name":"John Doe"'
    '},'
    '"georss:point":"40.7111 -73.9565",'
    '"category":"006",'
    '"content":{'
    '"report_id":"637621",'
    '"address":"1800 Market St, San Francisco, CA 94103",'
    '"description":"A large tree branch is blocking the road",'
    '"status":"created",'
    '"status_notes":null,'
    '"policy":"The City will inspect and require the responsible party to correct within 24 hours and/or issue a Correction Notice or Notice of Violation of the Public Works Code"'
    '}'
    '}]'
    '}';

/* GData simple test check string from */
String gDataSimpleJsonCheckString =
    '{"contacts": { "contact": { "id": "1", "name": { "\$t": "John Doe" }, "phone": { "\$t": "123-\\"456\\"-7890" }, "address": { "street": { "\$t": "123 JFKStreet" }, "city": { "\$t": "Any Town" }, "state": { "\$t": "Any State" }, "zipCode": { "\$t": "12345" } } } } }';

/* GData complex XML test string from https://developers.google.com/gdata/docs/json?csw=1 */
String gDatacomplexXmlTestString =
    '<feed xmlns="http://www.w3.org/2005/Atom" '
    'xmlns:openSearch="http://a9.com/-/spec/opensearchrss/1.0/" '
    'xmlns:gd="http://schemas.google.com/g/2005" '
    'xmlns:gCal="http://schemas.google.com/gCal/2005">'
    '<id>...</id>'
    '<updated>2006-11-12T21:25:30.000Z</updated>'
    '<![CDATA[This is cdata with "quotes"]]>'
    '<title type="text">Google Developer Events</title>'
    '<subtitle type="text">The calendar contains information about upcoming'
    'developer conferences at which Google will be speaking, along with'
    'other developer-related events.</subtitle>'
    '<link rel="..." '
    'type="application/atom+xml" href="..." />'
    '<link rel="self" type="application/atom+xml" href="..." />'
    '<author>'
    '<name>Google Developer Calendar</name>'
    '<email>developer-calendar@google.com</email>'
    '</author>'
    '<generator version="1.0" '
    'uri="http://www.google.com/calendar">Google Calendar</generator>'
    '<openSearch:startIndex>1</openSearch:startIndex>'
    '<openSearch:itemsPerPage>25</openSearch:itemsPerPage>'
    '<gCal:timezone value="America/Los_Angeles" />'
    '<entry>'
    '<id>...</id>'
    '<published>2006-11-12T21:25:30.000Z</published>'
    '<updated>2006-11-12T21:25:30.000Z</updated>'
    '<category scheme="..." term="..." />'
    '<title type="text">WebmasterWorld PubCon 2006:'
    'Google Developer Tools in General</title>'
    '<content type="text">Google is sponsoring at'
    ' WebmasterWorld PubCon 2006.\n Come and'
    ' visit us at the booth or join us for an evening demo reception where we'
    ' will be talking "5 ways to enhance your website with Google Code".'
    '\nAfter all, it is Vegas, baby! See you soon.</content>'
    '<link rel="alternate" type="text/html" href="..." title="alternate" />'
    '<link rel="self" type="application/atom+xml" href="..." />'
    '<author>'
    '<name>Google Developer Calendar</name>'
    '<email>developer-calendar@google.com</email>'
    '</author>'
    '<![CDATA[This is more cdata]]>'
    '<gCal:sendEventNotifications value="true" />'
    '<gd:comments>'
    '<gd:feedLink href="..." />'
    '</gd:comments>'
    '<gd:transparency value="http://schemas.google.com/g/2005#event.opaque"/>'
    '<gd:eventStatus value="http://schemas.google.com/g/2005#event.confirmed"/>'
    '<gd:where valueString="3150 Paradise Road, Las Vegas, NV 89109" />'
    '<gd:when startTime="2006-11-15" endTime="2006-11-17">'
    '<gd:reminder minutes="10" />'
    '</gd:when>'
    '</entry>'
    '</feed>';

/* GData complex test check string from */
String gDataComplexJsonCheckString =
    '{'
    '"feed": {'
    '"xmlns": "http://www.w3.org/2005/Atom",'
    '"xmlns\$openSearch": "http://a9.com/-/spec/opensearchrss/1.0/",'
    '"xmlns\$gd": "http://schemas.google.com/g/2005",'
    '"xmlns\$gCal": "http://schemas.google.com/gCal/2005",'
    '"id": {"\$t": "..."},'
    '"updated": {"\$t": "2006-11-12T21:25:30.000Z"},'
    '"__cdata" : "This is cdata with \\"quotes\\"",'
    '"title": {'
    '"type": "text",'
    '"\$t": "Google Developer Events"'
    '},'
    '"subtitle": {'
    '"type": "text",'
    '"\$t": "The calendar contains information about upcoming developer'
    'conferences at which Google will be speaking, along with other'
    'developer-related events."'
    '},'
    '"link": [{'
    '"rel": "...",'
    '"type": "application/atom+xml",'
    '"href": "..."'
    '},{'
    '"rel": "self",'
    '"type": "application/atom+xml",'
    '"href": "..."'
    '}],'
    '"author": {'
    '"name": {"\$t": "Google Developer Calendar"},'
    '"email": {"\$t": "developer-calendar@google.com"}'
    '},'
    '"generator":{'
    '"version": "1.0",'
    '"uri": "http://www.google.com/calendar",'
    '"\$t": "Google Calendar"'
    '},'
    '"openSearch\$startIndex": {"\$t": "1"},'
    '"openSearch\$itemsPerPage": {"\$t": "25"},'
    '"gCal\$timezone": {"value": "America/Los_Angeles"},'
    '"entry": {'
    '"id": {"\$t": "..."},'
    '"published": {"\$t": "2006-11-12T21:25:30.000Z"},'
    '"updated": {"\$t": "2006-11-12T21:25:30.000Z"},'
    '"category": {'
    '"scheme": "...",'
    '"term": "..."'
    '},'
    '"title":{'
    '"type": "text",'
    '"\$t": "WebmasterWorld PubCon 2006:Google Developer Tools in General"'
    '},'
    '"content": {'
    '"type": "text",'
    '"\$t": "Google is sponsoring at'
    ' WebmasterWorld PubCon 2006.'
    '\\\\\\\\n Come and visit us at the booth or join us for an evening demo'
    'reception where we will be talking \\"5 ways to enhance your website'
    'with Google Code\\".\\\\\\\\nAfter all,it is Vegas, baby! See you soon."'
    '},'
    '"link": [{'
    '"rel": "alternate",'
    '"type": "text/html",'
    '"href": "...",'
    '"title": "alternate"'
    '},{'
    '"rel": "self",'
    '"type": "application/atom+xml",'
    '"href": "..."'
    '}],'
    '"author": {'
    '"name": {"\$t": "Google Developer Calendar"},'
    '"email": {"\$t": "developer-calendar@google.com"}'
    '},'
    '"__cdata" : "This is more cdata",'
    '"gCal\$sendEventNotifications": {"value": "true"},'
    '"gd\$comments": {"gd\$feedLink": {"href": "..."}},'
    '"gd\$transparency": {"value": "http://schemas.google.com/g/2005#event.opaque"},'
    '"gd\$eventStatus": {"value": "http://schemas.google.com/g/2005#event.confirmed"},'
    '"gd\$where": {"valueString": "3150 Paradise Road,Las Vegas,NV 89109"},'
    '"gd\$when": {'
    '"startTime": "2006-11-15",'
    '"endTime": "2006-11-17",'
    '"gd\$reminder": {"minutes": "10"}'
    '}'
    '}'
    '}'
    '}';
String issue16 =
    '<?xml version="1.0" encoding="utf-8"?>'
    '<project id="LHRPlus_LeyserPlusHelpCenterDevPackages" name="HelpCenter_Dev_Packages" parentProjectId="LHRPlus_LeySerPlusHelpCenter" href="/httpAuth/app/rest/projects/id:LHRPlus_LeyserPlusHelpCenterDevPackages" webUrl="http://xa-tools-tcity/project.html?projectId=LHRPlus_LeyserPlusHelpCenterDevPackages">'
    '<parentProject id="LHRPlus_LeySerPlusHelpCenter" name="LeySerPlusHelpCenter" parentProjectId="LHRPlus" href="/httpAuth/app/rest/projects/id:LHRPlus_LeySerPlusHelpCenter" webUrl="http://xa-tools-tcity/project.html?projectId=LHRPlus_LeySerPlusHelpCenter"/>'
    '<buildTypes count="3">'
    '<buildType id="LHRPlus_LeyserPlusHelpCenterDevPackages_Deploy2xaLsrV10gttemp" name="HC Packages" description="Help Center" projectName="LHRPlus :: LeySerPlusHelpCenter :: HelpCenter_Dev_Packages" projectId="LHRPlus_LeyserPlusHelpCenterDevPackages" href="/httpAuth/app/rest/buildTypes/id:LHRPlus_LeyserPlusHelpCenterDevPackages_Deploy2xaLsrV10gttemp" webUrl="http://xa-tools-tcity/viewType.html?buildTypeId=LHRPlus_LeyserPlusHelpCenterDevPackages_Deploy2xaLsrV10gttemp"/>'
    '<buildType id="LHRPlus_LeyserPlusHelpCenterDevPackages_DailyBuildPublishLocalHelpCenter" name="RA Build HC: HelpCenter" projectName="LHRPlus :: LeySerPlusHelpCenter :: HelpCenter_Dev_Packages" projectId="LHRPlus_LeyserPlusHelpCenterDevPackages" href="/httpAuth/app/rest/buildTypes/id:LHRPlus_LeyserPlusHelpCenterDevPackages_DailyBuildPublishLocalHelpCenter" webUrl="http://xa-tools-tcity/viewType.html?buildTypeId=LHRPlus_LeyserPlusHelpCenterDevPackages_DailyBuildPublishLocalHelpCenter"/>'
    '<buildType id="LHRPlus_LeyserPlusHelpCenterDevPackages_DailyBuildPublishLocalLeyserDataManager" name="RA Build HC: LeyserDataManager" projectName="LHRPlus :: LeySerPlusHelpCenter :: HelpCenter_Dev_Packages" projectId="LHRPlus_LeyserPlusHelpCenterDevPackages" href="/httpAuth/app/rest/buildTypes/id:LHRPlus_LeyserPlusHelpCenterDevPackages_DailyBuildPublishLocalLeyserDataManager" webUrl="http://xa-tools-tcity/viewType.html?buildTypeId=LHRPlus_LeyserPlusHelpCenterDevPackages_DailyBuildPublishLocalLeyserDataManager"/>'
    '</buildTypes>'
    '<templates/>'
    '<parameters count="8" href="/app/rest/projects/id:LHRPlus_LeyserPlusHelpCenterDevPackages/parameters">'
    '<property name="buildconfig" value="JPProd" own="true"/>'
    '<property name="cmd.cd.helpcentersite" value="cd &quot;%system.teamcity.build.checkoutDir%\LeyserSystemManager\LeyserSystemManager.HelpCenterSite&quot;"/>'
    '<property name="cmd.npm.install" value="npm --registry http://myproget.grapecity.net/npm/npm install"/>'
    '<property name="deployconfig" value="JPProd.pubxml" own="true"/>'
    '<property name="MSBuildPath" value="&quot;C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe&quot;"/>'
    '<property name="npmconfig" value="JPProd" own="true"/>'
    '<property name="npmruncommand" value="npm run JPProd" own="true"/>'
    '<property name="SonarMSBuildRunner4.0.2" value="\\xa-tools-tcity\sonar-scanner-msbuild-4.0.2.892\SonarQube.Scanner.MSBuild.exe"/>'
    '</parameters>'
    '<vcsRoots href="/httpAuth/app/rest/vcs-roots?locator=project:(id:LHRPlus_LeyserPlusHelpCenterDevPackages)"/>'
    '<projects/>'
    '</project>';
String badgerfishLocalNodeXmlTestString =
    '<soapenv:Envelope xmlns:soapenv="http://www.w3.org/2003/05/soap-envelope"> <soapenv:Header/> <soapenv:Body> <tns:getDataResponse xmlns:tns="https://urchin.com/api/urchin/v1/"> <record> <recordId>1</recordId> <dimensions> <dimension name="u:month">2008-02-00T00:00:00Z</dimension> </dimensions> <metrics> <u:hits xmlns:u="https://urchin.com/api/urchin/v1/">836</u:hits> <u:bytes xmlns:u="https://urchin.com/api/urchin/v1/">1953960</u:bytes> </metrics> </record> </tns:getDataResponse> </soapenv:Body> </soapenv:Envelope>';
String badgerfishLocalNodeCheckString =
    '{"Envelope": {"@xmlns": [{"soapenv": "http://www.w3.org/2003/05/soap-envelope"}], "Header": {}, "Body": {"getDataResponse": {"@xmlns": [{"tns": "https://urchin.com/api/urchin/v1/"}], "record": {"recordId": {"\$": "1"}, "dimensions": {"dimension": {"@name": "u:month", "\$": "2008-02-00T00:00:00Z"}}, "metrics": {"hits": {"@xmlns": [{"u": "https://urchin.com/api/urchin/v1/"}], "\$": "836"}, "bytes": {"@xmlns": [{"u": "https://urchin.com/api/urchin/v1/"}], "\$": "1953960"}}}}}}}';
String issue33 = '<root><item>1</item><item>2</item><item>three</item></root>';

/* General testing XML strings from http://www.ibm.com/developerworks/library/x-xml2jsonphp */
String openRallyStringXML =
    """<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<gpx
  xmlns="http://www.topografix.com/GPX/1/1"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:openrally="http://www.openrally.org/xmlschemas/GpxExtensions/v1.0.3"
  creator="Rally Navigator"
  version="1.1"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd                       http://www.openrally.org/xmlschemas/GpxExtensions/v1.0.3 openrally.xsd">
  <metadata>
    <extensions>
      <openrally:units>metric</openrally:units>
      <openrally:distance>7.16</openrally:distance>
    </extensions>
  </metadata>
  <wpt lat="47.458149" lon="-0.477797">
    <name>waypoint_1</name>
    <extensions>
      <openrally:distance>0</openrally:distance>
      <openrally:cap>328</openrally:cap>
      <openrally:show_coordinates/>
      <openrally:tulip>
        <![CDATA[data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA...]]>
      </openrally:tulip>
      <openrally:notes>   
        <![CDATA[data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA...]]>
      </openrally:notes>
      <openrally:timecontrol/>
    </extensions>
  </wpt>
  <wpt lat="47.458807" lon="-0.478419">
    <name>waypoint_2</name>
    <extensions>
      <openrally:distance>0.09</openrally:distance>
      <openrally:cap>60</openrally:cap>
      <openrally:tulip>
        <![CDATA[data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA...]]>
      </openrally:tulip>
      <openrally:notes>
        <![CDATA[data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA...]]>
      </openrally:notes>
    </extensions>
  </wpt>
  <trk>
    <name>ACTIVE LOG 001</name>
    <desc>waypoints</desc>
    <trkseg>
      <trkpt lat="47.458149" lon="-0.477797"/>
      <trkpt lat="47.458431" lon="-0.478062"/>
    </trkseg>
  </trk>
</gpx>""";
String openRallyStringJson = """
{
  "gpx":{
    "xmlns":"http://www.topografix.com/GPX/1/1",
    "xsi":"http://www.w3.org/2001/XMLSchema-instance",
    "openrally":"http://www.openrally.org/xmlschemas/GpxExtensions/v1.0.3",
    "creator":"RallyNavigator",
    "version":"1.1",
    "schemaLocation":"http://www.topografix.com/GPX/1/1http://www.topografix.com/GPX/1/1/gpx.xsdhttp://www.openrally.org/xmlschemas/GpxExtensions/v1.0.3openrally.xsd",
    "metadata":{
      "extensions":{
        "units":"metric",
        "distance":"7.16"
      }
    },
    "wpt":[
      {
        "lat":"47.458149",
        "lon":"-0.477797",
        "name":"waypoint_1",
        "extensions":{
          "distance":"0",
          "cap":"328",
          "show_coordinates":null,
          "tulip":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA...",
          "notes":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA...",
          "timecontrol": null
        }
      },
      {
        "lat":"47.458807",
        "lon":"-0.478419",
        "name":"waypoint_2",
        "extensions":{
          "distance":"0.09",
          "cap":"60",
          "tulip":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA..."
          ,"notes":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAY4AAA..."
        }
      }
    ],
    "trk":{
      "name":"ACTIVELOG001",
      "desc":"waypoints",
      "trkseg":{
        "trkpt":[
          {
            "lat":"47.458149",
            "lon":"-0.477797"
          },
          {
            "lat":"47.458431",
            "lon":"-0.478062"
          }
        ]
      }  
    }
  }
}""";
