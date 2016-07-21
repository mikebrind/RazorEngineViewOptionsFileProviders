using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Primitives;
using System;
using System.IO;

namespace RazorEngineViewOptionsFileProviders
{
    public class DatabaseFileProvider : IFileProvider
    {
        private string _connection;
        public DatabaseFileProvider(string connection)
        {
            _connection = connection;
        }
        public IDirectoryContents GetDirectoryContents(string subpath)
        {
            throw new NotImplementedException();
        }

        public IFileInfo GetFileInfo(string subpath)
        {
            var result = new DatabaseFileInfo(_connection, subpath);
            return result.Exists ? result as IFileInfo : new NotFoundFileInfo(subpath);
        }

        public IChangeToken Watch(string filter)
        {
            return new DatabaseChangeToken(_connection, filter);
        }
    }
}
